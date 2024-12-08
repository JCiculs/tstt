/*
# LexAC Anti Cheat include
# Author: Mohammad
# Github: None
# Telegram: https://t.me/cattylip
# Instagram: https://instagram.com/Mohammad_Norozani
# LexAC version: 0.2.2
*/

/*

	 < HACK   Names >

HACK-    JP-HACK   - HACK // 1  (JetPack-HACK)
HACK-   Speed-HACK - HACK // 2  (SpeedCar-HACK)
HACK-   Fly-HACK   - HACK // 3  (Flying-HACK)
HACK-   CP-HACK    - HACK // 4  (CheckPoint-HACK)
HACK-   Aim-HACK   - HACK // 5  (AIMBOT-HACK)
HACK-   CB-HACK    - HACK // 6  (C-BUG-HACK)
HACK-   HP-HACK    - HACK // 7  (Health-HACK)
HACK-	AM-HACK    - HACK // 8  (Armour-HACK)
HACK-  Repair-HACK - HACK // 9  (Repair-HACK)
HACK-   TP-HACK    - HACK // 10 (Teleport-HACK)
HACK-   WP-HACK    - HACK // 11 (Weapon-HACK)
HACK-  DC-Vehicle  - HACK // 12 (Desynced-Vehicle-HACK)
HACK-   IMP-HACK   - HACK // 13 (Impossible changing seat-HACK)
HACK-   RIP-HACK#1 - HACK // 14 (RiP-HACK kill all players)
HACK-   RIP-HACK#2 - HACK // 15 (RiP-HACK kill all players)
HACK-   RIP-HACK#3 - HACK // 16 (RiP-HACK kill all players)
HACK- Tunning-HACK - HACK // 17 (Tunning HACK)
HACK-   TP-HACK    - HACK // 18 (Teleport HACK)
HACK-   AIB-HACK   - HACK // 19 (AirBreak HACK)
HACK-  Money-HACK  - HACK // 20 (GiveMoney HACK)
HACK-   CS-HACK    - HACK // 21 (Car Spawner HACK)
HACK- AntiBot-HACK - HACK // 22 (Anti Spam ROBOT HACK)

    <Lex-AC ANTI HACK>


*/

#if defined _lex_ac_included
	#endinput
#endif
#define _lex_ac_included

/* INCLUDES */

#include <a_samp>

/* DEFINES */

#define LEX_AC_VER "0.2.2"
#define COLOR_SendPM 0xFF6347FF
#define EnterRaceCheckPoint OnPlayerEnterRaceCheckpoint
#define DIALOG_LEXWARN 8585
#define GetKeyCBUG(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

/* FORWARDS */

#define LexAC%0(%1) forward %0(%1); public %0(%1)

/* NEW */

new bool:JetPackCheat[MAX_PLAYERS],
	bool:AntiCheat,
	bool:CooldownMSG[MAX_PLAYERS],
	bool:LexCheckPoint[MAX_PLAYERS],
	bool:GodmodeFeature[MAX_PLAYERS],
	bool:Exception[MAX_PLAYERS],
	bool:AFKSeconds[MAX_PLAYERS],
	bool:InDealer[MAX_PLAYERS],
	bool:ArenaSpec[MAX_PLAYERS],
	bool:WarningsCheat[MAX_PLAYERS],
	bool:VehicleExist[MAX_VEHICLES],
	bool:NearPNS[MAX_PLAYERS],
	CountAimBot[MAX_PLAYERS];
	
enum lexEnum
{
	Float:LPosX,
	Float:LPosY,
	Float:LPosZ,
	Float:LSpawnX,
	Float:LSpawnY,
	Float:LSpawnZ,
 	LAiBTime,
	LImmunity
};

static LAC_Info[MAX_PLAYERS][lexEnum];

