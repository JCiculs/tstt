
//Last Updated : 2018 Jan 27th
#if defined _AntiCarTroll_included
    #endinput
#endif

#define _AntiCarTroll_included

#include <YSI_Coding\y_hooks>

new SafeTimer;

enum ActPData
{
    bool:ActAntiSpam,
    bool:AntiJackBug,
    bool:IsDPaused,
    ActTimer,
    ResetTAct,
    pVehicleID,
    pPauseTick
};

enum ActVData
{
    VehicleTempOwner,
    bool:VehicleTaken
};

new
    ActPlayer[MAX_PLAYERS][ActPData],
    ActVehicle[MAX_VEHICLES][ActVData];

#if defined IsValidVehicle
#else
native IsValidVehicle(vehicleid); // Unlock the hidden native
#endif

forward SafeReset();
forward AntiCarTroll(playerid);
forward ActReset(playerid);
forward sActReset(playerid);
forward ActDelay(playerid);

// UN-Comment this part if you want it to ban.
//#define BanVersion

// Un-Comment this part if you want to use the OnPlayerCarTroll(playerid,vehicleid) function manually.
//#define ManualUse

// Un-Comment this part if you want the safe-extreme mode, will only remove the player from the vehicle.
#define Extreme_Safe

hook OnGameModeInit()
{
		print("		[[--|| rACT V1.0 ||--]]		");
		print("		[[--|| Anti car troll by RogueDrifter V 1.0 ||--]]		");
		print("		[[--|| Successfully Loaded! ||--]]		");
		SafeTimer = SetTimer("SafeReset",5000,true);
}

hook OnGameModeExit()
{
	for(new i, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if(!IsPlayerConnected(i)) continue;
		KillTimer(ActPlayer[i][ActTimer]);
	}
	KillTimer(SafeTimer);
}

stock IsPEnExCar(playerid)
{
	new playeranim = GetPlayerAnimationIndex(playerid);

	if (((playeranim == 1041) || (playeranim == 1012)) || (playeranim == 1025) || (playeranim == 1044) || (playeranim == 1045) ||
	(playeranim == 1010) || (playeranim == 1011) || (playeranim == 1024 || (playeranim == 1043) || (playeranim == 1009))) return 1;
 	else return 0;
}

public SafeReset()
{
	new AllVehicles[MAX_VEHICLES];
    for(new i, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
 		new gpVehicleID[MAX_PLAYERS];
		gpVehicleID[i] = GetPlayerVehicleID(i);
    	if(GetPlayerState(i)== PLAYER_STATE_DRIVER && AllVehicles[gpVehicleID[i]] != i )
    	{
			AllVehicles[gpVehicleID[i]]= i;
			ActVehicle[GetPlayerVehicleID(i)][VehicleTaken]= true;
    		}
		}
	for(new x; x<MAX_VEHICLES; x++)
	{
		if(!IsValidVehicle(x)) continue;
		if(AllVehicles[x] != -1)
		{
			if(GetPlayerState(AllVehicles[x]) != PLAYER_STATE_DRIVER) AllVehicles[x] = -1;
			}
		if(AllVehicles[x] == -1 && ActVehicle[x][VehicleTaken]) ActVehicle[x][VehicleTaken]= false;
		}
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	for(new i, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(!ispassenger && !ActPlayer[playerid][AntiJackBug] && i != playerid && GetPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
			ActPlayer[playerid][AntiJackBug]=true;
			SetTimerEx("sActReset",6000,false,"d",playerid);
			ActPlayer[i][AntiJackBug]=true;
			SetTimerEx("sActReset",6000,false,"d",i);
			}
		}

	return 1;
}

hook OnPlayerConnect(playerid)
{
	ActPlayer[playerid][ActAntiSpam]=false;
	ActPlayer[playerid][AntiJackBug]=false;

	ActPlayer[playerid][ActTimer] = SetTimerEx("AntiCarTroll",2500,true,"d",playerid);
	return 1;
}

