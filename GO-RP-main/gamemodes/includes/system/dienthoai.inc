/*thuandz*/

#include <YSI_Coding\y_hooks>
#include <a_samp>


/*
#define         SENDVITRI                   (0822)
#define         IDNGUOINHAN                 (0823)
#define         SDTNGUOINHAN                (0824)
#define         TINNHANGUI                  (0825)
*/


/*new PlayerText:Dienthoainhan[MAX_PLAYERS][9];
new PlayerText:Dienthoaimap[MAX_PLAYERS][28];
new PlayerText:Dienthoai_TD[MAX_PLAYERS][16];
new PlayerText:Dienthoaisc_TD[MAX_PLAYERS][26];
new PlayerText:Dienthoaireo[MAX_PLAYERS][5];
new sodienthoai[MAX_PLAYERS][11];
new PlayerText:Dienthoaizin[MAX_PLAYERS][8];*/

hook OnPlayerConnect(playerid) {
	////////////////////logincorich
	Dienthoaizin[playerid][0] = CreatePlayerTextDraw(playerid, 569.000000, 120.000000, "_"); //
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][0], 0.416666, 27.900009);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][0], 331.000000, 134.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][0], 2);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][0], -1727987713);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][0], -13421569);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][0], 0);

	Dienthoaizin[playerid][1] = CreatePlayerTextDraw(playerid, 569.000000, 124.000000, "_"); //
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][1], 0.591665, 26.999946);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][1], 298.500000, 127.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][1], 2);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][1], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][1], 0);

	Dienthoaizin[playerid][2] = CreatePlayerTextDraw(playerid, 526.000000, 330.000000, "ld_beat:left");
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][2], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][2], 1);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][2], -1);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][2], 1);

	Dienthoaizin[playerid][3] = CreatePlayerTextDraw(playerid, 564.500000, 330.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][3], 15.000000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][3], 2);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][3], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][3], 1);

	Dienthoaizin[playerid][4] = CreatePlayerTextDraw(playerid, 571.000000, 128.000000, "_"); //
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][4], 0.600000, -0.199994);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][4], 298.500000, 37.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][4], 2);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][4], -1094795521);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][4], 0);

	Dienthoaizin[playerid][5] = CreatePlayerTextDraw(playerid, 561.000000, 323.000000, "+"); //
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][5], 0.795833, 3.099998);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][5], 1);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][5], 0);

	Dienthoaizin[playerid][6] = CreatePlayerTextDraw(playerid, 602.000000, 330.000000, "ld_beat:cross");
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][6], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][6], 1);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][6], 1);

	Dienthoaizin[playerid][7] = CreatePlayerTextDraw(playerid, 619.000000, 124.000000, "ld_pool:ball");
	PlayerTextDrawFont(playerid, Dienthoaizin[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaizin[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaizin[playerid][7], 7.000000, 8.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaizin[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaizin[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaizin[playerid][7], 1);
	PlayerTextDrawColor(playerid, Dienthoaizin[playerid][7], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaizin[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaizin[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaizin[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaizin[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaizin[playerid][7], 0);
	///
	Dienthoainhan[playerid][0] = CreatePlayerTextDraw(playerid, 511.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][0], 117.000000, 180.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][0], -764862721);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][0], 0);

	Dienthoainhan[playerid][1] = CreatePlayerTextDraw(playerid, 570.000000, 189.000000, "ID");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][1], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][1], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][1], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][1], 200);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][1], 1);

	Dienthoainhan[playerid][2] = CreatePlayerTextDraw(playerid, 570.000000, 227.000000, "SDT");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][2], 0.179166, 1.950000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][2], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][2], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][2], 200);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][2], 1);

	Dienthoainhan[playerid][3] = CreatePlayerTextDraw(playerid, 570.000000, 267.000000, "VAN BAN");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][3], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][3], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][3], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][3], 200);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][3], 1);

	Dienthoainhan[playerid][4] = CreatePlayerTextDraw(playerid, 570.000000, 297.000000, "GUI");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][4], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][4], 16.500000, 40.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][4], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][4], 200);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][4], 1);

	Dienthoainhan[playerid][5] = CreatePlayerTextDraw(playerid, 569.000000, 153.000000, "Nhan tin");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][5], 0.341666, 1.850000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][5], 460.000000, 95.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][5], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][5], 2094792959);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][5], 0);

	Dienthoainhan[playerid][6] = CreatePlayerTextDraw(playerid, 569.000000, 169.000000, "ID Nguoi nhan");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][6], 0.341666, 1.850000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][6], 460.000000, 95.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][6], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][6], 1097458175);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][6], 0);

	Dienthoainhan[playerid][7] = CreatePlayerTextDraw(playerid, 569.000000, 209.000000, "SDT cua ho");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][7], 0.341666, 1.850000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][7], 460.000000, 95.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][7], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][7], 1097458175);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][7], 0);

	Dienthoainhan[playerid][8] = CreatePlayerTextDraw(playerid, 569.000000, 248.000000, "Van ban gui");
	PlayerTextDrawFont(playerid, Dienthoainhan[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoainhan[playerid][8], 0.341666, 1.850000);
	PlayerTextDrawTextSize(playerid, Dienthoainhan[playerid][8], 460.000000, 95.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoainhan[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoainhan[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Dienthoainhan[playerid][8], 2);
	PlayerTextDrawColor(playerid, Dienthoainhan[playerid][8], 1097458175);
	PlayerTextDrawBackgroundColor(playerid, Dienthoainhan[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoainhan[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, Dienthoainhan[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoainhan[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoainhan[playerid][8], 0);
	////
	Dienthoaisc_TD[playerid][0] = CreatePlayerTextDraw(playerid, 511.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][0], 66.500000, 72.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][0], 1711328511);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][0], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][0], 1);

	Dienthoaisc_TD[playerid][1] = CreatePlayerTextDraw(playerid, 511.000000, 221.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][1], 66.500000, 72.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][1], 859045887);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][1], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][1], 1);

	Dienthoaisc_TD[playerid][2] = CreatePlayerTextDraw(playerid, 511.000000, 296.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][2], 32.500000, 30.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][2], 9145343);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][2], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][2], 1);

	Dienthoaisc_TD[playerid][3] = CreatePlayerTextDraw(playerid, 546.500000, 296.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][3], 31.500000, 30.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][3], 1687547391);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][3], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][3], 1);

	Dienthoaisc_TD[playerid][4] = CreatePlayerTextDraw(playerid, 582.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][4], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][4], -741092353);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][4], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][4], 1);

	Dienthoaisc_TD[playerid][5] = CreatePlayerTextDraw(playerid, 582.000000, 171.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][5], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][5], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][5], 2094792959);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][5], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][5], 1);

	Dienthoaisc_TD[playerid][6] = CreatePlayerTextDraw(playerid, 582.000000, 196.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][6], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][6], 1687547391);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][6], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][6], 1);

	Dienthoaisc_TD[playerid][7] = CreatePlayerTextDraw(playerid, 607.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][7], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][7], -1962934017);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][7], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][7], 1);

	Dienthoaisc_TD[playerid][8] = CreatePlayerTextDraw(playerid, 607.000000, 171.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][8], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][8], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][8], -2686721);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][8], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][8], 1);

	Dienthoaisc_TD[playerid][9] = CreatePlayerTextDraw(playerid, 607.000000, 196.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][9], 20.000000, 21.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][9], -764862721);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][9], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][9], 1);

	Dienthoaisc_TD[playerid][10] = CreatePlayerTextDraw(playerid, 546.000000, 244.000000, "CALL");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][10], 0.212500, 2.250000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][10], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][10], 2);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][10], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][10], -1962934017);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][10], 0);

	Dienthoaisc_TD[playerid][11] = CreatePlayerTextDraw(playerid, 582.000000, 221.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][11], 45.000000, 105.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][11], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][11], -13434625);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][11], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][11], 1);

	Dienthoaisc_TD[playerid][12] = CreatePlayerTextDraw(playerid, 536.000000, 131.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][12], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][12], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][12], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][12], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][12], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][12], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][12], 19580);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][12], -42.000000, 0.000000, -20.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][12], 1, 1);

	Dienthoaisc_TD[playerid][13] = CreatePlayerTextDraw(playerid, 559.000000, 133.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][13], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][13], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][13], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][13], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][13], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][13], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][13], 456);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][13], 3.000000, 0.000000, -83.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][13], 21, 1);

	Dienthoaisc_TD[playerid][14] = CreatePlayerTextDraw(playerid, 561.000000, 107.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][14], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][14], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][14], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][14], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][14], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][14], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][14], 3931);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][14], 15.000000, 25.000000, -137.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][14], 21, 1);

	Dienthoaisc_TD[playerid][15] = CreatePlayerTextDraw(playerid, 555.000000, 86.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][15], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][15], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][15], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][15], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][15], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][15], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][15], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][15], 341);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][15], 15.000000, 25.000000, -137.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][15], 21, 1);

	Dienthoaisc_TD[playerid][16] = CreatePlayerTextDraw(playerid, 535.000000, 82.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][16], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][16], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][16], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][16], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][16], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][16], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][16], 1599);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][16], -37.000000, 47.000000, 89.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][16], 21, 1);

	Dienthoaisc_TD[playerid][17] = CreatePlayerTextDraw(playerid, 535.000000, 106.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][17], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][17], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][17], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][17], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][17], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][17], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][17], 3632);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][17], -60.000000, 40.000000, 98.000000, 6.029994);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][17], 21, 1);

	Dienthoaisc_TD[playerid][18] = CreatePlayerTextDraw(playerid, 545.000000, 167.000000, "_");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][18], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][18], 0.600000, 2.800003);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][18], 298.500000, 43.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][18], 2);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][18], 0);

	Dienthoaisc_TD[playerid][19] = CreatePlayerTextDraw(playerid, 537.000000, 172.000000, "ld_pool:ball");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][19], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][19], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][19], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][19], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][19], 1711328511);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][19], 0);

	Dienthoaisc_TD[playerid][20] = CreatePlayerTextDraw(playerid, 539.000000, 174.000000, "ld_pool:ball");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][20], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][20], 13.000000, 13.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][20], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][20], 0);

	Dienthoaisc_TD[playerid][21] = CreatePlayerTextDraw(playerid, 605.000000, 254.000000, "_");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][21], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][21], 0.600000, 2.800003);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][21], 218.500000, 35.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][21], 2);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][21], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][21], 0);

	Dienthoaisc_TD[playerid][22] = CreatePlayerTextDraw(playerid, 584.000000, 246.000000, "V");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][22], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][22], 1.520830, 2.199999);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][22], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][22], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][22], -13434625);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][22], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][22], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][22], 0);

	Dienthoaisc_TD[playerid][23] = CreatePlayerTextDraw(playerid, 601.000000, 260.000000, "ld_pool:ball");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][23], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][23], 8.000000, 8.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][23], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][23], -13434625);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][23], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][23], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][23], 0);

	Dienthoaisc_TD[playerid][24] = CreatePlayerTextDraw(playerid, 519.000000, 302.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][24], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][24], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][24], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][24], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][24], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][24], 0);

	Dienthoaisc_TD[playerid][25] = CreatePlayerTextDraw(playerid, 505.000000, 234.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaisc_TD[playerid][25], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaisc_TD[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaisc_TD[playerid][25], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaisc_TD[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaisc_TD[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaisc_TD[playerid][25], 1);
	PlayerTextDrawColor(playerid, Dienthoaisc_TD[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaisc_TD[playerid][25], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaisc_TD[playerid][25], 255);
	PlayerTextDrawUseBox(playerid, Dienthoaisc_TD[playerid][25], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaisc_TD[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaisc_TD[playerid][25], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaisc_TD[playerid][25], 1210);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaisc_TD[playerid][25], -3.000000, 42.000000, 29.000000, 4.779965);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaisc_TD[playerid][25], 21, 1);
	////
	Dienthoaimap[playerid][0] = CreatePlayerTextDraw(playerid, 511.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][0], 117.000000, 180.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][0], -741092353);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][0], 0);

	Dienthoaimap[playerid][1] = CreatePlayerTextDraw(playerid, 520.000000, 169.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][1], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][1], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][1], -65281);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][1], 1);

	Dienthoaimap[playerid][2] = CreatePlayerTextDraw(playerid, 547.000000, 169.000000, "HUD:radar_truck");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][2], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][2], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][2], 1);

	Dienthoaimap[playerid][3] = CreatePlayerTextDraw(playerid, 574.000000, 169.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][3], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][3], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][3], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][3], 1);

	Dienthoaimap[playerid][4] = CreatePlayerTextDraw(playerid, 600.000000, 169.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][4], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][4], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][4], -764862721);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][4], 1);

	Dienthoaimap[playerid][5] = CreatePlayerTextDraw(playerid, 519.000000, 185.000000, "Pizza    Truck    Miner  TieuPhu");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][5], 0.191666, 1.100000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][5], 622.500000, 22.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][5], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][5], 0);

	Dienthoaimap[playerid][6] = CreatePlayerTextDraw(playerid, 520.000000, 203.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][6], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][6], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][6], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][6], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][6], 1);

	Dienthoaimap[playerid][7] = CreatePlayerTextDraw(playerid, 547.000000, 203.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][7], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][7], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][7], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][7], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][7], 1);

	Dienthoaimap[playerid][8] = CreatePlayerTextDraw(playerid, 574.000000, 203.000000, "HUD:radar_tshirt");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][8], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][8], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][8], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][8], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][8], 1);

	Dienthoaimap[playerid][9] = CreatePlayerTextDraw(playerid, 600.000000, 203.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][9], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][9], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][9], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][9], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][9], 1);

	Dienthoaimap[playerid][10] = CreatePlayerTextDraw(playerid, 517.000000, 219.000000, "KhuDau NguDan   Binco  NhaMay");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][10], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][10], 0.191666, 1.100000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][10], 626.500000, 22.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][10], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][10], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][10], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][10], 0);

	Dienthoaimap[playerid][11] = CreatePlayerTextDraw(playerid, 520.000000, 238.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][11], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][11], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][11], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][11], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][11], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][11], 1);

	Dienthoaimap[playerid][12] = CreatePlayerTextDraw(playerid, 547.000000, 238.000000, "HUD:radar_ammugun");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][12], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][12], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][12], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][12], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][12], 1);

	Dienthoaimap[playerid][13] = CreatePlayerTextDraw(playerid, 574.000000, 238.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][13], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][13], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][13], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][13], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][13], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][13], 1);

	Dienthoaimap[playerid][14] = CreatePlayerTextDraw(playerid, 600.000000, 238.000000, "HUD:radar_school");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][14], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][14], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][14], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][14], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][14], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][14], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][14], 1);

	Dienthoaimap[playerid][15] = CreatePlayerTextDraw(playerid, 517.000000, 255.000000, "Casino  ShopGun ChoDen  DMV");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][15], 0.191666, 1.100000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][15], 626.500000, 22.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][15], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][15], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][15], 0);

	Dienthoaimap[playerid][16] = CreatePlayerTextDraw(playerid, 520.000000, 275.000000, "HUD:radar_boatyard");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][16], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][16], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][16], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][16], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][16], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][16], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][16], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][16], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][16], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][16], 1);

	Dienthoaimap[playerid][17] = CreatePlayerTextDraw(playerid, 547.000000, 275.000000, "HUD:radar_spray");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][17], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][17], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][17], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][17], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][17], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][17], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][17], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][17], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][17], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][17], 1);

	Dienthoaimap[playerid][18] = CreatePlayerTextDraw(playerid, 574.000000, 275.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][18], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][18], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][18], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][18], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][18], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][18], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][18], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][18], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][18], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][18], 1);

	Dienthoaimap[playerid][19] = CreatePlayerTextDraw(playerid, 516.000000, 292.000000, "LocDau CayXang  Suaxe  ThiLaiXe");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][19], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][19], 0.191666, 1.100000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][19], 626.500000, 22.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][19], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][19], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][19], 255);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][19], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][19], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][19], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][19], 0);

	Dienthoaimap[playerid][20] = CreatePlayerTextDraw(playerid, 600.000000, 275.000000, "HUD:radar_impound");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][20], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][20], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][20], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][20], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][20], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][20], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][20], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][20], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][20], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][20], 1);

	Dienthoaimap[playerid][21] = CreatePlayerTextDraw(playerid, 472.000000, 102.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][21], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][21], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][21], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][21], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][21], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][21], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][21], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][21], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][21], 249);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][21], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][21], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaimap[playerid][21], 2814);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaimap[playerid][21], -33.000000, -10.000000, -35.000000, 6.169996);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaimap[playerid][21], 0, 1);

	Dienthoaimap[playerid][22] = CreatePlayerTextDraw(playerid, 526.000000, 102.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][22], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][22], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][22], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][22], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][22], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][22], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][22], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][22], 249);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][22], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][22], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaimap[playerid][22], 3931);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaimap[playerid][22], -33.000000, -10.000000, -35.000000, 6.169996);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaimap[playerid][22], 0, 1);

	Dienthoaimap[playerid][23] = CreatePlayerTextDraw(playerid, 551.000000, 102.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][23], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][23], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][23], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][23], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][23], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][23], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][23], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][23], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][23], 249);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][23], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][23], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaimap[playerid][23], 1463);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaimap[playerid][23], -33.000000, -10.000000, -35.000000, 6.169996);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaimap[playerid][23], 0, 1);

	Dienthoaimap[playerid][24] = CreatePlayerTextDraw(playerid, 472.000000, 134.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][24], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][24], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][24], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][24], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][24], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][24], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][24], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][24], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][24], 249);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][24], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][24], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaimap[playerid][24], 2036);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaimap[playerid][24], -52.000000, -10.000000, -66.000000, 6.169996);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaimap[playerid][24], 0, 1);

	Dienthoaimap[playerid][25] = CreatePlayerTextDraw(playerid, 499.000000, 134.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][25], 5);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][25], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][25], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][25], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][25], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][25], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][25], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][25], 0);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][25], 249);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][25], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][25], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][25], 0);
	PlayerTextDrawSetPreviewModel(playerid, Dienthoaimap[playerid][25], 1604);
	PlayerTextDrawSetPreviewRot(playerid, Dienthoaimap[playerid][25], -33.000000, -10.000000, -35.000000, 6.169996);
	PlayerTextDrawSetPreviewVehCol(playerid, Dienthoaimap[playerid][25], 0, 1);

	Dienthoaimap[playerid][26] = CreatePlayerTextDraw(playerid, 571.000000, 305.000000, "MAP");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][26], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][26], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][26], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][26], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][26], 2);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][26], 2094792959);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][26], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][26], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][26], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][26], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][26], 0);

	Dienthoaimap[playerid][27] = CreatePlayerTextDraw(playerid, 525.000000, 307.000000, "HUD:radar_waypoint");
	PlayerTextDrawFont(playerid, Dienthoaimap[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaimap[playerid][27], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaimap[playerid][27], 16.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaimap[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaimap[playerid][27], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaimap[playerid][27], 1);
	PlayerTextDrawColor(playerid, Dienthoaimap[playerid][27], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaimap[playerid][27], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaimap[playerid][27], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaimap[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaimap[playerid][27], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaimap[playerid][27], 1);
    //corich
	Dienthoai_TD[playerid][0] = CreatePlayerTextDraw(playerid, 511.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][0], 115.500000, 180.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][0], -741092353);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][0], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][0], 0);

	Dienthoai_TD[playerid][1] = CreatePlayerTextDraw(playerid, 569.000000, 204.000000, "_");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][1], 0.600000, 12.800003);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][1], 344.500000, 104.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][1], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][1], -1094795521);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][1], 0);

	Dienthoai_TD[playerid][2] = CreatePlayerTextDraw(playerid, 569.000000, 180.000000, "_");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][2], 0.600000, -0.199996);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][2], 344.500000, 74.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][2], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][2], 1296911871);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][2], 0);

	Dienthoai_TD[playerid][3] = CreatePlayerTextDraw(playerid, 571.000000, 296.000000, "0");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][3], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][3], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][3], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][3], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][3], 1);

	Dienthoai_TD[playerid][4] = CreatePlayerTextDraw(playerid, 571.000000, 269.000000, "2");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][4], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][4], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][4], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][4], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][4], 1);

	Dienthoai_TD[playerid][5] = CreatePlayerTextDraw(playerid, 571.000000, 242.000000, "5");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][5], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][5], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][5], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][5], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][5], 1);

	Dienthoai_TD[playerid][6] = CreatePlayerTextDraw(playerid, 571.000000, 214.000000, "8");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][6], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][6], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][6], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][6], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][6], 1);

	Dienthoai_TD[playerid][7] = CreatePlayerTextDraw(playerid, 541.000000, 269.000000, "1");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][7], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][7], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][7], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][7], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][7], 1);

	Dienthoai_TD[playerid][8] = CreatePlayerTextDraw(playerid, 541.000000, 242.000000, "4");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][8], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][8], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][8], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][8], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][8], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][8], 1);

	Dienthoai_TD[playerid][9] = CreatePlayerTextDraw(playerid, 541.000000, 214.000000, "7");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][9], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][9], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][9], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][9], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][9], 1);

	Dienthoai_TD[playerid][10] = CreatePlayerTextDraw(playerid, 600.000000, 269.000000, "3");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][10], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][10], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][10], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][10], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][10], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][10], 1);

	Dienthoai_TD[playerid][11] = CreatePlayerTextDraw(playerid, 599.000000, 242.000000, "6");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][11], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][11], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][11], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][11], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][11], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][11], 1);

	Dienthoai_TD[playerid][12] = CreatePlayerTextDraw(playerid, 599.000000, 214.000000, "9");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][12], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][12], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][12], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][12], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][12], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][12], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][12], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][12], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][12], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][12], 1);

	Dienthoai_TD[playerid][13] = CreatePlayerTextDraw(playerid, 543.000000, 296.000000, ">");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][13], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][13], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][13], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][13], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][13], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][13], 2094792959);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][13], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][13], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][13], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][13], 1);

	Dienthoai_TD[playerid][14] = CreatePlayerTextDraw(playerid, 599.000000, 296.000000, "<");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][14], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][14], 0.333332, 2.449999);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][14], 16.500000, 15.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][14], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][14], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][14], -16776961);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][14], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][14], 200);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][14], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][14], 1);

	Dienthoai_TD[playerid][15] = CreatePlayerTextDraw(playerid, 569.000000, 160.000000, "_");
	PlayerTextDrawFont(playerid, Dienthoai_TD[playerid][15], 1);
	PlayerTextDrawLetterSize(playerid, Dienthoai_TD[playerid][15], 0.195833, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoai_TD[playerid][15], 400.000000, 77.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoai_TD[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoai_TD[playerid][15], 0);
	PlayerTextDrawAlignment(playerid, Dienthoai_TD[playerid][15], 2);
	PlayerTextDrawColor(playerid, Dienthoai_TD[playerid][15], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoai_TD[playerid][15], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoai_TD[playerid][15], 50);
	PlayerTextDrawUseBox(playerid, Dienthoai_TD[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoai_TD[playerid][15], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoai_TD[playerid][15], 0);



	///dtreo
	Dienthoaireo[playerid][0] = CreatePlayerTextDraw(playerid, 511.000000, 146.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, Dienthoaireo[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, Dienthoaireo[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Dienthoaireo[playerid][0], 115.500000, 180.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaireo[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Dienthoaireo[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaireo[playerid][0], 1);
	PlayerTextDrawColor(playerid, Dienthoaireo[playerid][0], -741092353);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaireo[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaireo[playerid][0], -869020417);
	PlayerTextDrawUseBox(playerid, Dienthoaireo[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaireo[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaireo[playerid][0], 0);

	Dienthoaireo[playerid][1] = CreatePlayerTextDraw(playerid, 570.000000, 149.000000, "Rowan_Atkinson");
	PlayerTextDrawFont(playerid, Dienthoaireo[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaireo[playerid][1], 0.170833, 2.399997);
	PlayerTextDrawTextSize(playerid, Dienthoaireo[playerid][1], 372.000000, 113.000000);
	PlayerTextDrawSetOutline(playerid, Dienthoaireo[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaireo[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaireo[playerid][1], 2);
	PlayerTextDrawColor(playerid, Dienthoaireo[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaireo[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Dienthoaireo[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Dienthoaireo[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Dienthoaireo[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaireo[playerid][1], 0);

	Dienthoaireo[playerid][2] = CreatePlayerTextDraw(playerid, 534.000000, 285.000000, ">");
	PlayerTextDrawFont(playerid, Dienthoaireo[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaireo[playerid][2], 0.249999, 2.649998);
	PlayerTextDrawTextSize(playerid, Dienthoaireo[playerid][2], 16.500000, 18.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaireo[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaireo[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaireo[playerid][2], 2);
	PlayerTextDrawColor(playerid, Dienthoaireo[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaireo[playerid][2], 16711935);
	PlayerTextDrawBoxColor(playerid, Dienthoaireo[playerid][2], 16711935);
	PlayerTextDrawUseBox(playerid, Dienthoaireo[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaireo[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaireo[playerid][2], 1);

	Dienthoaireo[playerid][3] = CreatePlayerTextDraw(playerid, 604.000000, 285.000000, "<");
	PlayerTextDrawFont(playerid, Dienthoaireo[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaireo[playerid][3], 0.249999, 2.649998);
	PlayerTextDrawTextSize(playerid, Dienthoaireo[playerid][3], 16.500000, 18.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaireo[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaireo[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaireo[playerid][3], 2);
	PlayerTextDrawColor(playerid, Dienthoaireo[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaireo[playerid][3], 16711935);
	PlayerTextDrawBoxColor(playerid, Dienthoaireo[playerid][3], -16776961);
	PlayerTextDrawUseBox(playerid, Dienthoaireo[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaireo[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaireo[playerid][3], 1);

	Dienthoaireo[playerid][4] = CreatePlayerTextDraw(playerid, 570.000000, 285.000000, "<");
	PlayerTextDrawFont(playerid, Dienthoaireo[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, Dienthoaireo[playerid][4], 0.249999, 2.649997);
	PlayerTextDrawTextSize(playerid, Dienthoaireo[playerid][4], 16.500000, 18.500000);
	PlayerTextDrawSetOutline(playerid, Dienthoaireo[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, Dienthoaireo[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Dienthoaireo[playerid][4], 2);
	PlayerTextDrawColor(playerid, Dienthoaireo[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Dienthoaireo[playerid][4], 16711935);
	PlayerTextDrawBoxColor(playerid, Dienthoaireo[playerid][4], -16776961);
	PlayerTextDrawUseBox(playerid, Dienthoaireo[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, Dienthoaireo[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Dienthoaireo[playerid][4], 1);
	
	SetPVarInt(playerid, "chiasevitri",-1);
	
	return 1;
}

/////
stock dienthoaimap(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][3]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][4]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][5]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][6]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][7]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][8]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][9]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][10]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][11]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][12]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][13]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][14]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][15]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][16]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][17]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][18]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][19]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][20]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][21]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][22]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][23]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][24]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][25]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][26]);
	PlayerTextDrawShow(playerid, Dienthoaimap[playerid][27]);
	return 1;
}
stock dienthoainhan(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][3]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][4]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][5]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][6]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][7]);
	PlayerTextDrawShow(playerid, Dienthoainhan[playerid][8]);
	return 1;
}
stock phonereo(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoaireo[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoaireo[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoaireo[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoaireo[playerid][3]);
	return 1;
}
stock phonegoi(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][3]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][4]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][5]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][6]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][7]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][8]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][9]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][10]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][11]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][12]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][13]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][14]);
	PlayerTextDrawShow(playerid, Dienthoai_TD[playerid][15]);
	return 1;
}
stock phonescreen(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][3]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][4]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][5]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][6]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][7]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][8]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][9]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][10]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][11]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][12]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][13]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][14]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][15]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][16]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][17]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][18]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][19]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][20]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][21]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][22]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][23]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][24]);
	PlayerTextDrawShow(playerid, Dienthoaisc_TD[playerid][25]);
	return 1;
}
stock dienthoaizin(playerid)
{
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][0]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][1]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][2]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][3]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][4]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][5]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][6]);
	PlayerTextDrawShow(playerid, Dienthoaizin[playerid][7]);
	return 1;
}
stock hidephonereo(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoaireo[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoaireo[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoaireo[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoaireo[playerid][3]);
	return 1;
}
stock hidephonescreen(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][3]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][4]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][5]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][6]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][7]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][8]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][9]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][10]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][11]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][12]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][13]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][14]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][15]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][16]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][17]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][18]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][19]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][20]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][21]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][22]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][23]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][24]);
	PlayerTextDrawHide(playerid, Dienthoaisc_TD[playerid][25]);
	return 1;
}
stock hidedienthoainhan(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][3]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][4]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][5]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][6]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][7]);
	PlayerTextDrawHide(playerid, Dienthoainhan[playerid][8]);
	return 1;
}
stock hidephonegoi(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][3]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][4]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][5]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][6]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][7]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][8]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][9]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][10]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][11]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][12]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][13]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][14]);
	PlayerTextDrawHide(playerid, Dienthoai_TD[playerid][15]);
	return 1;
}
stock hidedienthoaizin(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][3]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][4]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][5]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][6]);
	PlayerTextDrawHide(playerid, Dienthoaizin[playerid][7]);
	return 1;
}
stock hidedienthoaimap(playerid)
{
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][0]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][1]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][2]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][3]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][4]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][5]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][6]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][7]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][8]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][9]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][10]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][11]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][12]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][13]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][14]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][15]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][16]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][17]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][18]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][19]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][20]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][21]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][22]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][23]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][24]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][25]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][26]);
	PlayerTextDrawHide(playerid, Dienthoaimap[playerid][27]);
	return 1;
}
/////
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == IDNGUOINHAN)
    {
	    if(response)
	    {
	    	if((GetPVarInt(playerid, "sdtnn") == 1) || (GetPVarInt(playerid, "nhaptin") == 1)){
				DeletePVar(playerid, "sdtnn");
				DeletePVar(playerid, "nhaptin");
			}
		 	new thanglz = strval(inputtext);
			if(IsPlayerConnected(thanglz))
			{
				SetPVarInt(playerid,"nhantin",thanglz);
				SetPVarInt(playerid,"sdtnn",1);
			}
			else{
				SendClientMessageEx(playerid,COLOR_WHITE,"Nguoi choi khong hop le");
			}
		}
	}
	if(dialogid == SDTNGUOINHAN)
    {
	    if(response)
	    {
	        new nguoinhan = GetPVarInt(playerid,"nhantin");
	        new test = strval(inputtext);
			if(PlayerInfo[nguoinhan][pPnumber] == test)
			{
			    SetPVarInt(playerid,"nhaptin",1);
			    SendClientMessageEx(playerid,COLOR_WHITE,"Sdt hop le, ban co the nhap noi dung");
			}
			else{
			    SendClientMessageEx(playerid, COLOR_YELLOW,"Sdt nay khong phai cua ho");
			}
		}
		return 1;
	}
	if(dialogid == TINNHANGUI)
    {
	    if(response)
	    {
			SetPVarString(playerid,"doantin",inputtext);
			SetPVarInt(playerid, "send",1);
		}
		return 1;
	}
	if(dialogid == SENDVITRI)
    {
	    if(response)
	    {
		    new thangcc = strval(inputtext);
		    if(IsPlayerConnected(thangcc) && (thangcc != playerid))
		    {
				SendClientMessageEx(thangcc, COLOR_WHITE,"Mot nguoi choi muon chia se vi tri cua ho voi ban[/chapnhanvitri] hoac [/tuchoivitri]");
				SetPVarInt(thangcc, "chiasevitri",playerid);
	    		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da gui yeu cua send vi tri cua ban den ho");
			}
			else{
			SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi khong hop le");
			}
		}
		return 1;
	}
	return 1;
}
/////
forward goinhanh(playerid);
public goinhanh(playerid)
{
	if(GetPVarInt(playerid,"goinhanh") > 0)
	{
	    SetPVarInt(playerid, "goinhanh", GetPVarInt(playerid,"goinhanh")-1);
	    SetTimerEx("goinhanh",1000,false,"i",playerid);
	}
	return 1;
}
//////
hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	///dienthoaibyrich
    if(playertextid == Dienthoaireo[playerid][2])
	{
		new string[128];
		if(Mobile[playerid] != INVALID_PLAYER_ID)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
			return 1;
		}
		if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen") || PlayerInfo[playerid][pHospital]) {
	   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao thoi diem nay!");
		}
		foreach(new i :Player)
		{
			if(Mobile[i] == playerid)
			{
				Mobile[playerid] = i; //caller connecting
				SendClientMessageEx(i,  COLOR_GRAD2, "Da duoc ket noi......");
				format(string, sizeof(string), "* %s tra loi dien thoai di dong cua ho.", GetPlayerNameEx(playerid));
				PlayerTextDrawHide(playerid, Dienthoaireo[playerid][2]);
				PlayerTextDrawHide(playerid, Dienthoaireo[playerid][3]);
				PlayerTextDrawShow(playerid, Dienthoaireo[playerid][4]);
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				RingTone[playerid] = 0;
				SetPlayerAttachedObject(playerid, 9, 330, 6);
				StopAudioStreamForPlayer(playerid);
				return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			}
		}
		return 1;
	}
    if(playertextid == Dienthoaimap[playerid][1]) //pizza
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2098.2534,-1800.2639,13.3889, 3.0);
		CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][2]) //truck
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2426.7253,-2112.8484,13.5522, 3.0);
		CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][3]) //miner
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2285.2297,-2211.9587,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][4]) //tieuphu
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2560.5920,-905.4740,83.6853, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][6]) //khudau
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2759.0061,-3306.7454,-1.0270, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][7]) //ngudan
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 444.6969,-1878.0127,2.7828, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][8]) //binco
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2244.3767,-1665.3396,15.4766, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][9]) //nhamay
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2178.3586,-2254.8250,14.7700, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;	
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][11]) //casino
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2071.8181,-1793.7499,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][12]) //sgun
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 1366.3376,-1279.8447,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][13]) //choden
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2791.1343,-1420.6089,16.2500, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][14]) //dmv
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 1776.2717,-1724.0371,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
	
    if(playertextid == Dienthoaimap[playerid][16]) //locdau
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, -2628.8237,13.6379,179.0452, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][17]) //cayxang
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 1929.1433,-1776.3187,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][18]) //suaxe
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, 2424.7810,-1881.9120,13.5469, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][20]) //thilaixe
	{
		hidedienthoaimap(playerid);
	    hidedienthoaizin(playerid);
        DeletePVar(playerid, "batdienthoai");
        SetPlayerCheckpoint(playerid, -2117.0447,-414.0088,35.3359, 3.0);
        CancelSelectTextDraw(playerid);
        CP[playerid] = 112145;
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	}
    if(playertextid == Dienthoaimap[playerid][27]) 
	{
	    ShowPlayerDialog(playerid, SENDVITRI, DIALOG_STYLE_INPUT, "Gui Vi tri","Nhap ID nguoi ban muon gui vi tri","Gui","Huy");
	}
    if(playertextid == Dienthoaireo[playerid][3])
	{
		foreach(new i: Player)
		{
			if(IsPlayerConnected(Mobile[i]))
			{
				DeletePVar(playerid, "dangketnoi");
				hidephonereo(playerid);
				phonescreen(playerid);
				SetPVarInt(playerid, "batdienthoai",1);
				SendClientMessageEx(playerid,  COLOR_GRAD2, "Ban da tu choi cuoc goi.");
				StopAudioStreamForPlayer(playerid);
				
			    new string[333];
				format(string, sizeof(string), "Cuoc goi ket thuc.", GetPlayerNameEx(i));
				SendClientMessageEx(i, COLOR_YELLOW, string);
				CellTime[i] = 0;
				Mobile[i] = INVALID_PLAYER_ID;
	        	DeletePVar(i,"dangketnoi");
	    		SetPVarInt(i,"batdienthoai",1);
				SetPlayerSpecialAction(i, SPECIAL_ACTION_STOPUSECELLPHONE);
				break;
			}
			else{
				DeletePVar(playerid, "dangketnoi");
				hidephonereo(playerid);
				phonescreen(playerid);
				SetPVarInt(playerid, "batdienthoai",1);
				SendClientMessageEx(playerid,  COLOR_GRAD2, "Ban da tu choi cuoc goi.");
				break;
			}
		}
		return 1;
	}
	if(playertextid == Dienthoaireo[playerid][4])
	{
		new string[128];

		if(GetPVarInt(playerid, "Injured") != 0||PlayerCuffed[playerid]!=0||PlayerInfo[playerid][pHospital]!=0)
		{
			SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao luc nay.");
			return 1;
		}
		new caller = Mobile[playerid];
		if((IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID))
		{
			if(caller < MAX_PLAYERS)
			{
				SendClientMessageEx(caller,  COLOR_GRAD2, "Nguoi dau day ben kia da ket thuc cuoc goi....");
				format(string, sizeof(string), "* %s da ket thuc cuoc goi.", GetPlayerNameEx(caller));
				ProxDetector(30.0, caller, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				CellTime[caller] = 0;
				Mobile[caller] = INVALID_PLAYER_ID;
	        	DeletePVar(caller,"dangketnoi");
        		SetPVarInt(caller,"batdienthoai",1);
			}
			CellTime[playerid] = 0;
			SendClientMessageEx(playerid,  COLOR_GRAD2, "Ban da ket thuc cuoc goi....");
			format(string, sizeof(string), "* %s da ket thuc cuoc goi.", GetPlayerNameEx(playerid));
			phonescreen(playerid);
			SetPVarInt(playerid,"batdienthoai",1);
	        hidephonereo(playerid);
			PlayerTextDrawHide(playerid, Dienthoaireo[playerid][4]);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			Mobile[playerid] = INVALID_PLAYER_ID;
			CellTime[playerid] = 0;
			RingTone[playerid] = 0;
			RemovePlayerAttachedObject(playerid, 9);
			RemovePlayerAttachedObject(caller, 9);
			SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			return 1;
		}
		SendClientMessageEx(playerid,  COLOR_GRAD2, "   Dien thoai dang trong tui cua ban.");
		return 1;
	}
	if(GetPVarInt(playerid,"batdienthoai") == 1){
		if(playertextid == Dienthoaisc_TD[playerid][0])
		{
			new Float: Reedeg[MAX_PLAYERS];
		    new Float:Angle;
			new Float:x,Float:y,Float:z;
		    PlayerPlaySound(playerid, 17001, 0.0, 0.0, 0.0);
		    GetPlayerPos(playerid, x, y, z);
		    static Float: n1X, Float: n1Y;
		    GetPlayerFacingAngle(playerid, Angle);
		    n1X = x + 1.7 * floatcos(180.0, degrees);
		    n1Y = y + 1.7 * floatsin(180.0, degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, z + 1.15);
		    SetPlayerCameraLookAt(playerid, x, y, z + 1);
		    SetPlayerFacingAngle(playerid, Reedeg[playerid] - 270.0);
		    TogglePlayerControllable(playerid, 0);
		    SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang bat selfie [/tatcam] de tat che do nay");
		    hidedienthoaizin(playerid);
		    hidephonescreen(playerid);
		    CancelSelectTextDraw(playerid);
		    SetPVarInt(playerid, "tatcam",1);
		    DeletePVar(playerid, "batdienthoai");
		    ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
			return 1;
		}
		if(playertextid == Dienthoainhan[playerid][1])
	    {
			ShowPlayerDialog(playerid,IDNGUOINHAN,DIALOG_STYLE_INPUT,"ID","ID cua nguoi ban can gui tin","Xac nhan","Huy");
		}
		if(playertextid == Dienthoainhan[playerid][2])
	    {
	        if(GetPVarInt(playerid, "sdtnn") == 1)
	        {
	            ShowPlayerDialog(playerid,SDTNGUOINHAN,DIALOG_STYLE_INPUT,"Noi dung","Soan van ban can gui","Xac nhan","Huy");
			}
			else{
				SendClientMessageEx(playerid, COLOR_WHITE,"Ban chua nhap ID");
			}
		}
		if(playertextid == Dienthoainhan[playerid][3])
	    {
	        if(GetPVarInt(playerid, "nhaptin") == 1){
	        	ShowPlayerDialog(playerid,TINNHANGUI,DIALOG_STYLE_INPUT,"Noi dung","Soan van ban can gui","Xac nhan","Huy");
			}
			else{
				SendClientMessageEx(playerid, COLOR_WHITE,"Ban chua nhap sdt");
			}
		}
		if(playertextid == Dienthoainhan[playerid][4])
	    {
			if((GetPVarInt(playerid,"sdtnn") == 1) && (GetPVarInt(playerid,"nhaptin") == 1) && (GetPVarInt(playerid,"send") == 1)){
   				new thangmatcac = GetPVarInt(playerid,"nhantin");
				if(PhoneOnline[thangmatcac] == 0){
			        new doantin[128];
			        new concac[233];
			        GetPVarString(playerid,"doantin",doantin,128);
			        format(concac,sizeof(concac),"Tin nhan cua %s, SDT:%d",GetPlayerNameEx(playerid),PlayerInfo[playerid][pPnumber]);
			        SendClientMessageEx(playerid, COLOR_YELLOW, "-Gui tin nhan thanh cong-");
			        SendClientMessageEx(playerid, COLOR_YELLOW, doantin);
                    SendClientMessageEx(thangmatcac, COLOR_YELLOW, concac);
					SendClientMessageEx(thangmatcac, COLOR_YELLOW, doantin);
					DeletePVar(playerid,"doantin");
					DeletePVar(playerid,"sdtnn");
					DeletePVar(playerid,"nhaptin");
					DeletePVar(playerid,"send");
				}
				else{
					SendClientMessageEx(playerid, COLOR_WHITE,"Dien thoai ho dang ban.");
					DeletePVar(playerid,"doantin");
					DeletePVar(playerid,"sdtnn");
					DeletePVar(playerid,"nhaptin");
					DeletePVar(playerid,"send");
				}
			}
		}
		if(playertextid == Dienthoaisc_TD[playerid][3]) //fish
	    {
	       // return cmd_balo(playerid,"/");
		}
		if(playertextid == Dienthoaisc_TD[playerid][11]) //fish
	    {
	        hidephonescreen(playerid);
			dienthoainhan(playerid);
		}
		if(playertextid == Dienthoaisc_TD[playerid][4]) //fish
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Ngu Dan] {FFFFFF}Day la cong viec lam them nen ban khong can xin viec, vao Map va den Ngu dan .O day ban se thay nhung chiec thuyen free.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Ngu Dan] {FFFFFF}Viec cua ban la len thuyen roi [/diemdanhca] den noi thi /thaluoi .");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Ngu Dan] {FFFFFF}Sau khi danh ca xong thi [/diemdanhca] tim noi ban ca.");
		}
		if(playertextid == Dienthoaisc_TD[playerid][5]) //DauMo
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{777777}[Dau Mo] {FFFFFF}Day la cong viec lam them nen ban khong can xin viec, vao Map roi den khu dau.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{777777}[Dau Mo] {FFFFFF}Den noi ban se thay nhung gian khoan, ban vao chinh giua gian khoan roi [/khaithac].");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{777777}[Dau Mo] {FFFFFF}Moi len [/khaithac] xong ban se duoc 3 dau, den 20 dau la ban se khong duoc khai thac tiep.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{777777}[Dau Mo] {FFFFFF}Viet tiep theo ban lam la vao Map den Loc Dau roi loc dau.Cho doi gia dau len cao , hay den tram xang va ban no.");
		}
		if(playertextid == Dienthoaisc_TD[playerid][6]) //pizza
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{FF9900}[Pizza] {FFFFFF}Dau tien ban can nhan viec tai npc truoc tiem pizza, sau do lay trang phuc va xe.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{FF9900}[Pizza] {FFFFFF}Khi lay xe tai NPC no se hien checkpoint tren map cua ban, ban den do va lay xe, len xe [/giaobanh].");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{FF9900}[Pizza] {FFFFFF}Ban tiep tuc di chuyen xe den checkpoint, den gan checkpoint xuong xe va nhan [Y] de lay banh roi vao checkpoint.");
		}
		if(playertextid == Dienthoaisc_TD[playerid][7]) //tieuphu
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{663300}[Tieu Phu] {FFFFFF}Ban vao Map cua phone va di chuyen den khu tieu phu.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{663300}[Tieu Phu] {FFFFFF}Den noi ban se thay 1 NPC , ban den gan va [/work].");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{663300}[Tieu Phu] {FFFFFF}Sau do ban ra nhung cay va [/cuacay] roi den checkpoint, sau khi ket thuc lam viec den NPC [/work] de nhan tien.");
		}
		if(playertextid == Dienthoaisc_TD[playerid][8]) //ks
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Ban vao Map cua phone va di chuyen den Miner xin viec.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Sau do ban lay xe va di chuyen den checkpoint tren ban do.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Den checkpoint ban vao door , den cuc da nho thi nhan [Y] de dao.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Roi ra ngoai xe cua minh va nhan [Y] de chat no len xe.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Du 5 cuc tren xe thi vao Map cua phone de di chuyen den nha may.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Vao trong nha may co diem che bien, ban xuong xe va [/layda] roi dem no den cho che bien [/chebien]");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Sau khi che bien 5 cuc ban ra ngoai Tivi va nhan Y no se loc cho ban, ban nhan [Y] cai nua de nhan vao tui do.");
    		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Ban se nhan duoc random Sat Ruby Vang Kim cuong");
      		SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{111111}[Miner] {FFFFFF}Sat thi khong ban duoc, nhung thu kia hay dem no den tiem da quy va ban chung, con sat thi doi vu khi tai cho den.");
		}
		if(playertextid == Dienthoaisc_TD[playerid][9]) //trucker
	    {
	        SendClientMessageEx(playerid, COLOR_WHITE, "=============================================================================================================");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Day la cong viec doi hoi tu duy, ban vao Map cua phone va den Truck.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Ban den NPC xin viec va thue xe, sau do [/diemlayhang].");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Check xem nhung shop can thu mua mat hang gi thi ban den nhung shop khac ban mat hang do [/muahang].");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Sau khi mua hang thi [/diemlayhang] chon Shop ma ban can ban luc dau de ban hang.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Den shop can ban thi [/banhang].");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Cong viec nay chi don thuan la mua di va ban lai.");
			SendClientMessageEx(playerid, COLOR_WHITE, "{FF0000}[i]{0033CC}[Trucker] {FFFFFF}Ban mua hang tu 1 Shop gia re de ban lai gia cao cho 1 Shop khac.");
		}
		if(playertextid == Dienthoaizin[playerid][6])
	    {
			if(GetPVarInt(playerid,"dangketnoi") == 1) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban vui long cup may truoc khi tat may.");
			{
		        hidephonegoi(playerid);
		        hidedienthoainhan(playerid);
		        hidephonescreen(playerid);
		        hidedienthoaizin(playerid);
		        DeletePVar(playerid, "batdienthoai");
		        CancelSelectTextDraw(playerid);
		 		RemovePlayerAttachedObject(playerid, 9);
		 		hidedienthoaimap(playerid);
		 		
			}
		}
		if(playertextid == Dienthoaizin[playerid][2])
	    {
	    	if(GetPVarInt(playerid,"dangketnoi") == 1) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban vui long cup may moi co the thoat ra man hinh chinh.");
			{
				hidephonegoi(playerid);
				hidedienthoaimap(playerid);
				hidedienthoainhan(playerid);
				phonescreen(playerid);
			}
		}
		if(playertextid == Dienthoaisc_TD[playerid][2])
		{
			hidephonescreen(playerid);
			dienthoaimap(playerid);
		}
		if(playertextid == Dienthoaisc_TD[playerid][1])
	    {
			hidephonescreen(playerid);
			phonegoi(playerid);
			sodienthoai[playerid] = "";
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
		////
		if(playertextid == Dienthoai_TD[playerid][3])
		{
			strcat(sodienthoai[playerid],"0");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][7])
		{
			strcat(sodienthoai[playerid],"1");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][4])
		{
			strcat(sodienthoai[playerid],"2");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][10])
		{
			strcat(sodienthoai[playerid],"3");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
		if(playertextid == Dienthoai_TD[playerid][8])
		{
			strcat(sodienthoai[playerid],"4");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
		if(playertextid == Dienthoai_TD[playerid][5])
		{
			strcat(sodienthoai[playerid],"5");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][11])
		{
			strcat(sodienthoai[playerid],"6");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][9])
		{
			strcat(sodienthoai[playerid],"7");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
 		if(playertextid == Dienthoai_TD[playerid][6])
		{
			strcat(sodienthoai[playerid],"8");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
		if(playertextid == Dienthoai_TD[playerid][12])
		{
			strcat(sodienthoai[playerid],"9");
			PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15], sodienthoai[playerid]);
		}
		if(playertextid == Dienthoai_TD[playerid][14]) ///nguoigoi
		{
			new size = strlen(sodienthoai[playerid]);
			strdel(sodienthoai[playerid],size-1,size), PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15],sodienthoai[playerid]);
			if(GetPVarInt(playerid,"dangketnoi") == 1)
			{
				new string[128];

				if(GetPVarInt(playerid, "Injured") != 0||PlayerCuffed[playerid]!=0||PlayerInfo[playerid][pHospital]!=0)
				{
					SendClientMessageEx (playerid, COLOR_GRAD2, "Ban khong the lam dieu nay vao luc nay.");
					return 1;
				}
				new caller = Mobile[playerid];
				if((IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID))
				{
					if(caller < MAX_PLAYERS)
					{
						SendClientMessageEx(caller,  COLOR_GRAD2, "Nguoi dau day ben kia da ket thuc cuoc goi....");
						format(string, sizeof(string), "* %s da ket thuc cuoc goi.", GetPlayerNameEx(caller));
						ProxDetector(30.0, caller, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						CellTime[caller] = 0;
						Mobile[caller] = INVALID_PLAYER_ID;
			        	hidephonereo(caller);
						phonescreen(caller);
						PlayerTextDrawHide(caller, Dienthoaireo[playerid][4]);
     					DeletePVar(caller, "dangketnoi");
						SetPVarInt(caller,"batdienthoai",1);
					}
					CellTime[playerid] = 0;
					SendClientMessageEx(playerid,  COLOR_GRAD2, "Ban da ket thuc cuoc goi.");
					format(string, sizeof(string), "* %s da ket thuc cuoc goi.", GetPlayerNameEx(playerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					Mobile[playerid] = INVALID_PLAYER_ID;
					CellTime[playerid] = 0;
					RingTone[playerid] = 0;
					DeletePVar(playerid, "dangketnoi");
					RemovePlayerAttachedObject(caller, 9);
					SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
					return 1;
				}
				SendClientMessageEx(playerid,  COLOR_GRAD2, "   Dien thoai dang trong tui cua ban.");
				return 1;
			}
		}
 		if(playertextid == Dienthoai_TD[playerid][13])
		{
			new stringz = strval(sodienthoai[playerid]);
			new string[128];

			format(string, sizeof(string), "* %s lay dien thoai di dong tu tui quan ra.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			if(stringz == 911)
			{
				if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the su dung trong tu!");
				if(GetPVarType(playerid, "Has911Call")) SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the thuc hien mot cuoc goi cung luc. (/huycuocgoi)");
				else if(PlayerInfo[playerid][p911Muted] != 0) ShowPlayerDialog(playerid, 7955, DIALOG_STYLE_MSGBOX, "Chan cuoc goi", "Ban bi chan cuoc goi tu dich vu 911 do trong qua khu ban da lam dung.\n\n((Su dung /baocao de go bo lenh cam))", "Dong", "");
				else ShowPlayerDialog(playerid, DIALOG_911MENU, DIALOG_STYLE_LIST, "Dich vu khan cap 911", "Khan cap\nBac si\nHo tro canh sat (Khong khan cap)\nKeo xe", "Lua chon", "Ket thuc cuoc goi");
				return 1;
			}
			if(stringz == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Dien thoai nguoi do dang ban...");
				return 1;
			}
			if(Mobile[playerid] != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "  Ban dang co mot cuoc goi...");
				return 1;
			}
			if(GetPVarInt(playerid,"goinhanh") > 0)
			{
			    new strou[123];
			    format(strou, sizeof(strou),"Ban can doi %d giay nua de goi tiep!",GetPVarInt(playerid, "goinhanh"));
				SendClientMessageEx(playerid, COLOR_YELLOW, strou);
				return 1;
			}
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pPnumber] == stringz && stringz != 0)
				{
					new giveplayerid = i; //caller connecting
					Mobile[playerid] = i;
					if(IsPlayerConnected(giveplayerid))
					{
						if(giveplayerid != INVALID_PLAYER_ID)
						{
							if(PhoneOnline[giveplayerid] > 0)
							{
								SendClientMessageEx(playerid, COLOR_GREY, "Dien thoai nguoi do dang tat.");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Mobile[giveplayerid] != INVALID_PLAYER_ID)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if(Spectating[giveplayerid]!=0)
							{
								SendClientMessageEx(playerid, COLOR_GRAD2, "Dien thoai nguoi do dang ban...");
								Mobile[playerid] = INVALID_PLAYER_ID;
								return 1;
							}
							if (Mobile[giveplayerid] == INVALID_PLAYER_ID)
							{
								RingTone[giveplayerid] = 10;
								format(string, sizeof(string), "* %s's dien thoai dang do chuong.", GetPlayerNameEx(i));
								SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang goi den so may vua nhap, muon huy cuoc click phim {FF0000}[<]");
      							phonereo(i);
      							dienthoaizin(i);
      							hidephonegoi(i);
      							hidephonescreen(i);
                                PlayAudioStreamForPlayer(i, "https://cdn.discordapp.com/attachments/598143083581931536/880705319863484447/y2meta.com_-_Nhac_Chuong_ien_Thoai_o_Choi_Tre_Em_-_Remix__Cell_Phone_Toy_Sound_128_kbps.mp3");
      							DeletePVar(i,"batdienthoai");
      							SelectTextDraw(i, COLOR_YELLOW);
      							SetPVarInt(playerid, "dangketnoi",1);
                                SetPVarInt(playerid, "goinhanh",30);
	    						SetTimerEx("goinhanh",1000,false,"i",playerid);
	    						sodienthoai[playerid] = "";
	    						PlayerTextDrawSetString(playerid,Dienthoai_TD[playerid][15],"");
      							new strun[123];
      							format(strun, sizeof(strun),"%s",GetPlayerNameEx(playerid));
								PlayerTextDrawSetString(i, Dienthoaireo[playerid][1],strun);

								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								new Float:rX, Float:rY, Float:rZ;
								GetPlayerPos(giveplayerid, rX, rY, rZ);
								//SendRingtoneToArea(playerid, 100, rX, rY, rZ);
								//SendAudioToPlayer(playerid, 60, 100);
								CellTime[playerid] = 1;
								SetPlayerAttachedObject(playerid, 9, 330, 6);
								return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
							}
						}
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GRAD2, "Cuoc goi cua ban khong duoc thuc hien, vui long kiem tra lai so va thu lai.");
			return 1;
		}
	}
	return 1;
}