static const Float:modShopCoords[][] =
{
    {10.0,  -1936.0861, 237.4443,   34.3125},
	{10.0,  -2714.6309, 217.3955,   4.2965},
	{10.0,  2386.7686,  1042.1649,  10.8203},
	{10.0,  2644.9480,  -2037.6088, 13.5500},
	{10.0,  1041.2783,  -1027.8124, 32.1016},
	{50.0,  616.0253,   -8.0157,    1000.9219},
	{50.0,  615.2108,   -75.3288,   997.9922},
	{50.0,  612.9303,   -124.1615,  997.9922}
};


/* PUBLIC */

LexAC LexAC_OnGameModeInit() // Add To OnGameModeInit
{
	print("-=-=-=-=-=-=-=-=-=-=-");
	print("</Lex-AC> Loaded successfully <Lex-AC>");
	print("</Lex-AC> Version: "LEX_AC_VER" <Lex-AC>");
	print("</Lex-AC> Created By: MmDCatty <Lex-AC>");
	print("-=-=-=-=-=-=-=-=-=-=-");
	AntiCheat = true;
	SetTimer("LexAC_CheckCheats", 1000, 1);
}

LexAC LexAC_OnPlayerConnect(playerid) // Add To OnPlayerConnect
{
	JetPackCheat[playerid] = false;
	CooldownMSG[playerid] = false;
	LexCheckPoint[playerid] = false;
	SetTimerEx("ResetCount", 1000, true, "i", playerid);
}

stock Lex_PutPlayerInVehicle(playerid, vehicleid, seatid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(GetVehicleModel(vehicleid))
	    {
	        GetVehiclePos(vehicleid, LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ]);
		}
		LAC_Info[playerid][LImmunity] = gettime() + 5;
	}
	return PutPlayerInVehicle(playerid, vehicleid, seatid);
}

#if defined _ALS_PutPlayerInVehicle
	#undef PutPlayerInVehicle
#else
	#define _ALS_PutPlayerInVehicle
#endif

#define PutPlayerInVehicle Lex_PutPlayerInVehicle

stock Lex_SetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
	new ret = SetPlayerPos(playerid, x, y, z);
	if(ret)
	{
	    LAC_Info[playerid][LPosX] = x;
	    LAC_Info[playerid][LPosY] = y;
	    LAC_Info[playerid][LPosZ] = z;
	    LAC_Info[playerid][LImmunity] = gettime() + 5;
	}
	return ret;
}

#if defined _ALS_SetPlayerPos
	#undef SetPlayerPos
#else
	#define _ALS_SetPlayerPos
#endif

#define SetPlayerPos Lex_SetPlayerPos

static Lex_RangeCheck(Float:x1, Float:y1, Float:z1, Float:radius, Float:x2, Float:y2, Float:z2)
{
	x1 -= x2;
	y1 -= y2;
	z1 -= z2;

	return ((x1 * x1) + (y1 * y1) + (z1 * z1)) < (radius * radius);
}

static Float:Lex_GetSpeed1(playerid)
{
	new
		Float:vx,
		Float:vy,
		Float:vz;

	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid), vx, vy, vz);
	}
	else
	{
	    GetPlayerVelocity(playerid, vx, vy, vz);
	}

	return floatsqroot((vx * vx) + (vy * vy) + (vz * vz));
}

static Lex_IsPlayerNearModShop(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < sizeof(modShopCoords); i ++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, modShopCoords[i][0], modShopCoords[i][1], modShopCoords[i][2], modShopCoords[i][3]))
		    {
		        return 1;
			}
		}
	}
	return 0;
}

stock Lex_SetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
{
	new
	    ret = SetVehiclePos(vehicleid, x, y, z);

	if(ret)
	{
		for(new i = 0, l = GetPlayerPoolSize(); i <= l; i ++)
		{
		    if(GetPlayerState(i) == PLAYER_STATE_DRIVER && IsPlayerInVehicle(i, vehicleid))
		    {
		        LAC_Info[i][LPosX] = x;
		        LAC_Info[i][LPosY] = y;
		        LAC_Info[i][LPosZ] = z;
		        LAC_Info[i][LImmunity] = gettime() + 5;
		        break;
		    }
		}
	}

	return ret;
}

