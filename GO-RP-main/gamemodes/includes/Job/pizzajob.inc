#include <a_samp>
#include <YSI_Coding\y_hooks>


enum Con_Cac_Pizza{
	veh_id,
}
new DemPizza[MAX_PLAYERS];
new XePizza;
new BanhPizza[MAX_PLAYERS];
new XeGiaoPizza[MAX_PLAYERS][Con_Cac_Pizza];
new TienTraPizza[MAX_PLAYERS];
new DongPhucCuPizza[MAX_PLAYERS];
new Text3D:Text3DPizza[MAX_PLAYERS];
enum Giao_Pizza
{
	Float:Pizza_X,
	Float:Pizza_Y,
	Float:Pizza_Z
}

new CPPizza[19][Giao_Pizza] = {
	{2067.8982,-1628.6741,13.8762},
	{2150.6311,-1418.9769,25.9219},
	{2090.9160,-1277.9398,26.1797},
	{2249.3132,-1060.1954,55.9688},
	{280.9825,-1767.4105,4.5476},
	{927.1251,-1818.2919,13.3241},
	{2151.8894,-1014.6268,62.7717},
	{2637.0952,-1991.9050,14.3240},
	{2460.9399,-1896.4349,13.5469},
	{2269.2092,-1882.1875,14.2344},
	{769.2271,-1745.7755,13.0773},
	{766.9207,-1605.7599,13.8039},
	{2022.5972,-1120.2648,26.4210},
	{2348.4626,-1372.9103,24.3984},
	{2486.4531,-1644.7952,14.0772},
	{2278.3687,-2044.9587,13.5469},
	{2402.5845,-1715.8990,14.0074},
	{2309.6760,-1643.1245,14.8270},
	{1684.7267,-2098.1548,13.8343}
};
new Float:XePizzaSP[6][] = {
	{2131.1338,-1793.1614,13.3174,179.1870},
	{2131.0234,-1800.5370,13.3219,179.1303},
	{2130.8833,-1809.7042,13.3256,179.1273},
	{2130.7422,-1818.8431,13.3257,179.1177},
	{2116.9353,-1827.7639,13.3213,90.4514},
	{2108.3958,-1827.8357,13.3213,89.8339}
};

hook OnGameModeInit()
{
	CreateActor(155, 2098.9956,-1800.2728,13.3889,96.0465);
	CreateDynamic3DTextLabel("{D7DF01}Pizza Delivery\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de tuong tac",COLOR_YELLOW,2098.9956,-1800.2728,13.3889,10.0);
	XePizza = 0;
	return 1;
}

/*hook OnPlayerConnect(playerid)
{
	DemPizza[playerid] = 0;
	batdaugiaobanh[playerid] = 0;
	BanhPizza[playerid] = 0;
	XeGiaoPizza[playerid][veh_id] = 0;
	TienTraPizza[playerid] = 0;
	DongPhucCuPizza[playerid] = 0;
	dalayxe[playerid] = 0;
}*/

hook OnVehicleDeath(vehicleid)
{
	if(GetVehicleModel(vehicleid) == 526)
	{
		foreach(new i:Player)
		{
			if(vehicleid == XeGiaoPizza[i][veh_id])
			{
			    DeletePVar(i,"DaLayXe");
			    DestroyVehicle(XeGiaoPizza[i][veh_id]);
				XeGiaoPizza[i][veh_id] = INVALID_VEHICLE_ID;
				DestroyDynamic3DTextLabel(Text3DPizza[i]);
				SendClientMessageEx(i,-1,"{D7DF01}Pizza Delivery{FFFFFF}: Xe pizza cua ban da bi no tung, hay di thue lai mot chiec xe khac, hang van con do !");
			}
		}
	}
	return 1;
}


