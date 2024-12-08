// Poker Table Textdraw - Credits to GhoulSlayer
CreatePokerGUI(playerid)
{
    PlayerPokerUI[playerid][0] = CreatePlayerTextDraw(playerid, 390.000000, 263.000000, " "); // Seat 2 (SEAT 1)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][0], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][0], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][0], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][0], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][0], 0);

	PlayerPokerUI[playerid][1] = CreatePlayerTextDraw(playerid, 389.000000, 273.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][1], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][1], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][1], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][1], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][1], 0);

	PlayerPokerUI[playerid][2] = CreatePlayerTextDraw(playerid, 369.000000, 286.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][2], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][2], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][2], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][2], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][2], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][2], 20.000000, 33.000000);

	PlayerPokerUI[playerid][3] = CreatePlayerTextDraw(playerid, 392.000000, 286.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][3], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][3], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][3], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][3], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][3], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][3], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][3], 20.000000, 33.000000);

	PlayerPokerUI[playerid][4] = CreatePlayerTextDraw(playerid, 391.000000, 319.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][4], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][4], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][4], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][4], 0);

	PlayerPokerUI[playerid][5] = CreatePlayerTextDraw(playerid, 250.000000, 263.000000, " "); // Seat 1 (SEAT 2)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][5], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][5], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][5], 0.159999, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][5], 0);

	PlayerPokerUI[playerid][6] = CreatePlayerTextDraw(playerid, 250.000000, 273.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][6], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][6], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][6], 0.159999, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][6], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][6], 0);

	PlayerPokerUI[playerid][7] = CreatePlayerTextDraw(playerid, 229.000000, 286.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][7], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][7], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][7], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][7], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][7], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][7], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][7], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][7], 20.000000, 33.000000);

	PlayerPokerUI[playerid][8] = CreatePlayerTextDraw(playerid, 252.000000, 286.000000, " ");
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][8], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][8], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][8], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][8], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][8], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][8], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][8], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][8], 20.000000, 33.000000);

	PlayerPokerUI[playerid][9] = CreatePlayerTextDraw(playerid, 250.000000, 319.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][9], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][9], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][9], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][9], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][9], 0);

	PlayerPokerUI[playerid][10] = CreatePlayerTextDraw(playerid, 199.000000, 190.000000, " "); // Seat 6 (SEAT 3)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][10], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][10], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][10], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][10], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][10], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][10], 0);

	PlayerPokerUI[playerid][11] = CreatePlayerTextDraw(playerid, 199.000000, 199.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][11], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][11], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][11], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][11], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][11], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][11], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][11], 0);

	PlayerPokerUI[playerid][12] = CreatePlayerTextDraw(playerid, 179.000000, 212.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][12], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][12], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][12], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][12], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][12], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][12], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][12], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][12], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][12], 20.000000, 33.000000);

	PlayerPokerUI[playerid][13] = CreatePlayerTextDraw(playerid, 202.000000, 212.000000, " ");
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][13], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][13], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][13], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][13], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][13], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][13], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][13], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][13], 20.000000, 33.000000);

	PlayerPokerUI[playerid][14] = CreatePlayerTextDraw(playerid, 200.000000, 245.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][14], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][14], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][14], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][14], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][14], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][14], 0);

	PlayerPokerUI[playerid][15] = CreatePlayerTextDraw(playerid, 250.000000, 116.000000, " ");  // Seat 5 (SEAT 4)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][15], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][15], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][15], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][15], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][15], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][15], 0);

	PlayerPokerUI[playerid][16] = CreatePlayerTextDraw(playerid, 250.000000, 126.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][16], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][16], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][16], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][16], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][16], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][16], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][16], 0);

	PlayerPokerUI[playerid][17] = CreatePlayerTextDraw(playerid, 229.000000, 139.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][17], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][17], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][17], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][17], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][17], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][17], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][17], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][17], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][17], 20.000000, 33.000000);

	PlayerPokerUI[playerid][18] = CreatePlayerTextDraw(playerid, 252.000000, 139.000000, " ");
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][18], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][18], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][18], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][18], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][18], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][18], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][18], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][18], 20.000000, 33.000000);

	PlayerPokerUI[playerid][19] = CreatePlayerTextDraw(playerid, 250.000000, 172.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][19], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][19], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][19], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][19], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][19], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][19], 0);

	PlayerPokerUI[playerid][20] = CreatePlayerTextDraw(playerid, 390.000000, 116.000000, " "); // Seat 4 (SEAT 5)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][20], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][20], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][20], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][20], 0.159997, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][20], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][20], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][20], 0);

	PlayerPokerUI[playerid][21] = CreatePlayerTextDraw(playerid, 389.000000, 126.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][21], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][21], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][21], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][21], 0.159997, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][21], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][21], 0);

	PlayerPokerUI[playerid][22] = CreatePlayerTextDraw(playerid, 369.000000, 139.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][22], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][22], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][22], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][22], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][22], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][22], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][22], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][22], 20.000000, 33.000000);

	PlayerPokerUI[playerid][23] = CreatePlayerTextDraw(playerid, 392.000000, 139.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][23], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][23], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][23], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][23], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][23], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][23], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][23], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][23], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][23], 20.000000, 33.000000);

	PlayerPokerUI[playerid][24] = CreatePlayerTextDraw(playerid, 391.000000, 172.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][24], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][24], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][24], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][24], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][24], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][24], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][24], 0);

	PlayerPokerUI[playerid][25] = CreatePlayerTextDraw(playerid, 443.000000, 190.000000, " "); // Seat 3 (SEAT 6)
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][25], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][25], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][25], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][25], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][25], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][25], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][25], 0);

	PlayerPokerUI[playerid][26] = CreatePlayerTextDraw(playerid, 442.000000, 199.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][26], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][26], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][26], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][26], 0.159998, 1.200001);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][26], 16711935);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][26], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][26], 0);

	PlayerPokerUI[playerid][27] = CreatePlayerTextDraw(playerid, 422.000000, 212.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][27], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][27], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][27], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][27], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][27], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][27], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][27], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][27], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][27], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][27], 20.000000, 33.000000);

	PlayerPokerUI[playerid][28] = CreatePlayerTextDraw(playerid, 445.000000, 212.000000, " ");
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][28], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][28], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][28], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][28], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][28], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][28], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][28], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][28], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][28], 20.000000, 33.000000);

	PlayerPokerUI[playerid][29] = CreatePlayerTextDraw(playerid, 444.000000, 245.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][29], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][29], 100);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][29], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][29], 0.180000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][29], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][29], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][29], 0);

	PlayerPokerUI[playerid][30] = CreatePlayerTextDraw(playerid, 265.000000, 205.000000, "New Textdraw"); // Community Card Box
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][30], 0);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][30], 1);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][30], 0.539999, 2.099998);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][30], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][30], 100);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][30], 375.000000, 71.000000);

	PlayerPokerUI[playerid][31] = CreatePlayerTextDraw(playerid, 266.000000, 208.000000, "LD_CARD:cdback");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][31], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][31], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][31], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][31], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][31], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][31], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][31], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][31], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][31], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][31], 20.000000, 33.000000);

	PlayerPokerUI[playerid][32] = CreatePlayerTextDraw(playerid, 288.000000, 208.000000, "LD_CARD:cdback");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][32], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][32], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][32], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][32], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][32], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][32], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][32], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][32], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][32], 20.000000, 33.000000);

	PlayerPokerUI[playerid][33] = CreatePlayerTextDraw(playerid, 310.000000, 208.000000, "LD_CARD:cdback");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][33], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][33], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][33], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][33], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][33], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][33], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][33], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][33], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][33], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][33], 20.000000, 33.000000);

	PlayerPokerUI[playerid][34] = CreatePlayerTextDraw(playerid, 332.000000, 208.000000, "LD_CARD:cdback");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][34], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][34], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][34], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][34], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][34], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][34], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][34], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][34], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][34], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][34], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][34], 20.000000, 33.000000);

	PlayerPokerUI[playerid][35] = CreatePlayerTextDraw(playerid, 354.000000, 208.000000, "LD_CARD:cdback");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][35], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][35], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][35], 4);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][35], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][35], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][35], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][35], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][35], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][35], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][35], 255);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][35], 20.000000, 33.000000);

	PlayerPokerUI[playerid][36] = CreatePlayerTextDraw(playerid, 320.000000, 193.000000, "New Textdraw");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][36], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][36], 0);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][36], 1);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][36], 0.500000, 0.399999);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][36], 0);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][36], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][36], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][36], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][36], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][36], 50);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][36], 390.000000, 110.000000);

	PlayerPokerUI[playerid][37] = CreatePlayerTextDraw(playerid, 318.000000, 191.000000, "Texas Holdem Poker");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][37], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][37], -1);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][37], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][37], 0.199999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][37], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][37], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][37], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][37], 0);

	PlayerPokerUI[playerid][38] = CreatePlayerTextDraw(playerid, 321.000000, 268.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][38], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][38], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][38], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][38], 0.189999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][38], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][38], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][38], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][38], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][38], 45);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][38], 10.000000, 26.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerPokerUI[playerid][38], 1);

	PlayerPokerUI[playerid][39] = CreatePlayerTextDraw(playerid, 321.000000, 284.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][39], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][39], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][39], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][39], 0.189999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][39], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][39], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][39], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][39], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][39], 45);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][39], 10.000000, 26.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerPokerUI[playerid][39], 1);

	PlayerPokerUI[playerid][40] = CreatePlayerTextDraw(playerid, 321.000000, 300.000000, " ");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][40], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][40], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][40], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][40], 0.189999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][40], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][40], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][40], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][40], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][40], 45);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][40], 10.000000, 26.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerPokerUI[playerid][40], 1);

	PlayerPokerUI[playerid][41] = CreatePlayerTextDraw(playerid, 318.000000, 120.000000, "THOAT");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][41], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][41], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][41], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][41], 0.189999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][41], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][41], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][41], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][41], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][41], 45);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][41], 10.000000, 36.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerPokerUI[playerid][41], 1);

	PlayerPokerUI[playerid][42] = CreatePlayerTextDraw(playerid, 590.000000, 400.000000, "Casino~n~Games");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][42], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][42], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][42], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][42], 0.500000, 2.000000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][42], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][42], 1);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][42], 1);

	PlayerPokerUI[playerid][43] = CreatePlayerTextDraw(playerid, 589.000000, 396.000000, "GO-RP.NET");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][43], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][43], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][43], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][43], 0.180000, 0.800000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][43], 200);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][43], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][43], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][43], 0);

	PlayerPokerUI[playerid][44] = CreatePlayerTextDraw(playerid, 588.000000, 437.000000, "Phien ban Gay");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][44], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][44], 255);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][44], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][44], 0.180000, 0.800000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][44], 200);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][44], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][44], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][44], 0);

/*	PlayerPokerUI[playerid][45] = CreatePlayerTextDraw(playerid, 5.000000, 100.000000, "Debug:");
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][45], 0);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][45], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][45], 0.159999, 1.099999);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][45], 200);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][45], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][45], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][45], 1); */

	PlayerPokerUI[playerid][46] = CreatePlayerTextDraw(playerid, 318.000000, 245.000000, "Texas Holdem Poker");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][46], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][46], -1);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][46], 2);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][46], 0.199999, 1.200000);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][46], -1);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][46], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][46], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][46], 0);

	PlayerPokerUI[playerid][47] = CreatePlayerTextDraw(playerid, 320.000000, 248.000000, "New Textdraw");
	PlayerTextDrawAlignment(playerid, PlayerPokerUI[playerid][47], 2);
	PlayerTextDrawBackgroundColor(playerid, PlayerPokerUI[playerid][47], 0);
	PlayerTextDrawFont(playerid, PlayerPokerUI[playerid][47], 1);
	PlayerTextDrawLetterSize(playerid, PlayerPokerUI[playerid][47], 0.500000, 0.399998);
	PlayerTextDrawColor(playerid, PlayerPokerUI[playerid][47], 0);
	PlayerTextDrawSetOutline(playerid, PlayerPokerUI[playerid][47], 0);
	PlayerTextDrawSetProportional(playerid, PlayerPokerUI[playerid][47], 1);
	PlayerTextDrawSetShadow(playerid, PlayerPokerUI[playerid][47], 1);
	PlayerTextDrawUseBox(playerid, PlayerPokerUI[playerid][47], 1);
	PlayerTextDrawBoxColor(playerid, PlayerPokerUI[playerid][47], 50);
	PlayerTextDrawTextSize(playerid, PlayerPokerUI[playerid][47], 390.000000, 110.000000);
}
 