#if defined _ALS_SetVehiclePos
	#undef SetVehiclePos
#else
	#define _ALS_SetVehiclePos
#endif

#define SetVehiclePos Lex_SetVehiclePos

stock Lex_SetSpawnInfo(playerid, team, skin, Float:x, Float:y, Float:z, Float:rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo)
{
	if(IsPlayerConnected(playerid))
	{
	    LAC_Info[playerid][LSpawnX] = x;
	    LAC_Info[playerid][LSpawnY] = y;
	    LAC_Info[playerid][LSpawnZ] = z;
	}

	return SetSpawnInfo(playerid, team, skin, x, y, z, rotation, weapon1, weapon1_ammo, weapon2, weapon2_ammo, weapon3, weapon3_ammo);
}

#if defined _ALS_SetSpawnInfo
	#undef SetSpawnInfo
#else
	#define _ALS_SetSpawnInfo
#endif

#define SetSpawnInfo Lex_SetSpawnInfo

LexAC Lex_OnEnterExitModShop(playerid, enterexit, interiorid) // Add To OnEnterExitModShop
{
	GetPlayerPos(playerid, LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ]);
	LAC_Info[playerid][LImmunity] = gettime() + 5;
}

LexAC Lex_OnPlayerSpawn(playerid) // Add To OnPlayerSpawn
{
    LAC_Info[playerid][LImmunity] = gettime() + 5;
}

hook OnPlayerUpdate(playerid)
{
if(GodmodeFeature[playerid] == true)
{
SetPlayerHealth(playerid, 100000);
}
	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING && GetPlayerState(playerid) != PLAYER_STATE_NONE)
	{
		if(gettime() > LAC_Info[playerid][LImmunity])
		{
			if(!IsPlayerInRangeOfPoint(playerid, 100.0, LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ]) && !IsPlayerInRangeOfPoint(playerid, 5.0, LAC_Info[playerid][LSpawnX], LAC_Info[playerid][LSpawnY], LAC_Info[playerid][LSpawnZ]))
			{
			    new
					Float:x,
					Float:y,
					Float:z;

				GetPlayerPos(playerid, x, y, z);

				if(!Lex_RangeCheck(LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ], 3.0, LAC_Info[playerid][LSpawnX], LAC_Info[playerid][LSpawnY], LAC_Info[playerid][LSpawnZ]) && x != 0.0 && y != 0.0 && z != 0.0 && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER && !Lex_IsPlayerNearModShop(playerid))
				{
					if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
					{
						SendWarn_LexAC(playerid, "Teleport-HACK");
					}
				}
			}
			else if(gettime() > LAC_Info[playerid][LAiBTime] && !IsPlayerInRangeOfPoint(playerid, 10.0, LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ]))
			{
				if((GetPlayerState(playerid) == PLAYER_STATE_ONFOOT || GetPlayerState(playerid) == PLAYER_STATE_DRIVER) && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerSurfingObjectID(playerid) == INVALID_OBJECT_ID)
				{
				    new
				        Float:px,
				        Float:py,
				        Float:pz;

					GetPlayerPos(playerid, px, py, pz);

					px = floatabs(LAC_Info[playerid][LPosX] - px);
					py = floatabs(LAC_Info[playerid][LPosY] - py);
					pz = floatabs(LAC_Info[playerid][LPosZ] - pz);

		            if(((0.5 <= px < 13.9) && (0.5 <= py <= 13.9)) || (4.2 <= pz <= 19.2))
					{
						new
						    Float:speed = Lex_GetSpeed1(playerid);

						if((0.082 <= speed <= 0.215 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) || (0.0009 <= speed <= 0.0013 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
						{
							SendWarn_LexAC(playerid, "AirBreak-HACK");
	     					LAC_Info[playerid][LAiBTime] = gettime() + 1;
						}
					}
			    }
			}
		}
		GetPlayerPos(playerid, LAC_Info[playerid][LPosX], LAC_Info[playerid][LPosY], LAC_Info[playerid][LPosZ]);
	}

	#if defined Lex_OnPlayerUpdate
	    return Lex_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#define OnPlayerUpdate Lex_OnPlayerUpdate

