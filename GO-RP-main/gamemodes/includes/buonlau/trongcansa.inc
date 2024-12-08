	enum _:E_CanSa
{
	cs_Owner[32],
	Float:cs_X,
	Float:cs_Y,
	Float:cS_Z,
	cs_World,
	cs_Interior,
	cs_time,

	cs_Object,
	Text3D:cs_Label,
}


static
	Map:CanSa;

CMD:trongcansa(playerid, params[])
{
	if(CanSa_count(playerid) >= 2)
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co 2 lan trong");
	}
	if(PlayerInfo[playerid][pHatGiong])
	{
		new
			Info[E_CanSa], str[328], Cache:iCache;
        PlayerInfo[playerid][pHatGiong] -= 1;
		GetPlayerPos(playerid, Info[cs_X], Info[cs_Y], Info[cS_Z]);
		Info[cs_time] = gettime() + 7200;
		Info[cS_Z] -= 0.9;
		strcat((Info[cs_Owner][0] = '\0', Info[cs_Owner]), GetPlayerNameEx(playerid));
		format(str, sizeof(str), "{770000}SO HUU: %s\n{33FF66}/thuhoach\nCo the cuop", Info[cs_Owner]);
		Info[cs_Object] = CreateDynamicObject(19473, Info[cs_X], Info[cs_Y], Info[cS_Z], 0.0, 0.0, 0.0, (Info[cs_World] = GetPlayerVirtualWorld(playerid)), (Info[cs_Interior] = GetPlayerInterior(playerid)));
		Info[cs_Label] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, Info[cs_X], Info[cs_Y], Info[cS_Z], 10.0, .worldid = Info[cs_World], .interiorid = Info[cs_Interior]);

		mysql_format(MainPipeline, str, sizeof(str), "INSERT INTO CanSa (`Owner`, `X`, `Y`, `Z`, `World`, `Interior`, `Time`) VALUES ('%e', %f, %f, %f, %d, %d, %d)", Info[cs_Owner], Info[cs_X], Info[cs_Y], Info[cS_Z], Info[cs_World], Info[cs_Interior], Info[cs_time]);
		iCache = mysql_query(MainPipeline, str);
		map_add_arr(CanSa, cache_insert_id(), Info);
		cache_delete(iCache);

		SendClientMessageEx(playerid, -1, "Ban da trong mot cay can sa co the thu hoach sau 2h");
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co hat giong hay vao khu cho den de mua noo");
	return 1;
}

CMD:tronghoa_admintesta(playerid)
{
	new
		Info[E_CanSa], str[328], Cache:iCache;

	GetPlayerPos(playerid, Info[cs_X], Info[cs_Y], Info[cS_Z]);
	Info[cs_time] = gettime() + 10;
	Info[cS_Z] -= 0.9;

	strcat((Info[cs_Owner][0] = '\0', Info[cs_Owner]), GetPlayerNameEx(playerid));
	format(str, sizeof(str), "{99ff33}HAT GIONG\n{ffffff}Nguoi trong: {99ff33}%s\n{ffffff}Su dung lenh {99ff33}/haihoa{ffffff} de hai", Info[cs_Owner]);
	Info[cs_Object] = CreateDynamicObject(19473, Info[cs_X], Info[cs_Y], Info[cS_Z], 0.0, 0.0, 0.0, (Info[cs_World] = GetPlayerVirtualWorld(playerid)), (Info[cs_Interior] = GetPlayerInterior(playerid)));
	Info[cs_Label] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, Info[cs_X], Info[cs_Y], Info[cS_Z], 10.0, .worldid = Info[cs_World], .interiorid = Info[cs_Interior]);

	mysql_format(MainPipeline, str, sizeof(str), "INSERT INTO CanSa (`Owner`, `X`, `Y`, `Z`, `World`, `Interior`, `Time`) VALUES ('%e', %f, %f, %f, %d, %d, %d)", Info[cs_Owner], Info[cs_X], Info[cs_Y], Info[cS_Z], Info[cs_World], Info[cs_Interior], Info[cs_time]);
	iCache = mysql_query(MainPipeline, str);
	map_add_arr(CanSa, cache_insert_id(), Info);
	cache_delete(iCache);

	SendClientMessageEx(playerid, -1, "Ban da trong mot cay can sa co the thu hoach sau 24h");
	return 1;
}