forward LoadTextDraws();
public LoadTextDraws()
{
	//skin
	Buyskin_TD[0] = TextDrawCreate(145.058547, 120.200019, "mdl-2004:bg_main");
TextDrawLetterSize(Buyskin_TD[0], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[0], 344.000000, 204.000000);
TextDrawAlignment(Buyskin_TD[0], 1);
TextDrawColor(Buyskin_TD[0], -1);
TextDrawSetShadow(Buyskin_TD[0], 0);
TextDrawSetOutline(Buyskin_TD[0], 0);
TextDrawBackgroundColor(Buyskin_TD[0], 255);
TextDrawFont(Buyskin_TD[0], 4);
TextDrawSetProportional(Buyskin_TD[0], 0);
TextDrawSetShadow(Buyskin_TD[0], 0);

Buyskin_TD[1] = TextDrawCreate(162.530853, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[1], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[1], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[1], 1);
TextDrawColor(Buyskin_TD[1], -1);
TextDrawSetShadow(Buyskin_TD[1], 0);
TextDrawSetOutline(Buyskin_TD[1], 0);
TextDrawBackgroundColor(Buyskin_TD[1], 255);
TextDrawFont(Buyskin_TD[1], 4);
TextDrawSetProportional(Buyskin_TD[1], 0);
TextDrawSetShadow(Buyskin_TD[1], 0);
TextDrawSetSelectable(Buyskin_TD[1], true);

Buyskin_TD[2] = TextDrawCreate(227.930145, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[2], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[2], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[2], 1);
TextDrawColor(Buyskin_TD[2], -1);
TextDrawSetShadow(Buyskin_TD[2], 0);
TextDrawSetOutline(Buyskin_TD[2], 0);
TextDrawBackgroundColor(Buyskin_TD[2], 255);
TextDrawFont(Buyskin_TD[2], 4);
TextDrawSetProportional(Buyskin_TD[2], 0);
TextDrawSetShadow(Buyskin_TD[2], 0);
TextDrawSetSelectable(Buyskin_TD[2], true);

Buyskin_TD[3] = TextDrawCreate(293.334747, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[3], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[3], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[3], 1);
TextDrawColor(Buyskin_TD[3], -1);
TextDrawSetShadow(Buyskin_TD[3], 0);
TextDrawSetOutline(Buyskin_TD[3], 0);
TextDrawBackgroundColor(Buyskin_TD[3], 255);
TextDrawFont(Buyskin_TD[3], 4);
TextDrawSetProportional(Buyskin_TD[3], 0);
TextDrawSetShadow(Buyskin_TD[3], 0);
TextDrawSetSelectable(Buyskin_TD[3], true);

Buyskin_TD[4] = TextDrawCreate(359.733734, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[4], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[4], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[4], 1);
TextDrawColor(Buyskin_TD[4], -1);
TextDrawSetShadow(Buyskin_TD[4], 0);
TextDrawSetOutline(Buyskin_TD[4], 0);
TextDrawBackgroundColor(Buyskin_TD[4], 255);
TextDrawFont(Buyskin_TD[4], 4);
TextDrawSetProportional(Buyskin_TD[4], 0);
TextDrawSetShadow(Buyskin_TD[4], 0);
TextDrawSetSelectable(Buyskin_TD[4], true);

Buyskin_TD[5] = TextDrawCreate(424.932739, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[5], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[5], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[5], 1);
TextDrawColor(Buyskin_TD[5], -1);
TextDrawSetShadow(Buyskin_TD[5], 0);
TextDrawSetOutline(Buyskin_TD[5], 0);
TextDrawBackgroundColor(Buyskin_TD[5], 255);
TextDrawFont(Buyskin_TD[5], 4);
TextDrawSetProportional(Buyskin_TD[5], 0);
TextDrawSetShadow(Buyskin_TD[5], 0);
TextDrawSetSelectable(Buyskin_TD[5], true);

Buyskin_TD[6] = TextDrawCreate(424.932739, 270.648895, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[6], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[6], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[6], 1);
TextDrawColor(Buyskin_TD[6], -1);
TextDrawSetShadow(Buyskin_TD[6], 0);
TextDrawSetOutline(Buyskin_TD[6], 0);
TextDrawBackgroundColor(Buyskin_TD[6], 255);
TextDrawFont(Buyskin_TD[6], 4);
TextDrawSetProportional(Buyskin_TD[6], 0);
TextDrawSetShadow(Buyskin_TD[6], 0);
TextDrawSetSelectable(Buyskin_TD[6], true);

Buyskin_TD[7] = TextDrawCreate(359.133758, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[7], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[7], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[7], 1);
TextDrawColor(Buyskin_TD[7], -1);
TextDrawSetShadow(Buyskin_TD[7], 0);
TextDrawSetOutline(Buyskin_TD[7], 0);
TextDrawBackgroundColor(Buyskin_TD[7], 255);
TextDrawFont(Buyskin_TD[7], 4);
TextDrawSetProportional(Buyskin_TD[7], 0);
TextDrawSetShadow(Buyskin_TD[7], 0);
TextDrawSetSelectable(Buyskin_TD[7], true);

Buyskin_TD[8] = TextDrawCreate(293.033386, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[8], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[8], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[8], 1);
TextDrawColor(Buyskin_TD[8], -1);
TextDrawSetShadow(Buyskin_TD[8], 0);
TextDrawSetOutline(Buyskin_TD[8], 0);
TextDrawBackgroundColor(Buyskin_TD[8], 255);
TextDrawFont(Buyskin_TD[8], 4);
TextDrawSetProportional(Buyskin_TD[8], 0);
TextDrawSetShadow(Buyskin_TD[8], 0);
TextDrawSetSelectable(Buyskin_TD[8], true);

Buyskin_TD[9] = TextDrawCreate(228.433135, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[9], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[9], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[9], 1);
TextDrawColor(Buyskin_TD[9], -1);
TextDrawSetShadow(Buyskin_TD[9], 0);
TextDrawSetOutline(Buyskin_TD[9], 0);
TextDrawBackgroundColor(Buyskin_TD[9], 255);
TextDrawFont(Buyskin_TD[9], 4);
TextDrawSetProportional(Buyskin_TD[9], 0);
TextDrawSetShadow(Buyskin_TD[9], 0);
TextDrawSetSelectable(Buyskin_TD[9], true);

Buyskin_TD[10] = TextDrawCreate(162.633422, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[10], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[10], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[10], 1);
TextDrawColor(Buyskin_TD[10], -1);
TextDrawSetShadow(Buyskin_TD[10], 0);
TextDrawSetOutline(Buyskin_TD[10], 0);
TextDrawBackgroundColor(Buyskin_TD[10], 255);
TextDrawFont(Buyskin_TD[10], 4);
TextDrawSetProportional(Buyskin_TD[10], 0);
TextDrawSetShadow(Buyskin_TD[10], 0);
TextDrawSetSelectable(Buyskin_TD[10], true);

Buyskin_TD[11] = TextDrawCreate(150.632598, 145.216583, ""); // skin
TextDrawLetterSize(Buyskin_TD[11], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[11], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[11], 1);
TextDrawColor(Buyskin_TD[11], -1);
TextDrawSetShadow(Buyskin_TD[11], 0);
TextDrawSetOutline(Buyskin_TD[11], 0);
TextDrawBackgroundColor(Buyskin_TD[11], 0);
TextDrawFont(Buyskin_TD[11], 5);
TextDrawSetProportional(Buyskin_TD[11], 0);
TextDrawSetShadow(Buyskin_TD[11], 0);
TextDrawSetPreviewModel(Buyskin_TD[11], 20002);
TextDrawSetPreviewRot(Buyskin_TD[11], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[12] = TextDrawCreate(215.431747, 145.216583, "");// skin
TextDrawLetterSize(Buyskin_TD[12], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[12], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[12], 1);
TextDrawColor(Buyskin_TD[12], -1);
TextDrawSetShadow(Buyskin_TD[12], 0);
TextDrawSetOutline(Buyskin_TD[12], 0);
TextDrawBackgroundColor(Buyskin_TD[12], 0);
TextDrawFont(Buyskin_TD[12], 5);
TextDrawSetProportional(Buyskin_TD[12], 0);
TextDrawSetShadow(Buyskin_TD[12], 0);
TextDrawSetPreviewModel(Buyskin_TD[12], 20003);
TextDrawSetPreviewRot(Buyskin_TD[12], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[13] = TextDrawCreate(281.099304, 146.383255, "");// skin
TextDrawLetterSize(Buyskin_TD[13], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[13], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[13], 1);
TextDrawColor(Buyskin_TD[13], -1);
TextDrawSetShadow(Buyskin_TD[13], 0);
TextDrawSetOutline(Buyskin_TD[13], 0);
TextDrawBackgroundColor(Buyskin_TD[13], 0);
TextDrawFont(Buyskin_TD[13], 5);
TextDrawSetProportional(Buyskin_TD[13], 0);
TextDrawSetShadow(Buyskin_TD[13], 0);
TextDrawSetPreviewModel(Buyskin_TD[13], 20004);
TextDrawSetPreviewRot(Buyskin_TD[13], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[14] = TextDrawCreate(347.098297, 145.983261, "");// skin
TextDrawLetterSize(Buyskin_TD[14], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[14], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[14], 1);
TextDrawColor(Buyskin_TD[14], -1);
TextDrawSetShadow(Buyskin_TD[14], 0);
TextDrawSetOutline(Buyskin_TD[14], 0);
TextDrawBackgroundColor(Buyskin_TD[14], 0);
TextDrawFont(Buyskin_TD[14], 5);
TextDrawSetProportional(Buyskin_TD[14], 0);
TextDrawSetShadow(Buyskin_TD[14], 0);
TextDrawSetPreviewModel(Buyskin_TD[14], 20005);
TextDrawSetPreviewRot(Buyskin_TD[14], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[15] = TextDrawCreate(411.897308, 145.983261, "");// skin
TextDrawLetterSize(Buyskin_TD[15], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[15], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[15], 1);
TextDrawColor(Buyskin_TD[15], -1);
TextDrawSetShadow(Buyskin_TD[15], 0);
TextDrawSetOutline(Buyskin_TD[15], 0);
TextDrawBackgroundColor(Buyskin_TD[15], 0);
TextDrawFont(Buyskin_TD[15], 5);
TextDrawSetProportional(Buyskin_TD[15], 0);
TextDrawSetShadow(Buyskin_TD[15], 0);
TextDrawSetPreviewModel(Buyskin_TD[15], 20006);
TextDrawSetPreviewRot(Buyskin_TD[15], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[16] = TextDrawCreate(150.632598, 224.815368, "");// skin
TextDrawLetterSize(Buyskin_TD[16], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[16], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[16], 1);
TextDrawColor(Buyskin_TD[16], -1);
TextDrawSetShadow(Buyskin_TD[16], 0);
TextDrawSetOutline(Buyskin_TD[16], 0);
TextDrawBackgroundColor(Buyskin_TD[16], 0);
TextDrawFont(Buyskin_TD[16], 5);
TextDrawSetProportional(Buyskin_TD[16], 0);
TextDrawSetShadow(Buyskin_TD[16], 0);
TextDrawSetPreviewModel(Buyskin_TD[16], 20007);
TextDrawSetPreviewRot(Buyskin_TD[16], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[17] = TextDrawCreate(215.900131, 222.815399, "");// skin
TextDrawLetterSize(Buyskin_TD[17], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[17], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[17], 1);
TextDrawColor(Buyskin_TD[17], -1);
TextDrawSetShadow(Buyskin_TD[17], 0);
TextDrawSetOutline(Buyskin_TD[17], 0);
TextDrawBackgroundColor(Buyskin_TD[17], 0);
TextDrawFont(Buyskin_TD[17], 5);
TextDrawSetProportional(Buyskin_TD[17], 0);
TextDrawSetShadow(Buyskin_TD[17], 0);
TextDrawSetPreviewModel(Buyskin_TD[17], 20008);
TextDrawSetPreviewRot(Buyskin_TD[17], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[18] = TextDrawCreate(280.299163, 222.815399, "");// skin
TextDrawLetterSize(Buyskin_TD[18], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[18], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[18], 1);
TextDrawColor(Buyskin_TD[18], -1);
TextDrawSetShadow(Buyskin_TD[18], 0);
TextDrawSetOutline(Buyskin_TD[18], 0);
TextDrawBackgroundColor(Buyskin_TD[18], 0);
TextDrawFont(Buyskin_TD[18], 5);
TextDrawSetProportional(Buyskin_TD[18], 0);
TextDrawSetShadow(Buyskin_TD[18], 0);
TextDrawSetPreviewModel(Buyskin_TD[18], 20009);
TextDrawSetPreviewRot(Buyskin_TD[18], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[19] = TextDrawCreate(347.098144, 222.815399, "");// skin
TextDrawLetterSize(Buyskin_TD[19], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[19], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[19], 1);
TextDrawColor(Buyskin_TD[19], -1);
TextDrawSetShadow(Buyskin_TD[19], 0);
TextDrawSetOutline(Buyskin_TD[19], 0);
TextDrawBackgroundColor(Buyskin_TD[19], 0);
TextDrawFont(Buyskin_TD[19], 5);
TextDrawSetProportional(Buyskin_TD[19], 0);
TextDrawSetShadow(Buyskin_TD[19], 0);
TextDrawSetPreviewModel(Buyskin_TD[19], 20010);
TextDrawSetPreviewRot(Buyskin_TD[19], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[20] = TextDrawCreate(411.497161, 222.815399, "");// skin
TextDrawLetterSize(Buyskin_TD[20], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[20], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[20], 1);
TextDrawColor(Buyskin_TD[20], -1);
TextDrawSetShadow(Buyskin_TD[20], 0);
TextDrawSetOutline(Buyskin_TD[20], 0);
TextDrawBackgroundColor(Buyskin_TD[20], 0);
TextDrawFont(Buyskin_TD[20], 5);
TextDrawSetProportional(Buyskin_TD[20], 0);
TextDrawSetShadow(Buyskin_TD[20], 0);
TextDrawSetPreviewModel(Buyskin_TD[20], 20011);
TextDrawSetPreviewRot(Buyskin_TD[20], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[21] = TextDrawCreate(472.695983, 117.149856, "mdl-2004:btn_close");
TextDrawLetterSize(Buyskin_TD[21], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[21], 20.000000, 23.000000);
TextDrawAlignment(Buyskin_TD[21], 1);
TextDrawColor(Buyskin_TD[21], -1);
TextDrawSetShadow(Buyskin_TD[21], 0);
TextDrawSetOutline(Buyskin_TD[21], 0);
TextDrawBackgroundColor(Buyskin_TD[21], 255);
TextDrawFont(Buyskin_TD[21], 4);
TextDrawSetProportional(Buyskin_TD[21], 0);
TextDrawSetShadow(Buyskin_TD[21], 0);
TextDrawSetSelectable(Buyskin_TD[21], true);

Buyskin_TD[22] = TextDrawCreate(167.873626, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[22], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[22], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[22], 1);
TextDrawColor(Buyskin_TD[22], 16777215);
TextDrawSetShadow(Buyskin_TD[22], 0);
TextDrawSetOutline(Buyskin_TD[22], 0);
TextDrawBackgroundColor(Buyskin_TD[22], 255);
TextDrawFont(Buyskin_TD[22], 4);
TextDrawSetProportional(Buyskin_TD[22], 0);
TextDrawSetShadow(Buyskin_TD[22], 0);
TextDrawSetSelectable(Buyskin_TD[22], true);

Buyskin_TD[23] = TextDrawCreate(232.573944, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[23], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[23], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[23], 1);
TextDrawColor(Buyskin_TD[23], 16777215);
TextDrawSetShadow(Buyskin_TD[23], 0);
TextDrawSetOutline(Buyskin_TD[23], 0);
TextDrawBackgroundColor(Buyskin_TD[23], 255);
TextDrawFont(Buyskin_TD[23], 4);
TextDrawSetProportional(Buyskin_TD[23], 0);
TextDrawSetShadow(Buyskin_TD[23], 0);
TextDrawSetSelectable(Buyskin_TD[23], true);

Buyskin_TD[24] = TextDrawCreate(298.574615, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[24], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[24], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[24], 1);
TextDrawColor(Buyskin_TD[24], 16777215);
TextDrawSetShadow(Buyskin_TD[24], 0);
TextDrawSetOutline(Buyskin_TD[24], 0);
TextDrawBackgroundColor(Buyskin_TD[24], 255);
TextDrawFont(Buyskin_TD[24], 4);
TextDrawSetProportional(Buyskin_TD[24], 0);
TextDrawSetShadow(Buyskin_TD[24], 0);
TextDrawSetSelectable(Buyskin_TD[24], true);

Buyskin_TD[25] = TextDrawCreate(365.775299, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[25], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[25], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[25], 1);
TextDrawColor(Buyskin_TD[25], 16777215);
TextDrawSetShadow(Buyskin_TD[25], 0);
TextDrawSetOutline(Buyskin_TD[25], 0);
TextDrawBackgroundColor(Buyskin_TD[25], 255);
TextDrawFont(Buyskin_TD[25], 4);
TextDrawSetProportional(Buyskin_TD[25], 0);
TextDrawSetShadow(Buyskin_TD[25], 0);
TextDrawSetSelectable(Buyskin_TD[25], true);

Buyskin_TD[26] = TextDrawCreate(429.975952, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[26], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[26], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[26], 1);
TextDrawColor(Buyskin_TD[26], 16777215);
TextDrawSetShadow(Buyskin_TD[26], 0);
TextDrawSetOutline(Buyskin_TD[26], 0);
TextDrawBackgroundColor(Buyskin_TD[26], 255);
TextDrawFont(Buyskin_TD[26], 4);
TextDrawSetProportional(Buyskin_TD[26], 0);
TextDrawSetShadow(Buyskin_TD[26], 0);
TextDrawSetSelectable(Buyskin_TD[26], true);

Buyskin_TD[27] = TextDrawCreate(168.175811, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[27], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[27], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[27], 1);
TextDrawColor(Buyskin_TD[27], 16777215);
TextDrawSetShadow(Buyskin_TD[27], 0);
TextDrawSetOutline(Buyskin_TD[27], 0);
TextDrawBackgroundColor(Buyskin_TD[27], 255);
TextDrawFont(Buyskin_TD[27], 4);
TextDrawSetProportional(Buyskin_TD[27], 0);
TextDrawSetShadow(Buyskin_TD[27], 0);
TextDrawSetSelectable(Buyskin_TD[27], true);

Buyskin_TD[28] = TextDrawCreate(233.975524, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[28], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[28], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[28], 1);
TextDrawColor(Buyskin_TD[28], 16777215);
TextDrawSetShadow(Buyskin_TD[28], 0);
TextDrawSetOutline(Buyskin_TD[28], 0);
TextDrawBackgroundColor(Buyskin_TD[28], 255);
TextDrawFont(Buyskin_TD[28], 4);
TextDrawSetProportional(Buyskin_TD[28], 0);
TextDrawSetShadow(Buyskin_TD[28], 0);
TextDrawSetSelectable(Buyskin_TD[28], true);

Buyskin_TD[29] = TextDrawCreate(298.375244, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[29], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[29], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[29], 1);
TextDrawColor(Buyskin_TD[29], 16777215);
TextDrawSetShadow(Buyskin_TD[29], 0);
TextDrawSetOutline(Buyskin_TD[29], 0);
TextDrawBackgroundColor(Buyskin_TD[29], 255);
TextDrawFont(Buyskin_TD[29], 4);
TextDrawSetProportional(Buyskin_TD[29], 0);
TextDrawSetShadow(Buyskin_TD[29], 0);
TextDrawSetSelectable(Buyskin_TD[29], true);

Buyskin_TD[30] = TextDrawCreate(364.174957, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[30], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[30], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[30], 1);
TextDrawColor(Buyskin_TD[30], 16777215);
TextDrawSetShadow(Buyskin_TD[30], 0);
TextDrawSetOutline(Buyskin_TD[30], 0);
TextDrawBackgroundColor(Buyskin_TD[30], 255);
TextDrawFont(Buyskin_TD[30], 4);
TextDrawSetProportional(Buyskin_TD[30], 0);
TextDrawSetShadow(Buyskin_TD[30], 0);
TextDrawSetSelectable(Buyskin_TD[30], true);

Buyskin_TD[31] = TextDrawCreate(429.974670, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[31], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[31], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[31], 1);
TextDrawColor(Buyskin_TD[31], 16777215);
TextDrawSetShadow(Buyskin_TD[31], 0);
TextDrawSetOutline(Buyskin_TD[31], 0);
TextDrawBackgroundColor(Buyskin_TD[31], 255);
TextDrawFont(Buyskin_TD[31], 4);
TextDrawSetProportional(Buyskin_TD[31], 0);
TextDrawSetShadow(Buyskin_TD[31], 0);
TextDrawSetSelectable(Buyskin_TD[31], true);

Buyskin_TD[32] = TextDrawCreate(304.842987, 299.983367, "mdl-2004:btn_left");
TextDrawLetterSize(Buyskin_TD[32], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[32], 14.000000, 17.000000);
TextDrawAlignment(Buyskin_TD[32], 1);
TextDrawColor(Buyskin_TD[32], -1);
TextDrawSetShadow(Buyskin_TD[32], 0);
TextDrawSetOutline(Buyskin_TD[32], 0);
TextDrawBackgroundColor(Buyskin_TD[32], 255);
TextDrawFont(Buyskin_TD[32], 4);
TextDrawSetProportional(Buyskin_TD[32], 0);
TextDrawSetShadow(Buyskin_TD[32], 0);
TextDrawSetSelectable(Buyskin_TD[32], true);

Buyskin_TD[33] = TextDrawCreate(330.792327, 299.983367, "mdl-2004:btn_right");
TextDrawLetterSize(Buyskin_TD[33], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[33], 14.000000, 17.000000);
TextDrawAlignment(Buyskin_TD[33], 1);
TextDrawColor(Buyskin_TD[33], -1);
TextDrawSetShadow(Buyskin_TD[33], 0);
TextDrawSetOutline(Buyskin_TD[33], 0);
TextDrawBackgroundColor(Buyskin_TD[33], 255);
TextDrawFont(Buyskin_TD[33], 4);
TextDrawSetProportional(Buyskin_TD[33], 0);
TextDrawSetShadow(Buyskin_TD[33], 0);
TextDrawSetSelectable(Buyskin_TD[33], true);

Buyskin_TD[34] = TextDrawCreate(162.673309, 192.366607, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[34], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[34], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[34], 1);
TextDrawColor(Buyskin_TD[34], -1);
TextDrawSetShadow(Buyskin_TD[34], 0);
TextDrawSetOutline(Buyskin_TD[34], 0);
TextDrawBackgroundColor(Buyskin_TD[34], 255);
TextDrawFont(Buyskin_TD[34], 4);
TextDrawSetProportional(Buyskin_TD[34], 0);
TextDrawSetShadow(Buyskin_TD[34], 0);
TextDrawSetSelectable(Buyskin_TD[34], true);

Buyskin_TD[35] = TextDrawCreate(227.930145, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[35], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[35], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[35], 1);
TextDrawColor(Buyskin_TD[35], -1);
TextDrawSetShadow(Buyskin_TD[35], 0);
TextDrawSetOutline(Buyskin_TD[35], 0);
TextDrawBackgroundColor(Buyskin_TD[35], 255);
TextDrawFont(Buyskin_TD[35], 4);
TextDrawSetProportional(Buyskin_TD[35], 0);
TextDrawSetShadow(Buyskin_TD[35], 0);
TextDrawSetSelectable(Buyskin_TD[35], true);

Buyskin_TD[36] = TextDrawCreate(293.334747, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[36], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[36], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[36], 1);
TextDrawColor(Buyskin_TD[36], -1);
TextDrawSetShadow(Buyskin_TD[36], 0);
TextDrawSetOutline(Buyskin_TD[36], 0);
TextDrawBackgroundColor(Buyskin_TD[36], 255);
TextDrawFont(Buyskin_TD[36], 4);
TextDrawSetProportional(Buyskin_TD[36], 0);
TextDrawSetShadow(Buyskin_TD[36], 0);
TextDrawSetSelectable(Buyskin_TD[36], true);

Buyskin_TD[37] = TextDrawCreate(359.733734, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[37], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[37], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[37], 1);
TextDrawColor(Buyskin_TD[37], -1);
TextDrawSetShadow(Buyskin_TD[37], 0);
TextDrawSetOutline(Buyskin_TD[37], 0);
TextDrawBackgroundColor(Buyskin_TD[37], 255);
TextDrawFont(Buyskin_TD[37], 4);
TextDrawSetProportional(Buyskin_TD[37], 0);
TextDrawSetShadow(Buyskin_TD[37], 0);
TextDrawSetSelectable(Buyskin_TD[37], true);

Buyskin_TD[38] = TextDrawCreate(424.932739, 192.466720, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[38], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[38], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[38], 1);
TextDrawColor(Buyskin_TD[38], -1);
TextDrawSetShadow(Buyskin_TD[38], 0);
TextDrawSetOutline(Buyskin_TD[38], 0);
TextDrawBackgroundColor(Buyskin_TD[38], 255);
TextDrawFont(Buyskin_TD[38], 4);
TextDrawSetProportional(Buyskin_TD[38], 0);
TextDrawSetShadow(Buyskin_TD[38], 0);
TextDrawSetSelectable(Buyskin_TD[38], true);

Buyskin_TD[39] = TextDrawCreate(424.932739, 270.648895, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[39], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[39], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[39], 1);
TextDrawColor(Buyskin_TD[39], -1);
TextDrawSetShadow(Buyskin_TD[39], 0);
TextDrawSetOutline(Buyskin_TD[39], 0);
TextDrawBackgroundColor(Buyskin_TD[39], 255);
TextDrawFont(Buyskin_TD[39], 4);
TextDrawSetProportional(Buyskin_TD[39], 0);
TextDrawSetShadow(Buyskin_TD[39], 0);
TextDrawSetSelectable(Buyskin_TD[39], true);

Buyskin_TD[40] = TextDrawCreate(359.133758, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[40], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[40], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[40], 1);
TextDrawColor(Buyskin_TD[40], -1);
TextDrawSetShadow(Buyskin_TD[40], 0);
TextDrawSetOutline(Buyskin_TD[40], 0);
TextDrawBackgroundColor(Buyskin_TD[40], 255);
TextDrawFont(Buyskin_TD[40], 4);
TextDrawSetProportional(Buyskin_TD[40], 0);
TextDrawSetShadow(Buyskin_TD[40], 0);
TextDrawSetSelectable(Buyskin_TD[40], true);

Buyskin_TD[41] = TextDrawCreate(293.033386, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[41], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[41], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[41], 1);
TextDrawColor(Buyskin_TD[41], -1);
TextDrawSetShadow(Buyskin_TD[41], 0);
TextDrawSetOutline(Buyskin_TD[41], 0);
TextDrawBackgroundColor(Buyskin_TD[41], 255);
TextDrawFont(Buyskin_TD[41], 4);
TextDrawSetProportional(Buyskin_TD[41], 0);
TextDrawSetShadow(Buyskin_TD[41], 0);
TextDrawSetSelectable(Buyskin_TD[41], true);

Buyskin_TD[42] = TextDrawCreate(228.433135, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[42], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[42], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[42], 1);
TextDrawColor(Buyskin_TD[42], -1);
TextDrawSetShadow(Buyskin_TD[42], 0);
TextDrawSetOutline(Buyskin_TD[42], 0);
TextDrawBackgroundColor(Buyskin_TD[42], 255);
TextDrawFont(Buyskin_TD[42], 4);
TextDrawSetProportional(Buyskin_TD[42], 0);
TextDrawSetShadow(Buyskin_TD[42], 0);
TextDrawSetSelectable(Buyskin_TD[42], true);

Buyskin_TD[43] = TextDrawCreate(162.633422, 270.848846, "mdl-2004:sp_btn_mua");
TextDrawLetterSize(Buyskin_TD[43], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[43], 44.000000, 27.000000);
TextDrawAlignment(Buyskin_TD[43], 1);
TextDrawColor(Buyskin_TD[43], -1);
TextDrawSetShadow(Buyskin_TD[43], 0);
TextDrawSetOutline(Buyskin_TD[43], 0);
TextDrawBackgroundColor(Buyskin_TD[43], 255);
TextDrawFont(Buyskin_TD[43], 4);
TextDrawSetProportional(Buyskin_TD[43], 0);
TextDrawSetShadow(Buyskin_TD[43], 0);
TextDrawSetSelectable(Buyskin_TD[43], true);

Buyskin_TD[44] = TextDrawCreate(150.632598, 145.216583, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[44], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[44], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[44], 1);
TextDrawColor(Buyskin_TD[44], -1);
TextDrawSetShadow(Buyskin_TD[44], 0);
TextDrawSetOutline(Buyskin_TD[44], 0);
TextDrawBackgroundColor(Buyskin_TD[44], 0);
TextDrawFont(Buyskin_TD[44], 5);
TextDrawSetProportional(Buyskin_TD[44], 0);
TextDrawSetShadow(Buyskin_TD[44], 0);
TextDrawSetPreviewModel(Buyskin_TD[44], 20012);
TextDrawSetPreviewRot(Buyskin_TD[44], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[45] = TextDrawCreate(215.431747, 145.216583, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[45], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[45], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[45], 1);
TextDrawColor(Buyskin_TD[45], -1);
TextDrawSetShadow(Buyskin_TD[45], 0);
TextDrawSetOutline(Buyskin_TD[45], 0);
TextDrawBackgroundColor(Buyskin_TD[45], 0);
TextDrawFont(Buyskin_TD[45], 5);
TextDrawSetProportional(Buyskin_TD[45], 0);
TextDrawSetShadow(Buyskin_TD[45], 0);
TextDrawSetPreviewModel(Buyskin_TD[45], 20013);
TextDrawSetPreviewRot(Buyskin_TD[45], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[46] = TextDrawCreate(281.099304, 146.383255, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[46], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[46], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[46], 1);
TextDrawColor(Buyskin_TD[46], -1);
TextDrawSetShadow(Buyskin_TD[46], 0);
TextDrawSetOutline(Buyskin_TD[46], 0);
TextDrawBackgroundColor(Buyskin_TD[46], 0);
TextDrawFont(Buyskin_TD[46], 5);
TextDrawSetProportional(Buyskin_TD[46], 0);
TextDrawSetShadow(Buyskin_TD[46], 0);
TextDrawSetPreviewModel(Buyskin_TD[46], 20014);
TextDrawSetPreviewRot(Buyskin_TD[46], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[47] = TextDrawCreate(347.098297, 145.983261, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[47], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[47], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[47], 1);
TextDrawColor(Buyskin_TD[47], -1);
TextDrawSetShadow(Buyskin_TD[47], 0);
TextDrawSetOutline(Buyskin_TD[47], 0);
TextDrawBackgroundColor(Buyskin_TD[47], 0);
TextDrawFont(Buyskin_TD[47], 5);
TextDrawSetProportional(Buyskin_TD[47], 0);
TextDrawSetShadow(Buyskin_TD[47], 0);
TextDrawSetPreviewModel(Buyskin_TD[47], 2);
TextDrawSetPreviewRot(Buyskin_TD[47], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[48] = TextDrawCreate(411.897308, 145.983261, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[48], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[48], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[48], 1);
TextDrawColor(Buyskin_TD[48], -1);
TextDrawSetShadow(Buyskin_TD[48], 0);
TextDrawSetOutline(Buyskin_TD[48], 0);
TextDrawBackgroundColor(Buyskin_TD[48], 0);
TextDrawFont(Buyskin_TD[48], 5);
TextDrawSetProportional(Buyskin_TD[48], 0);
TextDrawSetShadow(Buyskin_TD[48], 0);
TextDrawSetPreviewModel(Buyskin_TD[48], 3);
TextDrawSetPreviewRot(Buyskin_TD[48], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[49] = TextDrawCreate(150.632598, 224.815368, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[49], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[49], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[49], 1);
TextDrawColor(Buyskin_TD[49], -1);
TextDrawSetShadow(Buyskin_TD[49], 0);
TextDrawSetOutline(Buyskin_TD[49], 0);
TextDrawBackgroundColor(Buyskin_TD[49], 0);
TextDrawFont(Buyskin_TD[49], 5);
TextDrawSetProportional(Buyskin_TD[49], 0);
TextDrawSetShadow(Buyskin_TD[49], 0);
TextDrawSetPreviewModel(Buyskin_TD[49], 4);
TextDrawSetPreviewRot(Buyskin_TD[49], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[50] = TextDrawCreate(215.900131, 222.815399, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[50], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[50], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[50], 1);
TextDrawColor(Buyskin_TD[50], -1);
TextDrawSetShadow(Buyskin_TD[50], 0);
TextDrawSetOutline(Buyskin_TD[50], 0);
TextDrawBackgroundColor(Buyskin_TD[50], 0);
TextDrawFont(Buyskin_TD[50], 5);
TextDrawSetProportional(Buyskin_TD[50], 0);
TextDrawSetShadow(Buyskin_TD[50], 0);
TextDrawSetPreviewModel(Buyskin_TD[50], 5);
TextDrawSetPreviewRot(Buyskin_TD[50], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[51] = TextDrawCreate(280.299163, 222.815399, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[51], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[51], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[51], 1);
TextDrawColor(Buyskin_TD[51], -1);
TextDrawSetShadow(Buyskin_TD[51], 0);
TextDrawSetOutline(Buyskin_TD[51], 0);
TextDrawBackgroundColor(Buyskin_TD[51], 0);
TextDrawFont(Buyskin_TD[51], 5);
TextDrawSetProportional(Buyskin_TD[51], 0);
TextDrawSetShadow(Buyskin_TD[51], 0);
TextDrawSetPreviewModel(Buyskin_TD[51], 6);
TextDrawSetPreviewRot(Buyskin_TD[51], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[52] = TextDrawCreate(347.098144, 222.815399, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[52], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[52], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[52], 1);
TextDrawColor(Buyskin_TD[52], -1);
TextDrawSetShadow(Buyskin_TD[52], 0);
TextDrawSetOutline(Buyskin_TD[52], 0);
TextDrawBackgroundColor(Buyskin_TD[52], 0);
TextDrawFont(Buyskin_TD[52], 5);
TextDrawSetProportional(Buyskin_TD[52], 0);
TextDrawSetShadow(Buyskin_TD[52], 0);
TextDrawSetPreviewModel(Buyskin_TD[52], 7);
TextDrawSetPreviewRot(Buyskin_TD[52], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[53] = TextDrawCreate(411.497161, 222.815399, ""); // skin trang 2
TextDrawLetterSize(Buyskin_TD[53], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[53], 66.000000, 53.000000);
TextDrawAlignment(Buyskin_TD[53], 1);
TextDrawColor(Buyskin_TD[53], -1);
TextDrawSetShadow(Buyskin_TD[53], 0);
TextDrawSetOutline(Buyskin_TD[53], 0);
TextDrawBackgroundColor(Buyskin_TD[53], 0);
TextDrawFont(Buyskin_TD[53], 5);
TextDrawSetProportional(Buyskin_TD[53], 0);
TextDrawSetShadow(Buyskin_TD[53], 0);
TextDrawSetPreviewModel(Buyskin_TD[53], 8);
TextDrawSetPreviewRot(Buyskin_TD[53], 0.000000, 0.000000, 0.000000, 1.000000);

Buyskin_TD[54] = TextDrawCreate(167.873626, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[54], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[54], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[54], 1);
TextDrawColor(Buyskin_TD[54], 16777215);
TextDrawSetShadow(Buyskin_TD[54], 0);
TextDrawSetOutline(Buyskin_TD[54], 0);
TextDrawBackgroundColor(Buyskin_TD[54], 255);
TextDrawFont(Buyskin_TD[54], 4);
TextDrawSetProportional(Buyskin_TD[54], 0);
TextDrawSetShadow(Buyskin_TD[54], 0);
TextDrawSetSelectable(Buyskin_TD[54], true);

Buyskin_TD[55] = TextDrawCreate(232.573944, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[55], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[55], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[55], 1);
TextDrawColor(Buyskin_TD[55], 16777215);
TextDrawSetShadow(Buyskin_TD[55], 0);
TextDrawSetOutline(Buyskin_TD[55], 0);
TextDrawBackgroundColor(Buyskin_TD[55], 255);
TextDrawFont(Buyskin_TD[55], 4);
TextDrawSetProportional(Buyskin_TD[55], 0);
TextDrawSetShadow(Buyskin_TD[55], 0);
TextDrawSetSelectable(Buyskin_TD[55], true);

Buyskin_TD[56] = TextDrawCreate(298.574615, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[56], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[56], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[56], 1);
TextDrawColor(Buyskin_TD[56], 16777215);
TextDrawSetShadow(Buyskin_TD[56], 0);
TextDrawSetOutline(Buyskin_TD[56], 0);
TextDrawBackgroundColor(Buyskin_TD[56], 255);
TextDrawFont(Buyskin_TD[56], 4);
TextDrawSetProportional(Buyskin_TD[56], 0);
TextDrawSetShadow(Buyskin_TD[56], 0);
TextDrawSetSelectable(Buyskin_TD[56], true);

Buyskin_TD[57] = TextDrawCreate(365.775299, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[57], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[57], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[57], 1);
TextDrawColor(Buyskin_TD[57], 16777215);
TextDrawSetShadow(Buyskin_TD[57], 0);
TextDrawSetOutline(Buyskin_TD[57], 0);
TextDrawBackgroundColor(Buyskin_TD[57], 255);
TextDrawFont(Buyskin_TD[57], 4);
TextDrawSetProportional(Buyskin_TD[57], 0);
TextDrawSetShadow(Buyskin_TD[57], 0);
TextDrawSetSelectable(Buyskin_TD[57], true);

Buyskin_TD[58] = TextDrawCreate(429.975952, 199.267028, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[58], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[58], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[58], 1);
TextDrawColor(Buyskin_TD[58], 16777215);
TextDrawSetShadow(Buyskin_TD[58], 0);
TextDrawSetOutline(Buyskin_TD[58], 0);
TextDrawBackgroundColor(Buyskin_TD[58], 255);
TextDrawFont(Buyskin_TD[58], 4);
TextDrawSetProportional(Buyskin_TD[58], 0);
TextDrawSetShadow(Buyskin_TD[58], 0);
TextDrawSetSelectable(Buyskin_TD[58], true);

Buyskin_TD[59] = TextDrawCreate(168.175811, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[59], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[59], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[59], 1);
TextDrawColor(Buyskin_TD[59], 16777215);
TextDrawSetShadow(Buyskin_TD[59], 0);
TextDrawSetOutline(Buyskin_TD[59], 0);
TextDrawBackgroundColor(Buyskin_TD[59], 255);
TextDrawFont(Buyskin_TD[59], 4);
TextDrawSetProportional(Buyskin_TD[59], 0);
TextDrawSetShadow(Buyskin_TD[59], 0);
TextDrawSetSelectable(Buyskin_TD[59], true);

Buyskin_TD[60] = TextDrawCreate(233.975524, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[60], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[60], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[60], 1);
TextDrawColor(Buyskin_TD[60], 16777215);
TextDrawSetShadow(Buyskin_TD[60], 0);
TextDrawSetOutline(Buyskin_TD[60], 0);
TextDrawBackgroundColor(Buyskin_TD[60], 255);
TextDrawFont(Buyskin_TD[60], 4);
TextDrawSetProportional(Buyskin_TD[60], 0);
TextDrawSetShadow(Buyskin_TD[60], 0);
TextDrawSetSelectable(Buyskin_TD[60], true);

Buyskin_TD[61] = TextDrawCreate(298.375244, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[61], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[61], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[61], 1);
TextDrawColor(Buyskin_TD[61], 16777215);
TextDrawSetShadow(Buyskin_TD[61], 0);
TextDrawSetOutline(Buyskin_TD[61], 0);
TextDrawBackgroundColor(Buyskin_TD[61], 255);
TextDrawFont(Buyskin_TD[61], 4);
TextDrawSetProportional(Buyskin_TD[61], 0);
TextDrawSetShadow(Buyskin_TD[61], 0);
TextDrawSetSelectable(Buyskin_TD[61], true);

Buyskin_TD[62] = TextDrawCreate(364.174957, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[62], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[62], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[62], 1);
TextDrawColor(Buyskin_TD[62], 16777215);
TextDrawSetShadow(Buyskin_TD[62], 0);
TextDrawSetOutline(Buyskin_TD[62], 0);
TextDrawBackgroundColor(Buyskin_TD[62], 255);
TextDrawFont(Buyskin_TD[62], 4);
TextDrawSetProportional(Buyskin_TD[62], 0);
TextDrawSetShadow(Buyskin_TD[62], 0);
TextDrawSetSelectable(Buyskin_TD[62], true);

Buyskin_TD[63] = TextDrawCreate(429.974670, 278.067260, "mdl-2004:button_info");
TextDrawLetterSize(Buyskin_TD[63], 0.000000, 0.000000);
TextDrawTextSize(Buyskin_TD[63], 33.000000, 12.000000);
TextDrawAlignment(Buyskin_TD[63], 1);
TextDrawColor(Buyskin_TD[63], 16777215);
TextDrawSetShadow(Buyskin_TD[63], 0);
TextDrawSetOutline(Buyskin_TD[63], 0);
TextDrawBackgroundColor(Buyskin_TD[63], 255);
TextDrawFont(Buyskin_TD[63], 4);
TextDrawSetProportional(Buyskin_TD[63], 0);
TextDrawSetShadow(Buyskin_TD[63], 0);
TextDrawSetSelectable(Buyskin_TD[63], true);
	//
	Nguoivc_TD[0] = TextDrawCreate(185.051254, 138.666656, "Cac ban /map va den NPC xin viec, job nay ban can co 1 chiec xe rieng, ban len xe va /batdaulamviec roi den checkpoint.");
	TextDrawLetterSize(Nguoivc_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Nguoivc_TD[0], 444.000000, 0.000000);
	TextDrawAlignment(Nguoivc_TD[0], 1);
	TextDrawColor(Nguoivc_TD[0], -1);
	TextDrawSetShadow(Nguoivc_TD[0], 0);
	TextDrawBackgroundColor(Nguoivc_TD[0], 255);
	TextDrawFont(Nguoivc_TD[0], 1);
	TextDrawSetProportional(Nguoivc_TD[0], 1);
	//
	Khoangsan_TD[0] = TextDrawCreate(174.275268, 139.250030, "/map xinviec>layxe>den checkpoint>dao da[Y]>chat da len xe[Y]>/map che bien>/layda roi /chebien ra tv check.");
	TextDrawLetterSize(Khoangsan_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Khoangsan_TD[0], 395.000000, 0.000000);
	TextDrawAlignment(Khoangsan_TD[0], 1);
	TextDrawColor(Khoangsan_TD[0], -1);
	TextDrawSetShadow(Khoangsan_TD[0], 0);
	TextDrawBackgroundColor(Khoangsan_TD[0], 255);
	TextDrawFont(Khoangsan_TD[0], 1);
	TextDrawSetProportional(Khoangsan_TD[0], 1);
		//
	Trucker_TD[0] = TextDrawCreate(174.275268, 138.666702, "/map den  NPC xin viec , den Icon hinh banh xe va thue xe.Den lay hang [Y] va chat len xe, du 5/5 /giaohang den checkpoint.");
	TextDrawLetterSize(Trucker_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Trucker_TD[0], 459.000000, 0.000000);
	TextDrawAlignment(Trucker_TD[0], 1);
	TextDrawColor(Trucker_TD[0], -1);
	TextDrawSetShadow(Trucker_TD[0], 0);
	TextDrawBackgroundColor(Trucker_TD[0], 255);
	TextDrawFont(Trucker_TD[0], 1);
	TextDrawSetProportional(Trucker_TD[0], 1);
	//
	Pizza_TD[0] = TextDrawCreate(185.051254, 138.666656, "Cac ban /map den NPC va xin viec.       Tiep den ra NPC truoc tiem Pizza lay do va xe.");
	TextDrawLetterSize(Pizza_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Pizza_TD[0], 456.000000, 0.000000);
	TextDrawAlignment(Pizza_TD[0], 1);
	TextDrawColor(Pizza_TD[0], -1);
	TextDrawSetShadow(Pizza_TD[0], 0);
	TextDrawBackgroundColor(Pizza_TD[0], 255);
	TextDrawFont(Pizza_TD[0], 1);
	TextDrawSetProportional(Pizza_TD[0], 1);

	Pizza_TD[1] = TextDrawCreate(185.051254, 182.416625, "Sau do lay banh va nhan Y de chat banh len xe, du 3/3 cai thi /batdaugiaobanh .");
	TextDrawLetterSize(Pizza_TD[1], 0.400000, 1.600000);
	TextDrawTextSize(Pizza_TD[1], 452.000000, 0.000000);
	TextDrawAlignment(Pizza_TD[1], 1);
	TextDrawColor(Pizza_TD[1], -1);
	TextDrawSetShadow(Pizza_TD[1], 0);
	TextDrawBackgroundColor(Pizza_TD[1], 255);
	TextDrawFont(Pizza_TD[1], 1);
	TextDrawSetProportional(Pizza_TD[1], 1);
	//
	Danhca_TD[0] = TextDrawCreate(185.051254, 138.666656, "Goi Taxi va di den khu vuc thuyen danh ca, len thuyen va /map tiem den diem danh ca roi /thaluoi.");
	TextDrawLetterSize(Danhca_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Danhca_TD[0], 444.000000, 0.000000);
	TextDrawAlignment(Danhca_TD[0], 1);
	TextDrawColor(Danhca_TD[0], -1);
	TextDrawSetShadow(Danhca_TD[0], 0);
	TextDrawBackgroundColor(Danhca_TD[0], 255);
	TextDrawFont(Danhca_TD[0], 1);
	TextDrawSetProportional(Danhca_TD[0], 1);
	//
	Tieuthu_TD[0] = TextDrawCreate(185.051254, 138.666656, "Cac ban /map va den NPC , /work va di den nhung cai cay /cuacay roi vo chay lai checkpoint.");
	TextDrawLetterSize(Tieuthu_TD[0], 0.400000, 1.600000);
	TextDrawTextSize(Tieuthu_TD[0], 444.000000, 0.000000);
	TextDrawAlignment(Tieuthu_TD[0], 1);
	TextDrawColor(Tieuthu_TD[0], -1);
	TextDrawSetShadow(Tieuthu_TD[0], 0);
	TextDrawBackgroundColor(Tieuthu_TD[0], 255);
	TextDrawFont(Tieuthu_TD[0], 1);
	TextDrawSetProportional(Tieuthu_TD[0], 1);
	
	//trangthai
	Notifix[0] = TextDrawCreate(274.000000, 336.662506, "Dang_Sua_Chua...");
	TextDrawLetterSize(Notifix[0], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[0], 1);
	TextDrawColor(Notifix[0], -1);
	TextDrawSetShadow(Notifix[0], 0);
	TextDrawSetOutline(Notifix[0], -1);
	TextDrawBackgroundColor(Notifix[0], 255);
	TextDrawFont(Notifix[0], 1);
	TextDrawSetProportional(Notifix[0], 1);
	TextDrawSetShadow(Notifix[0], 0);

	Notifix[1] = TextDrawCreate(274.000000, 336.662506, "Dang Thuc Hien");
	TextDrawLetterSize(Notifix[1], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[1], 1);
	TextDrawColor(Notifix[1], -1);
	TextDrawSetShadow(Notifix[1], 0);
	TextDrawSetOutline(Notifix[1], -1);
	TextDrawBackgroundColor(Notifix[1], 255);
	TextDrawFont(Notifix[1], 1);
	TextDrawSetProportional(Notifix[1], 1);
	TextDrawSetShadow(Notifix[1], 0);

	Notifix[2] = TextDrawCreate(274.000000, 336.662506, "Nhan (Y) de lay banh");
	TextDrawLetterSize(Notifix[2], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[2], 1);
	TextDrawColor(Notifix[2], -1);
	TextDrawSetShadow(Notifix[2], 0);
	TextDrawSetOutline(Notifix[2], -1);
	TextDrawBackgroundColor(Notifix[2], 255);
	TextDrawFont(Notifix[2], 1);
	TextDrawSetProportional(Notifix[2], 1);
	TextDrawSetShadow(Notifix[2], 0);

	Notifix[3] = TextDrawCreate(274.000000, 336.662506, "Vui long cho.....");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	Notifix[4] = TextDrawCreate(274.000000, 336.662506, "Da lay hang thanh cong");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	Notifix[5] = TextDrawCreate(274.000000, 336.662506, "Ban rinh thung hang");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	Notifix[6] = TextDrawCreate(274.000000, 336.662506, "Mua hang thanh cong");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	Notifix[7] = TextDrawCreate(274.000000, 336.662506, "Da khoa cua");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	Notifix[8] = TextDrawCreate(274.000000, 336.662506, "Da mo cua");
	TextDrawLetterSize(Notifix[3], 0.400000, 1.600000);
	TextDrawAlignment(Notifix[3], 1);
	TextDrawColor(Notifix[3], -1);
	TextDrawSetShadow(Notifix[3], 0);
	TextDrawSetOutline(Notifix[3], -1);
	TextDrawBackgroundColor(Notifix[3], 255);
	TextDrawFont(Notifix[3], 1);
	TextDrawSetProportional(Notifix[3], 1);
	TextDrawSetShadow(Notifix[3], 0);

	// Blindfold
	BFText = TextDrawCreate(0.000000, -3.000000, " ");
	TextDrawBackgroundColor(BFText, 255);
	TextDrawFont(BFText, 1);
	TextDrawLetterSize(BFText, 50.000000, 50.000000);
	TextDrawColor(BFText, 0x000000FF);
	TextDrawSetOutline(BFText, 0);
	TextDrawSetProportional(BFText, 1);
	TextDrawSetShadow(BFText, 1);
	TextDrawUseBox(BFText, 1);
	TextDrawBoxColor(BFText, 0x000000FF);
	TextDrawTextSize(BFText, 689.000000, -53.000000);

	// WristWatch
	WristWatch = TextDrawCreate(577.000000, 50.000000, " ");
	TextDrawAlignment(WristWatch, 2);
	TextDrawBackgroundColor(WristWatch, 255);
	TextDrawFont(WristWatch, 3);
	TextDrawLetterSize(WristWatch, 0.709998, 2.100001);
	TextDrawColor(WristWatch, -1);
	TextDrawSetOutline(WristWatch, 1);
	TextDrawSetProportional(WristWatch, 0);
	textdrawscount++;
	
	/*
	// Bottom Box 1
	MainMenuTxtdraw[0] = TextDrawCreate(-1.000000, 342.000000, "BottomBox1");
	TextDrawBackgroundColor(MainMenuTxtdraw[0], 0);
	TextDrawFont(MainMenuTxtdraw[0], 1);
	TextDrawLetterSize(MainMenuTxtdraw[0], 0.839999, 11.600002);
	TextDrawColor(MainMenuTxtdraw[0], 0);
	TextDrawSetOutline(MainMenuTxtdraw[0], 0);
	TextDrawSetProportional(MainMenuTxtdraw[0], 1);
	TextDrawSetShadow(MainMenuTxtdraw[0], 1);
	TextDrawUseBox(MainMenuTxtdraw[0], 1);
	TextDrawBoxColor(MainMenuTxtdraw[0], 255);
	TextDrawTextSize(MainMenuTxtdraw[0], 677.000000, 134.000000);
	textdrawscount++;

	// Top Box 1
	MainMenuTxtdraw[1] = TextDrawCreate(-10.000000, -18.000000, "TopBox1");
	TextDrawBackgroundColor(MainMenuTxtdraw[1], 0);
	TextDrawFont(MainMenuTxtdraw[1], 1);
	TextDrawLetterSize(MainMenuTxtdraw[1], 0.500000, 13.000000);
	TextDrawColor(MainMenuTxtdraw[1], 0);
	TextDrawSetOutline(MainMenuTxtdraw[1], 0);
	TextDrawSetProportional(MainMenuTxtdraw[1], 1);
	TextDrawSetShadow(MainMenuTxtdraw[1], 1);
	TextDrawUseBox(MainMenuTxtdraw[1], 1);
	TextDrawBoxColor(MainMenuTxtdraw[1], 255);
	TextDrawTextSize(MainMenuTxtdraw[1], 770.000000, 0.000000);
	textdrawscount++;

	// Bottom Box 2
	MainMenuTxtdraw[2] = TextDrawCreate(-1.000000, 342.000000, "BottomBox2");
	TextDrawBackgroundColor(MainMenuTxtdraw[2], 0);
	TextDrawFont(MainMenuTxtdraw[2], 1);
	TextDrawLetterSize(MainMenuTxtdraw[2], 0.839999, -0.799999);
	TextDrawColor(MainMenuTxtdraw[2], 0);
	TextDrawSetOutline(MainMenuTxtdraw[2], 0);
	TextDrawSetProportional(MainMenuTxtdraw[2], 1);
	TextDrawSetShadow(MainMenuTxtdraw[2], 1);
	TextDrawUseBox(MainMenuTxtdraw[2], 1);
	TextDrawBoxColor(MainMenuTxtdraw[2], 6730751);
	TextDrawTextSize(MainMenuTxtdraw[2], 677.000000, 131.000000);
	textdrawscount++;

	// Top Box 1
	MainMenuTxtdraw[3] = TextDrawCreate(-10.000000, 102.000000, "TopBox1");
	TextDrawBackgroundColor(MainMenuTxtdraw[3], 6730751);
	TextDrawFont(MainMenuTxtdraw[3], 1);
	TextDrawLetterSize(MainMenuTxtdraw[3], 0.500000, 0.199999);
	TextDrawColor(MainMenuTxtdraw[3], 0);
	TextDrawSetOutline(MainMenuTxtdraw[3], 0);
	TextDrawSetProportional(MainMenuTxtdraw[3], 1);
	TextDrawSetShadow(MainMenuTxtdraw[3], 1);
	TextDrawUseBox(MainMenuTxtdraw[3], 1);
	TextDrawBoxColor(MainMenuTxtdraw[3], 6730751);
	TextDrawTextSize(MainMenuTxtdraw[3], 770.000000, 138.000000);
	textdrawscount++;*/

	/*// NG-RP Title
	MainMenuTxtdraw[4] = TextDrawCreate(263.000000, 10.000000, "Beta : 0.1");
	TextDrawBackgroundColor(MainMenuTxtdraw[4], 255);
	TextDrawFont(MainMenuTxtdraw[4], 2);
	TextDrawLetterSize(MainMenuTxtdraw[4], 0.910000, 4.400001);
 	TextDrawColor(MainMenuTxtdraw[4], -1);
	TextDrawSetOutline(MainMenuTxtdraw[4], 0);
	TextDrawSetProportional(MainMenuTxtdraw[4], 1);
	TextDrawSetShadow(MainMenuTxtdraw[4], 1);
	textdrawscount++;

	// NG-RP Subtitle
	MainMenuTxtdraw[5] = TextDrawCreate(256.000000, 45.000000, "");
	TextDrawBackgroundColor(MainMenuTxtdraw[5], 255);
	TextDrawFont(MainMenuTxtdraw[5], 2);
	TextDrawLetterSize(MainMenuTxtdraw[5], 0.200000, 1.200001);
	TextDrawColor(MainMenuTxtdraw[5], -1);
	TextDrawSetOutline(MainMenuTxtdraw[5], 0);
	TextDrawSetProportional(MainMenuTxtdraw[5], 1);
	TextDrawSetShadow(MainMenuTxtdraw[5], 1);
	textdrawscount++;

	// NG-RP Version
	MainMenuTxtdraw[6] = TextDrawCreate(283.000000, 58.000000, SERVER_GM_TEXT);
	TextDrawBackgroundColor(MainMenuTxtdraw[6], 255);
	TextDrawFont(MainMenuTxtdraw[6], 2);
	TextDrawLetterSize(MainMenuTxtdraw[6], 0.200000, 1.200001);
	TextDrawColor(MainMenuTxtdraw[6], -65281);
	TextDrawSetOutline(MainMenuTxtdraw[6], 0);
	TextDrawSetProportional(MainMenuTxtdraw[6], 1);
	TextDrawSetShadow(MainMenuTxtdraw[6], 1);
	textdrawscount++;*/
	  
	// NG-RP Tooltips
	MainMenuTxtdraw[7] = TextDrawCreate(319.000000, 391.000000, Tooltips[random(sizeof(Tooltips))]);
	TextDrawAlignment(MainMenuTxtdraw[7], 2);
	TextDrawBackgroundColor(MainMenuTxtdraw[7], 255);
	TextDrawFont(MainMenuTxtdraw[7], 2);
	TextDrawLetterSize(MainMenuTxtdraw[7], 0.250000, 1.600000);
	TextDrawColor(MainMenuTxtdraw[7], -1);
	TextDrawSetOutline(MainMenuTxtdraw[7], 0);
	TextDrawSetProportional(MainMenuTxtdraw[7], 1);
	TextDrawSetShadow(MainMenuTxtdraw[7], 1);
	textdrawscount++;

	// Server Stats Bar
	MainMenuTxtdraw[8] = TextDrawCreate(319.000000, 421.000000, " ");
	TextDrawAlignment(MainMenuTxtdraw[8], 2);
	TextDrawBackgroundColor(MainMenuTxtdraw[8], 255);
	TextDrawFont(MainMenuTxtdraw[8], 1);
	TextDrawLetterSize(MainMenuTxtdraw[8], 0.189998, 1.100000);
	TextDrawColor(MainMenuTxtdraw[8], -1);
	TextDrawSetOutline(MainMenuTxtdraw[8], 0);
	TextDrawSetProportional(MainMenuTxtdraw[8], 1);
	TextDrawSetShadow(MainMenuTxtdraw[8], 1);
	textdrawscount++;

	// MOTD
	MainMenuTxtdraw[9] = TextDrawCreate(319.000000, 364.000000, " ");
	TextDrawAlignment(MainMenuTxtdraw[9], 2);
	TextDrawBackgroundColor(MainMenuTxtdraw[9], 65535);
	TextDrawFont(MainMenuTxtdraw[9], 1);
	TextDrawLetterSize(MainMenuTxtdraw[9], 0.229999, 1.400000);
	TextDrawColor(MainMenuTxtdraw[9], -1);
	TextDrawSetOutline(MainMenuTxtdraw[9], 0);
	TextDrawSetProportional(MainMenuTxtdraw[9], 1);
	TextDrawSetShadow(MainMenuTxtdraw[9], 0);
	textdrawscount++;

	MainMenuTxtdraw[10] = TextDrawCreate(319.000000, 81.000000, "");
	TextDrawAlignment(MainMenuTxtdraw[10], 2);
	TextDrawBackgroundColor(MainMenuTxtdraw[10], 255);
	TextDrawFont(MainMenuTxtdraw[10], 0);
	TextDrawLetterSize(MainMenuTxtdraw[10], 0.230000, 1.200000);
	TextDrawColor(MainMenuTxtdraw[10], -1);
	TextDrawSetOutline(MainMenuTxtdraw[10], 0);
	TextDrawSetProportional(MainMenuTxtdraw[10], 1);
	TextDrawSetShadow(MainMenuTxtdraw[10], 1);
	textdrawscount++;

	MainMenuTxtdraw[11] = TextDrawCreate(0.000000, 119.000000, "ShadowBox");
	TextDrawBackgroundColor(MainMenuTxtdraw[11], 0);
	TextDrawFont(MainMenuTxtdraw[11], 1);
	TextDrawLetterSize(MainMenuTxtdraw[11], 0.889999, 22.500005);
	TextDrawColor(MainMenuTxtdraw[11], 0);
	TextDrawSetOutline(MainMenuTxtdraw[11], 0);
	TextDrawSetProportional(MainMenuTxtdraw[11], 1);
	TextDrawSetShadow(MainMenuTxtdraw[11], 1);
	TextDrawUseBox(MainMenuTxtdraw[11], 1);
	TextDrawBoxColor(MainMenuTxtdraw[11], 75);
	TextDrawTextSize(MainMenuTxtdraw[11], 658.000000, 56.000000);
	textdrawscount++;

	// Notice Box
	NoticeTxtdraw[0] = TextDrawCreate(174.000000, 181.000000, "Box");
	TextDrawBackgroundColor(NoticeTxtdraw[0], 0);
	TextDrawFont(NoticeTxtdraw[0], 1);
	TextDrawLetterSize(NoticeTxtdraw[0], 1.590000, 7.700005);
	TextDrawColor(NoticeTxtdraw[0], 0);
	TextDrawSetOutline(NoticeTxtdraw[0], 0);
	TextDrawSetProportional(NoticeTxtdraw[0], 1);
	TextDrawSetShadow(NoticeTxtdraw[0], 1);
	TextDrawUseBox(NoticeTxtdraw[0], 1);
	TextDrawBoxColor(NoticeTxtdraw[0], 100);
	TextDrawTextSize(NoticeTxtdraw[0], 454.000000, 18.000000);

	NoticeTxtdraw[1] = TextDrawCreate(317.000000, 174.000000, "GO-RP - Notice");
	TextDrawAlignment(NoticeTxtdraw[1], 2);
	TextDrawBackgroundColor(NoticeTxtdraw[1], 255);
	TextDrawFont(NoticeTxtdraw[1], 2);
	TextDrawLetterSize(NoticeTxtdraw[1], 0.189999, 1.200000);
	TextDrawColor(NoticeTxtdraw[1], -1);
	TextDrawSetOutline(NoticeTxtdraw[1], 1);
	TextDrawSetProportional(NoticeTxtdraw[1], 1);

	// Title
	NoticeTxtdraw[2] = TextDrawCreate(323.000000, 196.000000, " ");
	TextDrawAlignment(NoticeTxtdraw[2], 2);
	TextDrawBackgroundColor(NoticeTxtdraw[2], 255);
	TextDrawFont(NoticeTxtdraw[2], 2);
	TextDrawLetterSize(NoticeTxtdraw[2], 0.449999, 2.000000);
	//TextDrawLetterSize(NoticeTxtdraw[2], 0.529999, 2.800000);
	TextDrawColor(NoticeTxtdraw[2], -1);
	TextDrawSetOutline(NoticeTxtdraw[2], 1);
	TextDrawSetProportional(NoticeTxtdraw[2], 1);
	
	// Description.
	NoticeTxtdraw[3] = TextDrawCreate(322.000000, 221.000000, " ");
	TextDrawAlignment(NoticeTxtdraw[3], 2);
	TextDrawBackgroundColor(NoticeTxtdraw[3], 255);
	TextDrawFont(NoticeTxtdraw[3], 1);
	TextDrawLetterSize(NoticeTxtdraw[3], 0.189999, 1.200000);
	TextDrawColor(NoticeTxtdraw[3], -1);
	TextDrawSetOutline(NoticeTxtdraw[3], 1);
	TextDrawSetProportional(NoticeTxtdraw[3], 1);
	
	// Tutorial (Frame 1) (Title)
	TutTxtdraw[4] = TextDrawCreate(168.000000, 120.000000, "Huong dan - Chao muong den voi cong dong GTARP:ORG (Mobile)");
	TextDrawBackgroundColor(TutTxtdraw[4], 255);
	TextDrawFont(TutTxtdraw[4], 2);
	TextDrawLetterSize(TutTxtdraw[4], 0.209999, 1.000000);
	TextDrawColor(TutTxtdraw[4], -1);
	TextDrawSetOutline(TutTxtdraw[4], 0);
	TextDrawSetProportional(TutTxtdraw[4], 1);
	TextDrawSetShadow(TutTxtdraw[4], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 1)
	TutTxtdraw[5] = TextDrawCreate(175.000000, 141.000000, "Introductions! Welcome to Evolution Gaming Roleplay, SA-MP's most popular");
	TextDrawBackgroundColor(TutTxtdraw[5], 255);
	TextDrawFont(TutTxtdraw[5], 2);
	TextDrawLetterSize(TutTxtdraw[5], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[5], -1);
	TextDrawSetOutline(TutTxtdraw[5], 1);
	TextDrawSetProportional(TutTxtdraw[5], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 2)
	TutTxtdraw[6] = TextDrawCreate(175.000000, 151.000000, "English speaking server! Our community has been around for quite");
	TextDrawBackgroundColor(TutTxtdraw[6], 255);
	TextDrawFont(TutTxtdraw[6], 2);
	TextDrawLetterSize(TutTxtdraw[6], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[6], -1);
	TextDrawSetOutline(TutTxtdraw[6], 1);
	TextDrawSetProportional(TutTxtdraw[6], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 3)
	TutTxtdraw[7] = TextDrawCreate(175.000000, 161.000000, "some time now, and we are glad to have you with us!");
	TextDrawBackgroundColor(TutTxtdraw[7], 255);
	TextDrawFont(TutTxtdraw[7], 2);
	TextDrawLetterSize(TutTxtdraw[7], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[7], -1);
	TextDrawSetOutline(TutTxtdraw[7], 1);
	TextDrawSetProportional(TutTxtdraw[7], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 4)
	TutTxtdraw[8] = TextDrawCreate(175.000000, 193.000000, "You know, we are more than just a SA-MP community, so if you are interested");
	TextDrawBackgroundColor(TutTxtdraw[8], 255);
	TextDrawFont(TutTxtdraw[8], 2);
	TextDrawLetterSize(TutTxtdraw[8], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[8], -1);
	TextDrawSetOutline(TutTxtdraw[8], 1);
	TextDrawSetProportional(TutTxtdraw[8], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 5)
	TutTxtdraw[9] = TextDrawCreate(175.000000, 203.000000, "be sure to visit us and sign up on our forums at ~y~www.eg-rp.vn~w~ - we");
	TextDrawBackgroundColor(TutTxtdraw[9], 255);
	TextDrawFont(TutTxtdraw[9], 2);
	TextDrawLetterSize(TutTxtdraw[9], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[9], -1);
	TextDrawSetOutline(TutTxtdraw[9], 1);
	TextDrawSetProportional(TutTxtdraw[9], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 6)
	TutTxtdraw[10] = TextDrawCreate(175.000000, 214.000000, "will be waiting, be sure to invite your friends!");
	TextDrawBackgroundColor(TutTxtdraw[10], 255);
	TextDrawFont(TutTxtdraw[10], 2);
	TextDrawLetterSize(TutTxtdraw[10], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[10], -1);
	TextDrawSetOutline(TutTxtdraw[10], 1);
	TextDrawSetProportional(TutTxtdraw[10], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 7)
	TutTxtdraw[11] = TextDrawCreate(175.000000, 245.000000, "We also have a e-store with a bunch of useful items to purchase, be sure to");
	TextDrawBackgroundColor(TutTxtdraw[11], 255);
	TextDrawFont(TutTxtdraw[11], 2);
	TextDrawLetterSize(TutTxtdraw[11], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[11], -1);
	TextDrawSetOutline(TutTxtdraw[11], 1);
	TextDrawSetProportional(TutTxtdraw[11], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 8)
	TutTxtdraw[12] = TextDrawCreate(175.000000, 255.000000, "check it all out at ~y~eg-rp.vn~w~, it helps keep this server up and");
	TextDrawBackgroundColor(TutTxtdraw[12], 255);
	TextDrawFont(TutTxtdraw[12], 2);
	TextDrawLetterSize(TutTxtdraw[12], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[12], -1);
	TextDrawSetOutline(TutTxtdraw[12], 1);
	TextDrawSetProportional(TutTxtdraw[12], 1);
	textdrawscount++;

	// Tutorial (Frame 1) (Line 9)
	TutTxtdraw[13] = TextDrawCreate(175.000000, 265.000000, "running with all the prices of space, bandwidth and labor these days.");
	TextDrawBackgroundColor(TutTxtdraw[13], 255);
	TextDrawFont(TutTxtdraw[13], 2);
	TextDrawLetterSize(TutTxtdraw[13], 0.159999, 0.899999);
	TextDrawColor(TutTxtdraw[13], -1);
	TextDrawSetOutline(TutTxtdraw[13], 1);
	TextDrawSetProportional(TutTxtdraw[13], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Title)
	TutTxtdraw[14] = TextDrawCreate(168.000000, 120.000000, "Tutorial - How to make money!");
	TextDrawBackgroundColor(TutTxtdraw[14], 255);
	TextDrawFont(TutTxtdraw[14], 2);
	TextDrawLetterSize(TutTxtdraw[14], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[14], -1);
	TextDrawSetOutline(TutTxtdraw[14], 0);
	TextDrawSetProportional(TutTxtdraw[14], 1);
	TextDrawSetShadow(TutTxtdraw[14], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 1)
	TutTxtdraw[15] = TextDrawCreate(175.000000, 141.000000, "There are many jobs located around San Andreas, these are represented");
	TextDrawBackgroundColor(TutTxtdraw[15], 255);
	TextDrawFont(TutTxtdraw[15], 2);
	TextDrawLetterSize(TutTxtdraw[15], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[15], -1);
	TextDrawSetOutline(TutTxtdraw[15], 1);
	TextDrawSetProportional(TutTxtdraw[15], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 2)
	TutTxtdraw[16] = TextDrawCreate(175.000000, 151.000000, "by ~y~yellow~w~ information icons.");
	TextDrawBackgroundColor(TutTxtdraw[16], 255);
	TextDrawFont(TutTxtdraw[16], 2);
	TextDrawLetterSize(TutTxtdraw[16], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[16], -1);
	TextDrawSetOutline(TutTxtdraw[16], 1);
	TextDrawSetProportional(TutTxtdraw[16], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 3)
	TutTxtdraw[17] = TextDrawCreate(181.000000, 172.000000, "| You can ~g~/withdraw~w~ and ~g~/deposit~w~ money at the bank.");
	TextDrawBackgroundColor(TutTxtdraw[17], 255);
	TextDrawFont(TutTxtdraw[17], 2);
	TextDrawLetterSize(TutTxtdraw[17], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[17], -1);
	TextDrawSetOutline(TutTxtdraw[17], 1);
	TextDrawSetProportional(TutTxtdraw[17], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 4)
	TutTxtdraw[18] = TextDrawCreate(181.000000, 183.000000, "| You can ~g~/awithdraw~w~ and ~g~/adeposit~w~ cash at a ATM for a small fee.");
	TextDrawBackgroundColor(TutTxtdraw[18], 255);
	TextDrawFont(TutTxtdraw[18], 2);
	TextDrawLetterSize(TutTxtdraw[18], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[18], -1);
	TextDrawSetOutline(TutTxtdraw[18], 1);
	TextDrawSetProportional(TutTxtdraw[18], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 5)
	TutTxtdraw[19] = TextDrawCreate(181.000000, 195.000000, "| You can ~g~/fish~w~ in boats or at the pier for money.");
	TextDrawBackgroundColor(TutTxtdraw[19], 255);
	TextDrawFont(TutTxtdraw[19], 2);
	TextDrawLetterSize(TutTxtdraw[19], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[19], -1);
	TextDrawSetOutline(TutTxtdraw[19], 1);
	TextDrawSetProportional(TutTxtdraw[19], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 6)
	TutTxtdraw[20] = TextDrawCreate(181.000000, 207.000000, "| You can ~g~/guard~w~ people for money.");
	TextDrawBackgroundColor(TutTxtdraw[20], 255);
	TextDrawFont(TutTxtdraw[20], 2);
	TextDrawLetterSize(TutTxtdraw[20], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[20], -1);
	TextDrawSetOutline(TutTxtdraw[20], 1);
	TextDrawSetProportional(TutTxtdraw[20], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 7)
	TutTxtdraw[21] = TextDrawCreate(181.000000, 219.000000, "| You can ~g~/sellgun~w~ to people for money.");
	TextDrawBackgroundColor(TutTxtdraw[21], 255);
	TextDrawFont(TutTxtdraw[21], 2);
	TextDrawLetterSize(TutTxtdraw[21], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[21], -1);
	TextDrawSetOutline(TutTxtdraw[21], 1);
	TextDrawSetProportional(TutTxtdraw[21], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 8)
	TutTxtdraw[22] = TextDrawCreate(181.000000, 232.000000, "| You can ~g~/sellpot~w~ or ~g~/sellcrack~w~ to people for money.");
	TextDrawBackgroundColor(TutTxtdraw[22], 255);
	TextDrawFont(TutTxtdraw[22], 2);
	TextDrawLetterSize(TutTxtdraw[22], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[22], -1);
	TextDrawSetOutline(TutTxtdraw[22], 1);
	TextDrawSetProportional(TutTxtdraw[22], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 9)
	TutTxtdraw[23] = TextDrawCreate(181.000000, 244.000000, "| You can smuggle drugs with ~g~/getcrate~w~ to specific dens.");
	TextDrawBackgroundColor(TutTxtdraw[23], 255);
	TextDrawFont(TutTxtdraw[23], 2);
	TextDrawLetterSize(TutTxtdraw[23], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[23], -1);
	TextDrawSetOutline(TutTxtdraw[23], 1);
	TextDrawSetProportional(TutTxtdraw[23], 1);
	textdrawscount++;

	// Tutorial (Frame 2-9) (Line 10)
	TutTxtdraw[24] = TextDrawCreate(181.000000, 256.000000, "| You can ~g~/jobhelp~w~ for more!");
	TextDrawBackgroundColor(TutTxtdraw[24], 255);
	TextDrawFont(TutTxtdraw[24], 2);
	TextDrawLetterSize(TutTxtdraw[24], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[24], -1);
	TextDrawSetOutline(TutTxtdraw[24], 1);
	TextDrawSetProportional(TutTxtdraw[24], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Title)
	TutTxtdraw[25] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Law Enforcement");
	TextDrawBackgroundColor(TutTxtdraw[25], 255);
	TextDrawFont(TutTxtdraw[25], 2);
	TextDrawLetterSize(TutTxtdraw[25], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[25], -1);
	TextDrawSetOutline(TutTxtdraw[25], 0);
	TextDrawSetProportional(TutTxtdraw[25], 1);
	TextDrawSetShadow(TutTxtdraw[25], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 1)
	TutTxtdraw[26] = TextDrawCreate(175.000000, 141.000000, "There are currently 4+ ~b~Law Enforcement~w~ Factions. LSPD, SFPD, SASD and FBI.");
	TextDrawBackgroundColor(TutTxtdraw[26], 255);
	TextDrawFont(TutTxtdraw[26], 2);
	TextDrawLetterSize(TutTxtdraw[26], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[26], -1);
	TextDrawSetOutline(TutTxtdraw[26], 1);
	TextDrawSetProportional(TutTxtdraw[26], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 2)
	TutTxtdraw[27] = TextDrawCreate(175.000000, 151.000000, "If you cause trouble and break local laws, you may be arrested by one of");
	TextDrawBackgroundColor(TutTxtdraw[27], 255);
	TextDrawFont(TutTxtdraw[27], 2);
	TextDrawLetterSize(TutTxtdraw[27], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[27], -1);
	TextDrawSetOutline(TutTxtdraw[27], 1);
	TextDrawSetProportional(TutTxtdraw[27], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 3)
	TutTxtdraw[28] = TextDrawCreate(175.000000, 161.000000, "them. If you're wanting to become a part of these factions, apply on our");
	TextDrawBackgroundColor(TutTxtdraw[28], 255);
	TextDrawFont(TutTxtdraw[28], 2);
	TextDrawLetterSize(TutTxtdraw[28], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[28], -1);
	TextDrawSetOutline(TutTxtdraw[28], 1);
	TextDrawSetProportional(TutTxtdraw[28], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 4)
	TutTxtdraw[29] = TextDrawCreate(175.000000, 171.000000, "forums at ~y~www.forum.eg-rp.vn~w~.");
	TextDrawBackgroundColor(TutTxtdraw[29], 255);
	TextDrawFont(TutTxtdraw[29], 2);
	TextDrawLetterSize(TutTxtdraw[29], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[29], -1);
	TextDrawSetOutline(TutTxtdraw[29], 1);
	TextDrawSetProportional(TutTxtdraw[29], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 5)
	TutTxtdraw[30] = TextDrawCreate(181.000000, 196.000000, "| ~b~LSPD~w~ (Los Santos Police Department)");
	TextDrawBackgroundColor(TutTxtdraw[30], 255);
	TextDrawFont(TutTxtdraw[30], 2);
	TextDrawLetterSize(TutTxtdraw[30], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[30], -1);
	TextDrawSetOutline(TutTxtdraw[30], 1);
	TextDrawSetProportional(TutTxtdraw[30], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 6)
	TutTxtdraw[31] = TextDrawCreate(181.000000, 212.000000, "| ~h~~b~SFPD~w~ (San Fierro Police Department)");
	TextDrawBackgroundColor(TutTxtdraw[31], 255);
	TextDrawFont(TutTxtdraw[31], 2);
	TextDrawLetterSize(TutTxtdraw[31], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[31], -1);
	TextDrawSetOutline(TutTxtdraw[31], 1);
	TextDrawSetProportional(TutTxtdraw[31], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 7)
	TutTxtdraw[32] = TextDrawCreate(181.000000, 229.000000, "| ~y~SASD~w~ (San Andreas Sheriff's Department)");
	TextDrawBackgroundColor(TutTxtdraw[32], 255);
	TextDrawFont(TutTxtdraw[32], 2);
	TextDrawLetterSize(TutTxtdraw[32], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[32], -1);
	TextDrawSetOutline(TutTxtdraw[32], 1);
	TextDrawSetProportional(TutTxtdraw[32], 1);
	textdrawscount++;

	// Tutorial (Frame 10) (Line 8)
	TutTxtdraw[33] = TextDrawCreate(181.000000, 246.000000, "| ~b~FBI~w~ (Federal Bureau of Investigation)");
	TextDrawBackgroundColor(TutTxtdraw[33], 255);
	TextDrawFont(TutTxtdraw[33], 2);
	TextDrawLetterSize(TutTxtdraw[33], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[33], -1);
	TextDrawSetOutline(TutTxtdraw[33], 1);
	TextDrawSetProportional(TutTxtdraw[33], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Title)
	TutTxtdraw[34] = TextDrawCreate(168.000000, 120.000000, "Tutorial - San Andreas Fire/Medical Department");
	TextDrawBackgroundColor(TutTxtdraw[34], 255);
	TextDrawFont(TutTxtdraw[34], 2);
	TextDrawLetterSize(TutTxtdraw[34], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[34], -1);
	TextDrawSetOutline(TutTxtdraw[34], 0);
	TextDrawSetProportional(TutTxtdraw[34], 1);
	TextDrawSetShadow(TutTxtdraw[34], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Line 1)
	TutTxtdraw[35] = TextDrawCreate(175.000000, 141.000000, "If you so happen to get injured, You may use ~g~/service ems~w~ to call for");
	TextDrawBackgroundColor(TutTxtdraw[35], 255);
	TextDrawFont(TutTxtdraw[35], 2);
	TextDrawLetterSize(TutTxtdraw[35], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[35], -1);
	TextDrawSetOutline(TutTxtdraw[35], 1);
	TextDrawSetProportional(TutTxtdraw[35], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Line 2)
	TutTxtdraw[36] = TextDrawCreate(175.000000, 151.000000, "help. If the EMS saves you in time, you may keep your personal belongings,");
	TextDrawBackgroundColor(TutTxtdraw[36], 255);
	TextDrawFont(TutTxtdraw[36], 2);
	TextDrawLetterSize(TutTxtdraw[36], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[36], -1);
	TextDrawSetOutline(TutTxtdraw[36], 1);
	TextDrawSetProportional(TutTxtdraw[36], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Line 3)
	TutTxtdraw[37] = TextDrawCreate(175.000000, 161.000000, "without losing them. If you're wanting to become a part of this faction,");
	TextDrawBackgroundColor(TutTxtdraw[37], 255);
	TextDrawFont(TutTxtdraw[37], 2);
	TextDrawLetterSize(TutTxtdraw[37], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[37], -1);
	TextDrawSetOutline(TutTxtdraw[37], 1);
	TextDrawSetProportional(TutTxtdraw[37], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Line 4)
	TutTxtdraw[38] = TextDrawCreate(175.000000, 171.000000, "apply on our forums at ~y~www.forum.eg-rp.vn~w~.");
	TextDrawBackgroundColor(TutTxtdraw[38], 255);
	TextDrawFont(TutTxtdraw[38], 2);
	TextDrawLetterSize(TutTxtdraw[38], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[38], -1);
	TextDrawSetOutline(TutTxtdraw[38], 1);
	TextDrawSetProportional(TutTxtdraw[38], 1);
	textdrawscount++;

	// Tutorial (Frame 11) (Line 5)
	TutTxtdraw[39] = TextDrawCreate(175.000000, 204.000000, "If you want to report a emergency, purchase a cellphone and ~g~/call 911~w~");
	TextDrawBackgroundColor(TutTxtdraw[39], 255);
	TextDrawFont(TutTxtdraw[39], 2);
	TextDrawLetterSize(TutTxtdraw[39], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[39], -1);
	TextDrawSetOutline(TutTxtdraw[39], 1);
	TextDrawSetProportional(TutTxtdraw[39], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Title)
	TutTxtdraw[40] = TextDrawCreate(168.000000, 120.000000, "Tutorial - K-LSR");
	TextDrawBackgroundColor(TutTxtdraw[40], 255);
	TextDrawFont(TutTxtdraw[40], 2);
	TextDrawLetterSize(TutTxtdraw[40], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[40], -1);
	TextDrawSetOutline(TutTxtdraw[40], 0);
	TextDrawSetProportional(TutTxtdraw[40], 1);
	TextDrawSetShadow(TutTxtdraw[40], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Line 1)
	TutTxtdraw[41] = TextDrawCreate(175.000000, 141.000000, "There is a ~b~K-LSR~w~ faction, they handle all the news within San");
	TextDrawBackgroundColor(TutTxtdraw[41], 255);
	TextDrawFont(TutTxtdraw[41], 2);
	TextDrawLetterSize(TutTxtdraw[41], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[41], -1);
	TextDrawSetOutline(TutTxtdraw[41], 1);
	TextDrawSetProportional(TutTxtdraw[41], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Line 2)
	TutTxtdraw[42] = TextDrawCreate(175.000000, 151.000000, "Andreas. They report about anything from gang riots and government");
	TextDrawBackgroundColor(TutTxtdraw[42], 255);
	TextDrawFont(TutTxtdraw[42], 2);
	TextDrawLetterSize(TutTxtdraw[42], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[42], -1);
	TextDrawSetOutline(TutTxtdraw[42], 1);
	TextDrawSetProportional(TutTxtdraw[42], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Line 3)
	TutTxtdraw[43] = TextDrawCreate(175.000000, 161.000000, "corruption, right down to bank robberies. If you wish to become a part of");
	TextDrawBackgroundColor(TutTxtdraw[43], 255);
	TextDrawFont(TutTxtdraw[43], 2);
	TextDrawLetterSize(TutTxtdraw[43], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[43], -1);
	TextDrawSetOutline(TutTxtdraw[43], 1);
	TextDrawSetProportional(TutTxtdraw[43], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Line 4)
	TutTxtdraw[44] = TextDrawCreate(175.000000, 171.000000, "this faction, apply on our forums at ~y~www.forum.eg-rp.vn~w~.");
	TextDrawBackgroundColor(TutTxtdraw[44], 255);
	TextDrawFont(TutTxtdraw[44], 2);
	TextDrawLetterSize(TutTxtdraw[44], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[44], -1);
	TextDrawSetOutline(TutTxtdraw[44], 1);
	TextDrawSetProportional(TutTxtdraw[44], 1);
	textdrawscount++;

	// Tutorial (Frame 12) (Line 5)
	TutTxtdraw[45] = TextDrawCreate(175.000000, 204.000000, "If you want to sell items or advertise about a party, use ~g~/ads~w~.");
	TextDrawBackgroundColor(TutTxtdraw[45], 255);
	TextDrawFont(TutTxtdraw[45], 2);
	TextDrawLetterSize(TutTxtdraw[45], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[45], -1);
	TextDrawSetOutline(TutTxtdraw[45], 1);
	TextDrawSetProportional(TutTxtdraw[45], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Title)
	TutTxtdraw[46] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Government");
	TextDrawBackgroundColor(TutTxtdraw[46], 255);
	TextDrawFont(TutTxtdraw[46], 2);
	TextDrawLetterSize(TutTxtdraw[46], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[46], -1);
	TextDrawSetOutline(TutTxtdraw[46], 0);
	TextDrawSetProportional(TutTxtdraw[46], 1);
	TextDrawSetShadow(TutTxtdraw[46], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Line 1)
	TutTxtdraw[47] = TextDrawCreate(175.000000, 141.000000, "There is also a ~b~Government~w~ faction, they make all important decisions");
	TextDrawBackgroundColor(TutTxtdraw[47], 255);
	TextDrawFont(TutTxtdraw[47], 2);
	TextDrawLetterSize(TutTxtdraw[47], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[47], -1);
	TextDrawSetOutline(TutTxtdraw[47], 1);
	TextDrawSetProportional(TutTxtdraw[47], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Line 2)
	TutTxtdraw[48] = TextDrawCreate(175.000000, 151.000000, "within San Andreas. They make sure law is enforced in the judicial branch.");
	TextDrawBackgroundColor(TutTxtdraw[48], 255);
	TextDrawFont(TutTxtdraw[48], 2);
	TextDrawLetterSize(TutTxtdraw[48], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[48], -1);
	TextDrawSetOutline(TutTxtdraw[48], 1);
	TextDrawSetProportional(TutTxtdraw[48], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Line 3)
	TutTxtdraw[49] = TextDrawCreate(175.000000, 161.000000, "They also set taxes and pay wages. If you're wanting to become a part of");
	TextDrawBackgroundColor(TutTxtdraw[49], 255);
	TextDrawFont(TutTxtdraw[49], 2);
	TextDrawLetterSize(TutTxtdraw[49], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[49], -1);
	TextDrawSetOutline(TutTxtdraw[49], 1);
	TextDrawSetProportional(TutTxtdraw[49], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Line 4)
	TutTxtdraw[50] = TextDrawCreate(175.000000, 171.000000, "this faction, apply on our forums at ~y~forum.eg-rp.vn~w~.");
	TextDrawBackgroundColor(TutTxtdraw[50], 255);
	TextDrawFont(TutTxtdraw[50], 2);
	TextDrawLetterSize(TutTxtdraw[50], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[50], -1);
	TextDrawSetOutline(TutTxtdraw[50], 1);
	TextDrawSetProportional(TutTxtdraw[50], 1);
	textdrawscount++;

	// Tutorial (Frame 13) (Line 5)
	TutTxtdraw[51] = TextDrawCreate(175.000000, 204.000000, "If you'd like to donate your money, you may use ~g~/charity~w~.");
	TextDrawBackgroundColor(TutTxtdraw[51], 255);
	TextDrawFont(TutTxtdraw[51], 2);
	TextDrawLetterSize(TutTxtdraw[51], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[51], -1);
	TextDrawSetOutline(TutTxtdraw[51], 1);
	TextDrawSetProportional(TutTxtdraw[51], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Title)
	TutTxtdraw[52] = TextDrawCreate(168.000000, 120.000000, "Tutorial - The Nation of Tierra Robada");
	TextDrawBackgroundColor(TutTxtdraw[52], 255);
	TextDrawFont(TutTxtdraw[52], 2);
	TextDrawLetterSize(TutTxtdraw[52], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[52], -1);
	TextDrawSetOutline(TutTxtdraw[52], 0);
	TextDrawSetProportional(TutTxtdraw[52], 1);
	TextDrawSetShadow(TutTxtdraw[52], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Line 1)
	TutTxtdraw[53] = TextDrawCreate(175.000000, 141.000000, "~g~Tierra Robada~w~ is an alternate nation seperate from San Andreas.  They");
	TextDrawBackgroundColor(TutTxtdraw[53], 255);
	TextDrawFont(TutTxtdraw[53], 2);
	TextDrawLetterSize(TutTxtdraw[53], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[53], -1);
	TextDrawSetOutline(TutTxtdraw[53], 1);
	TextDrawSetProportional(TutTxtdraw[53], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Line 2)
	TutTxtdraw[54] = TextDrawCreate(175.000000, 151.000000, "have their own laws, law enforcement, government and medical divisions.");
	TextDrawBackgroundColor(TutTxtdraw[54], 255);
	TextDrawFont(TutTxtdraw[54], 2);
	TextDrawLetterSize(TutTxtdraw[54], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[54], -1);
	TextDrawSetOutline(TutTxtdraw[54], 1);
	TextDrawSetProportional(TutTxtdraw[54], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Line 3)
	TutTxtdraw[55] = TextDrawCreate(175.000000, 161.000000, "If you wish to become a part of this faction, apply on our forums");
	TextDrawBackgroundColor(TutTxtdraw[55], 255);
	TextDrawFont(TutTxtdraw[55], 2);
	TextDrawLetterSize(TutTxtdraw[55], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[55], -1);
	TextDrawSetOutline(TutTxtdraw[55], 1);
	TextDrawSetProportional(TutTxtdraw[55], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Line 4)
	TutTxtdraw[56] = TextDrawCreate(175.000000, 171.000000, "at ~y~www.fg-roleplay.com~w~.");
	TextDrawBackgroundColor(TutTxtdraw[56], 255);
	TextDrawFont(TutTxtdraw[56], 2);
	TextDrawLetterSize(TutTxtdraw[56], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[56], -1);
	TextDrawSetOutline(TutTxtdraw[56], 1);
	TextDrawSetProportional(TutTxtdraw[56], 1);
	textdrawscount++;

	// Tutorial (Frame 14) (Line 5)
	TutTxtdraw[57] = TextDrawCreate(175.000000, 204.000000, "Be sure to pay the toll when you visit from San Fierro!");
	TextDrawBackgroundColor(TutTxtdraw[57], 255);
	TextDrawFont(TutTxtdraw[57], 2);
	TextDrawLetterSize(TutTxtdraw[57], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[57], -1);
	TextDrawSetOutline(TutTxtdraw[57], 1);
	TextDrawSetProportional(TutTxtdraw[57], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Title)
	TutTxtdraw[58] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Gangs/Families");
	TextDrawBackgroundColor(TutTxtdraw[58], 255);
	TextDrawFont(TutTxtdraw[58], 2);
	TextDrawLetterSize(TutTxtdraw[58], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[58], -1);
	TextDrawSetOutline(TutTxtdraw[58], 0);
	TextDrawSetProportional(TutTxtdraw[58], 1);
	TextDrawSetShadow(TutTxtdraw[58], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 1)
	TutTxtdraw[59] = TextDrawCreate(175.000000, 141.000000, "San Andreas has several different crime related gangs/families to join.");
	TextDrawBackgroundColor(TutTxtdraw[59], 255);
	TextDrawFont(TutTxtdraw[59], 2);
	TextDrawLetterSize(TutTxtdraw[59], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[59], -1);
	TextDrawSetOutline(TutTxtdraw[59], 1);
	TextDrawSetProportional(TutTxtdraw[59], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 2)
	TutTxtdraw[60] = TextDrawCreate(175.000000, 151.000000, "Type ~g~/families~w~ to display a list of gangs. Type ~g~/families number~w~ to show");
	TextDrawBackgroundColor(TutTxtdraw[60], 255);
	TextDrawFont(TutTxtdraw[60], 2);
	TextDrawLetterSize(TutTxtdraw[60], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[60], -1);
	TextDrawSetOutline(TutTxtdraw[60], 1);
	TextDrawSetProportional(TutTxtdraw[60], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 3)
	TutTxtdraw[61] = TextDrawCreate(175.000000, 161.000000, "thier members. Gang members can take control of the weapons/fuel/drug");
	TextDrawBackgroundColor(TutTxtdraw[61], 255);
	TextDrawFont(TutTxtdraw[61], 2);
	TextDrawLetterSize(TutTxtdraw[61], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[61], -1);
	TextDrawSetOutline(TutTxtdraw[61], 1);
	TextDrawSetProportional(TutTxtdraw[61], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 4)
	TutTxtdraw[62] = TextDrawCreate(175.000000, 171.000000, "trade to earn quick cash. If you want to join a gang, be sure to roleplay");
	TextDrawBackgroundColor(TutTxtdraw[62], 255);
	TextDrawFont(TutTxtdraw[62], 2);
	TextDrawLetterSize(TutTxtdraw[62], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[62], -1);
	TextDrawSetOutline(TutTxtdraw[62], 1);
	TextDrawSetProportional(TutTxtdraw[62], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 5)
	TutTxtdraw[63] = TextDrawCreate(175.000000, 204.000000, "Type ~g~/turfs~w~ to disply the turf maps.");
	TextDrawBackgroundColor(TutTxtdraw[63], 255);
	TextDrawFont(TutTxtdraw[63], 2);
	TextDrawLetterSize(TutTxtdraw[63], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[63], -1);
	TextDrawSetOutline(TutTxtdraw[63], 1);
	TextDrawSetProportional(TutTxtdraw[63], 1);
	textdrawscount++;

	// Tutorial (Frame 15) (Line 6)
	TutTxtdraw[64] = TextDrawCreate(175.000000, 182.000000, "with their leaders, you might get your chance!");
	TextDrawBackgroundColor(TutTxtdraw[64], 255);
	TextDrawFont(TutTxtdraw[64], 2);
	TextDrawLetterSize(TutTxtdraw[64], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[64], -1);
	TextDrawSetOutline(TutTxtdraw[64], 1);
	TextDrawSetProportional(TutTxtdraw[64], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Title)
	TutTxtdraw[65] = TextDrawCreate(168.000000, 120.000000, "Tutorial - 24/7 General Store");
	TextDrawBackgroundColor(TutTxtdraw[65], 255);
	TextDrawFont(TutTxtdraw[65], 2);
	TextDrawLetterSize(TutTxtdraw[65], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[65], -1);
	TextDrawSetOutline(TutTxtdraw[65], 0);
	TextDrawSetProportional(TutTxtdraw[65], 1);
	TextDrawSetShadow(TutTxtdraw[65], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Line 1)
	TutTxtdraw[66] = TextDrawCreate(175.000000, 141.000000, "You can purchase different items with the ~g~/buy~w~ command from any 24/7.");
	TextDrawBackgroundColor(TutTxtdraw[66], 255);
	TextDrawFont(TutTxtdraw[66], 2);
	TextDrawLetterSize(TutTxtdraw[66], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[66], -1);
	TextDrawSetOutline(TutTxtdraw[66], 1);
	TextDrawSetProportional(TutTxtdraw[66], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Line 2)
	TutTxtdraw[67] = TextDrawCreate(175.000000, 151.000000, "Buying a cellphone will give you the ability to ~g~/call~w~ or ~g~/sms~w~ other online");
	TextDrawBackgroundColor(TutTxtdraw[67], 255);
	TextDrawFont(TutTxtdraw[67], 2);
	TextDrawLetterSize(TutTxtdraw[67], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[67], -1);
	TextDrawSetOutline(TutTxtdraw[67], 1);
	TextDrawSetProportional(TutTxtdraw[67], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Line 3)
	TutTxtdraw[68] = TextDrawCreate(175.000000, 161.000000, "players. Along with banks, 24/7 stores appear as a green dollar sign on");
	TextDrawBackgroundColor(TutTxtdraw[68], 255);
	TextDrawFont(TutTxtdraw[68], 2);
	TextDrawLetterSize(TutTxtdraw[68], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[68], -1);
	TextDrawSetOutline(TutTxtdraw[68], 1);
	TextDrawSetProportional(TutTxtdraw[68], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Line 4)
	TutTxtdraw[69] = TextDrawCreate(175.000000, 171.000000, "the mini-map.");
	TextDrawBackgroundColor(TutTxtdraw[69], 255);
	TextDrawFont(TutTxtdraw[69], 2);
	TextDrawLetterSize(TutTxtdraw[69], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[69], -1);
	TextDrawSetOutline(TutTxtdraw[69], 1);
	TextDrawSetProportional(TutTxtdraw[69], 1);
	textdrawscount++;

	// Tutorial (Frame 16) (Line 5)
	TutTxtdraw[70] = TextDrawCreate(175.000000, 195.000000, "VIPs get special discounts from these stores.");
	TextDrawBackgroundColor(TutTxtdraw[70], 255);
	TextDrawFont(TutTxtdraw[70], 2);
	TextDrawLetterSize(TutTxtdraw[70], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[70], -1);
	TextDrawSetOutline(TutTxtdraw[70], 1);
	TextDrawSetProportional(TutTxtdraw[70], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Title)
	TutTxtdraw[71] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Clothing Stores");
	TextDrawBackgroundColor(TutTxtdraw[71], 255);
	TextDrawFont(TutTxtdraw[71], 2);
	TextDrawLetterSize(TutTxtdraw[71], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[71], -1);
	TextDrawSetOutline(TutTxtdraw[71], 0);
	TextDrawSetProportional(TutTxtdraw[71], 1);
	TextDrawSetShadow(TutTxtdraw[71], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Line 1)
	TutTxtdraw[72] = TextDrawCreate(175.000000, 141.000000, "You can purchase different skins with ~g~/buyclothes~w~ from any clothing store.");
	TextDrawBackgroundColor(TutTxtdraw[72], 255);
	TextDrawFont(TutTxtdraw[72], 2);
	TextDrawLetterSize(TutTxtdraw[72], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[72], -1);
	TextDrawSetOutline(TutTxtdraw[72], 1);
	TextDrawSetProportional(TutTxtdraw[72], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Line 2)
	TutTxtdraw[73] = TextDrawCreate(175.000000, 151.000000, "You can also purchase different clothing items with ~g~/buytoys~w~ from any");
	TextDrawBackgroundColor(TutTxtdraw[73], 255);
	TextDrawFont(TutTxtdraw[73], 2);
	TextDrawLetterSize(TutTxtdraw[73], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[73], -1);
	TextDrawSetOutline(TutTxtdraw[73], 1);
	TextDrawSetProportional(TutTxtdraw[73], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Line 3)
	TutTxtdraw[74] = TextDrawCreate(175.000000, 161.000000, "clothing store. Clothing stores appear as a white tee shirt on the");
	TextDrawBackgroundColor(TutTxtdraw[74], 255);
	TextDrawFont(TutTxtdraw[74], 2);
	TextDrawLetterSize(TutTxtdraw[74], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[74], -1);
	TextDrawSetOutline(TutTxtdraw[74], 1);
	TextDrawSetProportional(TutTxtdraw[74], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Line 4)
	TutTxtdraw[75] = TextDrawCreate(175.000000, 171.000000, "mini-map.");
	TextDrawBackgroundColor(TutTxtdraw[75], 255);
	TextDrawFont(TutTxtdraw[75], 2);
	TextDrawLetterSize(TutTxtdraw[75], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[75], -1);
	TextDrawSetOutline(TutTxtdraw[75], 1);
	TextDrawSetProportional(TutTxtdraw[75], 1);
	textdrawscount++;

	// Tutorial (Frame 17) (Line 5)
	TutTxtdraw[76] = TextDrawCreate(175.000000, 195.000000, "VIPs get an unrestricted selection of skins from these stores.");
	TextDrawBackgroundColor(TutTxtdraw[76], 255);
	TextDrawFont(TutTxtdraw[76], 2);
	TextDrawLetterSize(TutTxtdraw[76], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[76], -1);
	TextDrawSetOutline(TutTxtdraw[76], 1);
	TextDrawSetProportional(TutTxtdraw[76], 1);
	textdrawscount++;

	// Tutorial (Frame 18) (Title)
	TutTxtdraw[77] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Car Dealerships");
	TextDrawBackgroundColor(TutTxtdraw[77], 255);
	TextDrawFont(TutTxtdraw[77], 2);
	TextDrawLetterSize(TutTxtdraw[77], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[77], -1);
	TextDrawSetOutline(TutTxtdraw[77], 0);
	TextDrawSetProportional(TutTxtdraw[77], 1);
	TextDrawSetShadow(TutTxtdraw[77], 1);
	textdrawscount++;

	// Tutorial (Frame 18) (Line 1)
	TutTxtdraw[78] = TextDrawCreate(175.000000, 141.000000, "You can purchase different vehicles from several different car");
	TextDrawBackgroundColor(TutTxtdraw[78], 255);
	TextDrawFont(TutTxtdraw[78], 2);
	TextDrawLetterSize(TutTxtdraw[78], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[78], -1);
	TextDrawSetOutline(TutTxtdraw[78], 1);
	TextDrawSetProportional(TutTxtdraw[78], 1);
	textdrawscount++;

	// Tutorial (Frame 18) (Line 2)
	TutTxtdraw[79] = TextDrawCreate(175.000000, 151.000000, "dealerships. Once purchased, you can control said vehicle with the ~g~/car");
	TextDrawBackgroundColor(TutTxtdraw[79], 255);
	TextDrawFont(TutTxtdraw[79], 2);
	TextDrawLetterSize(TutTxtdraw[79], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[79], -1);
	TextDrawSetOutline(TutTxtdraw[79], 1);
	TextDrawSetProportional(TutTxtdraw[79], 1);
	textdrawscount++;

	// Tutorial (Frame 18) (Line 3)
	TutTxtdraw[80] = TextDrawCreate(175.000000, 161.000000, "command. Car dealerships appear as a car on the mini-map.");
	TextDrawBackgroundColor(TutTxtdraw[80], 255);
	TextDrawFont(TutTxtdraw[80], 2);
	TextDrawLetterSize(TutTxtdraw[80], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[80], -1);
	TextDrawSetOutline(TutTxtdraw[80], 1);
	TextDrawSetProportional(TutTxtdraw[80], 1);
	textdrawscount++;

	// Tutorial (Frame 18) (Line 4)
	TutTxtdraw[81] = TextDrawCreate(175.000000, 195.000000, "There are several different car dealerships, also in the VIP garage.");
	TextDrawBackgroundColor(TutTxtdraw[81], 255);
	TextDrawFont(TutTxtdraw[81], 2);
	TextDrawLetterSize(TutTxtdraw[81], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[81], -1);
	TextDrawSetOutline(TutTxtdraw[81], 1);
	TextDrawSetProportional(TutTxtdraw[81], 1);
	textdrawscount++;

	// Tutorial (Frame 19) (Title)
	TutTxtdraw[82] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Houses");
	TextDrawBackgroundColor(TutTxtdraw[82], 255);
	TextDrawFont(TutTxtdraw[82], 2);
	TextDrawLetterSize(TutTxtdraw[82], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[82], -1);
	TextDrawSetOutline(TutTxtdraw[82], 0);
	TextDrawSetProportional(TutTxtdraw[82], 1);
	TextDrawSetShadow(TutTxtdraw[82], 1);
	textdrawscount++;

	// Tutorial (Frame 19) (Line 1)
	TutTxtdraw[83] = TextDrawCreate(175.000000, 141.000000, "Houses are player ownable living units that you can purchase from other");
	TextDrawBackgroundColor(TutTxtdraw[83], 255);
	TextDrawFont(TutTxtdraw[83], 2);
	TextDrawLetterSize(TutTxtdraw[83], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[83], -1);
	TextDrawSetOutline(TutTxtdraw[83], 1);
	TextDrawSetProportional(TutTxtdraw[83], 1);
	textdrawscount++;

	// Tutorial (Frame 19) (Line 2)
	TutTxtdraw[84] = TextDrawCreate(175.000000, 151.000000, "players or from our e-store. You can store materials, drugs and money");
	TextDrawBackgroundColor(TutTxtdraw[84], 255);
	TextDrawFont(TutTxtdraw[84], 2);
	TextDrawLetterSize(TutTxtdraw[84], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[84], -1);
	TextDrawSetOutline(TutTxtdraw[84], 1);
	TextDrawSetProportional(TutTxtdraw[84], 1);
	textdrawscount++;

	// Tutorial (Frame 19) (Line 3)
	TutTxtdraw[85] = TextDrawCreate(175.000000, 161.000000, "into the house safe for keep sakes as long as you own the house.");
	TextDrawBackgroundColor(TutTxtdraw[85], 255);
	TextDrawFont(TutTxtdraw[85], 2);
	TextDrawLetterSize(TutTxtdraw[85], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[85], -1);
	TextDrawSetOutline(TutTxtdraw[85], 1);
	TextDrawSetProportional(TutTxtdraw[85], 1);
	textdrawscount++;

	// Tutorial (Frame 19) (Line 4)
	TutTxtdraw[86] = TextDrawCreate(175.000000, 195.000000, "Houses appear as a ~g~green~w~ floating house throughout San Andreas.");
	TextDrawBackgroundColor(TutTxtdraw[86], 255);
	TextDrawFont(TutTxtdraw[86], 2);
	TextDrawLetterSize(TutTxtdraw[86], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[86], -1);
	TextDrawSetOutline(TutTxtdraw[86], 1);
	TextDrawSetProportional(TutTxtdraw[86], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Title)
	TutTxtdraw[87] = TextDrawCreate(168.000000, 120.000000, "Tutorial - VIP & E-Store");
	TextDrawBackgroundColor(TutTxtdraw[87], 255);
	TextDrawFont(TutTxtdraw[87], 2);
	TextDrawLetterSize(TutTxtdraw[87], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[87], -1);
	TextDrawSetOutline(TutTxtdraw[87], 0);
	TextDrawSetProportional(TutTxtdraw[87], 1);
	TextDrawSetShadow(TutTxtdraw[87], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Line 1)
	TutTxtdraw[88] = TextDrawCreate(175.000000, 141.000000, "We operate a 24/7 E-Store at ~y~eg-rp.vn~w~, you can purchase Vehicles,");
	TextDrawBackgroundColor(TutTxtdraw[88], 255);
	TextDrawFont(TutTxtdraw[88], 2);
	TextDrawLetterSize(TutTxtdraw[88], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[88], -1);
	TextDrawSetOutline(TutTxtdraw[88], 1);
	TextDrawSetProportional(TutTxtdraw[88], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Line 2)
	TutTxtdraw[89] = TextDrawCreate(175.000000, 151.000000, "Houses, VIP and much much more! We have 4 different VIP levels that users");
	TextDrawBackgroundColor(TutTxtdraw[89], 255);
	TextDrawFont(TutTxtdraw[89], 2);
	TextDrawLetterSize(TutTxtdraw[89], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[89], -1);
	TextDrawSetOutline(TutTxtdraw[89], 1);
	TextDrawSetProportional(TutTxtdraw[89], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Line 3)
	TutTxtdraw[90] = TextDrawCreate(175.000000, 161.000000, "can purchase or obtain - learn more on our shop's website. VIPs have access");
	TextDrawBackgroundColor(TutTxtdraw[90], 255);
	TextDrawFont(TutTxtdraw[90], 2);
	TextDrawLetterSize(TutTxtdraw[90], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[90], -1);
	TextDrawSetOutline(TutTxtdraw[90], 1);
	TextDrawSetProportional(TutTxtdraw[90], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Line 4)
	TutTxtdraw[91] = TextDrawCreate(175.000000, 195.000000, "Want a trial run as a VIP? Ask a VIP for a ~b~buddy invite.");
	TextDrawBackgroundColor(TutTxtdraw[91], 255);
	TextDrawFont(TutTxtdraw[91], 2);
	TextDrawLetterSize(TutTxtdraw[91], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[91], -1);
	TextDrawSetOutline(TutTxtdraw[91], 1);
	TextDrawSetProportional(TutTxtdraw[91], 1);
	textdrawscount++;

	// Tutorial (Frame 20) (Line 5)
	TutTxtdraw[92] = TextDrawCreate(175.000000, 172.000000, "to several features, such as VIP chat, special vehicles, and much more!");
	TextDrawBackgroundColor(TutTxtdraw[92], 255);
	TextDrawFont(TutTxtdraw[92], 2);
	TextDrawLetterSize(TutTxtdraw[92], 0.159997, 0.899999);
	TextDrawColor(TutTxtdraw[92], -1);
	TextDrawSetOutline(TutTxtdraw[92], 1);
	TextDrawSetProportional(TutTxtdraw[92], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Title)
	TutTxtdraw[93] = TextDrawCreate(168.000000, 120.000000, "Tutorial - The Rules");
	TextDrawBackgroundColor(TutTxtdraw[93], 255);
	TextDrawFont(TutTxtdraw[93], 2);
	TextDrawLetterSize(TutTxtdraw[93], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[93], -1);
	TextDrawSetOutline(TutTxtdraw[93], 0);
	TextDrawSetProportional(TutTxtdraw[93], 1);
	TextDrawSetShadow(TutTxtdraw[93], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 1)
	TutTxtdraw[94] = TextDrawCreate(175.000000, 141.000000, "Breaking these rules may result in jail/prision time, or leading up to a ban.");
	TextDrawBackgroundColor(TutTxtdraw[94], 255);
	TextDrawFont(TutTxtdraw[94], 2);
	TextDrawLetterSize(TutTxtdraw[94], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[94], -1);
	TextDrawSetOutline(TutTxtdraw[94], 1);
	TextDrawSetProportional(TutTxtdraw[94], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 2)
	TutTxtdraw[95] = TextDrawCreate(181.000000, 160.000000, "| No deathmatching - do not kill without a reason.");
	TextDrawBackgroundColor(TutTxtdraw[95], 255);
	TextDrawFont(TutTxtdraw[95], 2);
	TextDrawLetterSize(TutTxtdraw[95], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[95], -1);
	TextDrawSetOutline(TutTxtdraw[95], 1);
	TextDrawSetProportional(TutTxtdraw[95], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 3)
	TutTxtdraw[96] = TextDrawCreate(181.000000, 170.000000, "| No revengekilling - you loose 30 minutes of memory when you die.");
	TextDrawBackgroundColor(TutTxtdraw[96], 255);
	TextDrawFont(TutTxtdraw[96], 2);
	TextDrawLetterSize(TutTxtdraw[96], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[96], -1);
	TextDrawSetOutline(TutTxtdraw[96], 1);
	TextDrawSetProportional(TutTxtdraw[96], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 4)
	TutTxtdraw[97] = TextDrawCreate(181.000000, 181.000000, "| No carparking - do not park cars on people.");
	TextDrawBackgroundColor(TutTxtdraw[97], 255);
	TextDrawFont(TutTxtdraw[97], 2);
	TextDrawLetterSize(TutTxtdraw[97], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[97], -1);
	TextDrawSetOutline(TutTxtdraw[97], 1);
	TextDrawSetProportional(TutTxtdraw[97], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 5)
	TutTxtdraw[98] = TextDrawCreate(181.000000, 192.000000, "| No disconnecting/logging to avoid any roleplay situation.");
	TextDrawBackgroundColor(TutTxtdraw[98], 255);
	TextDrawFont(TutTxtdraw[98], 2);
	TextDrawLetterSize(TutTxtdraw[98], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[98], -1);
	TextDrawSetOutline(TutTxtdraw[98], 1);
	TextDrawSetProportional(TutTxtdraw[98], 1);
	textdrawscount++;

	// Tutorial (Frame 21) (Line 6)
	TutTxtdraw[99] = TextDrawCreate(181.000000, 203.000000, "| No account farming/server advertising/cheating/hacking.");
	TextDrawBackgroundColor(TutTxtdraw[99], 255);
	TextDrawFont(TutTxtdraw[99], 2);
	TextDrawLetterSize(TutTxtdraw[99], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[99], -1);
	TextDrawSetOutline(TutTxtdraw[99], 1);
	TextDrawSetProportional(TutTxtdraw[99], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Title)
	TutTxtdraw[100] = TextDrawCreate(168.000000, 120.000000, "Tutorial - The Credits");
	TextDrawBackgroundColor(TutTxtdraw[100], 255);
	TextDrawFont(TutTxtdraw[100], 2);
	TextDrawLetterSize(TutTxtdraw[100], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[100], -1);
	TextDrawSetOutline(TutTxtdraw[100], 0);
	TextDrawSetProportional(TutTxtdraw[100], 1);
	TextDrawSetShadow(TutTxtdraw[100], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 1)
	TutTxtdraw[101] = TextDrawCreate(175.000000, 141.000000, "Be sure to thank who makes all of this possible.");
	TextDrawBackgroundColor(TutTxtdraw[101], 255);
	TextDrawFont(TutTxtdraw[101], 2);
	TextDrawLetterSize(TutTxtdraw[101], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[101], -1);
	TextDrawSetOutline(TutTxtdraw[101], 1);
	TextDrawSetProportional(TutTxtdraw[101], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 2)
	TutTxtdraw[102] = TextDrawCreate(181.000000, 160.000000, "Director of Development");
	TextDrawBackgroundColor(TutTxtdraw[102], 255);
	TextDrawFont(TutTxtdraw[102], 2);
	TextDrawLetterSize(TutTxtdraw[102], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[102], -1);
	TextDrawSetOutline(TutTxtdraw[102], 1);
	TextDrawSetProportional(TutTxtdraw[102], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 3)
	TutTxtdraw[103] = TextDrawCreate(189.000000, 170.000000, "| Brendan Thomson");
	TextDrawBackgroundColor(TutTxtdraw[103], 255);
	TextDrawFont(TutTxtdraw[103], 2);
	TextDrawLetterSize(TutTxtdraw[103], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[103], -1);
	TextDrawSetOutline(TutTxtdraw[103], 1);
	TextDrawSetProportional(TutTxtdraw[103], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 4)
	TutTxtdraw[104] = TextDrawCreate(354.000000, 160.000000, "Scripting");
	TextDrawBackgroundColor(TutTxtdraw[104], 255);
	TextDrawFont(TutTxtdraw[104], 2);
	TextDrawLetterSize(TutTxtdraw[104], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[104], -1);
	TextDrawSetOutline(TutTxtdraw[104], 1);
	TextDrawSetProportional(TutTxtdraw[104], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 5)
	TutTxtdraw[105] = TextDrawCreate(181.000000, 192.000000, "Special Thanks");
	TextDrawBackgroundColor(TutTxtdraw[105], 255);
	TextDrawFont(TutTxtdraw[105], 2);
	TextDrawLetterSize(TutTxtdraw[105], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[105], -1);
	TextDrawSetOutline(TutTxtdraw[105], 1);
	TextDrawSetProportional(TutTxtdraw[105], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 6)
	TutTxtdraw[106] = TextDrawCreate(189.000000, 203.000000, "| JernejL~n~| kyeman~n~");
	TextDrawBackgroundColor(TutTxtdraw[106], 255);
	TextDrawFont(TutTxtdraw[106], 2);
	TextDrawLetterSize(TutTxtdraw[106], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[106], -1);
	TextDrawSetOutline(TutTxtdraw[106], 1);
	TextDrawSetProportional(TutTxtdraw[106], 1);
	textdrawscount++;

	// Tutorial (Frame 22) (Line 7)
	TutTxtdraw[107] = TextDrawCreate(362.000000, 169.000000, "| Scott~n~| Donuts~n~| Brendan~n~| GhoulSlayeR~n~| Zhao~n~| Calgon~n~| Beren~n~| Razbit~n~| Sew Sumi~n~| John Milete~n~| Brian~n~| (S)Mo Cena~n~| Kareem~n~|Jac Cakey~n~| Farva~n~| AlexR~n~| Akatony~n~| Neo");
	TextDrawBackgroundColor(TutTxtdraw[107], 255);
	TextDrawFont(TutTxtdraw[107], 2);
	TextDrawLetterSize(TutTxtdraw[107], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[107], -1);
	TextDrawSetOutline(TutTxtdraw[107], 1);
	TextDrawSetProportional(TutTxtdraw[107], 1);
	textdrawscount++;
	textdrawscount++;

	// Tutorial (Frame 23) (Title)
	TutTxtdraw[108] = TextDrawCreate(168.000000, 120.000000, "Tutorial - Welcome to San Andreas");
	TextDrawBackgroundColor(TutTxtdraw[108], 255);
	TextDrawFont(TutTxtdraw[108], 2);
	TextDrawLetterSize(TutTxtdraw[108], 0.209998, 1.000000);
	TextDrawColor(TutTxtdraw[108], -1);
	TextDrawSetOutline(TutTxtdraw[108], 0);
	TextDrawSetProportional(TutTxtdraw[108], 1);
	TextDrawSetShadow(TutTxtdraw[108], 1);
	textdrawscount++;

	// Tutorial (Frame 23) (Line 1)
	TutTxtdraw[109] = TextDrawCreate(175.000000, 141.000000, "Enough chat, it's time to for us to shut up and for you to play, so if you");
	TextDrawBackgroundColor(TutTxtdraw[109], 255);
	TextDrawFont(TutTxtdraw[109], 2);
	TextDrawLetterSize(TutTxtdraw[109], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[109], -1);
	TextDrawSetOutline(TutTxtdraw[109], 1);
	TextDrawSetProportional(TutTxtdraw[109], 1);
	textdrawscount++;

	// Tutorial (Frame 23) (Line 2)
	TutTxtdraw[110] = TextDrawCreate(175.000000, 152.000000, "have any questions, use ~g~/newb~w~. If you need personal help, use");
	TextDrawBackgroundColor(TutTxtdraw[110], 255);
	TextDrawFont(TutTxtdraw[110], 2);
	TextDrawLetterSize(TutTxtdraw[110], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[110], -1);
	TextDrawSetOutline(TutTxtdraw[110], 1);
	TextDrawSetProportional(TutTxtdraw[110], 1);
	textdrawscount++;

	// Tutorial (Frame 23) (Line 3)
	TutTxtdraw[111] = TextDrawCreate(175.000000, 163.000000, "~g~/requesthelp~w~. For a list of commands type ~g~/help. ~w~For more information,");
	TextDrawBackgroundColor(TutTxtdraw[111], 255);
	TextDrawFont(TutTxtdraw[111], 2);
	TextDrawLetterSize(TutTxtdraw[111], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[111], -1);
	TextDrawSetOutline(TutTxtdraw[111], 1);
	TextDrawSetProportional(TutTxtdraw[111], 1);
	textdrawscount++;

	// Tutorial (Frame 23) (Line 4)
	TutTxtdraw[112] = TextDrawCreate(175.000000, 174.000000, "check out ~y~www.fg-roleplay.com~w~.");
	TextDrawBackgroundColor(TutTxtdraw[112], 255);
	TextDrawFont(TutTxtdraw[112], 2);
	TextDrawLetterSize(TutTxtdraw[112], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[112], -1);
	TextDrawSetOutline(TutTxtdraw[112], 1);
	TextDrawSetProportional(TutTxtdraw[112], 1);
	textdrawscount++;

	// Tutorial (Frame 23) (Line 5)
	TutTxtdraw[113] = TextDrawCreate(175.000000, 204.000000, "Your weapons will be restricted for the first 2 hours of play.");
	TextDrawBackgroundColor(TutTxtdraw[113], 255);
	TextDrawFont(TutTxtdraw[113], 2);
	TextDrawLetterSize(TutTxtdraw[113], 0.159998, 0.899999);
	TextDrawColor(TutTxtdraw[113], -1);
	TextDrawSetOutline(TutTxtdraw[113], 1);
	TextDrawSetProportional(TutTxtdraw[113], 1);
	textdrawscount++;
	



	print("[Textdraws] Loaded textdraws.");
	
	return 1;
}

stock PrepTradeToysGUI(playerid, sellerid, price, object)
{
	new string[128];
	InsideTradeToys[playerid] = 1;
	
	// Background
	ttBackground[playerid] = CreatePlayerTextDraw(playerid, 21.000000, 120.000000, "Background"); // Leave the string there, it will fuck up the size of the background if not
	PlayerTextDrawBackgroundColor(playerid, ttBackground[playerid], 255);
	PlayerTextDrawFont(playerid, ttBackground[playerid], 0);
	PlayerTextDrawLetterSize(playerid, ttBackground[playerid], -0.019998, 34.600002);
	PlayerTextDrawColor(playerid, ttBackground[playerid], -256);
	PlayerTextDrawSetOutline(playerid, ttBackground[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttBackground[playerid], 0);
	PlayerTextDrawSetShadow(playerid, ttBackground[playerid], 1);
	PlayerTextDrawUseBox(playerid, ttBackground[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ttBackground[playerid], 136);
	PlayerTextDrawTextSize(playerid, ttBackground[playerid], 618.000000, 164.000000);
	PlayerTextDrawSetSelectable(playerid, ttBackground[playerid], 0);
	
	// Model
	ttModel[playerid] = CreatePlayerTextDraw(playerid, 382.000000, 201.000000, "Model");
	PlayerTextDrawBackgroundColor(playerid, ttModel[playerid], 255);
	PlayerTextDrawFont(playerid, ttModel[playerid], 5);
	PlayerTextDrawLetterSize(playerid, ttModel[playerid], -0.679998, 15.999996);
	PlayerTextDrawColor(playerid, ttModel[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ttModel[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttModel[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttModel[playerid], 1);
	PlayerTextDrawUseBox(playerid, ttModel[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ttModel[playerid], 136);
	PlayerTextDrawTextSize(playerid, ttModel[playerid], 171.000000, 145.000000);
	PlayerTextDrawSetSelectable(playerid, ttModel[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, ttModel[playerid], object);
	PlayerTextDrawSetPreviewRot(playerid, ttModel[playerid], 0.000000, 0.000000, -180.000000, 1.000000);
	
	// Object Info
	format(string, sizeof(string), "(Object ID %d)", object);
	ttObjectInfo[playerid] = CreatePlayerTextDraw(playerid, 400.000000, 182.000000, string);
	PlayerTextDrawBackgroundColor(playerid, ttObjectInfo[playerid], 255);
	PlayerTextDrawFont(playerid, ttObjectInfo[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttObjectInfo[playerid], 0.310000, 1.000000);
	PlayerTextDrawColor(playerid, ttObjectInfo[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ttObjectInfo[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttObjectInfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttObjectInfo[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttObjectInfo[playerid], 0);
	
	// Logo
	ttLogo[playerid] = CreatePlayerTextDraw(playerid, 264.000000, 121.000000, "Buon ban do choi");
	PlayerTextDrawBackgroundColor(playerid, ttLogo[playerid], 255);
	PlayerTextDrawFont(playerid, ttLogo[playerid], 2);
	PlayerTextDrawLetterSize(playerid, ttLogo[playerid], 0.379999, 1.500000);
	PlayerTextDrawColor(playerid, ttLogo[playerid], 542758143);
	PlayerTextDrawSetOutline(playerid, ttLogo[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttLogo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttLogo[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttLogo[playerid], 0);
	
	// Purchase
	ttPurchase[playerid] = CreatePlayerTextDraw(playerid, 91.000000, 295.000000, "Mua");
	PlayerTextDrawBackgroundColor(playerid, ttPurchase[playerid], 255);
	PlayerTextDrawFont(playerid, ttPurchase[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttPurchase[playerid], 0.500000, 1.700000);
	PlayerTextDrawColor(playerid, ttPurchase[playerid], 16711935);
	PlayerTextDrawSetOutline(playerid, ttPurchase[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ttPurchase[playerid], 1);
	PlayerTextDrawUseBox(playerid, ttPurchase[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ttPurchase[playerid], 1625166370);
	PlayerTextDrawTextSize(playerid, ttPurchase[playerid], 164.000000, 4.000000);
	PlayerTextDrawSetSelectable(playerid, ttPurchase[playerid], 1);
	
	// Decline
	ttDecline[playerid] = CreatePlayerTextDraw(playerid, 254.000000, 295.000000, "Tu choi");
	PlayerTextDrawBackgroundColor(playerid, ttDecline[playerid], 255);
	PlayerTextDrawFont(playerid, ttDecline[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttDecline[playerid], 0.500000, 1.799999);
	PlayerTextDrawColor(playerid, ttDecline[playerid], -16776961);
	PlayerTextDrawSetOutline(playerid, ttDecline[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttDecline[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttDecline[playerid], 1);
	PlayerTextDrawUseBox(playerid, ttDecline[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ttDecline[playerid], -234414302);
	PlayerTextDrawTextSize(playerid, ttDecline[playerid], 310.000000, 0.000000);
	PlayerTextDrawSetSelectable(playerid, ttDecline[playerid], 0);
	
	// Offer
	format(string, sizeof(string), "%s da de nghi ban do choi nay voi gia $%s", GetPlayerNameEx(sellerid), number_format(price));
	ttOffer[playerid] = CreatePlayerTextDraw(playerid, 71.000000, 174.000000, string);
	PlayerTextDrawBackgroundColor(playerid, ttOffer[playerid], 255);
	PlayerTextDrawFont(playerid, ttOffer[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttOffer[playerid], 0.310000, 1.000000);
	PlayerTextDrawColor(playerid, ttOffer[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ttOffer[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttOffer[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttOffer[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttOffer[playerid], 0);
	
	// Note
	ttNote[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 221.000000, "Bam phim Y tu ban phim de dong y mua. Bam phim N tu ban phim de tu choi mua");
	PlayerTextDrawBackgroundColor(playerid, ttNote[playerid], 255);
	PlayerTextDrawFont(playerid, ttNote[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttNote[playerid], 0.150000, 1.000000);
	PlayerTextDrawColor(playerid, ttNote[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ttNote[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttNote[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttNote[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttNote[playerid], 0);
	
	// Yes 
	ttYes[playerid] = CreatePlayerTextDraw(playerid, 117.000000, 275.000000, "'Y'");
	PlayerTextDrawBackgroundColor(playerid, ttYes[playerid], 255);
	PlayerTextDrawFont(playerid, ttYes[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttYes[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ttYes[playerid], 16711935);
	PlayerTextDrawSetOutline(playerid, ttYes[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttYes[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttYes[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttYes[playerid], 0);

	// No 
	ttNo[playerid] = CreatePlayerTextDraw(playerid, 270.000000, 271.000000, "'N'");
	PlayerTextDrawBackgroundColor(playerid, ttNo[playerid], 255);
	PlayerTextDrawFont(playerid, ttNo[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ttNo[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, ttNo[playerid], -16776961);
	PlayerTextDrawSetOutline(playerid, ttNo[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ttNo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ttNo[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ttNo[playerid], 0);
	
	PlayerTextDrawShow(playerid, ttBackground[playerid]);
	PlayerTextDrawShow(playerid, ttModel[playerid]);
	PlayerTextDrawShow(playerid, ttObjectInfo[playerid]);
	PlayerTextDrawShow(playerid, ttLogo[playerid]);
	PlayerTextDrawShow(playerid, ttPurchase[playerid]);
	PlayerTextDrawShow(playerid, ttDecline[playerid]);
	PlayerTextDrawShow(playerid, ttOffer[playerid]);
	PlayerTextDrawShow(playerid, ttNote[playerid]);
	PlayerTextDrawShow(playerid, ttYes[playerid]);
	PlayerTextDrawShow(playerid, ttNo[playerid]);
	return 1;
}

stock HideTradeToysGUI(playerid)
{
	InsideTradeToys[playerid] = 0;
	PlayerTextDrawHide(playerid, ttBackground[playerid]);
	PlayerTextDrawHide(playerid, ttModel[playerid]);
	PlayerTextDrawHide(playerid, ttObjectInfo[playerid]);
	PlayerTextDrawHide(playerid, ttLogo[playerid]);
	PlayerTextDrawHide(playerid, ttPurchase[playerid]);
	PlayerTextDrawHide(playerid, ttDecline[playerid]);
	PlayerTextDrawHide(playerid, ttOffer[playerid]);
	PlayerTextDrawHide(playerid, ttNote[playerid]);
	PlayerTextDrawHide(playerid, ttYes[playerid]);
	PlayerTextDrawHide(playerid, ttNo[playerid]);
	return 1;
}

stock CreateHungerGamesTextdraw(playerid)
{
	new string[128];
	
	// Create the Player Count Textdraw
	format(string, sizeof(string), "So nguoi choi trong event: %d", hgPlayerCount);
	HungerPlayerInfo[playerid][hgPlayerText] = CreatePlayerTextDraw(playerid, 41.000000, 433.000000, string);
	PlayerTextDrawBackgroundColor(playerid, HungerPlayerInfo[playerid][hgPlayerText], 255);
	PlayerTextDrawFont(playerid, HungerPlayerInfo[playerid][hgPlayerText], 1);
	PlayerTextDrawLetterSize(playerid, HungerPlayerInfo[playerid][hgPlayerText], 0.250000, 0.899999);
	PlayerTextDrawColor(playerid, HungerPlayerInfo[playerid][hgPlayerText], -1);
	PlayerTextDrawSetOutline(playerid, HungerPlayerInfo[playerid][hgPlayerText], 1);
	PlayerTextDrawSetProportional(playerid, HungerPlayerInfo[playerid][hgPlayerText], 1);
	PlayerTextDrawSetSelectable(playerid, HungerPlayerInfo[playerid][hgPlayerText], 0);
	
	// Create the loading textdraw
	HungerPlayerInfo[playerid][hgLoadingText] = CreatePlayerTextDraw(playerid, 549.000000, 423.000000, "Loading Battle Royal...");
	PlayerTextDrawBackgroundColor(playerid, HungerPlayerInfo[playerid][hgLoadingText], 255);
	PlayerTextDrawFont(playerid, HungerPlayerInfo[playerid][hgLoadingText], 1);
	PlayerTextDrawLetterSize(playerid, HungerPlayerInfo[playerid][hgLoadingText], 0.160000, 0.699999);
	PlayerTextDrawColor(playerid, HungerPlayerInfo[playerid][hgLoadingText], -16776961);
	PlayerTextDrawSetOutline(playerid, HungerPlayerInfo[playerid][hgLoadingText], 1);
	PlayerTextDrawSetProportional(playerid, HungerPlayerInfo[playerid][hgLoadingText], 1);
	PlayerTextDrawSetSelectable(playerid, HungerPlayerInfo[playerid][hgLoadingText], 0);

	// Create the time left textdraw
	format(string, sizeof(string), "Thoi gian con lai: %d", hgCountdown);
	HungerPlayerInfo[playerid][hgTimeLeftText] = CreatePlayerTextDraw(playerid, 549.000000, 432.000000, string);
	PlayerTextDrawBackgroundColor(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 255);
	PlayerTextDrawFont(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 1);
	PlayerTextDrawLetterSize(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 0.210000, 1.000000);
	PlayerTextDrawColor(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], -1);
	PlayerTextDrawSetOutline(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 1);
	PlayerTextDrawSetProportional(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 1);
	PlayerTextDrawSetSelectable(playerid, HungerPlayerInfo[playerid][hgTimeLeftText], 0);

	// Create the credits textdraw
	HungerPlayerInfo[playerid][hgCreditsText] = CreatePlayerTextDraw(playerid, 532.000000, 2.000000, "Battle Royal - Beta : 0.1");
	PlayerTextDrawBackgroundColor(playerid, HungerPlayerInfo[playerid][hgCreditsText], 255);
	PlayerTextDrawFont(playerid, HungerPlayerInfo[playerid][hgCreditsText], 1);
	PlayerTextDrawLetterSize(playerid, HungerPlayerInfo[playerid][hgCreditsText], 0.190000, 0.699999);
	PlayerTextDrawColor(playerid, HungerPlayerInfo[playerid][hgCreditsText], -16776961);
	PlayerTextDrawSetOutline(playerid, HungerPlayerInfo[playerid][hgCreditsText], 1);
	PlayerTextDrawSetProportional(playerid, HungerPlayerInfo[playerid][hgCreditsText], 1);
	PlayerTextDrawSetSelectable(playerid, HungerPlayerInfo[playerid][hgCreditsText], 0);
	
	// Show the textdraws
	PlayerTextDrawShow(playerid, HungerPlayerInfo[playerid][hgPlayerText]);
	PlayerTextDrawShow(playerid, HungerPlayerInfo[playerid][hgLoadingText]);
	PlayerTextDrawShow(playerid, HungerPlayerInfo[playerid][hgTimeLeftText]);
	PlayerTextDrawShow(playerid, HungerPlayerInfo[playerid][hgCreditsText]);
	return true;
}

stock HideHungerGamesTextdraw(playerid)
{
	// Hide the textdraws
	PlayerTextDrawHide(playerid, HungerPlayerInfo[playerid][hgPlayerText]);
	PlayerTextDrawHide(playerid, HungerPlayerInfo[playerid][hgLoadingText]);
	PlayerTextDrawHide(playerid, HungerPlayerInfo[playerid][hgTimeLeftText]);
	PlayerTextDrawHide(playerid, HungerPlayerInfo[playerid][hgCreditsText]);
	return true;
}

stock ShowFPSCounter(playerid)
{
	new string[64];
	format(string, sizeof(string), "%d", pFPS[playerid]);
	pFPSCounter[playerid] = CreatePlayerTextDraw(playerid,617.000000, 2.000000, string);
	PlayerTextDrawBackgroundColor(playerid,pFPSCounter[playerid], 255);
	PlayerTextDrawFont(playerid,pFPSCounter[playerid], 3);
	PlayerTextDrawLetterSize(playerid,pFPSCounter[playerid], 0.370000, 1.200000);
	PlayerTextDrawColor(playerid,pFPSCounter[playerid], -65281);
	PlayerTextDrawSetOutline(playerid,pFPSCounter[playerid], 1);
	PlayerTextDrawSetProportional(playerid,pFPSCounter[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,pFPSCounter[playerid], 0);
	
	PlayerTextDrawShow(playerid, pFPSCounter[playerid]);
	return true;
}

stock HideFPSCounter(playerid)
{
	PlayerTextDrawHide(playerid, pFPSCounter[playerid]);
	return true;
}

stock CreatePlayerTextDraws(playerid)
{
	TBaoThatbai[playerid][0] = CreatePlayerTextDraw(playerid, 499.260070, 171.333206, "");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][0], 23.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][0], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][0], 0);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][0], 0);
	PlayerTextDrawSetPreviewModel(playerid, TBaoThatbai[playerid][0], 2965);
	PlayerTextDrawSetPreviewRot(playerid, TBaoThatbai[playerid][0], 90.000000, 0.000000, -90.000000, 1.000000);

	TBaoThatbai[playerid][1] = CreatePlayerTextDraw(playerid, 494.576324, 164.250061, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][1], 132.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][1], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][1], -97249793);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][1], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][1], 0);

	TBaoThatbai[playerid][2] = CreatePlayerTextDraw(playerid, 505.351715, 189.416702, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][2], 11.000000, -2.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][2], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][2], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][2], 0);

	TBaoThatbai[playerid][3] = CreatePlayerTextDraw(playerid, 493.170318, 161.083465, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][3], 2.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][3], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][3], 2132150015);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][3], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][3], 0);

	TBaoThatbai[playerid][4] = CreatePlayerTextDraw(playerid, 505.651763, 187.466705, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][4], 10.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][4], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][4], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][4], 0);

	TBaoThatbai[playerid][5] = CreatePlayerTextDraw(playerid, 506.251800, 186.266632, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][5], 9.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][5], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][5], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][5], 0);

	TBaoThatbai[playerid][6] = CreatePlayerTextDraw(playerid, 506.783325, 184.966552, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][6], 8.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][6], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][6], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][6], 0);

	TBaoThatbai[playerid][7] = CreatePlayerTextDraw(playerid, 507.183349, 184.149795, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][7], 7.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][7], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][7], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][7], 0);

	TBaoThatbai[playerid][8] = CreatePlayerTextDraw(playerid, 507.783386, 182.749710, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][8], 6.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][8], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][8], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][8], 0);

	TBaoThatbai[playerid][9] = CreatePlayerTextDraw(playerid, 508.083404, 181.649642, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][9], 5.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][9], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][9], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][9], 0);

	TBaoThatbai[playerid][10] = CreatePlayerTextDraw(playerid, 508.583435, 180.449569, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][10], 4.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][10], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][10], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][10], 0);

	TBaoThatbai[playerid][11] = CreatePlayerTextDraw(playerid, 508.883453, 179.449508, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][11], 4.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][11], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][11], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][11], 0);

	TBaoThatbai[playerid][12] = CreatePlayerTextDraw(playerid, 512.283569, 177.949417, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][12], -2.000000, -1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][12], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][12], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][12], 0);

	TBaoThatbai[playerid][13] = CreatePlayerTextDraw(playerid, 509.283477, 177.049362, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][13], 1.000000, 1.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][13], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][13], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][13], 0);

	TBaoThatbai[playerid][14] = CreatePlayerTextDraw(playerid, 508.605041, 176.000015, "!");
	PlayerTextDrawLetterSize(playerid, TBaoThatbai[playerid][14], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][14], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][14], -97249793);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][14], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][14], 1);

	TBaoThatbai[playerid][15] = CreatePlayerTextDraw(playerid, 524.729248, 167.833312, "He thong");
	PlayerTextDrawLetterSize(playerid, TBaoThatbai[playerid][15], 0.213059, 1.156664);
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][15], 699.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][15], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][15], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][15], 1);

	TBaoThatbai[playerid][16] = CreatePlayerTextDraw(playerid, 524.729248, 181.034118, "Ai do dang suc cac o day...");
	PlayerTextDrawLetterSize(playerid, TBaoThatbai[playerid][16], 0.129662, 1.098331);
	PlayerTextDrawTextSize(playerid, TBaoThatbai[playerid][16], 699.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TBaoThatbai[playerid][16], 1);
	PlayerTextDrawColor(playerid, TBaoThatbai[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThatbai[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThatbai[playerid][16], 255);
	PlayerTextDrawFont(playerid, TBaoThatbai[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, TBaoThatbai[playerid][16], 1);
	
	TBaoThanhcong[playerid][0] = CreatePlayerTextDraw(playerid, 518.169982, 120.583335, "He thong");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][0], 0.213059, 1.156664);
	PlayerTextDrawTextSize(playerid, TBaoThanhcong[playerid][0], 699.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][0], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][0], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][0], 1);

	TBaoThanhcong[playerid][1] = CreatePlayerTextDraw(playerid, 494.576324, 118.250053, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThanhcong[playerid][1], 132.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][1], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][1], 431701247);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][1], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][1], 0);

	TBaoThanhcong[playerid][2] = CreatePlayerTextDraw(playerid, 502.240203, 131.666641, "O");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][2], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, TBaoThanhcong[playerid][2], 295.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][2], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][2], 22);
	PlayerTextDrawSetOutline(playerid, TBaoThanhcong[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][2], -1);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][2], 1);

	TBaoThanhcong[playerid][3] = CreatePlayerTextDraw(playerid, 505.519836, 134.000015, "O");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][3], 0.231800, 0.993332);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][3], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TBaoThanhcong[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][3], -1);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][3], 1);

	TBaoThanhcong[playerid][4] = CreatePlayerTextDraw(playerid, 505.988586, 128.166702, "/");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][4], 0.408432, 1.611667);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][4], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][4], 431701247);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][4], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][4], 1);

	TBaoThanhcong[playerid][5] = CreatePlayerTextDraw(playerid, 517.701110, 133.999984, "Ban vua suc cac thanh cong");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][5], 0.129662, 1.098331);
	PlayerTextDrawTextSize(playerid, TBaoThanhcong[playerid][5], 2375.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][5], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][5], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][5], 1);

	TBaoThanhcong[playerid][6] = CreatePlayerTextDraw(playerid, 493.233062, 116.500000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, TBaoThanhcong[playerid][6], 2.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][6], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][6], 109006079);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][6], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][6], 0);

	TBaoThanhcong[playerid][7] = CreatePlayerTextDraw(playerid, 503.177581, 128.749984, "`");
	PlayerTextDrawLetterSize(playerid, TBaoThanhcong[playerid][7], 0.551332, 4.114166);
	PlayerTextDrawAlignment(playerid, TBaoThanhcong[playerid][7], 1);
	PlayerTextDrawColor(playerid, TBaoThanhcong[playerid][7], 431701247);
	PlayerTextDrawSetShadow(playerid, TBaoThanhcong[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, TBaoThanhcong[playerid][7], 255);
	PlayerTextDrawFont(playerid, TBaoThanhcong[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, TBaoThanhcong[playerid][7], 1);
	//////
	BeKhoa_TD[playerid][0] = CreatePlayerTextDraw(playerid, 254.136505, 145.499923, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][0], 150.000000, 150.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][0], 118495743);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][0], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][0], 0);

	BeKhoa_TD[playerid][1] = CreatePlayerTextDraw(playerid, 259.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][1], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][1], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][1], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][1], true);

	BeKhoa_TD[playerid][2] = CreatePlayerTextDraw(playerid, 283.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][2], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][2], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][2], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][2], true);

	BeKhoa_TD[playerid][3] = CreatePlayerTextDraw(playerid, 307.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][3], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][3], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][3], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][3], true);

	BeKhoa_TD[playerid][4] = CreatePlayerTextDraw(playerid, 331.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][4], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][4], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][4], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][4], true);

	BeKhoa_TD[playerid][5] = CreatePlayerTextDraw(playerid, 355.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][5], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][5], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][5], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][5], true);

	BeKhoa_TD[playerid][6] = CreatePlayerTextDraw(playerid, 379.000000, 150.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][6], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][6], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][6], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][6], true);

	BeKhoa_TD[playerid][7] = CreatePlayerTextDraw(playerid, 379.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][7], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][7], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][7], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][7], true);

	BeKhoa_TD[playerid][8] = CreatePlayerTextDraw(playerid, 379.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][8], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][8], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][8], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][8], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][8], true);

	BeKhoa_TD[playerid][9] = CreatePlayerTextDraw(playerid, 379.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][9], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][9], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][9], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][9], true);

	BeKhoa_TD[playerid][10] = CreatePlayerTextDraw(playerid, 379.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][10], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][10], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][10], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][10], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][10], true);

	BeKhoa_TD[playerid][11] = CreatePlayerTextDraw(playerid, 379.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][11], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][11], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][11], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][11], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][11], true);

	BeKhoa_TD[playerid][12] = CreatePlayerTextDraw(playerid, 355.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][12], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][12], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][12], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][12], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][12], true);

	BeKhoa_TD[playerid][13] = CreatePlayerTextDraw(playerid, 331.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][13], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][13], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][13], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][13], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][13], true);

	BeKhoa_TD[playerid][14] = CreatePlayerTextDraw(playerid, 307.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][14], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][14], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][14], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][14], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][14], true);

	BeKhoa_TD[playerid][15] = CreatePlayerTextDraw(playerid, 283.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][15], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][15], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][15], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][15], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][15], true);

	BeKhoa_TD[playerid][16] = CreatePlayerTextDraw(playerid, 259.000000, 174.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][16], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][16], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][16], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][16], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][16], true);

	BeKhoa_TD[playerid][17] = CreatePlayerTextDraw(playerid, 355.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][17], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][17], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][17], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][17], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][17], true);

	BeKhoa_TD[playerid][18] = CreatePlayerTextDraw(playerid, 331.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][18], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][18], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][18], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][18], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][18], true);

	BeKhoa_TD[playerid][19] = CreatePlayerTextDraw(playerid, 307.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][19], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][19], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][19], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][19], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][19], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][19], true);

	BeKhoa_TD[playerid][20] = CreatePlayerTextDraw(playerid, 283.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][20], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][20], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][20], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][20], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][20], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][20], true);

	BeKhoa_TD[playerid][21] = CreatePlayerTextDraw(playerid, 259.000000, 198.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][21], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][21], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][21], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][21], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][21], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][21], true);

	BeKhoa_TD[playerid][22] = CreatePlayerTextDraw(playerid, 355.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][22], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][22], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][22], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][22], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][22], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][22], true);

	BeKhoa_TD[playerid][23] = CreatePlayerTextDraw(playerid, 331.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][23], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][23], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][23], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][23], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][23], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][23], true);

	BeKhoa_TD[playerid][24] = CreatePlayerTextDraw(playerid, 307.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][24], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][24], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][24], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][24], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][24], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][24], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][24], true);

	BeKhoa_TD[playerid][25] = CreatePlayerTextDraw(playerid, 283.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][25], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][25], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][25], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][25], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][25], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][25], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][25], true);

	BeKhoa_TD[playerid][26] = CreatePlayerTextDraw(playerid, 259.000000, 222.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][26], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][26], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][26], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][26], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][26], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][26], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][26], true);

	BeKhoa_TD[playerid][27] = CreatePlayerTextDraw(playerid, 355.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][27], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][27], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][27], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][27], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][27], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][27], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][27], true);

	BeKhoa_TD[playerid][28] = CreatePlayerTextDraw(playerid, 331.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][28], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][28], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][28], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][28], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][28], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][28], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][28], true);

	BeKhoa_TD[playerid][29] = CreatePlayerTextDraw(playerid, 307.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][29], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][29], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][29], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][29], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][29], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][29], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][29], true);

	BeKhoa_TD[playerid][30] = CreatePlayerTextDraw(playerid, 283.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][30], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][30], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][30], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][30], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][30], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][30], true);

	BeKhoa_TD[playerid][31] = CreatePlayerTextDraw(playerid, 259.000000, 246.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][31], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][31], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][31], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][31], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][31], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][31], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][31], true);

	BeKhoa_TD[playerid][32] = CreatePlayerTextDraw(playerid, 355.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][32], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][32], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][32], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][32], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][32], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][32], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][32], true);

	BeKhoa_TD[playerid][33] = CreatePlayerTextDraw(playerid, 331.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][33], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][33], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][33], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][33], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][33], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][33], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][33], true);

	BeKhoa_TD[playerid][34] = CreatePlayerTextDraw(playerid, 307.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][34], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][34], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][34], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][34], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][34], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][34], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][34], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][34], true);

	BeKhoa_TD[playerid][35] = CreatePlayerTextDraw(playerid, 283.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][35], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][35], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][35], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][35], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][35], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][35], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][35], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][35], true);

	BeKhoa_TD[playerid][36] = CreatePlayerTextDraw(playerid, 259.000000, 270.000000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, BeKhoa_TD[playerid][36], 20.000000, 20.000000);
	PlayerTextDrawAlignment(playerid, BeKhoa_TD[playerid][36], 1);
	PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][36], 169552639);
	PlayerTextDrawSetShadow(playerid, BeKhoa_TD[playerid][36], 0);
	PlayerTextDrawBackgroundColor(playerid, BeKhoa_TD[playerid][36], 255);
	PlayerTextDrawFont(playerid, BeKhoa_TD[playerid][36], 4);
	PlayerTextDrawSetProportional(playerid, BeKhoa_TD[playerid][36], 0);
	PlayerTextDrawSetSelectable(playerid, BeKhoa_TD[playerid][36], true);

	///

	TDE_ChatHoTro_P[playerid][0] = CreatePlayerTextDraw(playerid, 320.785583, 368.499969, "");
	PlayerTextDrawLetterSize(playerid, TDE_ChatHoTro_P[playerid][0], 0.311833, 1.431664);
	PlayerTextDrawAlignment(playerid, TDE_ChatHoTro_P[playerid][0], 2);
	PlayerTextDrawColor(playerid, TDE_ChatHoTro_P[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, TDE_ChatHoTro_P[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, TDE_ChatHoTro_P[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, TDE_ChatHoTro_P[playerid][0], 255);
	PlayerTextDrawFont(playerid, TDE_ChatHoTro_P[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TDE_ChatHoTro_P[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TDE_ChatHoTro_P[playerid][0], 0);


	VehicleText[playerid][0] = CreatePlayerTextDraw(playerid, 333.800933, 347.224609, "Mo khoa phuong tien (thanh cong)");
	PlayerTextDrawLetterSize(playerid, VehicleText[playerid][0], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, VehicleText[playerid][0], 0.000000, 221.000000);
	PlayerTextDrawAlignment(playerid, VehicleText[playerid][0], 2);
	PlayerTextDrawColor(playerid, VehicleText[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, VehicleText[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, VehicleText[playerid][0], -1744830364);
	PlayerTextDrawSetShadow(playerid, VehicleText[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, VehicleText[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, VehicleText[playerid][0], 255);
	PlayerTextDrawFont(playerid, VehicleText[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, VehicleText[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, VehicleText[playerid][0], 0);

	NguDanText[playerid][0] = CreatePlayerTextDraw(playerid, 5.500000, 143.187500, "box");
	PlayerTextDrawLetterSize(playerid, NguDanText[playerid][0], 0.000000, 6.422988);
	PlayerTextDrawTextSize(playerid, NguDanText[playerid][0], 75.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, NguDanText[playerid][0], 1);
	PlayerTextDrawColor(playerid, NguDanText[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, NguDanText[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, NguDanText[playerid][0], 404232216);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, NguDanText[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, NguDanText[playerid][0], 255);
	PlayerTextDrawFont(playerid, NguDanText[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, NguDanText[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][0], 0);

	NguDanText[playerid][1] = CreatePlayerTextDraw(playerid, 61.800064, 130.950134, "Ngu Dan");
	PlayerTextDrawLetterSize(playerid, NguDanText[playerid][1], 0.335000, 1.285000);
	PlayerTextDrawAlignment(playerid, NguDanText[playerid][1], 3);
	PlayerTextDrawColor(playerid, NguDanText[playerid][1], -1378294017);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, NguDanText[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, NguDanText[playerid][1], 255);
	PlayerTextDrawFont(playerid, NguDanText[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, NguDanText[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][1], 0);

	NguDanText[playerid][2] = CreatePlayerTextDraw(playerid, 66.800010, 151.274749, "~y~/thaluoi ~w~de tien hanh tha luoi");
	PlayerTextDrawLetterSize(playerid, NguDanText[playerid][2], 0.257499, 1.494999);
	PlayerTextDrawAlignment(playerid, NguDanText[playerid][2], 3);
	PlayerTextDrawColor(playerid, NguDanText[playerid][2], -1061109505);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, NguDanText[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, NguDanText[playerid][2], 255);
	PlayerTextDrawFont(playerid, NguDanText[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, NguDanText[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][2], 0);

	NguDanText[playerid][3] = CreatePlayerTextDraw(playerid, 60.499984, 194.100280, "So ca hien tai:300");
	PlayerTextDrawLetterSize(playerid, NguDanText[playerid][3], 0.147499, 0.847499);
	PlayerTextDrawAlignment(playerid, NguDanText[playerid][3], 3);
	PlayerTextDrawColor(playerid, NguDanText[playerid][3], -1061109505);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, NguDanText[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, NguDanText[playerid][3], 255);
	PlayerTextDrawFont(playerid, NguDanText[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, NguDanText[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, NguDanText[playerid][3], 0);


	
	JoinJob[playerid][0] = CreatePlayerTextDraw(playerid, 255.000000, 326.000000, "CHAO BAN TOI CO THE GIUP GI CHO BAN");
	PlayerTextDrawFont(playerid, JoinJob[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, JoinJob[playerid][0], 0.179166, 2.350000);
	PlayerTextDrawTextSize(playerid, JoinJob[playerid][0], 402.500000, -234.500000);
	PlayerTextDrawSetOutline(playerid, JoinJob[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, JoinJob[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, JoinJob[playerid][0], 1);
	PlayerTextDrawColor(playerid, JoinJob[playerid][0], -168436481);
	PlayerTextDrawBackgroundColor(playerid, JoinJob[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, JoinJob[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, JoinJob[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, JoinJob[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, JoinJob[playerid][0], 0);

	JoinJob[playerid][1] = CreatePlayerTextDraw(playerid, 283.000000, 351.000000, "XIN VIEC");
	PlayerTextDrawFont(playerid, JoinJob[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, JoinJob[playerid][1], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, JoinJob[playerid][1], 26.500000, 56.500000);
	PlayerTextDrawSetOutline(playerid, JoinJob[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, JoinJob[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, JoinJob[playerid][1], 2);
	PlayerTextDrawColor(playerid, JoinJob[playerid][1], -2686721);
	PlayerTextDrawBackgroundColor(playerid, JoinJob[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, JoinJob[playerid][1], 200);
	PlayerTextDrawUseBox(playerid, JoinJob[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, JoinJob[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, JoinJob[playerid][1], 1);

	JoinJob[playerid][2] = CreatePlayerTextDraw(playerid, 365.000000, 350.000000, "thoat cong viec hien tai");
	PlayerTextDrawFont(playerid, JoinJob[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, JoinJob[playerid][2], 0.258333, 1.100000);
	PlayerTextDrawTextSize(playerid, JoinJob[playerid][2], 56.500000, 76.500000);
	PlayerTextDrawSetOutline(playerid, JoinJob[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, JoinJob[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, JoinJob[playerid][2], 2);
	PlayerTextDrawColor(playerid, JoinJob[playerid][2], -421070081);
	PlayerTextDrawBackgroundColor(playerid, JoinJob[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, JoinJob[playerid][2], 200);
	PlayerTextDrawUseBox(playerid, JoinJob[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, JoinJob[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, JoinJob[playerid][2], 1);

	JoinJob[playerid][3] = CreatePlayerTextDraw(playerid, 400.000000, 311.000000, "X");
	PlayerTextDrawFont(playerid, JoinJob[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, JoinJob[playerid][3], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, JoinJob[playerid][3], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, JoinJob[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, JoinJob[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, JoinJob[playerid][3], 2);
	PlayerTextDrawColor(playerid, JoinJob[playerid][3], -16776961);
	PlayerTextDrawBackgroundColor(playerid, JoinJob[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, JoinJob[playerid][3], 200);
	PlayerTextDrawUseBox(playerid, JoinJob[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, JoinJob[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, JoinJob[playerid][3], 1);

	LumberJackTextDraw[playerid] = CreatePlayerTextDraw(playerid, 552.000000, 235.000000, "");
	PlayerTextDrawFont(playerid, LumberJackTextDraw[playerid], 2);
	PlayerTextDrawLetterSize(playerid, LumberJackTextDraw[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, LumberJackTextDraw[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, LumberJackTextDraw[playerid], 1);
	PlayerTextDrawSetShadow(playerid, LumberJackTextDraw[playerid], 0);
	PlayerTextDrawAlignment(playerid, LumberJackTextDraw[playerid], 1);
	PlayerTextDrawColor(playerid, LumberJackTextDraw[playerid], -1094795521);
	PlayerTextDrawBackgroundColor(playerid, LumberJackTextDraw[playerid], 255);
	PlayerTextDrawBoxColor(playerid, LumberJackTextDraw[playerid], 50);
	PlayerTextDrawUseBox(playerid, LumberJackTextDraw[playerid], 0);
	PlayerTextDrawSetProportional(playerid, LumberJackTextDraw[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, LumberJackTextDraw[playerid], 0);
	
	NotiEms[playerid] = CreatePlayerTextDraw(playerid, 386.000000, 388.000000, "~g~Ban dang bi thuong khong the di chuyen");
	PlayerTextDrawFont(playerid, NotiEms[playerid], 1);
	PlayerTextDrawLetterSize(playerid, NotiEms[playerid], 0.141666, 1.000000);
	PlayerTextDrawTextSize(playerid, NotiEms[playerid], -5.000000, -98.000000);
	PlayerTextDrawSetOutline(playerid, NotiEms[playerid], 1);
	PlayerTextDrawSetShadow(playerid, NotiEms[playerid], 0);
	PlayerTextDrawAlignment(playerid, NotiEms[playerid], 3);
	PlayerTextDrawColor(playerid, NotiEms[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, NotiEms[playerid], 255);
	PlayerTextDrawBoxColor(playerid, NotiEms[playerid], 50);
	PlayerTextDrawUseBox(playerid, NotiEms[playerid], 0);
	PlayerTextDrawSetProportional(playerid, NotiEms[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, NotiEms[playerid], 0);

	Notistr[playerid] = CreatePlayerTextDraw(playerid, 386.000000, 388.000000, "");
	PlayerTextDrawFont(playerid, Notistr[playerid], 1);
	PlayerTextDrawLetterSize(playerid, Notistr[playerid], 0.141666, 1.000000);
	PlayerTextDrawTextSize(playerid, Notistr[playerid], -5.000000, -98.000000);
	PlayerTextDrawSetOutline(playerid, Notistr[playerid], 1);
	PlayerTextDrawSetShadow(playerid, Notistr[playerid], 0);
	PlayerTextDrawAlignment(playerid, Notistr[playerid], 3);
	PlayerTextDrawColor(playerid, Notistr[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, Notistr[playerid], 255);
	PlayerTextDrawBoxColor(playerid, Notistr[playerid], 50);
	PlayerTextDrawUseBox(playerid, Notistr[playerid], 0);
	PlayerTextDrawSetProportional(playerid, Notistr[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, Notistr[playerid], 0);



	EngineVeh[playerid] = CreatePlayerTextDraw(playerid, 266.000000, 385.000000, "");
	PlayerTextDrawFont(playerid, EngineVeh[playerid], 1);
	PlayerTextDrawLetterSize(playerid, EngineVeh[playerid], 0.224999, 1.500000);
	PlayerTextDrawTextSize(playerid, EngineVeh[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, EngineVeh[playerid], 1);
	PlayerTextDrawSetShadow(playerid, EngineVeh[playerid], 0);
	PlayerTextDrawAlignment(playerid, EngineVeh[playerid], 1);
	PlayerTextDrawColor(playerid, EngineVeh[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, EngineVeh[playerid], 255);
	PlayerTextDrawBoxColor(playerid, EngineVeh[playerid], 50);
	PlayerTextDrawUseBox(playerid, EngineVeh[playerid], 0);
	PlayerTextDrawSetProportional(playerid, EngineVeh[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, EngineVeh[playerid], 0);
	
	EnterVeh[playerid] = CreatePlayerTextDraw(playerid, 386.000000, 388.000000, "~w~Nhan '~g~N~w~' or '~g~/engine~w~' de khoi dong phuong tien");
	PlayerTextDrawFont(playerid, EnterVeh[playerid], 1);
	PlayerTextDrawLetterSize(playerid, EnterVeh[playerid], 0.141666, 1.000000);
	PlayerTextDrawTextSize(playerid, EnterVeh[playerid], -5.000000, -98.000000);
	PlayerTextDrawSetOutline(playerid, EnterVeh[playerid], 1);
	PlayerTextDrawSetShadow(playerid, EnterVeh[playerid], 0);
	PlayerTextDrawAlignment(playerid, EnterVeh[playerid], 3);
	PlayerTextDrawColor(playerid, EnterVeh[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, EnterVeh[playerid], 255);
	PlayerTextDrawBoxColor(playerid, EnterVeh[playerid], 50);
	PlayerTextDrawUseBox(playerid, EnterVeh[playerid], 0);
	PlayerTextDrawSetProportional(playerid, EnterVeh[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, EnterVeh[playerid], 0);

	//Shop Notice Textdraw
	ShopNotice[playerid] = CreatePlayerTextDraw(playerid,16.000000, 193.000000, "_");
	PlayerTextDrawBackgroundColor(playerid, ShopNotice[playerid], 255);
	PlayerTextDrawFont(playerid, ShopNotice[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ShopNotice[playerid], 0.289999, 1.299999);
	PlayerTextDrawColor(playerid, ShopNotice[playerid], -1);
	PlayerTextDrawSetOutline(playerid, ShopNotice[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ShopNotice[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ShopNotice[playerid], 1);
	PlayerTextDrawUseBox(playerid, ShopNotice[playerid], 1);
	PlayerTextDrawBoxColor(playerid, ShopNotice[playerid], 75);
	PlayerTextDrawTextSize(playerid, ShopNotice[playerid], 186.000000, 63.000000);
	PlayerTextDrawSetSelectable(playerid, ShopNotice[playerid], 0);
	
	//LEO Textdraws
	BackupText[playerid] = CreatePlayerTextDraw(playerid, 505 ,179 , "~r~Backup call active");
	PlayerTextDrawFont(playerid,BackupText[playerid] , 1);
	PlayerTextDrawLetterSize(playerid,BackupText[playerid] , 0.270000, 2.000000);
	PlayerTextDrawColor(playerid,BackupText[playerid] , -1);
	PlayerTextDrawSetOutline(playerid,BackupText[playerid] , true);
	PlayerTextDrawSetProportional(playerid,BackupText[playerid] , true);
	PlayerTextDrawSetShadow(playerid, BackupText[playerid] , 1);


	entertx[playerid] = CreatePlayerTextDraw(playerid, 102.000, 424.000, "mdl-2003:safezone");
    PlayerTextDrawTextSize(playerid, entertx[playerid], 91.000, 23.000);
    PlayerTextDrawAlignment(playerid, entertx[playerid], 1);
    PlayerTextDrawColor(playerid, entertx[playerid], -1);
    PlayerTextDrawSetShadow(playerid, entertx[playerid], 0);
    PlayerTextDrawSetOutline(playerid, entertx[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, entertx[playerid], 255);
    PlayerTextDrawFont(playerid, entertx[playerid], 4);
    PlayerTextDrawSetProportional(playerid, entertx[playerid], 1);


	rangecp[playerid] = CreatePlayerTextDraw(playerid, 372.000000, 31.000000, "");
	PlayerTextDrawFont(playerid, rangecp[playerid], 1);
	PlayerTextDrawLetterSize(playerid, rangecp[playerid], 0.299999, 0.950001);
	PlayerTextDrawTextSize(playerid, rangecp[playerid], 733.000000, -102.500000);
	PlayerTextDrawSetOutline(playerid, rangecp[playerid], 1);
	PlayerTextDrawSetShadow(playerid, rangecp[playerid], 0);
	PlayerTextDrawAlignment(playerid, rangecp[playerid], 3);
	PlayerTextDrawColor(playerid, rangecp[playerid], -168436481);
	PlayerTextDrawBackgroundColor(playerid, rangecp[playerid], 255);
	PlayerTextDrawBoxColor(playerid, rangecp[playerid], 50);
	PlayerTextDrawUseBox(playerid, rangecp[playerid], 0);
	PlayerTextDrawSetProportional(playerid, rangecp[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, rangecp[playerid], 0);

	
	_crTextTarget[playerid] = CreatePlayerTextDraw(playerid, 151.000000, 372.000000, "Target Vehicle: ~r~N/A");
	PlayerTextDrawFont(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTextTarget[playerid], 0.183331, 1.000000);
	PlayerTextDrawTextSize(playerid, _crTextTarget[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawSetShadow(playerid, _crTextTarget[playerid], 0);
	PlayerTextDrawAlignment(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawColor(playerid, _crTextTarget[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, _crTextTarget[playerid], 255);
	PlayerTextDrawBoxColor(playerid, _crTextTarget[playerid], 50);
	PlayerTextDrawUseBox(playerid, _crTextTarget[playerid], 0);
	PlayerTextDrawSetProportional(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, _crTextTarget[playerid], 0);

	/*_crTextTarget[playerid] = CreatePlayerTextDraw(playerid, 320.000000, 388.000000, "Target Vehicle: ~r~N/A");
	PlayerTextDrawAlignment(playerid, _crTextTarget[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, _crTextTarget[playerid], 255);
	PlayerTextDrawFont(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTextTarget[playerid], 0.500000, 1.600000);
	PlayerTextDrawColor(playerid, _crTextTarget[playerid], -1);
	PlayerTextDrawSetOutline(playerid, _crTextTarget[playerid], 1);
	PlayerTextDrawSetProportional(playerid, _crTextTarget[playerid], 1);*/

	_crTextSpeed[playerid] = CreatePlayerTextDraw(playerid, 151.000000, 383.000000, "Speed: ~r~N/A");
	PlayerTextDrawFont(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTextSpeed[playerid], 0.183331, 1.000000);
	PlayerTextDrawTextSize(playerid, _crTextSpeed[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, _crTextSpeed[playerid], 0);
	PlayerTextDrawAlignment(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawColor(playerid, _crTextSpeed[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, _crTextSpeed[playerid], 255);
	PlayerTextDrawBoxColor(playerid, _crTextSpeed[playerid], 50);
	PlayerTextDrawUseBox(playerid, _crTextSpeed[playerid], 0);
	PlayerTextDrawSetProportional(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, _crTextSpeed[playerid], 0);

	/*_crTextSpeed[playerid] = CreatePlayerTextDraw(playerid, 190.000000, 410.000000, "Toc do: ~r~N/A");
	PlayerTextDrawAlignment(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, _crTextSpeed[playerid], 255);
	PlayerTextDrawFont(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTextSpeed[playerid], 0.500000, 1.600000);
	PlayerTextDrawColor(playerid, _crTextSpeed[playerid], -1);
	PlayerTextDrawSetOutline(playerid, _crTextSpeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, _crTextSpeed[playerid], 1);*/
	
	_crTickets[playerid] = CreatePlayerTextDraw(playerid, 151.000000, 395.000000, "Ticket: ~r~N/A");
	PlayerTextDrawFont(playerid, _crTickets[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTickets[playerid], 0.183331, 1.000000);
	PlayerTextDrawTextSize(playerid, _crTickets[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, _crTickets[playerid], 1);
	PlayerTextDrawSetShadow(playerid, _crTickets[playerid], 0);
	PlayerTextDrawAlignment(playerid, _crTickets[playerid], 1);
	PlayerTextDrawColor(playerid, _crTickets[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, _crTickets[playerid], 255);
	PlayerTextDrawBoxColor(playerid, _crTickets[playerid], 50);
	PlayerTextDrawUseBox(playerid, _crTickets[playerid], 0);
	PlayerTextDrawSetProportional(playerid, _crTickets[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, _crTickets[playerid], 0);

	/*_crTickets[playerid] = CreatePlayerTextDraw(playerid, 340.000000, 410.000000, "Tickets: ~r~N/A");
	PlayerTextDrawAlignment(playerid, _crTickets[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, _crTickets[playerid], 255);
	PlayerTextDrawFont(playerid, _crTickets[playerid], 1);
	PlayerTextDrawLetterSize(playerid, _crTickets[playerid], 0.500000, 1.600000);
	PlayerTextDrawColor(playerid, _crTickets[playerid], -1);
	PlayerTextDrawSetOutline(playerid, _crTickets[playerid], 1);
	PlayerTextDrawSetProportional(playerid, _crTickets[playerid], 1);*/
	
	_vhudVisible[playerid] = 0;
	return 1;
}

