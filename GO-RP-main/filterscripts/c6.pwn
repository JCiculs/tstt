#include <a_samp>
#include <streamer>
public OnFilterScriptExit()
{
    for(new i; i < MAX_PLAYERS; i++)
    {
        if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0) TogglePlayerControllable(i, false);
    }
}
public OnFilterScriptInit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	//
	RemoveBuildingForPlayer(playerid, 5536, 1866.3281, -1789.7813, 20.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 1308, 1867.7188, -1798.2031, 12.7031, 0.25);
    RemoveBuildingForPlayer(playerid, 5397, 1866.3281, -1789.7813, 20.9453, 0.25);
    // 247
    RemoveBuildingForPlayer(playerid, 5409, 1918.848, -1776.328, 16.975, 0.250);
	RemoveBuildingForPlayer(playerid, 5535, 1918.848, -1776.328, 16.975, 0.250);
	RemoveBuildingForPlayer(playerid, 5681, 1921.479, -1778.910, 18.577, 0.250);
	RemoveBuildingForPlayer(playerid, 1524, 1910.160, -1779.660, 18.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1778.448, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1774.310, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1771.338, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1767.290, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 955, 1928.729, -1772.448, 12.944, 0.250);

	return 1;
}
