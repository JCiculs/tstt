#include <a_samp>
#include <YSI_Coding\y_hooks>

const 
	DIALOG_THUCANNHANH = 5123;

enum _:E_DYN_POINT
{
	Float:dpX,
	Float:dpY,
	Float:dpZ,
	dpInterior,
	dpWorld,
	dpHienCo,

	Text3D:dpLabel, 
	dpobject,
}

static 
	Map:dynamicPoints; 

CMD:xoaquay(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7)
	{
		if(isnull(params))
		{
			SendClientMessage(playerid, -1, "/xoaquay [id]");
		}
		else 
		{
			new 
				uid = strval(params), 
				str[128], dynPoint[E_DYN_POINT];
		
			if(map_has_key(dynamicPoints, uid))
			{
				if(map_get_arr_safe(dynamicPoints, uid, dynPoint))
				{
					if(map_remove(dynamicPoints, uid))
					{
						if(dynPoint[dpobject] != 0)
						{
							DestroyObject(dynPoint[dpobject]);
						}
						if(dynPoint[dpLabel] != Text3D:0)
						{
							DestroyDynamic3DTextLabel(dynPoint[dpLabel]);
						}
						if(dynPoint[dpHienCo] > 0)
						{
						    dynPoint[dpHienCo] = 0;
						}
						mysql_format(MainPipeline, str, 128, "DELETE FROM `quaythucan` WHERE `UID` = %d", uid);
						mysql_tquery(MainPipeline, str, "", "");
						SendClientMessage(playerid, -1, "Ban da xoa mot quay ban hang ");
					}
				}
			}
			else SendClientMessage(playerid, COLOR_GREY, "[ID] khong hop le");
		}
	}
	return 1;	
}

CMD:taoquay(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 7)
	{
		new 
			string[333], dynPoint[E_DYN_POINT];
		
		GetPlayerPos(playerid, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ]);
		mysql_format(MainPipeline, string, 333, "INSERT INTO `quaythucan` (`X`, `Y`, `Z`, `World`, `Interior`) \
			VALUES (%f, %f, %f, %i, %i)", dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ], 
			(dynPoint[dpWorld] = GetPlayerVirtualWorld(playerid)), 
			(dynPoint[dpInterior] = GetPlayerInterior(playerid))); 
		SendClientMessage(playerid, -1, "Ban da tao mot quay may ban tu dong");
		mysql_tquery(MainPipeline, string, "DynamicPoint_CreateQuery", "d", playerid);
	}
	return 1;
}

