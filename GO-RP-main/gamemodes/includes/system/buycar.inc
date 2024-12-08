/*
	made by quang huy
*/

#include <YSI_Coding\y_hooks>
#include <a_samp>

//new dangmuaxe;
//new xemua;

hook OnGameModeInit()
{
	dangmuaxe = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid,reason)
{
	if(GetPVarInt(playerid,"buycars") == 1){
	    for(new i=0;i<2;i++) PlayerTextDrawHide(playerid,ChonXe_TD[playerid][i]);
		for(new i=0;i<20;i++) PlayerTextDrawHide(playerid,BanXe_TD[playerid][i]);
		dangmuaxe = 0;		
		DeletePVar(playerid,"buycars");
		DestroyVehicle(xemua);
	}	
	return 1;
}

hook OnPlayerExitVehicle(playerid,vehicleid)
{
	if(GetPVarInt(playerid,"buycars") == 1){
	    for(new i=0;i<2;i++) PlayerTextDrawHide(playerid,ChonXe_TD[playerid][i]);
		for(new i=0;i<20;i++) PlayerTextDrawHide(playerid,BanXe_TD[playerid][i]);
		dangmuaxe = 0;		
		DeletePVar(playerid,"buycars");
		DestroyVehicle(xemua);
	}
	return 1;
}

