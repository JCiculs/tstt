#include <a_samp>
#include <YSI_Coding\y_hooks>

#define CHONGANG 8948

//new
new DaChonGang[MAX_PLAYERS];


//dialog

hook OnPlayerSpawn(playerid)
{
    if(DaChonGang[playerid] == 0)
    {
        ShowPlayerDialog(playerid, CHONGANG, DIALOG_STYLE_LIST, "Lua Chon - V0.0.1", "{00ff00}Grove Street\n{ca27f2}Ballas Gang\n{c6f227}Los Santos Vagos", "Option 1", "Option 2");
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
                    DaChonGang[playerid] = 1;
                    SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[GROVE] {ffffff}Ban da chon phe GROVE STREET");
                    switch(random(3))
                    {
                        case 1: SetPlayerSkin(playerid, 106);
                        case 2: SetPlayerSkin(playerid, 105);
                        case 3: SetPlayerSkin(playerid, 107);
                    }
                }
                     // Give them an M4
                case 1: {
                    DaChonGang[playerid] = 2;
                    SendClientMessage(playerid, COLOR_WHITE, "{b60aff}[BALLAS] {ffffff}Ban da chon phe BALLAS GANG");
                    switch(random(3))
                    {
                        case 1: SetPlayerSkin(playerid, 102);
                        case 2: SetPlayerSkin(playerid, 103);
                        case 3: SetPlayerSkin(playerid, 104);
                    }
                } // Give them an MP5
                case 2: {
                    DaChonGang[playerid] = 3;
                    SendClientMessage(playerid, COLOR_WHITE, "{d4ff00}[VAGOS] {ffffff}Ban da chon phe VAGOS GANG");
                    switch(random(3))
                    {
                        case 1: SetPlayerSkin(playerid, 108);
                        case 2: SetPlayerSkin(playerid, 109);
                        case 3: SetPlayerSkin(playerid, 110);
                    }
                } // Give them an AK-47
            }
        }
    }
}