#if defined Lex_OnPlayerUpdate
	forward Lex_OnPlayerUpdate(playerid);
#endif


stock Float:Lex_GetPlayerDistance(pid1, pid2)
{
    new Float:x,Float:y,Float:z;
    return (GetPlayerPos(pid1,x,y,z)?GetPlayerDistanceFromPoint(pid2,x,y,z):-1.0);
}

stock nearPNS(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	{
	    return 1;
	}
}

stock nearPNS2(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	{
	    return 1;
	}
}

stock Lex_GetIP(playerid) 
{
	new LexIP[16];
	GetPlayerIp(playerid, LexIP, sizeof(LexIP));
	return LexIP;
}

stock Lex_GetUser(playerid) 
{
	new LexUser[32];
	GetPlayerName(playerid, LexUser, 32);
	return LexUser;
}

LexAC Kick_LexAC(playerid)
{
	SetTimerEx("Kick2_LexAC", 300, false, "i", playerid);
}

LexAC Kick2_LexAC(playerid)
{
	Kick(playerid);
}

LexAC LexAC_CoolDown(playerid)
{
	CooldownMSG[playerid] = false;
}
				/*     Target	     CheatName	   */
LexAC SendWarn_LexAC(playerid, const cheatname[])
{
	if(AntiCheat == true && CooldownMSG[playerid] == false)
	{
		new string[128];
		format(string, sizeof(string), "{2ECC71}[Lex-AC] {FFFFFF}%s, Server detected %s cheats.",Lex_GetUser(playerid), cheatname);
		SendClientMessage(playerid, -1,string);
		CooldownMSG[playerid] = true;
		SetTimerEx("LexAC_CoolDown", 5000, false, "i", playerid);
	}
}

LexAC SendPM_LexAc(playerid, const cheatname[])
{
	new string[128];
	format(string, sizeof(string), "%s, You've been kicked due to cheating or lagging!\n - Cheat Name: %s\n - Your IP: %s",Lex_GetUser(playerid), cheatname, Lex_GetIP(playerid));
	ShowPlayerDialog(playerid, DIALOG_LEXWARN, DIALOG_STYLE_MSGBOX, "[Lex-AC]", string, "Close", "");
}

LexAC LexAC_GetPlayerSpeed(playerid)
{
	new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid))
	GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
	return floatround(ST[3]);
}

LexAC ResetCount(playerid) 
{
	CountAimBot[playerid] = 0;
}

stock Lex_GetGun(playerid) 
{
	new LexGun = GetPlayerWeapon(playerid) ;

	if(LexGun == 24 || LexGun == 25 || LexGun == 27 || LexGun == 34) return 1;

	return 0;
}

LexAC Lex_OnPlayerKeyStateChange(playerid, newkeys, oldkeys) // Add To OnPlayerKeyStateChange
{
	if((AntiCheat == true && Lex_GetGun(playerid) && GetKeyCBUG(KEY_FIRE)) && newkeys != KEY_FIRE && newkeys & KEY_CROUCH) //CB-HACK ( C-Bug HACK)
	{
       ApplyAnimation(playerid, "PED", "getup", 4.1, 0, 0, 0, 0, 0);
       SendClientMessage(playerid,COLOR_SendPM,"[Lex-AC]:{FFFFFF} don't try c-bug !");
    }
}
LexAC Lex_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) // Add To OnPlayerEnterVehicle
{
	new Float:vPosition[3];
	GetVehiclePos(vehicleid,vPosition[0],vPosition[1],vPosition[2]);
	if(AntiCheat == true && !ispassenger&&!IsPlayerInRangeOfPoint(playerid,10.0,vPosition[0],vPosition[1],vPosition[2]))
	{
		SetVehiclePos(vehicleid,vPosition[0],vPosition[1],vPosition[2]);
	    GetPlayerPos(playerid,vPosition[0],vPosition[1],vPosition[2]);
	    SetPlayerPos(playerid,vPosition[0],vPosition[1],vPosition[2]);
	    SendWarn_LexAC(playerid, "Desynced-Vehicle");
	}
}