hook OnPlayerDisconnect(playerid, reason)
{
	if(dalayxe[playerid] != 0)
	{
	    DestroyVehicle(XeGiaoPizza[playerid][veh_id]);
		DestroyDynamic3DTextLabel(Text3DPizza[playerid]);
	}
	if(DongPhucCuPizza[playerid] != 0){
		SetPlayerSkin(playerid, DongPhucCuPizza[playerid]);
		PlayerInfo[playerid][pModel] = DongPhucCuPizza[playerid];
	}
	DemPizza[playerid] = 0;
	batdaugiaobanh[playerid] = 0;
	BanhPizza[playerid] = 0;
	TienTraPizza[playerid] = 0;
	DemPizza[playerid] = 0;
	batdaugiaobanh[playerid] = 0;
	BanhPizza[playerid] = 0;
	XeGiaoPizza[playerid][veh_id] = 0;
	TienTraPizza[playerid] = 0;
	DongPhucCuPizza[playerid] = 0;
	dalayxe[playerid] = 0;
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == PizzaGetPizza)
	{
		if(response)
		{
			if(listitem == 0)
			{
    			ShowPlayerDialog(playerid, CHAPNHANCONGVIEC, DIALOG_STYLE_MSGBOX, "Cong viec", "Ban co chac chan rang muon nhan cong viec nay hay khong", "Co", "Khong");
				return cmd_xinviec(playerid,"");
			}
			if(listitem == 1)
			{
				cmd_layxecongviecdialogg(playerid,"");
			}
			if(listitem == 2)
			{
					if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
						return ChatHoTro(playerid, 255, "Ban khong phai Pizza Boy",5000);
						if(XeGiaoPizza[playerid][veh_id] == 0) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Pizza Boy ~w~nao!",5000);
						DestroyVehicle(XeGiaoPizza[playerid][veh_id]);
						dalayxe[playerid] = 0;
						DemPizza[playerid] = 0;
						batdaugiaobanh[playerid] = 0;
						BanhPizza[playerid] = 0;
						TienTraPizza[playerid] = 0;
						ChatHoTro(playerid,255,"Ban da tra xe cho Pizza Delivery",5000);
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21) {
					SendClientMessageEx(playerid,COLOR_GREY,"Ban khong phai la Pizza Boy!");
					return 1;
				}
				DongPhucCuPizza[playerid] = GetPlayerSkin(playerid);
				SetPlayerSkin(playerid, 155);
				PlayerInfo[playerid][pModel] = 155;
				SendClientMessage(playerid, COLOR_YELLOW,"{D7DF01}Pizza Delivery{FFFFFF}: Ban duoc cap mot dong phuc tu cua hang");
			}
			if(listitem == 4)
			{
				if(DongPhucCuPizza[playerid] != 0)
				{
					SetPlayerSkin(playerid,DongPhucCuPizza[playerid]);
					PlayerInfo[playerid][pModel] = DongPhucCuPizza[playerid];
					DongPhucCuPizza[playerid] = 0;
					ChatHoTro(playerid,255,"Ban da thay lai dong phuc cu cua ban!",5000);
				}
				else ChatHoTro(playerid,255,"Ban khong co ~r~dong phuc cu ~w~nao de thay!",5000);
			}
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(PlayerInfo[playerid][pJob] == 21 || PlayerInfo[playerid][pJob2] == 21)
		{
			if(BanhPizza[playerid] == 0)
			{
				new closestcar = GetClosestCar(playerid);
				new Float:Vehicle[3];
				GetVehiclePos(XeGiaoPizza[playerid][veh_id],Vehicle[0],Vehicle[1],Vehicle[2]);
				if(IsPlayerInRangeOfPoint(playerid, 3.0,Vehicle[0],Vehicle[1],Vehicle[2])) //return SendClientMessage(playerid,-1,"Ban can o gan phuong tien cua ban");
				{
					if(closestcar == XeGiaoPizza[playerid][veh_id] && !IsPlayerInAnyVehicle(playerid))
					{
					    if(BanhHienTai[playerid] > 0)
					    {
							BanhPizza[playerid] = 1;
					        SetPlayerAttachedObject(playerid, 9, 1582, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
							ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
							SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
							ChatHoTro(playerid,255,"Ban da lay banh pizza len tay, ~r~Y~w~ de cat banh lai vao xe",2000);
						}
						else ChatHoTro(playerid,255,"Ban da ~r~het ~w~banh trong xe",5000);
					}
				}
			}
			else if(BanhPizza[playerid] == 1)
			{
				new closestcar = GetClosestCar(playerid);
				if(closestcar == XeGiaoPizza[playerid][veh_id] && !IsPlayerInAnyVehicle(playerid))
				{
					BanhPizza[playerid] = 0;
					ClearAnimations(playerid);
					SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
					RemovePlayerAttachedObject(playerid,9);
					ChatHoTro(playerid,255,"Ban da cat banh vao xe",2000);
				}
			}
		}
	}
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2098.9956,-1800.2728,13.3889))
		{
			ShowPlayerDialog(playerid,PizzaGetPizza,DIALOG_STYLE_LIST,"> Pizza Delivery","Xin viec\nLay Xe\nTra xe\nNhan dong phuc\nTra dong phuc","CHON","HUY");
		}
	}
	return 1;
}

