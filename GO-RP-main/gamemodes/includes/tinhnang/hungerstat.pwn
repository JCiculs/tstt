
/*
    ,============================================,
    |     Hunger Stat (He thong doi bung)       |
    |               29.11.2023                  |
    |         Script: Nicks / Nickzky           |
    *============================================*

    Contact :
    > FB : https://www.facebook.com/Nick.2208/
    > Discord : nicks6723
*/

/* -------------------------------- INCLUDE -------------------------------- */

#include <YSI_Coding\y_hooks>

/************************** VARIABLES *****************************/

new PlayerText:HudStat[MAX_PLAYERS][4];
new PlayerText:HungerTD[MAX_PLAYERS][9];
/************************** FUNCTION *****************************/

	
stock ShowHunger_PC(playerid)
{
    HudStat[playerid][0] = CreatePlayerTextDraw(playerid, 617.916748, 47.511085, "mdl-2022:main");
    PlayerTextDrawLetterSize(playerid, HudStat[playerid][0], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, HudStat[playerid][0], 23.000000, 52.000000);
    PlayerTextDrawAlignment(playerid, HudStat[playerid][0], 1);
    PlayerTextDrawColor(playerid, HudStat[playerid][0], -1);
    PlayerTextDrawSetOutline(playerid, HudStat[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, HudStat[playerid][0], 255);
    PlayerTextDrawFont(playerid, HudStat[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, HudStat[playerid][0], true);
    PlayerTextDrawSetShadow(playerid, HudStat[playerid][0], 0);

    HudStat[playerid][1] = CreatePlayerTextDraw(playerid, 637.916442, 51.296272, "mdl-2022:eat");
    PlayerTextDrawLetterSize(playerid, HudStat[playerid][1], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, HudStat[playerid][1], -17.000000, 19.840019);
    PlayerTextDrawAlignment(playerid, HudStat[playerid][1], 1);
    PlayerTextDrawColor(playerid, HudStat[playerid][1], -1);
    PlayerTextDrawSetOutline(playerid, HudStat[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, HudStat[playerid][1], 255);
    PlayerTextDrawFont(playerid, HudStat[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, HudStat[playerid][1], true);
    PlayerTextDrawSetShadow(playerid, HudStat[playerid][1], 0);

    HudStat[playerid][2] = CreatePlayerTextDraw(playerid, 637.916442, 76.095893, "mdl-2022:drink");
    PlayerTextDrawLetterSize(playerid, HudStat[playerid][2], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, HudStat[playerid][2], -17.000000, 19.850065);
    PlayerTextDrawAlignment(playerid, HudStat[playerid][2], 1);
    PlayerTextDrawColor(playerid, HudStat[playerid][2], -1);
    PlayerTextDrawSetOutline(playerid, HudStat[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, HudStat[playerid][2], 255);
    PlayerTextDrawFont(playerid, HudStat[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, HudStat[playerid][2], true);
    PlayerTextDrawSetShadow(playerid, HudStat[playerid][2], 0);

    HudStat[playerid][3] = CreatePlayerTextDraw(playerid, 617.916809, 47.148166, "mdl-2022:main-icon");
    PlayerTextDrawLetterSize(playerid, HudStat[playerid][3], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, HudStat[playerid][3], 23.000000, 53.000000);
    PlayerTextDrawAlignment(playerid, HudStat[playerid][3], 1);
    PlayerTextDrawColor(playerid, HudStat[playerid][3], -1);
    PlayerTextDrawSetOutline(playerid, HudStat[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, HudStat[playerid][3], 255);
    PlayerTextDrawFont(playerid, HudStat[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, HudStat[playerid][3], true);
    PlayerTextDrawSetShadow(playerid, HudStat[playerid][3], 0);

    for(new i = 0; i <= 3; i++) PlayerTextDrawShow(playerid, HudStat[playerid][i]);
    return 1;
}
stock ShowHunger_MB(playerid)	{
    HungerTD[playerid][0] = CreatePlayerTextDraw(playerid, 554.000, 160.000, "ld_dual:white");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][0], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][0], 86.500, 22.500);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][0], -764862721);
    PlayerTextDrawUseBox(playerid, HungerTD[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, HungerTD[playerid][0], 50);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][0], 1);

    HungerTD[playerid][1] = CreatePlayerTextDraw(playerid, 556.000, 163.799, "ld_dual:white");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][1], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][1], 39.500, 17.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][1], 255);
    PlayerTextDrawUseBox(playerid, HungerTD[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid, HungerTD[playerid][1], 50);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][1], 1);

    HungerTD[playerid][2] = CreatePlayerTextDraw(playerid, 557.000, 165.000, "ld_dual:white");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][2], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][2], 16.000, 15.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][2], -764862721);
    PlayerTextDrawUseBox(playerid, HungerTD[playerid][2], 1);
    PlayerTextDrawBoxColor(playerid, HungerTD[playerid][2], 50);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][2], 1);

    HungerTD[playerid][3] = CreatePlayerTextDraw(playerid, 551.000, 156.000, "Preview_Model");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][3], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][3], 19.000, 29.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][3], 0);
    PlayerTextDrawFont(playerid, HungerTD[playerid][3], 5);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][3], 1);
    PlayerTextDrawSetPreviewModel(playerid, HungerTD[playerid][3], 2703);
    PlayerTextDrawSetPreviewRot(playerid, HungerTD[playerid][3], 109.000, 0.000, 162.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, HungerTD[playerid][3], 1, 1);

    HungerTD[playerid][4] = CreatePlayerTextDraw(playerid, 575.000, 167.000, "100%");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][4], 0.179, 1.049);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][4], 400.000, 17.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][4], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][4], 2);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][4], 1);

    HungerTD[playerid][5] = CreatePlayerTextDraw(playerid, 598.000, 163.799, "ld_dual:white");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][5], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][5], 39.500, 17.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][5], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][5], 255);
    PlayerTextDrawUseBox(playerid, HungerTD[playerid][5], 1);
    PlayerTextDrawBoxColor(playerid, HungerTD[playerid][5], 50);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][5], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][5], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][5], 1);

    HungerTD[playerid][6] = CreatePlayerTextDraw(playerid, 599.000, 165.000, "ld_dual:white");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][6], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][6], 16.000, 15.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][6], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][6], -764862721);
    PlayerTextDrawUseBox(playerid, HungerTD[playerid][6], 1);
    PlayerTextDrawBoxColor(playerid, HungerTD[playerid][6], 50);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][6], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][6], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][6], 1);

    HungerTD[playerid][7] = CreatePlayerTextDraw(playerid, 595.000, 163.000, "Preview_Model");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][7], 0.600, 2.000);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][7], 22.500, 18.500);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][7], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][7], 0);
    PlayerTextDrawFont(playerid, HungerTD[playerid][7], 5);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][7], 1);
    PlayerTextDrawSetPreviewModel(playerid, HungerTD[playerid][7], 2647);
    PlayerTextDrawSetPreviewRot(playerid, HungerTD[playerid][7], -10.000, 0.000, -67.000, 1.000);
    PlayerTextDrawSetPreviewVehCol(playerid, HungerTD[playerid][7], 1, 1);

    HungerTD[playerid][8] = CreatePlayerTextDraw(playerid, 618.000, 167.000, "100%");
    PlayerTextDrawLetterSize(playerid, HungerTD[playerid][8], 0.179, 1.049);
    PlayerTextDrawTextSize(playerid, HungerTD[playerid][8], 400.000, 17.000);
    PlayerTextDrawAlignment(playerid, HungerTD[playerid][8], 1);
    PlayerTextDrawColor(playerid, HungerTD[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, HungerTD[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, HungerTD[playerid][8], 1);
    PlayerTextDrawBackgroundColor(playerid, HungerTD[playerid][8], 255);
    PlayerTextDrawFont(playerid, HungerTD[playerid][8], 2);
    PlayerTextDrawSetProportional(playerid, HungerTD[playerid][8], 1);
    for(new i = 0; i < 9; i ++) PlayerTextDrawShow(playerid, HungerTD[playerid][i]);
	return 1;
}
hook OnplayerDisconnect(playerid)
{
    for(new i = 0; i < 9; i ++) PlayerTextDrawHide(playerid, HungerTD[playerid][i]);
    for(new i = 0; i <= 3; i++) PlayerTextDrawHide(playerid, HudStat[playerid][i]);
    return 1;
}

LoadingHungerStat(playerid)
{
    if(gPlayerLogged{playerid} == 1)
    {
        if(GetPVarInt(playerid, "NotAndroid") == 0)
        {
            new string[10];
            format(string, sizeof(string), "%d", PlayerInfo[playerid][pHunger]);
            PlayerTextDrawSetString(playerid, HungerTD[playerid][4], string);

            format(string, sizeof(string), "%d", PlayerInfo[playerid][pKhatNuoc]);
            PlayerTextDrawSetString(playerid, HungerTD[playerid][8], string);
        }
        else 
        {
            PlayerTextDrawTextSize(playerid, HudStat[playerid][1], PlayerInfo[playerid][pHunger]*-0.17, 19.840019);
            PlayerTextDrawShow(playerid, HudStat[playerid][1]);
            PlayerTextDrawTextSize(playerid, HudStat[playerid][2], PlayerInfo[playerid][pKhatNuoc]*-0.17, 19.850065);      
            PlayerTextDrawShow(playerid, HudStat[playerid][2]);    
        }
        
    }           
    return 1;   
}
