/*
    Teleport (Made by LJ)
*/

#include <a_samp>
static
    Float:player_pos[MAX_PLAYERS][3], tick[MAX_PLAYERS], SpawnCon[MAX_PLAYERS];

stock Prefix_SetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
    player_pos[playerid][0] = x,
    player_pos[playerid][1] = y,
    player_pos[playerid][2] = z;

    TP_Tick(playerid, 1000);
	return SetPlayerPos(playerid, x, y, z);
}

#if defined _ALS_SetPlayerPos
	#undef SetPlayerPos
#else
	#define _ALS_SetPlayerPos
#endif

#define SetPlayerPos Prefix_SetPlayerPos

stock Prefix_SetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
{
    foreach(new playerid: Player)
    {
    	if(GetPlayerVehicleID(playerid) == vehicleid)
    	{
	        player_pos[playerid][0] = x,
		    player_pos[playerid][1] = y,
		    player_pos[playerid][2] = z;

		    TP_Tick(playerid, 1000);
    	}
    }
	return SetVehiclePos(vehicleid, Float:x, Float:y, Float:z);
}

#if defined _ALS_SetVehiclePos
	#undef SetVehiclePos
#else
	#define _ALS_SetVehiclePos
#endif

#define SetVehiclePos Prefix_SetVehiclePos

stock pds_SetPlayerPosFindZ(playerid, Float:x, Float:y, Float:z)
{
    player_pos[playerid][0] = x,
    player_pos[playerid][1] = y,
    player_pos[playerid][2] = z;

    TP_Tick(playerid, 1000);
    return SetPlayerPosFindZ(playerid, x, y, z);
}

#if defined _ALS_SetPlayerPosFindZ
    #undef SetPlayerPosFindZ
#else
    #define _ALS_SetPlayerPosFindZ
#endif

#define SetPlayerPosFindZ pds_SetPlayerPosFindZ

stock pds_SetPlayerVirtualWorld(playerid, worldid)
{
	GetPlayerPos(playerid, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]);
    TP_Tick(playerid, 1000);
    return SetPlayerVirtualWorld(playerid, worldid);
}

#if defined _ALS_SetPlayerVirtualWorld
    #undef SetPlayerVirtualWorld
#else
    #define _ALS_SetPlayerVirtualWorld
#endif

#define SetPlayerVirtualWorld pds_SetPlayerVirtualWorld

hook OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	tick[playerid] = GetTickCount() + 1000;
    GetPlayerPos(playerid, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]);
    return 1;
}

stock TP_Tick(playerid, ticak)
{
    tick[playerid] = GetTickCount() + ticak;
    return 1;
}

#include <YSI\y_hooks>
hook OnPlayerSpawn(playerid)
{
    SpawnCon[playerid] = 1;
    tick[playerid] = GetTickCount() + 2000;
    GetPlayerPos(playerid, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]);
    return 1;
}

hook OnPlayerConnect(playerid)
{
    SpawnCon[playerid] = 1;
    GetPlayerPos(playerid, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]);
    return 1;
}

hook OnPlayerUpdate(playerid)
{
    if(tick[playerid] - GetTickCount() <= 0)
    {
        if(SpawnCon[playerid] == 0)
        {
			new Float:range = IsPlayerInAnyVehicle(playerid) ? 100.0 : 50.0;
            if(!IsPlayerInRangeOfPoint(playerid, range, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]) && PlayerInfo[playerid][pAdmin] < 1 && gPlayerLogged{playerid})
            {
                new
                    string[128];

                format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) Hack Teleport.", GetPlayerNameEx(playerid), playerid);
                ABroadCast(COLOR_YELLOW, string, 2);
                Kick(playerid);
                tick[playerid] = GetTickCount() + 1000;
            }
        }
        else
        {
            SpawnCon[playerid] = 0;
        }
    }
    GetPlayerPos(playerid, player_pos[playerid][0], player_pos[playerid][1], player_pos[playerid][2]);
    return 1;
}


