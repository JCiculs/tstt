#include <a_samp>
#include <YSI_Coding\y_hooks>

#define CHONGANG 8948

//new
new DaChonGang[MAX_PLAYERS];


//dialog

hook OnPlayerSpawn(playerid)
{
    if(DaChonGang[playerid] == 0 & !IsACop(playerid) &IsAMedic(playerid))
    {
        ShowPlayerDialog(playerid, CHONGANG, DIALOG_STYLE_LIST, "Lua Chon - V0.0.1", "{00ff00}Grove Street\n{ca27f2}Ballas Gang\n{c6f227}Los Santos Vagos", "Chon ", "");
    }
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == CHONGANG)
    {
        if(response) // If they clicked 'Select' or double-clicked a weapon
        {
            // Give them the weapon
            switch(listitem)
            {
                case 0: {
                    PlayerInfo[playerid][pGang] = 1;
                    PlayerInfo[playerid][pFMember] = 1; 
                    PlayerInfo[playerid][pRank] = 0;
                    PlayerInfo[playerid][pDivision] = 0;
                    cmd_switchfam(playerid, 1);
                    SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[GROVE] {ffffff}Ban da chon phe GROVE STREET");
                    return 1;
                }
                case 1: {
                    PlayerInfo[playerid][pGang] = 2;
                    PlayerInfo[playerid][pFMember] = 2; 
                    PlayerInfo[playerid][pRank] = 0;
                    PlayerInfo[playerid][pDivision] = 0;
                    cmd_switchfam(playerid, 2);
                    SendClientMessage(playerid, COLOR_WHITE, "{b60aff}[BALLAS] {ffffff}Ban da chon phe BALLAS GANG");
                    return 1;
                } 
                case 2: {
                    PlayerInfo[playerid][pGang] = 3;
                    PlayerInfo[playerid][pFMember] = 3; 
                    PlayerInfo[playerid][pRank] = 0;
                    PlayerInfo[playerid][pDivision] = 0;
                    cmd_switchfam(playerid, 3);
                    SendClientMessage(playerid, COLOR_WHITE, "{d4ff00}[VAGOS] {ffffff}Ban da chon phe VAGOS GANG");
                    return 1;
                }
            }
        }
        else
        {
            SendClientMessage(playerid, -1, "Ban phai chon.");
            ShowPlayerDialog(playerid, CHONGANG, DIALOG_STYLE_LIST, "Lua Chon - V0.0.1", "{00ff00}Grove Street\n{ca27f2}Ballas Gang\n{c6f227}Los Santos Vagos", "Chon ", "");
        }
    }
}

/*task GangRandom[2000000]()
{
    foreach(new i: Player)
	{
    if(Dachon)
}
*/