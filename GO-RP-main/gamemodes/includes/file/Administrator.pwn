#include <a_samp>
#include <YSI_Coding\y_hooks>


CMD:vhp(playerid, params[])
{
    	if(IsPlayerInAnyVehicle(playerid))
    	{
	    new szMessage[1280];
		format(szMessage, sizeof(szMessage), "Nguoi choi %s (ID: %d) co the dang dung Hack Car.", GetPlayerNameEx(playerid), playerid);
		ABroadCast(COLOR_RED, szMessage, 2);
	}
	return 1;
}

CMD:chp(playerid, params[])
{
    	if(IsPlayerInAnyVehicle(playerid))
    	{
	    new szMessage[1280];
		format(szMessage, sizeof(szMessage), "Nguoi choi %s (ID: %d) co the dang dung Hack Car.", GetPlayerNameEx(playerid), playerid);
		ABroadCast(COLOR_RED, szMessage, 2);
	}
	return 1;
}


CMD:xoaaccount(playerid, params[]) {

    if(PlayerInfo[playerid][pAdmin] < 8) {
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new string[1280], playername[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]", playername)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /xoaccount [player name]");
    new giveplayerid = ReturnUser(playername);
    if(IsPlayerConnected(giveplayerid)) {
        SendClientMessageEx(playerid, COLOR_YELLOW2, "Nguoi choi nay hien dang ton tai trong may chu, khong the #Delete_Account ngay bay gio!");
    }
    else {
	    new query[15000], tmpName[24];
	    mysql_escape_string(playername, tmpName);

		format(query, sizeof(query), "DELETE FROM `accounts` WHERE `Username`='%s'", tmpName);
		mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "ii", SENDDATA_THREAD, tmpName);

		format(string, sizeof(string), "[GO-RP.NET] Tai khoan %s da bi %s xoa vinh vien ra khoi may chu", tmpName, GetPlayerNameEx(playerid));
		SendClientMessageToAllEx(COLOR_LIGHTRED, string);
	}
	return 1;
}

CMD:abug(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return 0;

	new playername[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]", playername)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /abug [Player Name]");

    new giveplayerid = ReturnUser(playername);
	if(!IsPlayerConnected(giveplayerid))
	{
	    new query[128], tmpName[24], string[1280];
		mysql_escape_string(playername, tmpName);

		format(query, 2048, "UPDATE `accounts` SET `SPos_x` = '%0.2f', `SPos_y` = '%0.2f', `SPos_z` = '%0.2f', `SPos_r` = '%0.2f' WHERE `Username` = '%s'",1830.9292,-1593.1130,13.5469, 90.7264, tmpName);
		mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", SENDDATA_THREAD);

		format(string,sizeof(string),"Ban da fix bug cho account %s...", tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "Nguoi nay hien dang online trong may chu vui long (/sendto).");
	}
	return 1;
}

CMD:catxeall(playerid)
{
	if(PlayerInfo[playerid][pAdmin] <= 2) return 1;
	foreach(new i:Player)
	{
	    for(new a; a < MAX_PLAYERVEHICLES; a++)
	    {
	        if(PlayerVehicleInfo[i][a][pvSpawned] == 1)
	        {
	            new iVehicleID = PlayerVehicleInfo[i][a][pvId];
	            if(!IsPlayerInVehicle(playerid, iVehicleID))
	            {
					--PlayerCars;
					VehicleSpawned[i]--;
					PlayerVehicleInfo[i][a][pvSpawned] = 0;
					PlayerVehicleInfo[i][a][pvFuel] = 100;
					DestroyVehicle(iVehicleID);
					PlayerVehicleInfo[i][a][pvId] = INVALID_PLAYER_VEHICLE_ID;
					g_mysql_SaveVehicle(i, a);
				}
			}
		}
	}
	return 1;
}