public AntiCarTroll(playerid)
{
    if(GetTickCount() > (ActPlayer[playerid][pPauseTick]+4000) && !ActPlayer[playerid][IsDPaused]) ActPlayer[playerid][IsDPaused] = true;
    else if(ActPlayer[playerid][IsDPaused]) ActPlayer[playerid][IsDPaused] = false;
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
	if(!IsValidVehicle(i)) continue;
	if(ActVehicle[i][VehicleTaken] && GetPlayerVehicleID(playerid) == i && playerid != ActVehicle[i][VehicleTempOwner] && !ActPlayer[playerid][AntiJackBug] && !ActPlayer[ActVehicle[i][VehicleTempOwner]][AntiJackBug] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER  && !IsPEnExCar(playerid) && !ActPlayer[ActVehicle[i][VehicleTempOwner]][IsDPaused])
	{
		#if defined Extreme_Safe
		if(!ActPlayer[playerid][ActAntiSpam])
		{
		    ActPlayer[playerid][ActAntiSpam]=true;
			SetPlayerHealth(playerid,0);
			// format(actmsg,sizeof(actmsg),".: Server has scanned %s for Car Troll Cheats :.",pName);
			// SendClientMessageToAll(0xAA3333AA,actmsg);
			return 1;
			}
		#endif
	    #if defined ManualUse
	    #if defined OnPlayerCarTroll
	    	return OnPlayerCarTroll(playerid,i);
    	#endif
	    #else
		new pName[MAX_PLAYER_NAME],actmsg[80];
		GetPlayerName(playerid,pName,sizeof(pName));
		#if defined BanVersion
		format(actmsg,sizeof(actmsg),"banned %s, Ly: Su dung Car spam", pName);
		#else
        format(actmsg,sizeof(actmsg),"Kick %s, Ly: Su dung Car spam", pName);
		#endif
		if(!ActPlayer[playerid][ActAntiSpam])
		{
		    ActPlayer[playerid][ActAntiSpam]=true;
			//SendClientMessageToAll(0xFF0000A,actmsg);
			new vas[128];
			format(vas, 128, "Kick %s | TrollCar", pName);
			ABroadCast(COLOR_LIGHTRED,vas, 2, true);

			RespawnNearbyVehicles(playerid, 300.0);
			//Kick(playerid);
			SetTimerEx("ActDelay",250,false,"d",playerid);
		}
		#endif
		}
	}
	return 1;
}

#if defined ManualUse
	#if defined OnPlayerCarTroll
	forward OnPlayerCarTroll(playerid,vehicleid);// Only use if you defined ManualUse
	#endif

#else



public ActDelay(playerid)
{
	for(new i = 0; i < MAX_VEHICLES; i ++)
	{
	    SetVehicleToRespawn(i);
	}
	#if defined BanVersion
	Ban(playerid);
	#else
	Kick(playerid);
	#endif
	return 1;
}

#endif

public ActReset(playerid)
{
	ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken] = false;
	ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTempOwner] = -1;
	return 1;
}

public sActReset(playerid)
{
	ActPlayer[playerid][AntiJackBug]=false;
	return 1;
}

hook OnPlayerUpdate(playerid)
{
    ActPlayer[playerid][pPauseTick] = GetTickCount();
    return 1;
}
hook OnPlayerStateChange(playerid,newstate,oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    ActPlayer[playerid][pVehicleID] = GetPlayerVehicleID(playerid);
    	if(!ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken])
		{
		    KillTimer(ActPlayer[playerid][ResetTAct]);
			ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken] = true;
			ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTempOwner] = playerid;
		}
	}
	else if(newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_DRIVER)
	{
		ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid);
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
    ActPlayer[playerid][ActAntiSpam]=false;
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid);
	}
	return 1;
}

hook OnPlayerExitVehicle(playerid,vehicleid)
{
	ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    new gpVehicleID;
	gpVehicleID = GetPlayerVehicleID(playerid);

	KillTimer(ActPlayer[playerid][ActTimer]);
	ActPlayer[playerid][IsDPaused] = false;

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    ActVehicle[gpVehicleID][VehicleTaken] =false;
	    ActVehicle[gpVehicleID][VehicleTempOwner] = -1;
	}
	return 1;
}

