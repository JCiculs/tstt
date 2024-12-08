#include <YSI_Coding\y_hooks>

forward OnVehicleHealthChange(vehicleid, newhealth, oldhealth);
new
    prviHealth[MAX_VEHICLES], noviHealth[MAX_VEHICLES], bool:PopravioVozilo[MAX_PLAYERS];

Float:VehicleHealth(vehicleid)
{
  new
      Float:health;
  GetVehicleHealth(vehicleid, health);
  return health;
}

stock
    GetVehicleDriver(vehicleid)
{
    for(new i; i < MAX_PLAYERS; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        if(GetPlayerState(i) != PLAYER_STATE_DRIVER) continue;
        if(GetPlayerVehicleID(i) == vehicleid)
        {
            return i;
        }
    }
    return -1;
}

public OnFilterScriptExit()
{
    return 1;
}

forward AntiRepairTimer();
public AntiRepairTimer()
{
    for(new vehicleid = 1; vehicleid <= MAX_VEHICLES; vehicleid++)
    {
        noviHealth[vehicleid] = floatround(VehicleHealth(vehicleid));
        if(noviHealth[vehicleid] != prviHealth[vehicleid])
        {
            OnVehicleHealthChange(vehicleid, noviHealth[vehicleid], prviHealth[vehicleid]);
            prviHealth[vehicleid] = noviHealth[vehicleid];
        }
    }
    return true;
}

hook OnVehicleHealthChange(vehicleid, newhealth, oldhealth)
{
	if(PlayerInfo[playerid][pNhanvienxang] < 0)
	{
    if(newhealth > oldhealth)
    {
        if(GetVehicleDriver(vehicleid) != -1)
        {
            if(!PopravioVozilo[GetVehicleDriver(vehicleid)])
            {
                SendClientMessage(GetVehicleDriver(vehicleid), 0xF81414FF, "[Anti-Cheat] Co The Dang Su Dung Cleo Fix Vehicle.");
            }
            else
            {
                PopravioVozilo[GetVehicleDriver(vehicleid)] = false;
            	}
            }
        }
	}
    return true;
}
