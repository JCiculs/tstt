/*
    ,============================================,
    |     Nametag Custom (He thong ten player)  |
    |               29.11.2023                  |
    |         Script: Nicks / Nickzky           |
    *============================================*

    Contact :
    > FB : https://www.facebook.com/Nick.2208/
    > Discord : nicks6723
*/

/* -------------------------------- INCLUDE -------------------------------- */
#include <YSI_Coding\y_hooks>

/* -------------------------------- DEFINE -------------------------------- */
#define 		NT_DISTANCE 	50.0

/* -------------------------------- VARIABLES -------------------------------- */

new Timer:myNameTagTimer[MAX_PLAYERS] = {Timer:-1, ...};

/* -------------------------------- FUNCTION -------------------------------- */
stock GetHealthDots(playerid)
{
    new dots[64];
    new Float:HP;

    GetPlayerHealth(playerid, HP);
	if(HP == 100)
		dots = "----------";
	else if(HP >= 90 && HP < 100)
		dots = "---------{660000}-";
	else if(HP >= 80 && HP < 90)
		dots = "--------{660000}--";
	else if(HP >= 70 && HP < 80)
		dots = "-------{660000}---";
	else if(HP >= 60 && HP < 70)
		dots = "------{660000}----";
	else if(HP >= 50 && HP < 60)
		dots = "-----{660000}-----";
	else if(HP >= 40 && HP < 50)
		dots = "----{660000}------";
	else if(HP >= 30 && HP < 40)
		dots = "---{660000}-------";
	else if(HP >= 20 && HP < 30)
		dots = "--{660000}--------";
	else if(HP >= 10 && HP < 20)
		dots = "-{660000}---------";
	else if(HP >= 0 && HP < 10)
		dots = "{660000}----------";
	 
	return dots;
}

stock GetArmorDots(playerid)
{
	new dots[64];
	new Float:AR;
	 
	GetPlayerArmour(playerid, AR);
	 
	if(AR == 100)
		dots = "----------";
	else if(AR >= 90 && AR < 100)
		dots = "---------{666666}-";
	else if(AR >= 80 && AR < 90)
		dots = "--------{666666}--";
	else if(AR >= 70 && AR < 80)
		dots = "-------{666666}---";
	else if(AR >= 60 && AR < 70)
		dots = "------{666666}----";
	else if(AR >= 50 && AR < 60)
		dots = "-----{666666}-----";
	else if(AR >= 40 && AR < 50)
		dots = "----{666666}------";
	else if(AR >= 30 && AR < 40)
		dots = "---{666666}-------";
	else if(AR >= 20 && AR < 30)
		dots = "--{666666}--------";
	else if(AR >= 10 && AR < 20)
		dots = "-{666666}---------";
	else if(AR >= 0 && AR < 10)
		dots = "{666666}----------";

    return dots;
}
/* -------------------------------- CALLBACK -------------------------------- */
hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    SetPVarInt(playerid,"TakeNameTagDMG",gettime() + 8);
}

hook OnPlayerConnect(playerid) {
	if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]))
        DestroyDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]);
    PlayerInfo[playerid][pNameTag] = CreateDynamic3DTextLabel("Loading nametag...", 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);
	myNameTagTimer[playerid] = repeat UpdateNameTagTimer(playerid);
	return 1;
}
hook OnPlayerDisconnect(playerid, reason) {
    if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]))
        DestroyDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]);
	PlayerInfo[playerid][pNameTag] = INVALID_3DTEXT_ID;
	if(myNameTagTimer[playerid] != Timer:-1)
	{
		stop myNameTagTimer[playerid];
    	myNameTagTimer[playerid] = Timer:-1;
	}
    return 1;
}
timer UpdateNameTagTimer[500](playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(IsValidDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]))
		{
			new nametag[388], Float:armour;
			GetPlayerArmour(playerid, armour);
			if(playerAFK[playerid] != 0 && playerAFK[playerid] > 60)
			{
				format(nametag, sizeof(nametag), "{F81414}[AFK]{FFFFFF} %s (%d)", GetPlayerNameEx(playerid), playerid);
			}
			else
			{
				if(SuDungMask[playerid] == 1)
				{
					format(nametag, sizeof(nametag), "{%06x}%s{FFFFFF} (%d)", GetPlayerColor(playerid) >>> 8, GetPlayerNameExt(playerid), playerid);
				}
				else
				{
					format(nametag, sizeof(nametag), "{%06x}%s{FFFFFF} (%d)", GetPlayerColor(playerid) >>> 8, GetPlayerNameEx(playerid), playerid);
				}
			}
			if(gettime() < GetPVarInt(playerid, "TakeNameTagDMG") ) 
			{
				if(armour > 1.0)
				{
					format(nametag, sizeof(nametag), "%s\n{FFFFFF}%s\n{FF0000}%s", nametag, GetArmorDots(playerid), GetHealthDots(playerid));
				}
				else
				{
					format(nametag, sizeof(nametag), "%s\n{FF0000}%s", nametag, GetHealthDots(playerid));
				}
			}
			UpdateDynamic3DTextLabelText(PlayerInfo[playerid][pNameTag], 0xFFFFFFFF, nametag);
		}
		else if(!IsValidDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]))  
		{
			DestroyDynamic3DTextLabel(PlayerInfo[playerid][pNameTag]);
			PlayerInfo[playerid][pNameTag] = INVALID_3DTEXT_ID;
			PlayerInfo[playerid][pNameTag] = CreateDynamic3DTextLabel("", 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);
		}
	}
    return 1;
}

