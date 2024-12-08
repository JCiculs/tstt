#include <a_samp>
#include <YSI_Coding\y_hooks>

new PlayerText:speed_TD[MAX_PLAYERS][25];
new PlayerText:speed_PTD[MAX_PLAYERS][2];
new Text:speeds[29];

stock Speedomodel(playerid)
{

	speeds[0] = TextDrawCreate(520.1669, 371.6667, "particle:lamp_shad_64"); // ïóñòî
	TextDrawTextSize(speeds[0], 76.0000, 33.0000);
	TextDrawAlignment(speeds[0], 1);
	TextDrawColor(speeds[0], 673720351);
	TextDrawBackgroundColor(speeds[0], 255);
	TextDrawFont(speeds[0], 4);
	TextDrawSetProportional(speeds[0], 0);
	TextDrawSetShadow(speeds[0], 0);

	speeds[1] = TextDrawCreate(578.8068, 349.2500, ""); // ïóñòî
	TextDrawTextSize(speeds[1], 69.0000, 51.0000);
	TextDrawAlignment(speeds[1], 1);
	TextDrawColor(speeds[1], -40817153);
	TextDrawFont(speeds[1], 5);
	TextDrawSetProportional(speeds[1], 0);
	TextDrawSetShadow(speeds[1], 0);
	TextDrawSetPreviewModel(speeds[1], 2153);
	TextDrawSetPreviewRot(speeds[1], 0.0000, -15.0000, 90.0000, 1.0000);

	speeds[2] = TextDrawCreate(598.5870, 386.5832, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[2], 20.0000, 20.0000);
	TextDrawAlignment(speeds[2], 1);
	TextDrawColor(speeds[2], -40817153);
	TextDrawBackgroundColor(speeds[2], 255);
	TextDrawFont(speeds[2], 4);
	TextDrawSetProportional(speeds[2], 0);
	TextDrawSetShadow(speeds[2], 0);

	speeds[3] = TextDrawCreate(560.0659, 345.7499, ""); // ïóñòî
	TextDrawTextSize(speeds[3], 67.0000, 55.0000);
	TextDrawAlignment(speeds[3], 1);
	TextDrawColor(speeds[3], -40817153);
	TextDrawFont(speeds[3], 5);
	TextDrawSetProportional(speeds[3], 0);
	TextDrawSetShadow(speeds[3], 0);
	TextDrawSetPreviewModel(speeds[3], 2153);
	TextDrawSetPreviewRot(speeds[3], 0.0000, -15.0000, 90.0000, 1.0000);

	speeds[4] = TextDrawCreate(584.4331, 392.4166, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[4], 24.0000, 11.0000);
	TextDrawAlignment(speeds[4], 1);
	TextDrawColor(speeds[4], -40817153);
	TextDrawBackgroundColor(speeds[4], 255);
	TextDrawFont(speeds[4], 4);
	TextDrawSetProportional(speeds[4], 0);
	TextDrawSetShadow(speeds[4], 0);

	speeds[5] = TextDrawCreate(576.0000, 387.0000, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[5], 20.0000, 20.0000);
	TextDrawAlignment(speeds[5], 1);
	TextDrawColor(speeds[5], -40817153);
	TextDrawBackgroundColor(speeds[5], 255);
	TextDrawFont(speeds[5], 4);
	TextDrawSetProportional(speeds[5], 0);
	TextDrawSetShadow(speeds[5], 0);

	speeds[6] = TextDrawCreate(600.3627, 346.3332, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[6], 24.0000, 11.0000);
	TextDrawAlignment(speeds[6], 1);
	TextDrawColor(speeds[6], -40817153);
	TextDrawBackgroundColor(speeds[6], 255);
	TextDrawFont(speeds[6], 4);
	TextDrawSetProportional(speeds[6], 0);
	TextDrawSetShadow(speeds[6], 0);

	speeds[7] = TextDrawCreate(590.6226, 342.8333, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[7], 20.0000, 20.0000);
	TextDrawAlignment(speeds[7], 1);
	TextDrawColor(speeds[7], -40817153);
	TextDrawBackgroundColor(speeds[7], 255);
	TextDrawFont(speeds[7], 4);
	TextDrawSetProportional(speeds[7], 0);
	TextDrawSetShadow(speeds[7], 0);

	speeds[8] = TextDrawCreate(597.5516, 353.3333, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[8], 17.0000, 44.0000);
	TextDrawAlignment(speeds[8], 1);
	TextDrawColor(speeds[8], -40817153);
	TextDrawBackgroundColor(speeds[8], 255);
	TextDrawFont(speeds[8], 4);
	TextDrawSetProportional(speeds[8], 0);
	TextDrawSetShadow(speeds[8], 0);

	speeds[9] = TextDrawCreate(614.5171, 342.8333, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[9], 20.0000, 20.0000);
	TextDrawAlignment(speeds[9], 1);
	TextDrawColor(speeds[9], -40817153);
	TextDrawBackgroundColor(speeds[9], 255);
	TextDrawFont(speeds[9], 4);
	TextDrawSetProportional(speeds[9], 0);
	TextDrawSetShadow(speeds[9], 0);

	speeds[10] = TextDrawCreate(625.1155, 413.0834, "particle:lamp_shad_64"); // ïóñòî
	TextDrawTextSize(speeds[10], -131.0000, -67.0000);
	TextDrawAlignment(speeds[10], 1);
	TextDrawColor(speeds[10], 673720436);
	TextDrawBackgroundColor(speeds[10], 255);
	TextDrawFont(speeds[10], 4);
	TextDrawSetProportional(speeds[10], 0);
	TextDrawSetShadow(speeds[10], 0);

	speeds[11] = TextDrawCreate(570.0070, 366.1667, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[11], 15.0000, 15.0000);
	TextDrawAlignment(speeds[11], 1);
	TextDrawColor(speeds[11], 336860415);
	TextDrawBackgroundColor(speeds[11], 255);
	TextDrawFont(speeds[11], 4);
	TextDrawSetProportional(speeds[11], 0);
	TextDrawSetShadow(speeds[11], 0);

	speeds[12] = TextDrawCreate(575.0589, 374.3332, ""); // ïóñòî
	TextDrawTextSize(speeds[12], 10.0000, 9.0000);
	TextDrawAlignment(speeds[12], 1);
	TextDrawColor(speeds[12], 336860415);
	TextDrawBackgroundColor(speeds[12], 336860160);
	TextDrawFont(speeds[12], 5);
	TextDrawSetProportional(speeds[12], 0);
	TextDrawSetShadow(speeds[12], 0);
	TextDrawSetPreviewModel(speeds[12], 2153);
	TextDrawSetPreviewRot(speeds[12], 0.0000, -15.0000, 90.0000, 1.0000);

	speeds[13] = TextDrawCreate(568.1330, 373.1668, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[13], 15.0000, 15.0000);
	TextDrawAlignment(speeds[13], 1);
	TextDrawColor(speeds[13], 336860415);
	TextDrawBackgroundColor(speeds[13], 255);
	TextDrawFont(speeds[13], 4);
	TextDrawSetProportional(speeds[13], 0);
	TextDrawSetShadow(speeds[13], 0);

	speeds[14] = TextDrawCreate(517.4339, 368.5000, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[14], 59.0000, 17.5000);
	TextDrawAlignment(speeds[14], 1);
	TextDrawColor(speeds[14], 336860415);
	TextDrawBackgroundColor(speeds[14], 255);
	TextDrawFont(speeds[14], 4);
	TextDrawSetProportional(speeds[14], 0);
	TextDrawSetShadow(speeds[14], 0);

	speeds[15] = TextDrawCreate(511.4421, 366.1667, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[15], 15.0000, 15.0000);
	TextDrawAlignment(speeds[15], 1);
	TextDrawColor(speeds[15], 336860415);
	TextDrawBackgroundColor(speeds[15], 255);
	TextDrawFont(speeds[15], 4);
	TextDrawSetProportional(speeds[15], 0);
	TextDrawSetShadow(speeds[15], 0);

	speeds[16] = TextDrawCreate(519.3051, 380.1664, ""); // ïóñòî
	TextDrawTextSize(speeds[16], -10.0000, -9.0000);
	TextDrawAlignment(speeds[16], 1);
	TextDrawColor(speeds[16], 336860415);
	TextDrawBackgroundColor(speeds[16], 336860160);
	TextDrawFont(speeds[16], 5);
	TextDrawSetProportional(speeds[16], 0);
	TextDrawSetShadow(speeds[16], 0);
	TextDrawSetPreviewModel(speeds[16], 2153);
	TextDrawSetPreviewRot(speeds[16], 0.0000, -15.0000, 90.0000, 1.0000);

	speeds[17] = TextDrawCreate(509.0996, 373.1667, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[17], 15.0000, 15.0000);
	TextDrawAlignment(speeds[17], 1);
	TextDrawColor(speeds[17], 336860415);
	TextDrawBackgroundColor(speeds[17], 255);
	TextDrawFont(speeds[17], 4);
	TextDrawSetProportional(speeds[17], 0);
	TextDrawSetShadow(speeds[17], 0);

	speeds[18] = TextDrawCreate(518.0017, 379.0000, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[18], 57.0000, 3.0000);
	TextDrawAlignment(speeds[18], 1);
	TextDrawColor(speeds[18], -1166921985);
	TextDrawBackgroundColor(speeds[18], 255);
	TextDrawFont(speeds[18], 4);
	TextDrawSetProportional(speeds[18], 0);
	TextDrawSetShadow(speeds[18], 0);

	speeds[19] = TextDrawCreate(518.0017, 379.0000, "LD_SPAC:white"); // ïóñòî
	TextDrawTextSize(speeds[19], 31.0000, 3.0000);
	TextDrawAlignment(speeds[19], 1);
	TextDrawColor(speeds[19], -124373249);
	TextDrawBackgroundColor(speeds[19], 255);
	TextDrawFont(speeds[19], 4);
	TextDrawSetProportional(speeds[19], 0);
	TextDrawSetShadow(speeds[19], 0);

	speeds[20] = TextDrawCreate(535.9739, 367.9167, "FILL_146"); // ïóñòî
	TextDrawLetterSize(speeds[20], 0.1151, 1.0808);
	TextDrawAlignment(speeds[20], 1);
	TextDrawColor(speeds[20], -1);
	TextDrawBackgroundColor(speeds[20], 255);
	TextDrawFont(speeds[20], 2);
	TextDrawSetProportional(speeds[20], 1);
	TextDrawSetShadow(speeds[20], 0);

	speeds[21] = TextDrawCreate(516.0000, 351.0000, "LOCK"); // ïóñòî
	TextDrawLetterSize(speeds[21], 0.1802, 1.1916);
	TextDrawAlignment(speeds[21], 1);
	TextDrawColor(speeds[21], -459199745);
	TextDrawBackgroundColor(speeds[21], 255);
	TextDrawFont(speeds[21], 1);
	TextDrawSetProportional(speeds[21], 1);
	TextDrawSetShadow(speeds[21], 0);

	speeds[22] = TextDrawCreate(538.0000, 351.0000, "ENGINE"); // ïóñòî
	TextDrawLetterSize(speeds[22], 0.1802, 1.1916);
	TextDrawAlignment(speeds[22], 1);
	TextDrawColor(speeds[22], -1);
	TextDrawBackgroundColor(speeds[22], 255);
	TextDrawFont(speeds[22], 1);
	TextDrawSetProportional(speeds[22], 1);
	TextDrawSetShadow(speeds[22], 0);

	speeds[23] = TextDrawCreate(566.0000, 351.0000, "LIGHT"); // ïóñòî
	TextDrawLetterSize(speeds[23], 0.1802, 1.1916);
	TextDrawAlignment(speeds[23], 1);
	TextDrawColor(speeds[23], -1);
	TextDrawBackgroundColor(speeds[23], 255);
	TextDrawFont(speeds[23], 1);
	TextDrawSetProportional(speeds[23], 1);
	TextDrawSetShadow(speeds[23], 0);

	speeds[24] = TextDrawCreate(576.0000, 386.5000, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[24], 20.0000, 20.5000);
	TextDrawAlignment(speeds[24], 1);
	TextDrawColor(speeds[24], 336860415);
	TextDrawBackgroundColor(speeds[24], 255);
	TextDrawFont(speeds[24], 4);
	TextDrawSetProportional(speeds[24], 0);
	TextDrawSetShadow(speeds[24], 0);

	speeds[25] = TextDrawCreate(589.0000, 391.0000, "KM/H"); // ïóñòî
	TextDrawLetterSize(speeds[25], 0.1287, 1.1566);
	TextDrawAlignment(speeds[25], 1);
	TextDrawColor(speeds[25], -1);
	TextDrawBackgroundColor(speeds[25], 255);
	TextDrawFont(speeds[25], 2);
	TextDrawSetProportional(speeds[25], 1);
	TextDrawSetShadow(speeds[25], 0);

	speeds[26] = TextDrawCreate(598.5870, 386.5832, "ld_beat:chit"); // ïóñòî
	TextDrawTextSize(speeds[26], 20.0000, 20.0000);
	TextDrawAlignment(speeds[26], 1);
	TextDrawColor(speeds[26], 336860415);
	TextDrawBackgroundColor(speeds[26], 255);
	TextDrawFont(speeds[26], 4);
	TextDrawSetProportional(speeds[26], 0);
	TextDrawSetShadow(speeds[26], 0);

	speeds[27] = TextDrawCreate(585.4685, 390.0833, "ld_spac:white"); // ïóñòî
	TextDrawTextSize(speeds[27], 23.0000, 13.5000);
	TextDrawAlignment(speeds[27], 1);
	TextDrawColor(speeds[27], 336860415);
	TextDrawBackgroundColor(speeds[27], 255);
	TextDrawFont(speeds[27], 4);
	TextDrawSetProportional(speeds[27], 0);
	TextDrawSetShadow(speeds[27], 0);

	speeds[28] = TextDrawCreate(597.0000, 364.0000, "255"); // ïóñòî
	TextDrawLetterSize(speeds[28], 0.2734, 1.5008);
	TextDrawTextSize(speeds[28], -22.0000, 0.0000);
	TextDrawAlignment(speeds[28], 1);
	TextDrawColor(speeds[28], -1);
	TextDrawSetOutline(speeds[28], 1);
	TextDrawBackgroundColor(speeds[28], 134);
	TextDrawFont(speeds[28], 3);
	TextDrawSetProportional(speeds[28], 1);
	TextDrawSetShadow(speeds[28], 0);


	speed_TD[playerid][0] = CreatePlayerTextDraw(playerid, 578.5000, 402.6250, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][0], 54.0000, 42.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][0], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][0], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][0], 0);

	speed_TD[playerid][1] = CreatePlayerTextDraw(playerid, 552.5000, 402.5624, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][1], 22.0000, 42.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][1], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][1], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][1], 0);

	speed_TD[playerid][2] = CreatePlayerTextDraw(playerid, 525.7065, 402.5624, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][2], 22.0000, 42.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][2], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][2], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][2], 0);

	speed_TD[playerid][3] = CreatePlayerTextDraw(playerid, 493.7065, 392.7873, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][3], 64.0000, 62.1199);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][3], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][3], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][3], 0);

	speed_TD[playerid][4] = CreatePlayerTextDraw(playerid, 578.9002, 403.2999, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][4], 53.0000, 40.9198);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][4], 255);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][4], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][4], 0);

	speed_TD[playerid][5] = CreatePlayerTextDraw(playerid, 552.7016, 403.1498, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][5], 21.0000, 41.2401);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][5], 255);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][5], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][5], 0);

	speed_TD[playerid][6] = CreatePlayerTextDraw(playerid, 526.0081, 403.1498, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][6], 21.0000, 41.2401);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][6], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][6], 0);

	speed_TD[playerid][7] = CreatePlayerTextDraw(playerid, 495.5066, 393.0873, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][7], 61.0000, 61.6100);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][7], 255);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][7], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][7], 0);

	speed_TD[playerid][8] = CreatePlayerTextDraw(playerid, 543.5000, 415.7500, "000"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_TD[playerid][8], 0.4000, 1.6000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][8], 3);
	PlayerTextDrawColor(playerid, speed_TD[playerid][8], 1566400832);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][8], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][8], 0);

	speed_TD[playerid][9] = CreatePlayerTextDraw(playerid, 585.5001, 410.0999, "ENGINE"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_TD[playerid][9], 0.1820, 0.8518);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][9], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][9], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][9], 0);

	speed_TD[playerid][10] = CreatePlayerTextDraw(playerid, 585.8000, 420.1005, "LOCK"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_TD[playerid][10], 0.1820, 0.8518);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][10], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][10], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][10], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][10], 0);

	speed_TD[playerid][11] = CreatePlayerTextDraw(playerid, 585.7000, 430.4012, "LIGHT"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_TD[playerid][11], 0.1820, 0.8518);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][11], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][11], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][11], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][11], 0);

	speed_TD[playerid][12] = CreatePlayerTextDraw(playerid, 624.8068, 411.2874, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][12], -7.0000, 7.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][12], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][12], 5391615);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][12], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][12], 0);

	speed_TD[playerid][13] = CreatePlayerTextDraw(playerid, 624.8068, 421.3880, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][13], -7.0000, 7.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][13], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][13], 5391615);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][13], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][13], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][13], 0);

	speed_TD[playerid][14] = CreatePlayerTextDraw(playerid, 624.8068, 431.0886, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][14], -7.0000, 7.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][14], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][14], 1828716799);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][14], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][14], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][14], 0);

	speed_TD[playerid][15] = CreatePlayerTextDraw(playerid, 554.7070, 411.4131, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][15], 6.0000, 5.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][15], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][15], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][15], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][15], 0);

	speed_TD[playerid][16] = CreatePlayerTextDraw(playerid, 563.3049, 411.4131, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][16], 6.0000, 5.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][16], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][16], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][16], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][16], 0);

	speed_TD[playerid][17] = CreatePlayerTextDraw(playerid, 563.6049, 426.2140, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][17], 6.0000, 5.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][17], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][17], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][17], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][17], 0);

	speed_TD[playerid][18] = CreatePlayerTextDraw(playerid, 554.9070, 426.2140, "Ld_beat:chit"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][18], 6.0000, 5.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][18], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][18], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][18], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][18], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][18], 0);

	speed_TD[playerid][19] = CreatePlayerTextDraw(playerid, 557.7001, 412.2375, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][19], 10.0000, 3.0799);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][19], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][19], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][19], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][19], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][19], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][19], 0);

	speed_TD[playerid][20] = CreatePlayerTextDraw(playerid, 555.8006, 413.3376, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][20], 3.8399, 15.1600);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][20], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][20], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][20], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][20], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][20], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][20], 0);

	speed_TD[playerid][21] = CreatePlayerTextDraw(playerid, 557.7001, 427.2384, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][21], 10.0000, 3.0799);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][21], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][21], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][21], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][21], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][21], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][21], 0);

	speed_TD[playerid][22] = CreatePlayerTextDraw(playerid, 564.7984, 413.3376, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][22], 3.5699, 15.1600);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][22], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][22], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][22], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][22], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][22], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][22], 0);

	speed_TD[playerid][23] = CreatePlayerTextDraw(playerid, 557.7001, 418.3379, "LD_SPAC:white"); // ïóñòî
	PlayerTextDrawTextSize(playerid, speed_TD[playerid][23], 10.0000, 10.0000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][23], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][23], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][23], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][23], 4);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][23], 0);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][23], 0);

	speed_TD[playerid][24] = CreatePlayerTextDraw(playerid, 565.5002, 414.2875, "S"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_TD[playerid][24], 0.4000, 1.6000);
	PlayerTextDrawAlignment(playerid, speed_TD[playerid][24], 1);
	PlayerTextDrawColor(playerid, speed_TD[playerid][24], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_TD[playerid][24], 255);
	PlayerTextDrawFont(playerid, speed_TD[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, speed_TD[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, speed_TD[playerid][24], 0);

	speed_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 563.8001, 434.2999, "27%"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][0], 0.1405, 0.8650);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][0], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][0], 255);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][0], 0);

	speed_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 543.5000, 415.7500, "79"); // ïóñòî
	PlayerTextDrawLetterSize(playerid, speed_PTD[playerid][1], 0.4000, 1.6000);
	PlayerTextDrawAlignment(playerid, speed_PTD[playerid][1], 3);
	PlayerTextDrawColor(playerid, speed_PTD[playerid][1], 1566399999);
	PlayerTextDrawBackgroundColor(playerid, speed_PTD[playerid][1], 255);
	PlayerTextDrawFont(playerid, speed_PTD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, speed_PTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, speed_PTD[playerid][1], 0);

	return 1;
}