LexAC Lex_OnPlayerStateChange(playerid, newstate, oldstate)
{
	if((AntiCheat == true
		&& oldstate==PLAYER_STATE_DRIVER||oldstate==PLAYER_STATE_PASSENGER)
			&&(newstate==PLAYER_STATE_DRIVER||newstate==PLAYER_STATE_PASSENGER))
	{
		SendWarn_LexAC(playerid, "Impossible changing seat"); // Impossible changing seat 
	}
}

LexAC Lex_AirPlane(playerid, vehicleid)
{
	vehicleid = GetPlayerVehicleID(playerid);
	switch(GetVehicleModel(vehicleid))
	{
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 498, 563, 447, 469: return true;
	}
	return false;
}
//Its Flyhack :|
LexAC FlyCheckSpeed(playerid)
{
	new Float: animpos[3];
	GetPlayerVelocity(playerid, animpos[0], animpos[1], animpos[2]);	
	if(animpos[0] <= -0.500000 || animpos[1] <= -0.500000 || animpos[2] <= -0.500000 
		&& GetPlayerState(playerid) != PLAYER_STATE_DRIVER 
			&& GetPlayerState(playerid) != PLAYER_STATE_PASSENGER) 
	{
		FlyCheckSurf(playerid);
	}
}
LexAC FlyCheckSurf(playerid)
{
	new surfx = GetPlayerSurfingVehicleID(playerid);
	if(surfx == INVALID_VEHICLE_ID) 
	{					
		SendWarn_LexAC(playerid, "Fly-Hack");
	}
}
//
LexAC LexAC_CheckCheats(playerid) //Get Cheats
{
	if(AntiCheat == true)
	{
		if(GetPlayerSpecialAction(playerid) == 2 
			&& JetPackCheat[playerid] == false) // JetPack HACK
		{
			SendWarn_LexAC(playerid, "JetPack");
			SendPM_LexAc(playerid, "JetPack-Hack");
			Kick_LexAC(playerid);
		}
		if(LexAC_GetPlayerSpeed(playerid) >= 250) //Speed HACK
		{
			SendWarn_LexAC(playerid, "Speed-Hack");
		}
		new anim = GetPlayerAnimationIndex(playerid);
		if(anim == 1008 || anim == 1538 || anim == 159 || anim == 157 || anim == 958)		
		{
			FlyCheckSpeed(playerid);
		}
		if(CountAimBot[playerid] >= 3)
		{
			SendWarn_LexAC(playerid, "Aim-Bot");
		}
		new Float: Lex_GetHP; 
		GetPlayerHealth(playerid, Lex_GetHP);		
		if(Lex_GetHP == 100 && PlayerInfo[playerid][pAdmin] == 0) //Health HACK
		{
			SendWarn_LexAC(playerid, "Health-HACK");
		}
		new Float: Lex_GetAM; 
		GetPlayerArmour(playerid, Lex_GetAM);
		if(Lex_GetAM == 100 && PlayerInfo[playerid][pAdmin] == 0 && GetPVarInt(playerid, "Armour") == 0) //Armour HACK
		{
			SendWarn_LexAC(playerid, "Armour-HACK");
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerInterior(playerid) == 0)  //Repair-HACK
		{
			if(!nearPNS(playerid) && VehicleExist[GetPlayerVehicleID(playerid)] == 1 && PlayerInfo[playerid][pAdmin] == 0)
			{
				new Float: vhp;
				GetVehicleHealth(GetPlayerVehicleID(playerid), vhp);
				if(vhp == 1000) 
				{
					SendWarn_LexAC(playerid, "Repair-Hack");
					RemovePlayerFromVehicle(playerid);
				}					
			}
			if(!nearPNS2(playerid) && NearPNS[playerid] == 1) DisableRemoteVehicleCollisions(playerid, 0), NearPNS[playerid] = 0;
			if(nearPNS2(playerid)) 
			{
				DisableRemoteVehicleCollisions(playerid, 1);
				NearPNS[playerid] = 1;
			}
		}
		if(GetPlayerWeapon(playerid) >= 8 && GetPlayerWeapon(playerid) != 46 && GetPlayerWeapon(playerid) != 43 && PlayerInfo[playerid][pGunLic] == 0)
		{
			SendWarn_LexAC(playerid, "Weapon-Hack"); //Weapon-HACK
		}
		new Float:LastPos[MAX_PLAYERS][3];
		if(!IsPlayerInRangeOfPoint(100.0, playerid, LastPos[playerid][0], LastPos[playerid][1], LastPos[playerid][2])
			&& !IsPlayerInArea(playerid, -3000, -2274.5, -1776, -859.5) 
				&& PlayerInfo[playerid][pAdmin] == 0 && Exception[playerid] == 0 && AFKSeconds[playerid] < 10 
					&& InDealer[playerid] == 0 && ArenaSpec[playerid] == -1 && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER 
						&& Spectate[playerid] == 255 && GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID) 
		{
			WarningsCheat[playerid] += 2;
			if(WarningsCheat[playerid] >= 4) 
			{ 		
				SendWarn_LexAC(playerid, "Teleport-Hack");		//Teleport-HACK
				WarningsCheat[playerid] = -3;
			}	
		}
	}
}

