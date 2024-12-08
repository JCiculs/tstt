#include <a_samp>
#include <YSI_Coding\y_hooks>
	enum _:E_ConBo
{
	nuoibo_Owner[32],
	Float:nuoibo_X,
	Float:nuoibo_Y,
	Float:nuoibo_Z,
	nuoibo_World,
	nuoibo_Interior,
	nuoibo_time,

	nuoibo_Object,
	Text3D:nuoibo_Label,
}
static
	Map:ConBo;

CMD:nuoibo(playerid, params[])
{
	/* if(SuDungMask[playerid] == 1)
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the nuoi bo khi dang deo mat na");
	} */	
    if(ConBo_count(playerid) >= 5)
    {
        return SendClientMessageEx(playerid, COLOR_GREY, "ban chi co the nuoi bo 1 lan 5 con");
    }
    if(PlayerInfo[playerid][pPhieunuoibo])
    {
        if(IsPlayerInRangeOfPoint(playerid, 40.0, 2908.7190, -3715.9172, 65.5436)) {
        new
            Info[E_ConBo], str[328], Cache:iCache;
        PlayerInfo[playerid][pPhieunuoibo] -= 1;
        GetPlayerPos(playerid, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z]);
        Info[nuoibo_time] = gettime() + 14400;
        Info[nuoibo_Z] -= 0.9;
        strcat((Info[nuoibo_Owner][0] = '\0', Info[nuoibo_Owner]), GetPlayerNameEx(playerid));
        format(str, sizeof(str), "{FFFF00}Con Bo So Huu: %s{FFFF00}", Info[nuoibo_Owner]);
        Info[nuoibo_Object] = CreateDynamicObject(19833, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], 0.0, 0.0, 0.0, (Info[nuoibo_World] = GetPlayerVirtualWorld(playerid)), (Info[nuoibo_Interior] = GetPlayerInterior(playerid)));
        Info[nuoibo_Label] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], 10.0, .worldid = Info[nuoibo_World], .interiorid = Info[nuoibo_Interior]);

        mysql_format(MainPipeline, str, sizeof(str), "INSERT INTO ConBo (`Owner`, `X`, `Y`, `Z`, `World`, `Interior`, `Time`) VALUES ('%e', %f, %f, %f, %d, %d, %d)", Info[nuoibo_Owner], Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], Info[nuoibo_World], Info[nuoibo_Interior], Info[nuoibo_time]);
        iCache = mysql_query(MainPipeline, str);
        map_add_arr(ConBo, cache_insert_id(), Info);
        cache_delete(iCache);

        SendClientMessageEx(playerid, -1, "Ban da nuoi 1 con bo - 4h sau moi co the ban");
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
        }
        else SendClientMessageEx(playerid, -1, "Ban Khong O Trang Trai De Nuoi Bo");
    }
    else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co phieu nuoi bo, hay di mua");
    return 1;
}

CMD:banbo(playerid)
{
	new
		ranUID = 0, Info[E_ConBo];
	for(new Iter:map = map_iter(ConBo); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.5, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z]))
			{
				ranUID = iter_get_key(map);
				break;
			}
		}
	}
	if(ranUID != 0)
	{
		if(map_get_arr_safe(ConBo, ranUID, Info))
		{
			if(Info[nuoibo_time] - gettime() < 0)
			{
				new
					str[128];

				format(str, sizeof(str), "[He thong] Ban bo thanh cong ban nhan duoc 6,200$");
				SendClientMessage(playerid, -1, str);
				PlayerInfo[playerid][pCash] += 6200;

				DestroyDynamicObject(Info[nuoibo_Object]);
				DestroyDynamic3DTextLabel(Info[nuoibo_Label]);
				

				map_remove_deep(ConBo, ranUID);

				format(str, sizeof(str), "DELETE FROM ConBo WHERE ID = '%i' LIMIT 1", ranUID);
				mysql_tquery(MainPipeline, str, "", "");
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
				cmd_me(playerid, "Lay dung cu ra, va tien hanh ban con bo de lay tien...");
			}
			else SendClientMessageEx(playerid, -1, "[He thong] Ban chua the ban con bo nay.");
		}
	}
	else SendClientMessageEx(playerid, -1, "Ban khong o gan con bo nao ca?");
	return 1;
}


