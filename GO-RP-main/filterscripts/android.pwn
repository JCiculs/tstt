
#include <a_samp>
#include <YSI_Coding\y_hooks>
//native SendClientCheck(playerid, type, arg, offset, size);
//forward OnClientCheckResponse(playerid, type, arg, response);

#pragma warning disable 239

//#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0

public OnFilterScriptInit()
{
    print("Android check has been successfully loaded.");
}

public OnFilterScriptExit()
{
    print("\n--------------------------------------");
    print(" Android check filterscript unloaded");
    print("--------------------------------------\n");
    return 1;
}

public OnPlayerConnect(playerid)
{

    SendClientCheck(playerid, 0x48, 0, 0, 2);
    return 1;
}

/*public OnPlayerUpdate(playerid)
{
    new str[128];
    if(GetPVarInt(playerid, "NotAndroid") == 0) // pc
    {
        format(str, 128,"PC\n%s (%d)",GetPlayerNameEx(playerid),playerid);
        HideNamePc[playerid] = Create3DTextLabel(str, -1, 30.0, 40.0, 50.0, 10.0, 0);
        Attach3DTextLabelToPlayer(HideNamePc[playerid], playerid, 0.0, 0.0, 0);
    }
    if(IsPlayerAndroid(playerid)) // mobi
    {
        format(str, 128,"Android\n%s (%d)",GetPlayerNameEx(playerid),playerid);
        SetPlayerChatBubble(playerid, str, -1, 10,190000);
    }
    return 1;
}*/
hook OnClientCheckResponse(playerid, type, arg, response)
{
    switch(type)
    {
        case 0x48:
        {
            SetPVarInt(playerid, "NotAndroid", 1);
        }
    }
    return 1;
}

// SendClientCheck example script by evgen1137
// thanks to MTA devs for structs