LexAC Lex_CheckPoint(playerid) // Add To SetPlayerCheckPoint And SetPlayerRaceCheckPoint
{
	LexCheckPoint[playerid]=true;
}

LexAC LDisablePlayerRaceCheckpoint(playerid) // Add To DisablePlayerRaceCheckPoint
{
	LexCheckPoint[playerid]=false;
}

LexAC LDisablePlayerCheckpoint(playerid) // Add To DisablePlayerCheckPoint
{
	LexCheckPoint[playerid]=false;
}

LexAC Lex_EnterCheckPoint(playerid) // Add To OnPlayerEnterCheckPoint and OnPlayerEnterRaceCheckPoint
{
	if(AntiCheat == true && LexCheckPoint[playerid] == false) // FakeCP Hack
	{
		SendPM_LexAc(playerid, "FakeCP-Hack");
		SendWarn_LexAC(playerid, "Fake-CP");
		Kick_LexAC(playerid);
	} 
	LexCheckPoint[playerid]=false;
}

stock GetSniper(playerid)
{
	if(GetPlayerWeapon(playerid) == 34) return 0;
	return 1;
}

LexAC Lex_OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) //Add To OnPlayerTakeDamage
{
    if(AntiCheat == true && issuerid != INVALID_PLAYER_ID && bodypart == 9) //AIMBOT-HACK
    {
    	CountAimBot[issuerid] ++;
    }
	if(AntiCheat == true && GetSniper(issuerid) == 34 && Lex_GetPlayerDistance(playerid,issuerid) > 301) //RIP-HACK #1
	{
		SendPM_LexAc(issuerid, "RIP-Hack #1");
		SendWarn_LexAC(issuerid, "RiP-Hack #1");
		Kick_LexAC(issuerid);
	}
}

