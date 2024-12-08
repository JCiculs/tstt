#include <YSI_Coding\y_hooks>
// #include "./includes/Main/commands.pwn"
#define FIXVEHCILE 1582.3419,-2166.8740,13.5785
#define FIXVEHCILE1 1595.8185,-2166.2366,13.6591
#define FIXVEHCILE2 1559.0133,-2171.6455,13.7191
#define DIALOG__LINHKIEN 1000
#define fixcar    333
#define VITRI_MUALINHKIEN 1578.0439,-2162.7939,13.5779 // vi tri xin viec
enum Fix_Vehicle_New{
	Player_Vehicle_ID,
}
new VehFixPlayers[MAX_PLAYERS][Fix_Vehicle_New];
new Float:AntiFixCar[MAX_PLAYERS];

forward Fixvehicles(playerid);
public Fixvehicles(playerid)
{
	if(GetPVarInt(playerid, "OnPlayerFixCar") == 1)
	{
		//TogglePlayerControllable(playerid, 1);
		SendClientMessage(playerid, -1, "{33CC99}~Sua Xe~{FFFFFF} Phuong tien cua ban da sua chua xong");
		DeletePVar(playerid, "OnPlayerFixCar");
		KillTimer(TimeFixVehicles[playerid]);
		TogglePlayerControllable(playerid, 1);
	 	new Float:vrot;
        GetVehicleZAngle(GetPlayerVehicleID(playerid), vrot);
        SetVehicleZAngle(GetPlayerVehicleID(playerid), vrot);
        RepairVehicle(GetPlayerVehicleID(playerid));
		Vehicle_Armor(GetPlayerVehicleID(playerid));
		vehicle_unlock_doors(VehFixPlayers[playerid][Player_Vehicle_ID]);
   		//RepairVehicle(VehFixPlayers[playerid][Player_Vehicle_ID]);
   		//VehFixPlayers[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;

	}
}


