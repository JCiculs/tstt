tddoikhat(playerid)
{

	doikhat[0] = CreatePlayerTextDraw(playerid, 602.999877, 176.570373, "mdl-2001:burger");
	PlayerTextDrawTextSize(playerid, doikhat[0], 21.000000, 25.000000);
	PlayerTextDrawAlignment(playerid, doikhat[0], 1);
	PlayerTextDrawColor(playerid, doikhat[0], -1);
	PlayerTextDrawSetShadow(playerid, doikhat[0], 0);
	PlayerTextDrawBackgroundColor(playerid, doikhat[0], 255);
	PlayerTextDrawFont(playerid, doikhat[0], 4);
	PlayerTextDrawSetProportional(playerid, doikhat[0], 0);

	doikhat[1] = CreatePlayerTextDraw(playerid, 602.200378, 209.755538, "mdl-2001:water");
	PlayerTextDrawTextSize(playerid, doikhat[1], 24.000000, 24.000000);
	PlayerTextDrawAlignment(playerid, doikhat[1], 1);
	PlayerTextDrawColor(playerid, doikhat[1], -1);
	PlayerTextDrawSetShadow(playerid, doikhat[1], 0);
	PlayerTextDrawBackgroundColor(playerid, doikhat[1], 255);
	PlayerTextDrawFont(playerid, doikhat[1], 4);
	PlayerTextDrawSetProportional(playerid, doikhat[1], 0);

	doikhat[2] = CreatePlayerTextDraw(playerid, 612.567382, 190.685211, "1");
	PlayerTextDrawLetterSize(playerid, doikhat[2], 0.190663, 0.724740);
	PlayerTextDrawAlignment(playerid, doikhat[2], 2);
	PlayerTextDrawColor(playerid, doikhat[2], 255);
	PlayerTextDrawSetShadow(playerid, doikhat[2], 0);
	PlayerTextDrawBackgroundColor(playerid, doikhat[2], 255);
	PlayerTextDrawFont(playerid, doikhat[2], 1);
	PlayerTextDrawSetProportional(playerid, doikhat[2], 0);

	doikhat[3] = CreatePlayerTextDraw(playerid, 612.899719, 223.279479, "1");
	PlayerTextDrawLetterSize(playerid, doikhat[3], 0.190663, 0.724740);
	PlayerTextDrawTextSize(playerid, doikhat[3], 0.000000, 612.367248);
	PlayerTextDrawAlignment(playerid, doikhat[3], 2);
	PlayerTextDrawColor(playerid, doikhat[3], 255);
	PlayerTextDrawSetShadow(playerid, doikhat[3], 0);
	PlayerTextDrawBackgroundColor(playerid, doikhat[3], 255);
	PlayerTextDrawFont(playerid, doikhat[3], 1);
	PlayerTextDrawSetProportional(playerid, doikhat[3], 0);
	return 1;
}

// ADD CMD anbanh
/*
	new rand = random(5),string[10];
    PlayerInfo[pHunger] += rand;
    if(PlayerInfo[pHunger] >= 100) {
        PlayerInfo[pHunger] = 100;
	ApplyAnimation(playerid,"FOOD","EAT_BURGER",4.1,0,1,1,1,1,1);
    format(string, sizeof string, "%d", PlayerInfo[pHunger]);
    PlayerTextDrawSetString(playerid, doikhat[2], string);
    format(string, sizeof string, "%d", PlayerInfo[pKhatNuoc]);
    PlayerTextDrawSetString(playerid, doikhat[3], string);
 // ADD CMD uonguon

    	new rand = random(5),string[10];
    PlayerInfo[pKhatNuoc] += rand;
    if(PlayerInfo[pKhatNuoc] >= 100) {
        PlayerInfo[pKhatNuoc] = 100;
	ApplyAnimation(playerid,"FOOD","EAT_BURGER",4.1,0,1,1,1,1,1);
    format(string, sizeof string, "%d", PlayerInfo[pHunger]);
    PlayerTextDrawSetString(playerid, doikhat[2], string);
    format(string, sizeof string, "%d", PlayerInfo[pKhatNuoc]);
    PlayerTextDrawSetString(playerid, doikhat[3], string);
*/