stock banxemodel(playerid)
{
	BanXe_TD[playerid][0] = CreatePlayerTextDraw(playerid, 392.999755, 115.333374, "box");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][0], 0.000000, 23.100019);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][0], 642.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, BanXe_TD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, BanXe_TD[playerid][0], 150);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][0], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][0], 1);

	BanXe_TD[playerid][1] = CreatePlayerTextDraw(playerid, 392.333251, 113.259239, "box");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][1], 0.000000, 0.099999);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][1], 696.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, BanXe_TD[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, BanXe_TD[playerid][1], -65281);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][1], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][1], 1);

	BanXe_TD[playerid][2] = CreatePlayerTextDraw(playerid, 393.333160, 326.059326, "box");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][2], 0.000000, 0.099999);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][2], 700.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][2], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, BanXe_TD[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, BanXe_TD[playerid][2], -65281);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][2], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][2], 1);

	BanXe_TD[playerid][3] = CreatePlayerTextDraw(playerid, 390.000091, 113.259277, "box");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][3], 0.000000, 23.766679);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][3], 391.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][3], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, BanXe_TD[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, BanXe_TD[playerid][3], -65281);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][3], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][3], 1);

	BanXe_TD[playerid][4] = CreatePlayerTextDraw(playerid, 638.333496, 115.748176, "box");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][4], 0.000000, 23.300006);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][4], 643.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][4], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, BanXe_TD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, BanXe_TD[playerid][4], -65281);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][4], 0);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][4], 1);

	BanXe_TD[playerid][5] = CreatePlayerTextDraw(playerid, 553.665771, 98.999969, "");
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][5], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][5], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][5], 0);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][5], 0);
	PlayerTextDrawSetPreviewModel(playerid, BanXe_TD[playerid][5], 411);
	PlayerTextDrawSetPreviewRot(playerid, BanXe_TD[playerid][5], 0.000000, 0.000000, -45.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, BanXe_TD[playerid][5], 1, 1);
	PlayerTextDrawBackgroundColor(playerid,BanXe_TD[playerid][5], 0);

	BanXe_TD[playerid][6] = CreatePlayerTextDraw(playerid, 394.000122, 123.629547, "Vehicle : Infernus");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][6], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][6], 1000.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][6], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][6], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][6], 5);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][6], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][6], 1);

	BanXe_TD[playerid][7] = CreatePlayerTextDraw(playerid, 393.333282, 169.674072, "Speed Limit : 260km/h");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][7], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][7], 643.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][7], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][7], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][7], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][7], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][7], 1);

	BanXe_TD[playerid][8] = CreatePlayerTextDraw(playerid, 394.666656, 147.688873, "Health : 2000 HP");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][8], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][8], 850.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][8], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][8], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][8], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][8], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][8], 1);

	BanXe_TD[playerid][9] = CreatePlayerTextDraw(playerid, 393.666687, 190.414855, "Slot : 2");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][9], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][9], 982.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][9], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][9], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][9], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][9], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][9], 1);

	BanXe_TD[playerid][10] = CreatePlayerTextDraw(playerid, 394.333465, 213.229690, "TypeCar : SuperCar");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][10], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][10], 900.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][10], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][10], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][10], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][10], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][10], 1);

	BanXe_TD[playerid][11] = CreatePlayerTextDraw(playerid, 551.999816, 152.511062, "");
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][11], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][11], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][11], 0);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][11], 5);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][11], 0);
	PlayerTextDrawSetPreviewModel(playerid, BanXe_TD[playerid][11], 411);
	PlayerTextDrawSetPreviewRot(playerid, BanXe_TD[playerid][11], 0.000000, 0.000000, 0.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, BanXe_TD[playerid][11], 1, 1);
	PlayerTextDrawBackgroundColor(playerid,BanXe_TD[playerid][11], 0);

	BanXe_TD[playerid][12] = CreatePlayerTextDraw(playerid, 559.332275, 203.948089, "");
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][12], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][12], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][12], 0);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][12], 5);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][12], 0);
	PlayerTextDrawSetPreviewModel(playerid, BanXe_TD[playerid][12], 411);
	PlayerTextDrawSetPreviewRot(playerid, BanXe_TD[playerid][12], 0.000000, 0.000000, 150.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, BanXe_TD[playerid][12], 1, 1);
	PlayerTextDrawBackgroundColor(playerid,BanXe_TD[playerid][12], 0);

	BanXe_TD[playerid][13] = CreatePlayerTextDraw(playerid, 464.000091, 97.911117, "Car Information");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][13], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][13], 678.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][13], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][13], 16777215);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][13], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][13], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][13], 3);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][13], 1);

	BanXe_TD[playerid][14] = CreatePlayerTextDraw(playerid, 484.333465, 85.466674, "Los Santos G");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][14], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][14], 591.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][14], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][14], -5963521);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][14], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][14], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][14], 0);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][14], 1);

	BanXe_TD[playerid][15] = CreatePlayerTextDraw(playerid, 396.000122, 235.214843, "Price :");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][15], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][15], 475.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][15], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][15], -2072969217);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][15], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][15], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][15], 1);

	BanXe_TD[playerid][16] = CreatePlayerTextDraw(playerid, 458.666595, 234.385208, "2.000.000 $");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][16], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][16], 612.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][16], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][16], -65281);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][16], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][16], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][16], 3);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][16], 1);

	ChonXe_TD[playerid][0] = CreatePlayerTextDraw(playerid, 405.087951, 283.916625, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, ChonXe_TD[playerid][0], 68.000000, 18.000000);
	PlayerTextDrawAlignment(playerid, ChonXe_TD[playerid][0], 1);
	PlayerTextDrawColor(playerid, ChonXe_TD[playerid][0], 150);
	PlayerTextDrawSetShadow(playerid, ChonXe_TD[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, ChonXe_TD[playerid][0], 255);
	PlayerTextDrawFont(playerid, ChonXe_TD[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, ChonXe_TD[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, BanXe_TD[playerid][0], true);

	ChonXe_TD[playerid][1] = CreatePlayerTextDraw(playerid, 553.609436, 283.333312, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, ChonXe_TD[playerid][1], 68.000000, 18.000000);
	PlayerTextDrawAlignment(playerid, ChonXe_TD[playerid][1], 1);
	PlayerTextDrawColor(playerid, ChonXe_TD[playerid][1], 150);
	PlayerTextDrawSetShadow(playerid, ChonXe_TD[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, ChonXe_TD[playerid][1], 255);
	PlayerTextDrawFont(playerid, ChonXe_TD[playerid][1], 4);
	PlayerTextDrawSetProportional(playerid, ChonXe_TD[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, ChonXe_TD[playerid][1], true);

	BanXe_TD[playerid][17] = CreatePlayerTextDraw(playerid, 409.666625, 284.163177, "Thu Xe");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][17], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][17], 509.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][17], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][17], 16777215);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][17], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][17], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][17], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][17], 1);

	BanXe_TD[playerid][18] = CreatePlayerTextDraw(playerid, 557.666870, 284.162902, "Mua Xe");
	PlayerTextDrawLetterSize(playerid, BanXe_TD[playerid][18], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][18], 662.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][18], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][18], 16777215);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, BanXe_TD[playerid][18], 1);
	PlayerTextDrawBackgroundColor(playerid, BanXe_TD[playerid][18], 255);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][18], 2);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][18], 1);

	BanXe_TD[playerid][19] = CreatePlayerTextDraw(playerid, 474.000091, 242.940719, "");
	PlayerTextDrawTextSize(playerid, BanXe_TD[playerid][19], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, BanXe_TD[playerid][19], 1);
	PlayerTextDrawColor(playerid, BanXe_TD[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, BanXe_TD[playerid][19], 0);
	PlayerTextDrawFont(playerid, BanXe_TD[playerid][19], 5);
	PlayerTextDrawBackgroundColor(playerid,BanXe_TD[playerid][19], 0);
	PlayerTextDrawSetProportional(playerid, BanXe_TD[playerid][19], 0);
	PlayerTextDrawSetPreviewModel(playerid, BanXe_TD[playerid][19], 7392);
	PlayerTextDrawSetPreviewRot(playerid, BanXe_TD[playerid][19], 0.000000, 0.000000, 90.000000, 1.000000);	
	return 1;
}

CMD:buycar(playerid,params)
{
	if(!IsPlayerInRangeOfPoint(playerid,5.0,1557.1479,-1253.4930,17.5355)) return ChatHoTro(playerid,255,"Ban khong o dia diem mua xe",5000);
	if(dangmuaxe != 0) return ChatHoTro(playerid,255,"Nhan vien dang phuc vu mot khach hang khac, ban vui long doi mot chut !",5000);
	banxemodel(playerid);
	SetPVarInt(playerid,"buycars",1);
	ShowModelSelectionMenu(playerid, ShopxeAudi, "Shop xe Audi");
	dangmuaxe = 1;
	return 1;
}

CMD:loadshopxe(playerid,params)
{
	if(PlayerInfo[playerid][pAdmin] == 0) return 1;
	ShopxeAudi = LoadModelSelectionMenu("ShopxeAudi.txt");
	SendClientMessageEx(playerid,-1,"Done");
	return 1;
}