CMD:thuhoach(playerid)
{
	new
		ranUID = 0, Info[E_CanSa];

	for(new Iter:map = map_iter(CanSa); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.5, Info[cs_X], Info[cs_Y], Info[cS_Z]))
			{
				ranUID = iter_get_key(map);
				break;
			}
		}
	}
	if(ranUID != 0)
	{
		if(map_get_arr_safe(CanSa, ranUID, Info))
		{
			if(Info[cs_time] - gettime() < 0)
			{
				new
					str[128];

				format(str, sizeof(str), "[Thu Hoach Thanh Cong] Ban Nhan Duoc 1 Crack va 1 Pot ");
				SendClientMessage(playerid, -1, str);
				PlayerInfo[playerid][pPot] += 1;
				PlayerInfo[playerid][pCrack] += 1;

				DestroyDynamicObject(Info[cs_Object]);
				DestroyDynamic3DTextLabel(Info[cs_Label]);
				map_remove_deep(CanSa, ranUID);

				format(str, sizeof(str), "DELETE FROM CanSa WHERE ID = '%i' LIMIT 1", ranUID);
				mysql_tquery(MainPipeline, str, "", "");
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
			}
			else SendClientMessageEx(playerid, -1, "[Thu Hoach That Bai] Ban chua the thu hoach cay can sa nay.");
		}
	}
	else SendClientMessageEx(playerid, -1, "Ban khong o gan mot cay can sa nao");
	return 1;
}


CMD:checkcansa(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new str[128], Info[E_CanSa];
		for(new Iter:map = map_iter(CanSa); iter_inside(map); iter_move_next(map))
		{
			if(iter_get_arr_safe(map, Info))
			{
				format(str, sizeof(str), "%s | %0.1f, %0.1f, %0.1f | VW %d | INT %d", Info[cs_Owner], Info[cs_X], Info[cs_Y], Info[cS_Z], Info[cs_World], Info[cs_Interior]);
				SendClientMessage(playerid, -1, str);
			}
		}
	}
	return 1;
}

stock CanSa_count(playerid)
{
	new count = 0, Info[E_CanSa];
	for(new Iter:map = map_iter(CanSa); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(strcmp(Info[cs_Owner], GetPlayerNameEx(playerid), true) == 0)
			{
				printf("%s, %s", Info[cs_Owner], GetPlayerNameEx(playerid));
				count ++;
			}
		}
	}
	return count;
}

#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
	CanSa = map_new();
	SetTimer("test_debug", 10, false);
}

forward test_debug();
public test_debug()
{
	mysql_tquery(MainPipeline, "SELECT * FROM CanSa", "CanSaLoad", "");
}

forward CanSaLoad();
public CanSaLoad()
{
	new str[228], UID, count, Info[E_CanSa];
	for(new i = 0; i < cache_num_rows(); i ++)
	{
		UID = cache_get_field_content_int(i, "ID");
		cache_get_field_content(i, "Owner", Info[cs_Owner]);
		Info[cs_X] = cache_get_field_content_float(i, "X");
		Info[cs_Y] = cache_get_field_content_float(i, "Y");
		Info[cS_Z] = cache_get_field_content_float(i, "Z");

		Info[cs_time] 	= cache_get_field_content_int(i, "Time");
		Info[cs_World] = cache_get_field_content_int(i, "World");
		Info[cs_Interior] = cache_get_field_content_int(i, "Interior");
		format(str, sizeof(str), "{770000}Nguoi trong: %s\n{33FF66}/thuhoach", Info[cs_Owner]);
		Info[cs_Object] = CreateDynamicObject(Info[cs_time] - gettime() < 0 ? 19473 : 19473, Info[cs_X], Info[cs_Y], Info[cS_Z], 0.0, 0.0, 0.0, Info[cs_World], Info[cs_Interior]);
		Info[cs_Label] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, Info[cs_X], Info[cs_Y], Info[cS_Z], 10.0, .worldid = Info[cs_World], .interiorid = Info[cs_Interior]);

		map_add_arr(CanSa, UID, Info);
		count ++;
	}
}

task sync_15s[60000]()
{
	new Info[E_CanSa];
	for(new Iter:map = map_iter(CanSa); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(Info[cs_time] - gettime() < 0)
			{
				DestroyDynamicObject(Info[cs_Object]);
				map_set_cell(CanSa, iter_get_key(map), cs_Object, CreateDynamicObject(Info[cs_time] - gettime() < 0 ? 19473 : 19473, Info[cs_X], Info[cs_Y], Info[cS_Z], 0.0, 0.0, 0.0, Info[cs_World], Info[cs_Interior]));
			}
			else
			{
				if(Info[cs_time] - gettime() < -10)
				{
					DestroyDynamicObject(Info[cs_Object]);
					DestroyDynamic3DTextLabel(Info[cs_Label]);
					map_remove_deep(CanSa, iter_get_key(map));
				}
			}
		}
	}
}