CMD:uongnuoc(playerid, params[])
{
	if(GetPVarType(playerid, "UONGNUOC") == 1)
		return SendClientMessage(playerid, COLOR_GREY, "Ban dang uong nuoc khong the thuc hien");
	if(PlayerInfo[playerid][pNuocLoc] >= 1)
	{	
		ApplyAnimation(playerid,"FOOD","EAT_BURGER",4.1,0,1,1,1,1,1);
		SetPVarInt(playerid, "UONGNUOC", 1);
		SetTimerEx("ONPLAYERUONGNUOC", 2000, 0,"ii", playerid); // 2s
	}
		else SendClientMessage(playerid, COLOR_GREY, "Ban khong co chai nuoc nao");
	return 1;
}
CMD:anbanh(playerid, parmas[])
{
	if(GetPVarInt(playerid, "ANBANH") == 1)
		return SendClientMessage(playerid, COLOR_GREY, "Co ve ban dang an banh");
	if(PlayerInfo[playerid][pBanhMi] >= 1)
	{
			ApplyAnimation(playerid,"FOOD","EAT_BURGER",4.1,0,1,1,1,1,1);
			SetPVarInt(playerid, "ANBANH", 1);
			SetTimerEx("ONPLAYERANBANH", 5000, 0,"ii",playerid); // 5k = 5s
	}
		else SendClientMessage(playerid, COLOR_GREY, "Ban khong co o banh mi nao");
	return 1;
}
forward ONPLAYERANBANH(playerid);
public ONPLAYERANBANH(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid, health);
	if(GetPVarType(playerid, "ANBANH") == 1)
	{
		DeletePVar(playerid, "ANBANH");
		ClearAnimations(playerid);
		TogglePlayerControllable(playerid, 1);
		PlayerInfo[playerid][pBanhMi] --;

		//PlayerInfo[playerid][pHunger] += 100;
		//UpdateHungerBar(playerid);
		if (PlayerInfo[playerid][pFitness] >= 5)
		PlayerInfo[playerid][pFitness] -= 5;
		else
		PlayerInfo[playerid][pFitness] = 0;
		PlayerInfo[playerid][pHungerTimer] = 0;
		PlayerInfo[playerid][pHungerDeathTimer] = 0;

		//if(PlayerInfo[playerid][pHunger] > 100) PlayerInfo[playerid][pHunger] = 100;
 		//new rand = random(20);
		PlayerInfo[playerid][pHunger] += 30;
		SendClientMessage(playerid, -1, "Ban da an xong mot cai banh mi va co mot chut suc khoe");
		if(PlayerInfo[playerid][pHunger] >= 100){
			PlayerInfo[playerid][pHunger] = 100;
		}
	}
}
forward ONPLAYERUONGNUOC(playerid);
public ONPLAYERUONGNUOC(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid, health);
	if(GetPVarInt(playerid, "UONGNUOC") == 1)
	{

		DeletePVar(playerid, "UONGNUOC");
		ClearAnimations(playerid); 
		TogglePlayerControllable(playerid, 1);
		PlayerInfo[playerid][pNuocLoc] --;
		//PlayerInfo[playerid][pKhatNuoc] = 100;
		//new rand = random(20);
		PlayerInfo[playerid][pKhatNuoc] += 30;
		SendClientMessage(playerid, -1, "Ban uong xong mot chai nuoc loc va co mot chut suc khoe");
		if(PlayerInfo[playerid][pKhatNuoc] >= 100){
			PlayerInfo[playerid][pKhatNuoc] = 100;
		}
		//UpdateHungerBar(playerid);
		PlayerInfo[playerid][pKhatNuocTimer] = 0;

		if (PlayerInfo[playerid][pFitness] >= 5)
			PlayerInfo[playerid][pFitness] -= 5;
		else
			PlayerInfo[playerid][pFitness] = 0;
		//if(PlayerInfo[playerid][pKhatNuoc] > 100) PlayerInfo[playerid][pKhatNuoc] = 100;
	}
}

hook OnGameModeInit()
{
	dynamicPoints = map_new();
	SetTimer("LOAD_QUAYTHUCAN", 1000, 0);
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_THUCANNHANH)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerInfo[playerid][pCash] < 10)
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 10$ de mua nuoc loc");

					PlayerInfo[playerid][pNuocLoc] ++;
					PlayerInfo[playerid][pCash] -= 10;
					SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua 1 chai nuoc tu may ban hang");
				}
				case 1:
				{
					if(PlayerInfo[playerid][pCash] < 15)
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $15 de mua banh mi");


					PlayerInfo[playerid][pBanhMi] ++;
					PlayerInfo[playerid][pCash] -= 15;
					SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua 1 banh mi tu may ban hang");
				}
			}
		}
	}
	return 0;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(quaythucan_Near(playerid))
			cmd_muadodung(playerid);
	}
	return 1;
}

CMD:muadodung(playerid)
{
	new a[600];
	if(quaythucan_Near(playerid))
	{
		new
		dynPoint[E_DYN_POINT];
		for(new Iter:map = map_iter(dynamicPoints); iter_inside(map); iter_move_next(map))
		{
    		if(iter_get_arr_safe(map, dynPoint))
    		{
				format(a,sizeof(a),"Ten vat pham\tGia\nNuoc Loc\t10$\nBanh Mi\t15$");
				ShowPlayerDialog(playerid,DIALOG_THUCANNHANH,DIALOG_STYLE_TABLIST_HEADERS,"> MAY BAN HANG TU DONG",a,"Mua","Huy");
			}
		}
		//return ShowPlayerDialog(playerid, DIALOG_THUCANNHANH, DIALOG_STYLE_TABLIST_HEADERS, "MAY BAN TU DONG", "Ten vat pham\tGia\tSo luong hien co\nNuoc Loc\t30$\t100\nThuc An Nhanh\t50$\t100", "mua", "Huy");
	}
	//else SendClientMessage(playerid, COLOR_GREY, "Co ve nhu ban khong o gan mot quay nao");
	return 1;
}