stock ThuongPizza(playerid)
{
	new Float:doxa = GetPlayerDistanceFromPoint(playerid,2095.9231,-1808.7534,13.5520);
	new str[128];
	if(doxa > 400)
	{
		new rand = Random(100, 150);
		GivePlayerCash(playerid,rand);
		format(str,sizeof(str),"{DDDDDD}Ban da duoc khach hang thuong them $%d (vi tri xa)",rand);
		SendClientMessageEx(playerid,COLOR_GRAD2,str);
	}
	else if(50 < doxa < 400)
	{
		new rand = Random(50, 140);
		GivePlayerCash(playerid,rand);
		format(str,sizeof(str),"{DDDDDD}Ban da duoc khach hang thuong them $%d (vi tri gan)",rand);
		SendClientMessageEx(playerid,COLOR_GRAD2,str);
	}
	return 1;
}



hook OnPlayerEnterCheckpoint(playerid)
{
	if(batdaugiaobanh[playerid] == 1)
	{
		if(BanhHienTai[playerid] > 0)
		{
			if(BanhPizza[playerid] == 1  && CP[playerid] != 2)
			{
				BanhHienTai[playerid] -= 1;
				BanhPizza[playerid] = 0;
				new str[50];
				DisablePlayerCheckpoint(playerid);
				ClearAnimations(playerid);
				format(str,sizeof(str),"Banh tren xe ~r~%d~w~/10",BanhHienTai[playerid]);
				RemovePlayerAttachedObject(playerid,9);
				ChatHoTro(playerid,255,str,5000);
				new tienthuong;
				new Float:doxa = GetPlayerDistanceFromPoint(playerid,2095.9231,-1808.7534,13.5520);
				tienthuong = floatround(doxa/10,floatround_round);
				TienTraPizza[playerid] += tienthuong;
				ThuongPizza(playerid);
				ClearAnimations(playerid);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
				if(BanhHienTai[playerid] == 0)
				{
					SetPlayerCheckpoint(playerid,2112.7732,-1780.2974,13.3893,3.0);
				}
				else if(BanhHienTai[playerid] > 0)
				{
					new rand = random(sizeof(CPPizza));
					SetPlayerCheckpoint(playerid,CPPizza[rand][Pizza_X],CPPizza[rand][Pizza_Y],CPPizza[rand][Pizza_Z],3.0);
				}
			}
			else ChatHoTro(playerid,255,"Ban chua co banh tren tay",5000);
		}
		else if(BanhHienTai[playerid] == 0)
		{
			new veh = GetPlayerVehicleID(playerid);
			if(veh == XeGiaoPizza[playerid][veh_id])
			{
				new Float:mauxe;
				GetVehicleHealth(veh, mauxe);
				new tientraxehu = floatround(1000-mauxe,floatround_round);
				new str[128];
				if(tientraxehu < 0) {
					format(str,sizeof(str),"[GTAVN-AC: %s dang hack GOD/CAR",GetPlayerNameEx(playerid));
					ABroadCast(COLOR_LIGHTRED,str,2);
					tientraxehu = 0;
				}
				format(str,sizeof(str),"{D7DF01}Pizza Delivery{FFFFFF}: Ban duoc nhan $%d tu viec giao pizza va tru $%d vi lam hong xe",TienTraPizza[playerid],tientraxehu);
				SendClientMessageEx(playerid,-1,str);
				format(str,sizeof(str),"{D7DF01}Pizza Delivery{FFFFFF}: %s duoc nhan $%d tu viec giao pizza va tru $%d vi lam hong xe",GetPlayerNameEx(playerid),TienTraPizza[playerid],tientraxehu);
				Log("logs/giaopizza.log", str);
				GivePlayerCash(playerid,-tientraxehu);
				GivePlayerCash(playerid,TienTraPizza[playerid]);
				TienTraPizza[playerid] = 0;
				BanhHienTai[playerid] = -1;
				dalayxe[playerid] = 0;
				DestroyVehicle(XeGiaoPizza[playerid][veh_id]);
				XeGiaoPizza[playerid][veh_id] = 0;
				DisablePlayerCheckpoint(playerid);
			}
		}
	}
	if(CP[playerid] == 27)
	{
		ChatHoTro(playerid,255,"Day la xe cua ban, len xe ~r~/giaobanh ~w~de bat dau di giao banh",5000);
		CP[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	return 1;
}

CMD:giaobanh(playerid,params)
{
    if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
    return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua nhan cong viec");
	new veh = GetPlayerVehicleID(playerid);
	if(veh != XeGiaoPizza[playerid][veh_id]) return ChatHoTro(playerid,255,"Ban khong o tren xe giao pizza cua ban",5000);
	new rand = random(sizeof(CPPizza));
	SetPlayerCheckpoint(playerid,CPPizza[rand][Pizza_X],CPPizza[rand][Pizza_Y],CPPizza[rand][Pizza_Z],3.0);
	batdaugiaobanh[playerid] = 1;
	BanhHienTai[playerid] = 10;
	ChatHoTro(playerid,255,"Hay di den checkpoint de giao banh",5000);
	return 1;
}

CMD:layxecongviecdialogg(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua nhan cong viec");

	if(GetPlayerSkin(playerid) != 155)
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua mac dong phuc cua hang");

	if(dalayxe[playerid] == 1)
		return ChatHoTro(playerid,255,"Ban dang co 1 chiec xe ~r~Pizza ~w~roi, khong the lay them (/timxepizza)",5000);
	//new vehicleid = GetPlayerVehicleID(playerid);
	//new lights,alarm,bonnet,objective;

	XeGiaoPizza[playerid][veh_id] = CreateVehicle(526, XePizzaSP[XePizza][0],XePizzaSP[XePizza][1],XePizzaSP[XePizza][2],XePizzaSP[XePizza][3], 3, 3, -1);
	//new str[1280];
	//format(str,sizeof(str),"{FFFF33}Pizza Delivery{FFFFFF}\nPhuong tien cua {FFFF33}%s.", GetPlayerNameEx(playerid));
	//Text3DPizza[playerid] = CreateDynamic3DTextLabel(str, 0xFFFFFFAA, 0, 0, 0.3, 30, .attachedvehicle = XeGiaoPizza[playerid][veh_id]);
	dalayxe[playerid] = 1;
	SetPlayerCheckpoint(playerid,XePizzaSP[XePizza][0],XePizzaSP[XePizza][1],XePizzaSP[XePizza][2],3.0);
	CP[playerid] = 27;
	XePizza += 1;
	if(XePizza == 5) XePizza = 0;
	//SetVehicleParamsEx(XeGiaoPizza[playerid][veh_id],VEHICLE_PARAMS_OFF,lights,alarm,0,bonnet,0,objective);
	VehicleFuel[XeGiaoPizza[playerid][veh_id]] = 100.0;
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"{D7DF01}Pizza Delivery{FFFFFF} Ban da lay xe tu cua hang, hay chay cho that can than nhe");
	return 1;
}

CMD:timxepizza(playerid,params)
{
	if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
		return ChatHoTro(playerid, 255, "Ban khong phai Pizza Boy",5000);
	if(XeGiaoPizza[playerid][veh_id] == 0) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Pizza Boy ~w~nao!",5000);
	new Float:VPos[3];
	GetVehiclePos(XeGiaoPizza[playerid][veh_id],VPos[0],VPos[1],VPos[2]);
	SetPlayerCheckpoint(playerid,VPos[0],VPos[1],VPos[2],3.0);
	CP[playerid] = 2;
	ChatHoTro(playerid,255,"{D7DF01}Pizza Delivery{FFFFFF}: Xe pizza cua ban duoc tim thay tren ban do.",5000);
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(GetVehicleModel(vehicleid) == 448 && vehicleid != XeGiaoPizza[playerid][veh_id])
		{
		    if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
		    {
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz+1.3);
				PlayerPlaySound(playerid, 1130, slx, sly, slz+1.3);
			    RemovePlayerFromVehicle(playerid);
			    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung phuong tien nay.");
			}
		}
	}
	return 1;
}