CMD:batphone(playerid, params[])
{
	if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0)
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the su dung dien thoai.");
		return 1;
	}
	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) {
   		return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lam dieu do vao luc nay!");
	}
    if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the su dung dien thoai trong tu!");
	if(PhoneOnline[playerid] > 0) return SendClientMessageEx(playerid, COLOR_GREY, "Your phone is off.");
	if(GetPVarInt(playerid,"batdienthoai") == 1) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban dang bat dien thoai");
	{
		if(PlayerInfo[playerid][pPnumber] == 0) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban khong co dien thoai");
		{
			if(PhoneOnline[playerid] > 0) return SendClientMessageEx(playerid, COLOR_WHITE,"Dien thoai ban dang tat nguon");
			{
				SetPVarInt(playerid,"batdienthoai",1);
				phonescreen(playerid);
  				dienthoaizin(playerid);
				SelectTextDraw(playerid, 0x000000);
			}
		}
	}
	return 1;
}
CMD:tuchoivitri(playerid, params[])
{
	new thangcc = GetPVarInt(playerid, "chiasevitri");
	if(GetPVarInt(playerid, "chiasevitri"))
	{
	    SendClientMessageEx(thangcc, COLOR_WHITE, "Ho da huy yeu cau gui vi tri cua ban.");
	    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da huy yeu cau gui vi tri cua ho.");
		SetPVarInt(playerid, "chiasevitri",-1);
	}
	return 1;
}
CMD:chapnhanvitri(playerid)
{
	if(CP[playerid] != 0 || BanhHienTai[playerid] > 0) return ChatHoTro(playerid, 255,"Ban dang co checkpoint khac",5000);
    if(GetPVarInt(playerid, "chiasevitri") == -1) return ChatHoTro(playerid, 255,"Ban khong co ai gui vi tri",5000);
    new thangcc = GetPVarInt(playerid, "chiasevitri");
    new Float:tx, Float:ty, Float:tz;
    GetPlayerPos(thangcc, tx,ty,tz);
    SetPlayerCheckpoint(playerid, tx,ty,tz, 3.0);
    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chap nhan yeu cau gui vi tri cua ho.");
    SendClientMessageEx(thangcc, COLOR_WHITE, "Nguoi choi ban yeu cau da chap nhan loi de nghi.");
    CP[playerid] = 2;
    SetPVarInt(playerid, "chiasevitri",-1);
	return 1;
}
CMD:tatcam(playerid, params[])
{
	if(GetPVarInt(playerid,"tatcam") == 1){
		TogglePlayerControllable(playerid, 1);
		ClearAnimations(playerid);
		SetCameraBehindPlayer(playerid);
		DeletePVar(playerid, "tatcam");
	}
	return 1;
}