hook OnPlayerConnect(playerid)
{
	Speedomodel(playerid);
	return 1;
}

stock ShowSpeedo(playerid)
{
	for(new i=0;i<25;i++) PlayerTextDrawShow(playerid,speed_TD[playerid][i]);
	for(new i=0;i<2;i++) PlayerTextDrawShow(playerid,speed_PTD[playerid][i]);
	return 1;
}

stock hidespeedo(playerid)
{
	for(new i=0;i<25;i++) PlayerTextDrawHide(playerid,speed_TD[playerid][i]);
	for(new i=0;i<2;i++) PlayerTextDrawHide(playerid,speed_PTD[playerid][i]);	
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	hidespeedo(playerid);
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		ShowSpeedo(playerid);
	}
	else if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
	{
		hidespeedo(playerid);
		DeletePVar(playerid,"Dashowspeedo");
	}
	return 1;
}

hook OnPlayerUpdate(playerid)
{
	new vehicle = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid)) // Making sure the player is in a vehicle as driver
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
		{
			new speed[24];
			format(speed, sizeof(speed), "%d", floatround(player_get_speed(playerid),floatround_round));
			PlayerTextDrawSetString(playerid, speed_PTD[playerid][1], speed);
			new xang[24];
			format(xang,sizeof(xang),"%0.2f%", VehicleFuel[vehicle]);
			PlayerTextDrawSetString(playerid, speed_PTD[playerid][0],xang);
		}
	}
	return 1;
}

CMD:testspd(playerid, params[])
{
	new i;
	if(sscanf(params, "d", i)) return true;
	TextDrawShowForPlayer(playerid, speeds[i]);
	return true;
}