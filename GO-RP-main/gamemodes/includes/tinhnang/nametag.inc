#include <a_samp>
#include <YSI_Coding\y_hooks>

#define NT_DISTANCE 25.0

new Text3D:playerNametag[MAX_PLAYERS];
new Text3D:cNametag[MAX_PLAYERS];

hook OnPlayerConnect(playerid) {
    //playerNametag[playerid] = CreateDynamic3DTextLabel("{FFFFFF}...", COLOR_WHITE, 0.0, 0.0, 0.1, 13.0, .attachedplayer = playerid, .testlos = 1);
    cNametag[playerid] = CreateDynamic3DTextLabel("Loading nametag...", 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);
    return 1;
}

task UpdatePlayerNametag[1000]() {
    foreach(new i: Player) {
        new text[1000];
        if (playerAFK[i] > 0) {
            if(PlayerInfo[i][pAdmin] >= 2) format(text, sizeof text, "{FFFFFF}%s (%d)", GetPlayerNameEx(i), i, playerAFK[i]);
            else format(text, sizeof text, "{FFFFFF}%s (%d)", GetPlayerNameEx(i), i, playerAFK[i]);
        }
        else {
            if(PlayerInfo[i][pAdmin] >= 2) format(text, sizeof text, "{FFFFFF}%s (%d)", GetPlayerNameEx(i), i);
            else format(text, sizeof text, "{FFFFFF}%s (%d)", GetPlayerNameEx(i), i);
        }
        UpdateDynamic3DTextLabelText(playerNametag[i], COLOR_WHITE, text);
    }
}

hook OnPlayerDisconnect(playerid, reason)
{
    if(IsValidDynamic3DTextLabel(cNametag[playerid]))
    DestroyDynamic3DTextLabel(cNametag[playerid]);
    cNametag[playerid] = 0;
    //if (IsValidDynamic3DTextLabel(playerNametag[playerid])) DestroyDynamic3DTextLabel(playerNametag[playerid]);	
	return 1;
}

forward UpdateNametag();
public UpdateNametag()
{
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i))
        {
//        	new
//			  	string[128],
//			    iGroupID = PlayerInfo[i][pMember];

            if(PlayerInfo[i][pOnline] == -1) 
            {
                new nametag[128], playername[MAX_PLAYER_NAME], Float:armour;
                GetPlayerArmour(i, armour);
                GetPlayerName(i, playername, sizeof(playername));
                if(armour > 1.0)
                {
                    format(nametag, sizeof(nametag), "{ff0000}Fake Name {%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i));
                }
                else
                {
                    format(nametag, sizeof(nametag), "{ff0000}Fake Name {%06x}%s {FFFFFF}(%i)\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i));
                }
                UpdateDynamic3DTextLabelText(cNametag[i], 0xFFFFFFFF, nametag);
            }
                else {
                    new nametag[128], playername[MAX_PLAYER_NAME], Float:armour;
                    GetPlayerArmour(i, armour);
                    GetPlayerName(i, playername, sizeof(playername));
                    if(armour > 1.0)
                    {
                        format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i));
                    }
                    else
                    {
                        format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i));
                    }
                    UpdateDynamic3DTextLabelText(cNametag[i], 0xFFFFFFFF, nametag);
                }
            }
            else {
                new nametag[128], playername[MAX_PLAYER_NAME], Float:armour;
                GetPlayerArmour(i, armour);
                GetPlayerName(i, playername, sizeof(playername));
                if(armour > 1.0)
                {
                    format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FFFFFF}%s\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetArmorDots(i), GetHealthDots(i));
                }
                else
                {
                    format(nametag, sizeof(nametag), "{%06x}%s {FFFFFF}(%i)\n{FF0000}%s", GetPlayerColor(i) >>> 8, playername, i, GetHealthDots(i));
                }
                UpdateDynamic3DTextLabelText(cNametag[i], 0xFFFFFFFF, nametag);
            }
        }
    }

GetHealthDots(playerid)
{
    new
        dots[64], Float: HP;

    GetPlayerHealth(playerid, HP);

    if(HP >= 100)
        dots = "----------";
    else if(HP >= 90)
        dots = "---------{660000}-";
    else if(HP >= 80)
        dots = "--------{660000}--";
    else if(HP >= 70)
        dots = "-------{660000}---";
    else if(HP >= 60)
        dots = "llllll{660000}----";
    else if(HP >= 50)
        dots = "-----{660000}-----";
    else if(HP >= 40)
        dots = "----{660000}------";
    else if(HP >= 30)
        dots = "---{660000}-------";
    else if(HP >= 20)
        dots = "--{660000}--------";
    else if(HP >= 10)
        dots = "-{660000}---------";
    else if(HP >= 0)
        dots = "{660000}----------";

    return dots;
}

GetArmorDots(playerid)
{
    new
        dots[64], Float: AR;

    GetPlayerArmour(playerid, AR);

    if(AR >= 100)
        dots = "----------";
    else if(AR >= 90)
        dots = "---------{666666}-";
    else if(AR >= 80)
        dots = "--------{666666}--";
    else if(AR >= 70)
        dots = "-------{666666}---";
    else if(AR >= 60)
        dots = "------{666666}----";
    else if(AR >= 50)
        dots = "-----{666666}-----";
    else if(AR >= 40)
        dots = "----{666666}-----";
    else if(AR >= 30)
        dots = "---{666666}-------";
    else if(AR >= 20)
        dots = "--{666666}--------";
    else if(AR >= 10)
        dots = "-{666666}---------";
    else if(AR >= 0)
        dots = "{666666}----------";

    return dots;
}