LexAC Lex_PlayerDeath(playerid, killerid, reason)
{
	if(AntiCheat == true && GetSniper(killerid) && Lex_GetPlayerDistance(playerid,killerid) > 301) //RIP-HACK #1
	{
		SendPM_LexAc(killerid, "RIP-Hack #1");
		SendWarn_LexAC(killerid, "RiP-Hack #1");
		Kick_LexAC(killerid);
	}
	if(AntiCheat == true && GetSniper(killerid) && Lex_GetPlayerDistance(killerid,playerid) > 301 && reason != 34)  //RIP-HACK #2
	{
		SendPM_LexAc(killerid, "RIP-Hack #2");
		SendWarn_LexAC(killerid, "RiP-Hack #2");
		Kick_LexAC(killerid);
	}
}
LexAC Lex_OnVehicleMod(playerid, vehicleid, componentid) //Add To OnVehicleMod
{
	if(AntiCheat == true && GetPlayerInterior(playerid) == 0)
	{
		SendWarn_LexAC(playerid, "Tunning-HACK");
	}
}
LexAC Lex_MaxGunDamage(playerid, weaponid)
{
	new GetDamage;
	    
	if(weaponid >= 0 || weaponid <= 46)
	{
		switch(weaponid)
		{
		    case 0..15:
		    {
		    	GetDamage = 1;
		    }
		    case 19, 31:
		    {
		    	GetDamage = 70;
		    }
			case 20, 38:        
			{
				GetDamage = 60;
			}
			case 22..24:
			{
				GetDamage = 30;
			}
			case 25, 27:
			{
				GetDamage = 40;
			}
			case 26, 28:
			{
				GetDamage = 30;
			}
			case 29, 32:
			{
				GetDamage = 30;
			}
			case 30: GetDamage = 70;
			case 33: GetDamage = 90;
			case 34: GetDamage = 300;
			default: GetDamage = 0;
		}
		return GetDamage;
	}
	SendWarn_LexAC(playerid, "RiP-Hack #3");
	return 0;
}

/*

// Added to gamemode for off and on

Cat->anticheatoff<playerid, params[]>
{
	if(PlayerInfo[playerid][pAdmin] < 8) return SendClientMessage(playerid,COLOR_SERVER, AdminOnly);
	new sendername[30], string[256];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string,sizeof(string),"{AA0000}[ADM-WARN]: {FFFFFF}%s Has turned off the Anti Cheat System.",sendername);
	SendAdminMessage(COLOR_SERVER, string,1);
	AntiCheat = false;
	return 1;
}
Cat->anticheaton<playerid, params[]>
{
	if(PlayerInfo[playerid][pAdmin] < 8) return SendClientMessage(playerid,COLOR_SERVER, AdminOnly);
	new sendername[30], string[256];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	format(string,sizeof(string),"{AA0000}[ADM-WARN]: {FFFFFF}%s Has turned on the Anti Cheat System.",sendername);
	SendAdminMessage(COLOR_SERVER, string,1);
	AntiCheat = true;
	return 1;
}
Cat->antiboton<playerid, params[]>
{
	new string[128];
	if(PlayerInfo[playerid][pAdmin]<=9) return ErrorMessage(playerid, ERROR_NOT_AUTHORISED);
	if(EnableAntiBot==true)return SCM(playerid,COLOR_RED,"anti bot is already enabled.");
	EnableAntiBot=true;
	format(string,sizeof(string),"[Admin-Warn]: {FFFFFF}Admin %s has enabled the server's antibot system",PlayerInfo[playerid][pName]);
	SendAdminMessage(COLOR_ADMIN,string,1);
	return 1;
}
Cat->antibotoff<playerid, params[]>
{
	new string[128];
	if(PlayerInfo[playerid][pAdmin]<=9) return ErrorMessage(playerid, ERROR_NOT_AUTHORISED);
	if(EnableAntiBot==false)return SCM(playerid,COLOR_RED,"anti bot is already disabled.");
	EnableAntiBot=false;
	format(string,sizeof(string),"[Admin-Warn]: {FFFFFF}Admin %s has disabled the server's antibot system",PlayerInfo[playerid][pName]);
	SendAdminMessage(COLOR_ADMIN,string,1);
	return 1;
}
*/
