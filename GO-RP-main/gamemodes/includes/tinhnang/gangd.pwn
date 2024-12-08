#include <a_samp>
#include <YSI_Coding\y_hooks>

#define CHONGANG 8948

//new
//new DaChonGang[MAX_PLAYERS];


//dialog

hook OnPlayerSpawn(playerid)
{
    if(IsACop(playerid)) return;
    if(IsAMedic(playerid)) return;
    if(IsAMechanic(playerid)) return;
    if(IsACasino(playerid)) return;
    if(PlayerInfo[playerid][pGang] == 0)
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
                    ShowPlayerDialog(playerid, CHONGANG, DIALOG_STYLE_LIST, "Lua Chon - V0.0.1", "{00ff00}Grove Street\n{ca27f2}Ballas Gang\n{c6f227}Los Santos Vagos", "Chon ", "");
                    SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[GROVE] {ffffff}GROVER STREET Da Full 20/20");
                    return 1;
                }
                case 1: {
                    PlayerInfo[playerid][pGang] = 2;
                    PlayerInfo[playerid][pFMember] = 2; 
                    PlayerInfo[playerid][pRank] = 0;
                    PlayerInfo[playerid][pDivision] = 0;
                    //cmd_switchfam(playerid, 2);
                    SendClientMessage(playerid, COLOR_WHITE, "{b60aff}[BALLAS] {ffffff}Ban da chon phe BALLAS GANG");
                    return 1;
                } 
                case 2: {
                    PlayerInfo[playerid][pGang] = 3;
                    PlayerInfo[playerid][pFMember] = 3; 
                    PlayerInfo[playerid][pRank] = 0;
                    PlayerInfo[playerid][pDivision] = 0;
                    //cmd_switchfam(playerid, 3);
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

/*task GangRandom[1000]()
{
    foreach(new i: Player)
	{
    new hour, minute;
    gettime(hour, minute);
    
    if (hour == 20 && minute == 30)
    {
        if (PlayerInfo[i][pGang] >= 1 && PlayerInfo[i][pGang] <= 3)
        {
            SendClientMessage(i, -1, "{00ff00}/gthamgia"); // Gửi thông báo cho người chơi
        }
    }
}*/
/*CMD:gthamgia(playerid, params[])
{
    if(DaChonGang[playerid] == 1) { 
        return SendClientMessage(playerid,COLOR_WHITE, "Ban da tham gia truoc do roi");
    }
    if (PlayerInfo[i][pGang] >= 1 && PlayerInfo[i][pGang] <= 3 & DaChonGang[playerid] == 0) 
    {
        if(PlayerInfo[i][pGang] == 1)
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}Play To Fun, Not Drama");
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}/trogiupchiemdong");
            SetPlayerPos(playerid, 2228.3394,-1739.0873,13.5491);
            DaChonGang[playerid] = 1;
        }
        if(PlayerInfo[i][pGang] == 1)
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}Play To Fun, Not Drama");
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}/trogiupchiemdong");
            SetPlayerPos(playerid, 2299.9409,-1740.3541,13.5469);
            DaChonGang[playerid] = 1;
        }
        if(PlayerInfo[i][pGang] == 1)
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}Play To Fun, Not Drama");
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[CLAIM] {ffffff}/trogiupchiemdong");
            SetPlayerPos(playerid, 2265.6443,-1759.3188,13.5469);
            DaChonGang[playerid] = 1;
        }
        return 1;
    }
    return 1;
}*/