CMD:checkconbo(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new str[128], Info[E_ConBo];
		for(new Iter:map = map_iter(ConBo); iter_inside(map); iter_move_next(map))
		{
			if(iter_get_arr_safe(map, Info))
			{
				format(str, sizeof(str), "%s | %0.1f, %0.1f, %0.1f | VW %d | INT %d", Info[nuoibo_Owner], Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], Info[nuoibo_World], Info[nuoibo_Interior]);
				SendClientMessage(playerid, -1, str);
			}
		}
	}
	return 1;
}

stock ConBo_count(playerid)
{
	new count = 0, Info[E_ConBo];
	for(new Iter:map = map_iter(ConBo); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(strcmp(Info[nuoibo_Owner], GetPlayerNameEx(playerid), true) == 0)
			{
				printf("%s, %s", Info[nuoibo_Owner], GetPlayerNameEx(playerid));
				count ++;
			}
		}
	}
	return count;
}
hook OnGameModeInit()
{
	ConBo = map_new();
	SetTimer("test_conbo", 10, false);
}

forward test_conbo();
public test_conbo()
{
	mysql_tquery(MainPipeline, "SELECT * FROM ConBo", "NuoiBoLoad", "");
}

forward NuoiBoLoad();
public NuoiBoLoad()
{
	new str[228], UID, count, Info[E_ConBo];
	for(new i = 0; i < cache_num_rows(); i ++)
	{
		UID = cache_get_field_content_int(i, "ID");
		cache_get_field_content(i, "Owner", Info[nuoibo_Owner]);
		Info[nuoibo_X] = cache_get_field_content_float(i, "X");
		Info[nuoibo_Y] = cache_get_field_content_float(i, "Y");
		Info[nuoibo_Z] = cache_get_field_content_float(i, "Z");

		Info[nuoibo_time] 	= cache_get_field_content_int(i, "Time");
		Info[nuoibo_World] = cache_get_field_content_int(i, "World");
		Info[nuoibo_Interior] = cache_get_field_content_int(i, "Interior");
		format(str, sizeof(str), "{FFFF00}Con Bo So Huu: %s\n{FFFF00}", Info[nuoibo_Owner]);
		Info[nuoibo_Object] = CreateDynamicObject(Info[nuoibo_time] - gettime() < 0 ? 19833 : 19833, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], 0.0, 0.0, 0.0, Info[nuoibo_World], Info[nuoibo_Interior]);
		Info[nuoibo_Label] = CreateDynamic3DTextLabel(str, COLOR_YELLOW, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], 10.0, .worldid = Info[nuoibo_World], .interiorid = Info[nuoibo_Interior]);

		map_add_arr(ConBo, UID, Info);
		count ++;
	}
}

task nuoibo_15s[10000]()
{
	new Info[E_ConBo];
	for(new Iter:map = map_iter(ConBo); iter_inside(map); iter_move_next(map))
	{
		if(iter_get_arr_safe(map, Info))
		{
			if(Info[nuoibo_time] - gettime() < 0)
			{
				DestroyDynamicObject(Info[nuoibo_Object]);
				map_set_cell(ConBo, iter_get_key(map), nuoibo_Object, CreateDynamicObject(Info[nuoibo_time] - gettime() < 0 ? 19833 : 19833, Info[nuoibo_X], Info[nuoibo_Y], Info[nuoibo_Z], 0.0, 0.0, 0.0, Info[nuoibo_World], Info[nuoibo_Interior]));
			}
			else
			{
				if(Info[nuoibo_time] - gettime() < -10)
				{
					DestroyDynamicObject(Info[nuoibo_Object]);
					DestroyDynamic3DTextLabel(Info[nuoibo_Label]);
					map_remove_deep(ConBo, iter_get_key(map));
				}
			}
		}
	}
}