forward LOAD_QUAYTHUCAN();
public LOAD_QUAYTHUCAN()
{
	new Cache:q = mysql_query(MainPipeline, "SELECT * FROM `quaythucan`");

	for(new dynPoint[E_DYN_POINT], u, i = 0; i < cache_num_rows(); i ++)
	{
		dynPoint[dpX] = cache_get_field_content_float(i, "X");
		dynPoint[dpY] = cache_get_field_content_float(i, "Y");
		dynPoint[dpZ] = cache_get_field_content_float(i, "Z");
		dynPoint[dpWorld] = cache_get_field_content_int(i, "World");
		dynPoint[dpInterior] = cache_get_field_content_int(i, "Interior");
		dynPoint[dpHienCo] = cache_get_field_content_int(i,"SoLuong");

		u = cache_get_field_content_int(i, "UID");
		if(map_add_arr(dynamicPoints, u, dynPoint))
		{
			quaythucan_Update(u);
		}
	}
	cache_delete(q);
}

forward DynamicPoint_CreateQuery(playerid);
public DynamicPoint_CreateQuery(playerid)
{
	new 
		id = cache_insert_id(), dynPoint[E_DYN_POINT];
		
	GetPlayerPos(playerid, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ]);
	dynPoint[dpWorld] = GetPlayerVirtualWorld(playerid);
	dynPoint[dpInterior] = GetPlayerInterior(playerid);
	dynPoint[dpHienCo] = 100;
	if(map_add_arr(dynamicPoints, id, dynPoint))
	{
		quaythucan_Update(id);
		return 1;
	}
	return 0;	
}

stock quaythucan_Update(uid)
{
	if(map_has_key(dynamicPoints, uid))
	{
		new 
			str[128], dynPoint[E_DYN_POINT];

		if(map_get_arr_safe(dynamicPoints, uid, dynPoint))
		{
			if(dynPoint[dpobject] != 0)
			{
				DestroyObject(dynPoint[dpobject]);
			}
			if(dynPoint[dpLabel] != Text3D:0)
			{
				DestroyDynamic3DTextLabel(dynPoint[dpLabel]);
			}
			format(str, 128, "{66FF33}May ban hang tu dong\nSu dung: {EE0000}(Y){FFFFFF}\nID:%d", uid);
			//dynPoint[dpobject] = CreateDynamicObject(2577, 0, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ], 0.6, .worldid = dynPoint[dpWorld], .interiorid = dynPoint[dpInterior]);
			//dynPoint[dpobject] = CreateDynamicPickup(2577, 23, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ] - 0.6, dynPoint[dpWorld], dynPoint[dpInterior]);
			dynPoint[dpLabel] = CreateDynamic3DTextLabel(str, -1, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ], 10.0, .worldid = dynPoint[dpWorld], .interiorid = dynPoint[dpInterior]);
			if(map_set_arr(dynamicPoints, uid, dynPoint))
			{
				quaythucan_Save(uid);
			}
		}
	}
	return 0;
}

stock quaythucan_Save(uid)
{
	if(map_has_key(dynamicPoints, uid))
	{
		new 
			str[444], dynPoint[E_DYN_POINT];

		if(map_get_arr_safe(dynamicPoints, uid, dynPoint))
		{
			mysql_format(MainPipeline, str, sizeof(str), "UPDATE `quaythucan` SET `X` = %f, `Y` = %f, `Z` = %f, `World` = %d, `SoLuong` = %d,`Interior` = %d  WHERE `UID` = %d", dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ], dynPoint[dpWorld],dynPoint[dpHienCo], dynPoint[dpInterior],uid);
			mysql_tquery(MainPipeline, str, "", "");
		}
	}
	return 1;
}

stock quaythucan_Near(playerid)
{
	new 
		dynPoint[E_DYN_POINT];
	
	for(new Iter:map = map_iter(dynamicPoints); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, dynPoint))
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, dynPoint[dpX], dynPoint[dpY], dynPoint[dpZ]))
			{
				if(dynPoint[dpWorld] == GetPlayerInterior(playerid) && dynPoint[dpInterior] == GetPlayerInterior(playerid))
				{
					return 1;
				}
			}
		}
	}
	return 0;
}
