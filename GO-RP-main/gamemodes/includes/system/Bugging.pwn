#include <a_samp>
#include <YSI_Coding\y_hooks>
#define DIALOG_CHECKBUGGING 1509

new checkbugging[MAX_PLAYERS] = 0;

hook OnPlayerUpdate(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        new Float: x, Float:y, Float: z;
        GetPlayerPos(playerid, x, y, z);
//        new anim_index = GetPlayerAnimationIndex(playerid);

        if(checkbugging[playerid] == 0 && z < -20.0)
        {
            CA_FindZ_For2DCoord(x, y, z);
            TogglePlayerControllable(playerid, 0);
            SetPVarFloat(playerid, "Posx", 1529.6);
            SetPVarFloat(playerid, "Posy", -1691.2);
            SetPVarFloat(playerid, "Posz", 13.3);
            ShowPlayerDialog(playerid, DIALOG_CHECKBUGGING, DIALOG_STYLE_MSGBOX, "[!] Anti Bug", "Ban hien dang bi bug vui long chon Xu Li de len mat dat.", "XU LI", "Cancel");
            return 1;
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_CHECKBUGGING)
    {
        if(response == 1)
    {
        new Float: x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPos(playerid, GetPVarFloat(playerid, "Posx"), GetPVarFloat(playerid, "Posy"), GetPVarFloat(playerid, "Posz"));
        TogglePlayerControllable(playerid, true);
        checkbugging[playerid] = 0;
        }
    }
    return 1;
}