forward OnPlayerVehjilcetx(playerid);
public OnPlayerVehjilcetx(playerid)
{
	if(GetPVarInt(playerid, "HideTx") == 1)
	{
		TextDrawHideForPlayer(playerid, Notifix[6]);

	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
    AntiFixCar[playerid] = 0;
	//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	/*RemoveBuildingForPlayer(playerid, 3594, 2450.459, -1890.780, 13.164, 0.250);
	RemoveBuildingForPlayer(playerid, 1635, 2441.439, -1901.699, 14.726, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, 2439.550, -1879.920, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, 2434.270, -1879.699, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, 2444.830, -1879.880, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, 2452.300, -1879.709, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, 2461.879, -1879.699, 13.820, 0.250);*/

	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG__LINHKIEN)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pSat] < 20) return ChatHoTro(playerid, 255, "Ban khong du Sat de che tao",5000);
				//if(PlayerInfo[playerid][pBanhXe] > 1) return ChatHoTro(playerid, 255, "Ban chi co the mang toi da 2 banh xe",5000);

				SetPVarInt(playerid, "HideTx", 1);
				SetTimerEx("OnPlayerVehjilcetx",1000,0,"i",playerid);
				TextDrawShowForPlayer(playerid, Notifix[6]);
				PlayerInfo[playerid][pSat] -= 20;
				PlayerInfo[playerid][pBanhXe] ++;
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pSat] < 100) return ChatHoTro(playerid, 255, "Ban khong co du 100 sat de che tao",5000);
				//if(PlayerInfo[playerid][pDongCo] > 1) return ChatHoTro(playerid, 255, "Ban chi co the mang toi da 2 dong co",5000);

				SetPVarInt(playerid, "HideTx", 1);
				SetTimerEx("OnPlayerVehjilcetx",1000,0,"i",playerid);
				TextDrawShowForPlayer(playerid, Notifix[6]);
				PlayerInfo[playerid][pSat] -= 100;
				PlayerInfo[playerid][pBinhxang] ++;
				}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pSat] < 60) return ChatHoTro(playerid, 255, "Ban khong co du 60 sat de che tao",5000);
				//if(PlayerInfo[playerid][pDongCo] > 1) return ChatHoTro(playerid, 255, "Ban chi co the mang toi da 2 dong co",5000);

				SetPVarInt(playerid, "HideTx", 1);
				SetTimerEx("OnPlayerVehjilcetx",1000,0,"i",playerid);
				TextDrawShowForPlayer(playerid, Notifix[6]);
				PlayerInfo[playerid][pSat] -= 60;
				PlayerInfo[playerid][pSpraycan] ++;
				}
			}
		}
	return 1;
}
CMD:bomxang(playerid, params[])
{
	if(PlayerInfo[playerid][pBinhxang] < 1) return ChatHoTro(playerid,255,"Ban khong co binh xang!",5000);
	if(IsPlayerInRangeOfPoint(playerid,5.0,1942.8601,-1772.8632,13.3906))
	{
		if(PlayerInfo[playerid][pBombinh] == 200) return ChatHoTro(playerid,255,"Binh xang cua ban da day",5000);
		new sotien = 200 - PlayerInfo[playerid][pBombinh];
		new tientra = sotien * 5;
		new string[128],str[128];
		if(PlayerInfo[playerid][pCash] < tientra)
		{
			while(PlayerInfo[playerid][pCash] < tientra)
			{
				tientra -= 5;
			}
			new Float: xangtru = tientra/5;
			switch(random(2))
			{
			    case 0:{
					Businesses[2][GasPumpGallons][0] -= xangtru;
					format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][0], Businesses[2][GasPumpSaleGallons][0], Businesses[2][GasPumpGallons][0], Businesses[2][GasPumpCapacity][0]);
					UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][0], COLOR_YELLOW, str);
				}
			    case 1:{
					Businesses[2][GasPumpGallons][1] -= xangtru;
					format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][1], Businesses[2][GasPumpSaleGallons][1], Businesses[2][GasPumpGallons][1], Businesses[2][GasPumpCapacity][1]);
					UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][1], COLOR_YELLOW, str);
				}
			}
			PlayerInfo[playerid][pCash] -= tientra;
			PlayerInfo[playerid][pBombinh] += tientra/5;
			format(string,sizeof(string),"Ban da mua %d lit xang voi gia $%d vi ban khong du tien mua day binh",tientra/5,tientra);
			SendClientMessageEx(playerid,-1,string);
			return 1;
		} 
		new Float: xangtrus = sotien;
		switch(random(2))
		{
		    case 0:{
				Businesses[2][GasPumpGallons][0] -= xangtrus;
				format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][0], Businesses[2][GasPumpSaleGallons][0], Businesses[2][GasPumpGallons][0], Businesses[2][GasPumpCapacity][0]);
				UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][0], COLOR_YELLOW, str);
			}
		    case 1:{
				Businesses[2][GasPumpGallons][1] -= xangtrus;
				format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][1], Businesses[2][GasPumpSaleGallons][1], Businesses[2][GasPumpGallons][1], Businesses[2][GasPumpCapacity][1]);
				UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][1], COLOR_YELLOW, str);
			}
		}
		PlayerInfo[playerid][pCash] -= tientra;
		PlayerInfo[playerid][pBombinh] += sotien;
		format(string,sizeof(string),"Ban da mua %d lit xang voi gia $%d",sotien,tientra);
		SendClientMessageEx(playerid,-1,string);		
	}
	else return ChatHoTro(playerid,255,"Ban khong o cay xang",5000);
	return 1;
}
CMD:bomxangxe(playerid,params[])
{
	if(PlayerInfo[playerid][pBinhxang] < 1) return ChatHoTro(playerid,255,"Ban khong co binh xang",5000);
	new xecanh = GetClosestCar(playerid);
	new Float:VPos[3];
	GetVehiclePos(xecanh,VPos[0],VPos[1],VPos[2]);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,VPos[0],VPos[1],VPos[2])) return ChatHoTro(playerid,255,"Khong co xe nao o canh ban",5000);
	if(VehicleFuel[xecanh] > 99) return ChatHoTro(playerid,255,"Xe do da day xang, khong the bom them",5000);
	new Float:xangdo = float(100) - VehicleFuel[xecanh];
	new xangchot = floatround(xangdo, floatround_round);
	new str[128];
	format(str,sizeof(str),"%0.2f",xangdo);
	SendClientMessage(playerid,-1,str);
	if(PlayerInfo[playerid][pBombinh] >= xangchot)
	{
		VehicleFuel[xecanh] = 100.0;
		PlayerInfo[playerid][pBombinh] -= xangchot;
		ChatHoTro(playerid,255,"Ban da do day binh xe",5000);
		return 1;
	}
	else
	{
		new Float:xangbom = float(PlayerInfo[playerid][pBombinh]);
		VehicleFuel[xecanh] += xangbom;
		PlayerInfo[playerid][pBombinh] = 0;
		format(str,sizeof(str),"Ban da do %0.2f lit vao xe vi khong du de do day binh",xangbom);
		SendClientMessageEx(playerid,-1,str);
	}
	return 1;
}
CMD:xembinhxang(playerid,params[])
{
	if(PlayerInfo[playerid][pBinhxang] < 1) return ChatHoTro(playerid,255,"Ban khong co binh xang",5000);
	new str[128];
	format(str,sizeof(str),"So xang hien co trong binh cua ban la %d lit",PlayerInfo[playerid][pBombinh]);
	SendClientMessage(playerid,-1,str);
	return 1;
}
CMD:duabinhxang(playerid,params[])
{
	new giveplayerid;
	if(sscanf(params, "u",giveplayerid)) return SendClientMessageEx(playerid,COLOR_GRAD2,"Su dung: /duabinhxang [ID/NAME]");
	//if(PlayerInfo[playerid][pNhanvienxang] < 1) return ChatHoTro(playerid,255,"Ban khong co quyen han de ban",5000);
	if(!IsPlayerConnected(giveplayerid))
		return ChatHoTro(playerid,255,"Nguoi choi khong truy cap",5000);
	if(PlayerInfo[playerid][pBinhxang] < 1) return ChatHoTro(playerid,255,"Ban khong co binh xang",5000);
	new str[128];
	PlayerInfo[playerid][pBinhxang]--;
	PlayerInfo[giveplayerid][pBinhxang]++;
	format(str,sizeof(str),"%s da dua cho ban mot binh xang",GetPlayerNameEx(playerid));
	SendClientMessageEx(giveplayerid,-1,str);
	format(str,sizeof(str),"Ban da dua cho %s mot binh xang",GetPlayerNameEx(giveplayerid));
	SendClientMessageEx(playerid,-1,str);
	return 1;
}
CMD:mualinhkien(playerid, params[])
{
	if(IsAMechanic(playerid)) {
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_MUALINHKIEN)) return ChatHoTro(playerid, 255, "Ban khong o noi mua linh kien",5000);
	//if(PlayerInfo[playerid][pNhanvienxang] < 1) return ChatHoTro(playerid,255,"Ban khong phai nhan vien sua xe",5000);
	ShowPlayerDialog(playerid, DIALOG__LINHKIEN, DIALOG_STYLE_TABLIST_HEADERS, "Phu kien", "Ten\tGia\tSo luong\nHop Cong Cu\t20 Sat\nBinh xang\t100 Sat\nBinh Son Xe\t60 Sat","Chon","Huy"); //pSpraycan
	}
	return 1;
}	
CMD:linhkien(playerid, params[])
{
	new str[128];
	format(str,sizeof(str),"Linh kien hien co cua ban\nHop Cong Cu: %d\nBinh Xang: %d: %d",PlayerInfo[playerid][pBanhXe],PlayerInfo[playerid][pDongCo]);
	SendClientMessage(playerid, -1, str);
	return 1;
}
CMD:suachuaphuongtien(playerid, params[])
{
	if(IsAMechanic(playerid)) {
	new vehicleid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	new Float:health;
	GetVehicleParamsEx(VehFixPlayers[playerid][Player_Vehicle_ID],engine,lights,alarm,doors,bonnet,boot,objective);
	GetVehicleHealth(GetPlayerVehicleID(playerid), health);
	if(gettime() < PlayerInfo[playerid][pServiceTime])
		return ChatHoTro(playerid, 255,"Ban can cho 20 giay tiep theo moi co the tiep tuc",5000);
		
	if(!IsPlayerInRangeOfPoint(playerid, 3.0,FIXVEHCILE) && !IsPlayerInRangeOfPoint(playerid, 3.0, FIXVEHCILE1) && !IsPlayerInRangeOfPoint(playerid, 3.0, FIXVEHCILE2))
		return ChatHoTro(playerid, 255,"Khong the thuc hien",5000);
	if(IsPlayerInRangeOfPoint(playerid, 3.0, FIXVEHCILE2)){
	    if(health > 270) return ChatHoTro(playerid,255,"Hay vao trong de sua xe",5000);
	}
	//if(PlayerInfo[playerid][pNhanvienxang] == 1)
	{
		if(!IsPlayerInAnyVehicle(playerid)) // dieu khien phai tren xe
			return ChatHoTro(playerid,255,"Ban can o tren xe",5000);
	}
	//else return ChatHoTro(playerid, 255,"Ban khong phai la mot tho sua xe",5000);
	if(PlayerInfo[playerid][pBanhXe] >= 1) // dieu khien phai tren xe
	{	
		if(PlayerInfo[playerid][pBanhXe] < 1)
			return SendClientMessage(playerid, COLOR_GREY,"Ban khong co dung cu sua xe");
		if(!IsPlayerInAnyVehicle(playerid))
			return SendClientMessage(playerid,COLOR_GREY,"Ban khong o tren xe");
		TogglePlayerControllable(playerid, 0);
		VehFixPlayers[playerid][Player_Vehicle_ID] = vehicleid;
		vehicle_lock_doors(VehFixPlayers[playerid][Player_Vehicle_ID]);
		PlayerInfo[playerid][pBanhXe] --;
		PlayerInfo[playerid][pServiceTime] = gettime()+20;
		SetVehicleParamsEx(VehFixPlayers[playerid][Player_Vehicle_ID],VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		fVehSpeed[playerid] = 0.0;
		SetPVarInt(playerid, "OnPlayerFixCar", 1);
		SendClientMessage(playerid,COLOR_YELLOW,"Ban da dat phuong tien len ke sua chua, Dang Sua Chua... (20s)");
		TimeFixVehicles[playerid] = SetTimerEx("Fixvehicles", 30000, 0, "ii", playerid);
		cmd_me(playerid, "Tien Hanh Sua Chua Phuong Tien...");
		return 1;
		}
	}
	return 1;
}
CMD:suachuaphuongtien2(playerid,params)
{
	if(IsAMechanic(playerid)) {
	new closestcar = GetClosestCar(playerid);
	new modelcar = GetVehicleModel(closestcar);
	if(modelcar != 468 && modelcar != 462 && modelcar != 522 && modelcar != 461 && modelcar != 521 && modelcar != 463 && modelcar != 489 && modelcar != 497 && modelcar != 469 && modelcar != 581) return ChatHoTro(playerid, 255,"Ban khong dung gan chiec xe may nao",5000);
	new Float:VPos[3];
	GetVehiclePos(closestcar,VPos[0],VPos[1],VPos[2]);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,VPos[0],VPos[1],VPos[2])) return ChatHoTro(playerid,255,"Ban khong dung gan chiec xe do, hay lai gan hon",5000);
	if(PlayerInfo[playerid][pBanhXe] < 1)
		return SendClientMessage(playerid, COLOR_GREY,"Ban Khong Co Dung Cu Sua Xe");
	new Float:H;
	GetVehicleHealth(closestcar,H);
	PlayerInfo[playerid][pBanhXe] --;
	PlayerInfo[playerid][pServiceTime] = gettime()+20;
	ChatHoTro(playerid,255,"Ban dang tien hanh sua chua chiec xe nay",5000);
	ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0);
	//await task_ms(20000);
	SetVehicleHealth(closestcar,1000);
	ClearAnimations(playerid);
	ChatHoTro(playerid,255,"Ban da sua xong chiec xe nay",5000);
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	DeletePVar(playerid, "OnPlayerFixCar");
   	VehFixPlayers[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
}
hook OnGameModeInit()
{

	CreateDynamicPickup(1073, 0,VITRI_MUALINHKIEN, -1);
	CreateDynamicPickup(1073, 0,FIXVEHCILE, -1);
	CreateDynamicPickup(1073, 0,FIXVEHCILE1, -1);
	CreateDynamicPickup(1073, 0,FIXVEHCILE2, -1);
	CreateDynamic3DTextLabel("{0000FF}/suachuaphuongtien",COLOR_YELLOW,FIXVEHCILE1+0.5,4.0);
	CreateDynamic3DTextLabel("{0000FF}[ Tuning GORP ]/doxe",COLOR_YELLOW,FIXVEHCILE2+0.5,4.0);
	CreateDynamic3DTextLabel("{0000FF}/suachuaphuongtien",COLOR_YELLOW,FIXVEHCILE+0.5,4.0);
	CreateDynamic3DTextLabel("{33CC99}/mualinhkien",COLOR_YELLOW,VITRI_MUALINHKIEN+0.5,4.0);



/*	g_Object[0] = CreateObject(19817, 2558.8869, -2144.1181, -1.1562, 0.0000, 0.0000, 88.1000); //CarFixerRamp1
	g_Object[1] = CreateObject(2567, 2554.7492, -2170.2875, 0.7852, 0.0000, 0.0000, -88.0999); //ab_warehouseShelf
	g_Object[2] = CreateObject(19817, 2558.7143, -2149.3666, -1.1562, 0.0000, 0.0000, 88.1000); //CarFixerRamp1
	g_Object[3] = CreateObject(19817, 2558.5417, -2154.5771, -1.1562, 0.0000, 0.0000, 88.1000); //CarFixerRamp1
	g_Object[4] = CreateObject(19817, 2558.1787, -2165.5241, -1.1562, 0.0000, 0.0000, 88.1000); //CarFixerRamp1
	g_Object[5] = CreateObject(19817, 2558.3559, -2160.1657, -1.1562, 0.0000, 0.0000, 88.1000); //CarFixerRamp1
	g_Object[6] = CreateObject(3761, 2554.2170, -2175.9968, 0.8102, 0.0000, 0.0000, -178.4000); //industshelves
	g_Object[7] = CreateObject(12943, 2610.0632, -2147.3747, -1.2179, 0.0000, 0.0000, 90.1998); //sw_SHED07
	g_Object[8] = CreateObject(1376, 2608.8059, -2132.0393, 8.7752, 176.0999, 0.0000, -167.7000); //ContainerCrane_03
	g_Object[9] = CreateObject(3593, 2559.1145, -2132.2292, -0.3266, 1.0999, 0.0000, 23.5000); //la_fuckcar2
	g_Object[10] = CreateObject(3630, 2554.9565, -2183.8291, -0.2224, 0.0000, 0.0000, -90.0999); //crdboxes2_LAs
	g_Object[11] = CreateObject(3630, 2555.0063, -2183.7973, 2.7475, 0.0000, 0.0000, 89.5002); //crdboxes2_LAs
	g_Object[12] = CreateObject(19471, 2572.6787, -2126.3073, -0.4532, 0.0000, 0.0000, 0.0000); //forsale02
	g_Object[13] = CreateObject(3593, 2560.6333, -2131.1433, 0.1527, 1.0999, 34.1000, 23.5000); //la_fuckcar2
	g_Object[14] = CreateObject(3594, 2562.1025, -2127.6220, -0.2441, 0.0000, 0.0000, 51.5999); //la_fuckcar1
	g_Object[15] = CreateObject(3594, 2563.1240, -2126.8349, 0.7521, 17.7000, 0.0000, 127.6000); //la_fuckcar1
	g_Object[16] = CreateObject(13590, 2599.1523, -2200.8874, 0.0452, 0.0000, 0.0000, -18.2000); //kickbus04
	g_Object[17] = CreateObject(13591, 2568.3276, -2130.5227, -0.2440, 0.0000, 0.0000, -75.8999); //kickcar28
	g_Object[18] = CreateObject(1358, 2565.7275, -2132.7260, 0.0637, 0.0000, 0.0000, 0.0000); //CJ_SKIP_Rubbish
	g_Object[19] = CreateObject(1083, 2555.4426, -2169.9377, 3.0612, 0.0000, 0.0000, 0.0000); //wheel_lr2
	g_Object[20] = CreateObject(1083, 2555.5349, -2168.0476, 3.0712, 0.0000, 0.0000, 0.0000); //wheel_lr2
	g_Object[21] = CreateObject(1083, 2555.5349, -2168.9973, 3.0712, 0.0000, 0.0000, 0.0000); //wheel_lr2
	g_Vehicle[1] = CreateVehicle(424, 2571.3242, -2165.7690, -0.4281, 10.8028, 0, 0, -1); //BF Injection
	g_Actor[0] = CreateActor(50, 2555.7724, -2176.8281, -0.2187, 83.4999); //Mechanic
	ApplyActorAnimation(g_Actor[0], "BAR", "BARSERVE_BOTTLE", 4.0999, 1, 0, 0, 0, 0);
	g_Actor[1] = CreateActor(50, 2556.6850, -2151.6875, -0.2187, 0.0000); //Mechanic
	ApplyActorAnimation(g_Actor[1], "BAR", "BARSERVE_GLASS", 4.0999, 1, 0, 0, 0, 0);
	g_Actor[2] = CreateActor(1, 2572.1730, -2165.8674, -0.2187, 98.7000); //The Truth
	ApplyActorAnimation(g_Actor[2], "BAR", "BARMAN_IDLE", 4.0999, 1, 0, 0, 0, 0);
	g_Actor[3] = CreateActor(2, 2597.1328, -2178.5266, -0.2187, 161.2999); //Maccer
	ApplyActorAnimation(g_Actor[3], "AIRPORT", "THRW_BARL_THRW", 4.0999, 1, 0, 0, 0, 0);
	g_Actor[4] = CreateActor(15, 2569.5515, -2165.2678, -0.2187, -89.8000); //Mr.Whittaker (RS Hau
	ApplyActorAnimation(g_Actor[4], "BAR", "BARSERVE_LOOP", 4.0999, 1, 0, 0, 0, 0);*/


	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-08-01 01:16:28" by "Co_Rich"
		Created by "Co_Rich"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	new tmpobjid;
/*	tmpobjid = CreateObject(19456, 2439.465087, -1885.608154, 14.306884, 360.000000, 720.000000, -89.999969);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(12987, 2440.532226, -1885.004882, 13.230751, 0.000000, 0.000000, 90.500076);
	SetObjectMaterial(tmpobjid, 0, 915, "airconext", "cj_sheet2", 0x00000000);
	tmpobjid = CreateObject(19456, 2449.091796, -1885.608154, 14.306884, 360.000000, 720.000000, -89.999969);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2453.833740, -1886.333251, 14.305151, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19456, 2453.857177, -1895.700683, 14.296885, 360.000000, 720.000000, -179.699935);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.543212, -1900.057373, 12.731088, 0.000000, 90.000000, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.512207, -1890.425781, 12.731088, 0.000000, 90.000000, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19456, 2455.435546, -1890.676391, 12.317855, 0.000000, -76.099899, 0.299999);
	SetObjectMaterial(tmpobjid, 0, 13590, "kickstart", "rock01_law", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.040039, -1900.094970, 12.731088, 0.000000, 90.000000, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19866, 2453.864501, -1902.221801, 15.295151, 360.000000, 360.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 16640, "a51", "banding9_64HV", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.007080, -1890.464477, 12.731088, 0.000000, 90.000000, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.623291, -1900.057373, 16.131113, 0.000000, 90.000015, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 14771, "int_brothelint3", "GB_nastybar12", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.592285, -1890.425781, 16.131113, 0.000000, 90.000015, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 14771, "int_brothelint3", "GB_nastybar12", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.120117, -1900.094970, 16.131113, 0.000000, 90.000015, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 14771, "int_brothelint3", "GB_nastybar12", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.087158, -1890.464477, 16.131113, 0.000000, 90.000015, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 14771, "int_brothelint3", "GB_nastybar12", 0x00000000);
	tmpobjid = CreateObject(19866, 2453.804443, -1889.001098, 15.365152, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 16640, "a51", "banding9_64HV", 0x00000000);
	tmpobjid = CreateObject(19456, 2464.440429, -1901.658691, 14.296885, 360.000000, 720.000000, -179.699935);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19375, 2459.211425, -1901.709838, 15.951109, 0.000000, 90.000007, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 14771, "int_brothelint3", "GB_nastybar12", 0x00000000);
	tmpobjid = CreateObject(19437, 2454.644042, -1896.931152, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2456.245605, -1896.931152, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2463.697021, -1896.921142, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2457.851562, -1896.931152, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2459.452392, -1896.931152, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(19437, 2462.563476, -1896.931152, 14.305151, 0.000000, 0.000000, 89.999977);
	SetObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_wall1b", 0x00000000);
	tmpobjid = CreateObject(1491, 2460.248291, -1897.044799, 12.545148, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10778, "airportcpark_sfse", "vgsclubdoor02_128", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.703369, -1899.987304, 16.151113, 0.000000, 90.000022, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateObject(19375, 2448.672363, -1890.355712, 16.151113, 0.000000, 90.000022, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.200195, -1900.024902, 16.151113, 0.000000, 90.000022, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateObject(19375, 2438.167236, -1890.394409, 16.151113, 0.000000, 90.000022, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateObject(19375, 2459.211425, -1901.679809, 16.111108, 0.000000, 90.000007, 0.199999);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateObject(19866, 2460.316894, -1896.954467, 15.305151, 360.000000, 360.000000, 90.100105);
	SetObjectMaterial(tmpobjid, 0, 16640, "a51", "banding9_64HV", 0x00000000);
	tmpobjid = CreateObject(1688, 2450.553222, -1899.493164, 17.227075, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 16640, "a51", "dam_gencon", 0x00000000);
	tmpobjid = CreateObject(927, 2453.693847, -1891.723388, 14.350641, 0.000000, 0.000000, -89.799964);
	SetObjectMaterial(tmpobjid, 0, 13590, "kickstart", "yellowrust2_64", 0x00000000);
	tmpobjid = CreateObject(19899, 2446.436279, -1902.147949, 12.812369, 0.000000, 0.000000, 90.000076);
	SetObjectMaterial(tmpobjid, 0, 16322, "a51_stores", "dish_panel_a", 0x00000000);
	tmpobjid = CreateObject(19903, 2439.673339, -1901.990478, 12.817026, 0.000000, 0.000000, 90.000000);
	SetObjectMaterial(tmpobjid, 0, 16644, "a51_detailstuff", "steel256128", 0x00000000);
	tmpobjid = CreateObject(19482, 2453.726074, -1895.692382, 13.127027, 0.000000, 0.000000, 180.000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} CO RICH", 0, 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2453.761962, -1897.103515, 14.362936, 27.500013, 0.199999, 180.000061);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} CHU LING", 0, 130, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2453.726074, -1895.692382, 12.717028, 0.000000, 0.000000, 180.000000);
	SetObjectMaterialText(tmpobjid, "{7388C1} w99die3", 0, 130, "Ariel", 50, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2450.195800, -1885.510498, 13.953358, 0.000000, 0.000000, 90.000000);
	SetObjectMaterialText(tmpobjid, "{000000} LsG - 2021", 0, 80, "Engravers MT", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2453.759033, -1898.188842, 13.397039, 0.000000, 0.000000, 180.000000);
	SetObjectMaterialText(tmpobjid, "{ff0341} Farley", 0, 80, "Engravers MT", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2453.729492, -1895.815307, 14.253338, 0.000000, 0.000000, 180.000000);
	SetObjectMaterialText(tmpobjid, "{000000} LsG - 2021", 0, 90, "Engravers MT", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2453.745605, -1897.580566, 12.577020, 0.000000, 0.000000, 180.000000);
	SetObjectMaterialText(tmpobjid, "{F9F400} Vixx", 0, 60, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2438.121582, -1890.409057, 14.147013, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{99FFFF} Duckeskaylation", 0, 80, "Engravers MT", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2438.121582, -1890.449096, 14.157013, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{FFFF00} Duckeskaylation", 0, 80, "Engravers MT", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2438.121582, -1890.409057, 14.147013, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{99FFFF} Duckeskaylation", 0, 80, "Engravers MT", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2438.121582, -1890.409057, 13.177000, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{99FFFF} Sun Trau", 0, 80, "Quartz MS", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2438.121582, -1890.399047, 13.177000, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{00FF33} Sun Trau", 0, 80, "Quartz MS", 20, 1, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(1412, 2426.337890, -1879.579589, 13.763360, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1412, 2431.622802, -1879.579589, 13.763360, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19815, 2459.815673, -1902.636840, 14.067045, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(1412, 2436.916748, -1879.579589, 13.763360, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3594, 2479.831542, -1893.893188, 14.039817, -7.500000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1415, 2480.583984, -1901.349975, 12.661942, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(12957, 2479.296142, -1896.882202, 13.306920, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3593, 2477.855957, -1892.870117, 12.689145, 0.000000, 0.000000, -51.300018);
	tmpobjid = CreateObject(1728, 2474.923828, -1897.246093, 12.560056, 0.000000, 0.000000, -1.400299);
	tmpobjid = CreateObject(1728, 2478.352050, -1899.984497, 12.536944, 0.000000, 0.000000, -136.800018);
	tmpobjid = CreateObject(1729, 2477.941894, -1898.658081, 12.539014, -1.399996, 0.000000, -65.199928);
	tmpobjid = CreateObject(2226, 2478.927246, -1897.881713, 14.031678, 0.000000, 0.000000, -88.299972);
	tmpobjid = CreateObject(2670, 2476.485839, -1899.700927, 12.645152, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2675, 2476.463867, -1899.549438, 12.645154, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2463.546875, -1902.242553, 12.567044, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1412, 2442.227783, -1879.519531, 13.773361, 0.000000, 0.000000, 0.499999);
	tmpobjid = CreateObject(1412, 2447.529296, -1879.402343, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2452.819335, -1879.309936, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2458.070312, -1879.218750, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2463.360839, -1879.127807, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2468.652099, -1879.035766, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2473.942138, -1878.942749, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(1412, 2479.212402, -1878.851684, 13.773361, 0.000000, 0.000000, 1.000000);
	tmpobjid = CreateObject(11729, 2462.956298, -1902.242553, 12.567044, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19612, 2447.201171, -1901.993286, 14.431638, 0.000000, 0.000000, -178.700057);
	tmpobjid = CreateObject(2964, 2479.100830, -1885.524658, 12.530733, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1412, 2481.977539, -1881.467041, 13.773361, 0.000000, 0.000000, -87.799972);
	tmpobjid = CreateObject(11729, 2462.385742, -1902.242553, 12.567044, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(338, 2480.708740, -1885.028198, 12.860226, 0.000000, 14.499996, 0.000000);
	tmpobjid = CreateObject(338, 2480.708740, -1885.138305, 12.860226, 0.000000, 14.499996, 0.000000);
	tmpobjid = CreateObject(4227, 2465.956787, -1902.311889, 13.989476, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19789, 2454.386962, -1886.050048, 12.185145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19789, 2454.376953, -1886.630615, 12.175145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19789, 2454.376953, -1891.391845, 12.175145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19789, 2454.386962, -1892.391235, 12.185145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2461.815185, -1902.242553, 12.567044, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19789, 2454.386962, -1893.392211, 12.185145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1985, 2473.341796, -1901.289062, 15.679814, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19789, 2454.386962, -1894.392700, 12.185145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19789, 2454.386962, -1895.393066, 12.185145, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(918, 2452.647705, -1886.012695, 13.186873, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19817, 2444.546875, -1889.235717, 10.991343, 0.000000, 0.000000, 114.800003);
	tmpobjid = CreateObject(19817, 2444.280517, -1896.336547, 10.991343, 0.000000, 0.000000, 119.799926);
	tmpobjid = CreateObject(19375, 2459.101318, -1901.790161, 12.481107, 0.000000, 90.000007, 0.199999);
	tmpobjid = CreateObject(18661, 2481.084716, -1888.705688, 14.075956, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1440, 2477.751220, -1895.526733, 13.032021, 0.000000, 0.000000, -139.600067);
	tmpobjid = CreateObject(1635, 2454.471435, -1893.546752, 14.955167, 0.000000, 0.000000, -179.700286);
	tmpobjid = CreateObject(1897, 2473.357910, -1902.384521, 15.441903, 93.200019, 180.000000, 360.000000);
	tmpobjid = CreateObject(14791, 2476.086669, -1913.385620, 18.620035, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2649, 2454.597412, -1896.381713, 14.176147, 0.000000, -90.700012, -89.599906);
	tmpobjid = CreateObject(2674, 2470.252441, -1909.961547, 16.570011, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2675, 2468.412597, -1909.941528, 16.610012, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2675, 2470.169677, -1913.371948, 16.640012, 0.000000, 0.000000, -98.999984);
	tmpobjid = CreateObject(2675, 2474.215087, -1908.641113, 16.630023, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2676, 2477.232910, -1906.197143, 16.650012, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2677, 2476.429199, -1909.622192, 16.850017, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2677, 2472.106689, -1908.041748, 16.850017, 0.000000, 0.000000, 78.699989);
	tmpobjid = CreateObject(2677, 2471.382080, -1911.680053, 16.850017, 0.000000, 0.000000, -89.000045);
	tmpobjid = CreateObject(2047, 2481.069091, -1914.151000, 19.770029, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19878, 2467.599853, -1915.914916, 16.620012, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2228, 2472.290771, -1885.624755, 13.630260, 17.100009, -16.000001, 118.599967);
	tmpobjid = CreateObject(18666, 2481.088378, -1908.779541, 18.440031, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2237, 2474.013183, -1886.561157, 13.113394, 69.599990, -177.900009, -49.800006);
	tmpobjid = CreateObject(1728, 2469.310546, -1919.847656, 16.550010, 0.000000, 0.000000, 142.200012);
	tmpobjid = CreateObject(17055, 2459.644531, -1900.437866, 18.367082, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(1362, 2480.659912, -1906.289916, 17.134605, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19815, 2443.400634, -1902.350219, 15.247040, 180.000000, 180.000000, 0.000000);
	tmpobjid = CreateObject(2063, 2444.785156, -1892.581054, 13.727039, 0.000000, 0.000000, 25.600004);
	tmpobjid = CreateObject(2063, 2444.780517, -1892.594360, 14.607045, 0.000000, 0.000000, 25.600004);
	tmpobjid = CreateObject(2063, 2442.438476, -1893.702880, 13.727039, 0.000000, 0.000000, 25.600004);
	tmpobjid = CreateObject(2063, 2442.433837, -1893.716186, 14.607037, 0.000000, 0.000000, 25.600004);
	tmpobjid = CreateObject(941, 2443.415771, -1901.767456, 13.287032, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(941, 2441.044921, -1901.767456, 13.287032, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11711, 2453.775146, -1901.209960, 15.707031, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(2714, 2453.957031, -1888.976806, 15.555158, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19825, 2441.584472, -1902.317626, 15.587034, 0.000000, 0.000000, 540.000000);
	tmpobjid = CreateObject(2371, 2438.077636, -1895.452514, 12.947029, 0.000000, 90.000000, 0.000000);
	tmpobjid = CreateObject(1081, 2438.618408, -1894.051147, 13.257034, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1083, 2438.602539, -1895.744018, 13.257036, 0.000000, 0.000000, 630.000000);
	tmpobjid = CreateObject(1084, 2438.623535, -1895.412841, 13.287035, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(1081, 2438.618408, -1894.381347, 13.257034, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1081, 2438.618408, -1894.771728, 13.257034, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1010, 2444.883300, -1892.490600, 13.663485, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19815, 2443.395019, -1902.341674, 14.247029, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(1244, 2438.631835, -1902.036987, 13.587035, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1299, 2462.502197, -1898.899902, 13.017039, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1415, 2459.036865, -1897.553222, 12.567045, 0.000000, 0.000000, 360.000000);
	tmpobjid = CreateObject(1217, 2451.572509, -1886.104858, 13.242486, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1338, 2459.177246, -1898.925292, 12.567045, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1217, 2450.271240, -1886.132324, 13.167518, -30.300006, 90.499900, 0.000000);
	tmpobjid = CreateObject(918, 2457.717285, -1897.296386, 12.917045, 0.000000, 0.000000, -35.099998);
	tmpobjid = CreateObject(918, 2457.673339, -1897.899536, 12.917045, 0.000000, 0.000000, -35.099998);
	tmpobjid = CreateObject(918, 2457.257324, -1897.534667, 12.917045, 0.000000, 0.000000, -35.099998);
	tmpobjid = CreateObject(1319, 2454.779296, -1887.048583, 13.077541, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1319, 2454.779296, -1890.980590, 13.077541, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1708, 2455.528808, -1898.065917, 12.517040, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1708, 2454.587890, -1900.286621, 12.517040, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1716, 2456.316894, -1899.394775, 12.397041, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2261, 2454.452148, -1897.713134, 13.717048, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(2267, 2453.989501, -1899.554077, 14.647049, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19939, 2456.306396, -1902.457031, 13.727050, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19939, 2456.306396, -1902.457031, 14.177050, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(1829, 2463.504394, -1901.110717, 13.037046, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(930, 2449.179199, -1886.035522, 13.291682, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19624, 2446.439453, -1901.907958, 14.483266, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1362, 2438.463378, -1886.105468, 13.427782, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19621, 2445.741699, -1892.179809, 13.750089, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2485, 2445.540039, -1892.277832, 14.137384, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19627, 2444.280517, -1899.592895, 12.834340, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19625, 2444.757812, -1901.192626, 13.765106, 0.000000, 0.000000, 168.999801);
	tmpobjid = CreateObject(19617, 2438.129638, -1898.601684, 14.576284, 0.000000, 0.000000, 90.499847);
	tmpobjid = CreateObject(19482, 2449.376953, -1889.712768, 12.817026, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1001, 2444.132812, -1892.964965, 14.081829, 0.000000, 0.000000, 25.099998);
	tmpobjid = CreateObject(1003, 2445.094726, -1892.516479, 13.172581, 0.000000, 0.000000, 23.699996);
	tmpobjid = CreateObject(1114, 2441.457275, -1894.088378, 13.176996, 0.000000, 0.000000, 100.599906);
	tmpobjid = CreateObject(1083, 2445.665771, -1892.621582, 13.271709, 0.000000, 0.000000, -62.100032);
	tmpobjid = CreateObject(1045, 2446.016845, -1903.845092, 15.510263, 4.999997, 0.599999, 179.800155);
	tmpobjid = CreateObject(2226, 2445.613525, -1901.921875, 14.057027, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(1184, 2443.261230, -1893.330200, 14.661586, 0.000000, 0.000000, 27.999990);
	tmpobjid = CreateObject(2798, 2442.365966, -1893.787719, 14.171674, 0.000000, 37.399990, 0.000000);
	tmpobjid = CreateObject(1650, 2441.319824, -1902.151977, 14.077038, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2060, 2453.093750, -1886.445556, 12.887025, 0.000000, 0.000000, 29.200000);
	tmpobjid = CreateObject(1428, 2447.530761, -1886.060180, 13.978715, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1650, 2446.602539, -1885.899047, 13.123387, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3854, 2467.586181, -1879.133422, 12.766879, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1226, 2454.885253, -1880.535278, 16.416870, 0.000000, 0.000000, 94.600067);
	tmpobjid = CreateObject(1226, 2430.496826, -1880.838623, 16.386899, 0.000000, 0.000000, 91.499984);
	tmpobjid = CreateObject(1226, 2480.671386, -1879.737182, 16.276866, 0.000000, 0.000000, 28.300022);
	tmpobjid = CreateObject(8874, 2475.076904, -1898.718383, 18.927047, 0.000000, 0.000000, -166.499267);
	tmpobjid = CreateObject(3017, 2443.988525, -1901.413452, 13.767020, 0.000000, 0.000000, 179.999954);
	tmpobjid = CreateObject(1893, 2450.470214, -1894.842041, 16.107048, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2448.127929, -1894.842041, 16.177049, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2445.626464, -1894.842041, 16.087041, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2450.470214, -1889.101684, 16.177049, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2448.127929, -1889.121582, 16.177049, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2445.626464, -1889.130615, 16.087041, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3864, 2479.872314, -1902.810546, 18.122781, 0.000000, 0.000000, -47.000022);*/



	///////////////////////////////////////////////////////////////////////////////////

	tmpobjid = CreateObject(11317, 1573.328979, -2164.786376, 17.798563, 0.000079, 0.000000, 89.999717, 300.00);
	SetObjectMaterial(tmpobjid, 2, 18901, "matclothes", "beretred", 0x00000000);
	SetObjectMaterial(tmpobjid, 3, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 4, 18646, "matcolours", "red-3", 0x00000000);
	SetObjectMaterial(tmpobjid, 5, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 6, 18646, "matcolours", "grey", 0x00000000);
	SetObjectMaterial(tmpobjid, 7, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 8, 18646, "matcolours", "grey-20-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 9, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 10, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 11, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 12, 10850, "bakerybit2_sfse", "GB_truckdepot29", 0x00000000);
	SetObjectMaterial(tmpobjid, 13, 18646, "matcolours", "grey-93-percent", 0x00000000);
	tmpobjid = CreateObject(19912, 1587.999755, -2157.860839, 13.866854, 0.000000, 0.000073, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(19912, 1557.039062, -2184.041259, 13.866853, 0.000000, 0.000072, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(19912, 1574.899414, -2184.041259, 13.866853, 0.000000, 0.000072, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 7, 10765, "airportgnd_sfse", "crackedgroundb", 0x00000000);
	tmpobjid = CreateObject(19912, 1602.577026, -2170.591064, 13.866847, -0.000049, 0.000022, -89.999839, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(19912, 1601.189331, -2157.860839, 13.866854, 0.000000, 0.000073, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(19912, 1602.577026, -2183.551269, 13.866847, -0.000049, 0.000022, -89.999839, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(19912, 1560.148803, -2184.041259, 16.796861, 0.000000, -89.999923, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	tmpobjid = CreateObject(18981, 1564.651367, -2170.810546, 12.077868, 0.000000, -89.999946, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetObjectMaterial(tmpobjid, 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	tmpobjid = CreateObject(18981, 1589.650512, -2170.810546, 12.077868, 0.000000, -89.999946, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetObjectMaterial(tmpobjid, 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	tmpobjid = CreateObject(18981, 1558.000976, -2170.810546, 12.087863, 0.000000, -89.999946, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetObjectMaterial(tmpobjid, 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	tmpobjid = CreateObject(18980, 1563.644775, -2167.736816, 6.404767, 0.000000, 32.900024, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateObject(18980, 1545.527099, -2167.736816, 6.382367, 0.000000, 32.900024, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateObject(2960, 1585.377807, -2166.541748, 13.638526, -0.000022, 90.000000, -89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(9191, 1588.532714, -2184.519531, 25.306949, 0.000022, -90.000000, 89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 1, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FF0000} Mechanic - Showroom", 0, 110, "Engravers MT", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(2960, 1579.377807, -2166.541748, 13.638526, -0.000022, 90.000000, -89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(939, 1588.859497, -2163.502197, 15.017868, -0.000022, 0.000000, -89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 3, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(939, 1588.859497, -2170.451904, 15.017868, -0.000022, 0.000000, -89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 3, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(18980, 1544.302490, -2143.127929, 4.653811, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	tmpobjid = CreateObject(939, 1575.299804, -2170.451904, 15.017868, -0.000022, 0.000000, -89.999931, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetObjectMaterial(tmpobjid, 2, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterial(tmpobjid, 3, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(19903, 1586.346435, -2161.694091, 12.557872, 0.000000, 0.000000, -141.700027, 300.00);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateObject(19903, 1596.203735, -2159.799072, 12.557872, 0.000000, 0.000000, -92.000038, 300.00);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateObject(19872, 1582.292480, -2166.462646, 10.737877, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2669, "cj_chris", "cj_metalplate2", 0x00000000);
	tmpobjid = CreateObject(14724, 1581.750244, -2164.218261, 9.737870, 0.000000, 0.000000, -25.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1585.477172, -2163.109863, 9.737870, 0.000000, 0.000000, -25.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1579.236816, -2163.156005, 9.737870, 0.000000, 0.000000, 25.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1582.950073, -2164.260742, 9.737870, 0.000000, 0.000000, 25.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(2960, 1598.858276, -2166.541748, 13.638525, -0.000029, 90.000000, -89.999908, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(2960, 1592.858276, -2166.541748, 13.638525, -0.000029, 90.000000, -89.999908, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18901, "matclothes", "beretred", 0x00000000);
	tmpobjid = CreateObject(19872, 1595.772949, -2166.462646, 10.737876, 0.000000, 0.000007, 0.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2669, "cj_chris", "cj_metalplate2", 0x00000000);
	tmpobjid = CreateObject(14724, 1595.230712, -2164.218261, 9.737870, -0.000003, 0.000006, -24.999996, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1598.957641, -2163.109863, 9.737870, -0.000003, 0.000006, -24.999996, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1592.717285, -2163.156005, 9.737870, 0.000003, 0.000006, 24.999996, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(14724, 1596.430541, -2164.260742, 9.737870, 0.000003, 0.000006, 24.999996, 300.00);
	SetObjectMaterial(tmpobjid, 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	tmpobjid = CreateObject(7313, 1595.929321, -2184.390869, 16.461420, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{FFCC00} Mechanic Duckeskaylation", 0, 70, "Calibri", 28, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(7313, 1576.552612, -2149.873046, 16.051370, 0.000000, 0.000000, 90.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{00FFFF} Garage Duckeskaylation", 0, 70, "Calibri", 28, 1, 0x00000001, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1545.625244, -2178.089843, 14.116773, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{FFFF00} Duckeskaylation", 0, 70, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1545.625244, -2178.039794, 14.116773, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{FF0000} Duckeskaylation", 0, 70, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1545.625244, -2178.139892, 14.116773, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{00FFFF} Duckeskaylation", 0, 70, "Ariel", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1545.625244, -2177.019287, 14.866792, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{FFFF00} Mechanic - Showroom", 0, 110, "Fixedsys", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1545.625244, -2176.989257, 14.866792, 0.000000, 0.000000, 0.000000, 300.00);
	SetObjectMaterialText(tmpobjid, "{000000} Mechanic - Showroom", 0, 110, "Fixedsys", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(2727, 1545.571166, -2174.010498, 14.716641, 91.700027, 90.000000, 0.599993, 300.00);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "CJ_7_11_TILE", 0x00000000);
	tmpobjid = CreateObject(9191, 1589.040771, -2187.771728, 25.306951, 0.000022, -90.000000, 269.999938, 300.00);
	SetObjectMaterial(tmpobjid, 1, 19297, "matlights", "invisible", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FF0000} Mechanic - Showroom", 0, 110, "Engravers MT", 30, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19903, 1559.413085, -2168.382080, 12.597875, 0.000000, 0.000000, -92.000038, 300.00);
	SetObjectMaterial(tmpobjid, 1, 18646, "matcolours", "red", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(2748, 1556.122192, -2183.363769, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(1175, 1574.848754, -2168.370849, 12.997873, 90.000000, -62.000007, 0.000000, 300.00);
	tmpobjid = CreateObject(1157, 1588.400268, -2170.585693, 13.386030, -0.000022, 0.000003, -74.999992, 300.00);
	tmpobjid = CreateObject(1893, 1595.668945, -2164.022949, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1893, 1582.270263, -2164.022949, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1893, 1582.270263, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1074, 1552.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1097, 1554.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1075, 1553.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1080, 1555.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1073, 1551.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1082, 1557.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1085, 1559.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1098, 1561.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1079, 1556.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1096, 1558.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1081, 1560.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1076, 1562.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1078, 1563.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1084, 1565.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1083, 1564.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1077, 1566.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, 300.00);
	tmpobjid = CreateObject(1893, 1595.668945, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1893, 1569.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1893, 1561.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(1893, 1553.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, 300.00);
	tmpobjid = CreateObject(19899, 1600.539794, -2172.298583, 12.578521, 0.000000, 0.000029, 179.999893, 300.00);
	tmpobjid = CreateObject(19815, 1601.011474, -2175.325683, 14.578530, 0.000029, 0.000000, -90.000061, 300.00);
	tmpobjid = CreateObject(19379, 1469.399414, -1754.000000, 3284.199951, 0.000000, 90.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19899, 1600.539794, -2175.329101, 13.838519, 0.000000, 179.999984, -0.000167, 300.00);
	tmpobjid = CreateObject(1010, 1576.965698, -2162.554443, 13.827869, -0.000018, 0.000011, -60.899967, 300.00);
	tmpobjid = CreateObject(1073, 1590.047729, -2173.117675, 13.047862, -0.000012, 0.000018, -36.999988, 300.00);
	tmpobjid = CreateObject(19379, 1479.000000, -1754.000000, 3284.199951, 0.000000, 90.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19899, 1592.691528, -2160.069091, 13.838519, 0.000014, 179.999984, 107.399948, 300.00);
	tmpobjid = CreateObject(1536, 1475.699951, -1748.863037, 3284.300048, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(1536, 1472.699218, -1748.899414, 3284.300048, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19899, 1577.051147, -2165.296630, 12.578521, 0.000000, 0.000022, 0.000000, 300.00);
	tmpobjid = CreateObject(19815, 1576.579467, -2162.269531, 14.578530, 0.000022, 0.000000, 89.999931, 300.00);
	tmpobjid = CreateObject(19899, 1577.051147, -2162.266113, 13.838519, 0.000000, 179.999984, 179.999893, 300.00);
	tmpobjid = CreateObject(19900, 1586.062988, -2169.098144, 12.547870, 0.000000, 0.000000, -26.200000, 300.00);
	tmpobjid = CreateObject(19921, 1575.802124, -2168.976318, 14.647877, 0.000000, 0.000000, 33.100002, 300.00);
	tmpobjid = CreateObject(19917, 1575.411621, -2172.258544, 12.867877, 0.000000, 0.000000, -42.400012, 300.00);
	tmpobjid = CreateObject(1148, 1588.118652, -2168.476318, 13.417879, 0.000000, 0.000000, 126.099975, 300.00);
	tmpobjid = CreateObject(1014, 1588.815063, -2171.586914, 14.537877, 0.000000, 0.000000, -41.700004, 300.00);
	tmpobjid = CreateObject(2748, 1554.500854, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2748, 1552.880004, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2748, 1551.279174, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2748, 1549.718383, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2748, 1548.096923, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2748, 1546.476196, -2183.374511, 13.137873, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2172, 1547.128417, -2171.074951, 12.577871, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2193, 1546.135253, -2168.355468, 12.587873, 0.000000, 0.000000, 270.000000, 300.00);
	tmpobjid = CreateObject(2311, 1569.487060, -2169.563964, 12.587867, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2131, 1572.640502, -2167.504638, 12.577860, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1723, 1569.280151, -2168.093994, 12.556864, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19872, 1559.247314, -2171.603271, 10.797846, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(19893, 1570.228881, -2169.290771, 13.077868, 0.000000, 0.000000, 180.000000, 300.00);
	//tmpobjid = CreateObject(1676, 1560.410156, -2175.074707, 14.107862, 0.000000, 0.000000, 0.000000, 300.00);
	//tmpobjid = CreateObject(1676, 1558.358764, -2175.074707, 14.107862, 0.000000, 0.000000, 0.000000, 300.00);


}