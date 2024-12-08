#include <a_samp>
#include <YSI_Coding\y_hooks>
#define             Time_RAXE                        30
#define THOIGIANRAXE 15 // 15 giay 
/*new ChotKhoa[MAX_PLAYERS];
new ChonDung[MAX_PLAYERS][37];
new DaChon[MAX_PLAYERS];
new ChonSai[MAX_PLAYERS];*/
enum Con_Cac_Veh{
	veh_id,
}
new dabekhoathanhcong[MAX_PLAYERS][Con_Cac_Veh];


hook OnPlayerDisconnect(playerid)
{
	DeletePVar(playerid, "BatDauRaXe");
	DeletePVar(playerid,"Dangbekhoa"); 
	DeletePVar(playerid, "bekhoaxe");
	dabekhoathanhcong[playerid][veh_id] = INVALID_VEHICLE_ID;
	ChotKhoa[playerid] = 0;
	DaChon[playerid] = 0;
	ChonSai[playerid] = 0;
}

/*hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		new checkxe = 0;
	    for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
	    {
	        if(PlayerVehicleInfo[playerid][d][pvId] == vehicleid){ checkxe = 1;}
	    }	
	    if(checkxe == 0)
	    {
        	new engine,lights,alarm,doors,bonnet,boot,objective;
        	GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
        	if((engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET))
        	{
        		ChatHoTro(playerid,255,"Day khong phai xe cua ban ~r~/bekhoa~w~ de be khoa xe",5000);
        	}
	    }
	}
	return 1;
}*/

stock Hidebekhoa(playerid)
{
	for(new i=0;i<36;i++) PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][i]);
	return 1;
}

stock bekhoathatbai(playerid)
{
	for(new i=0;i<37;i++) ChonDung[playerid][i] = 0;
	CancelSelectTextDraw(playerid);
	ChonSai[playerid] = 0;
	DaChon[playerid] = 0;
	ChotKhoa[playerid] = 0;
	new vehicleid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,engine,lights,1,doors,bonnet,boot,objective);	
	DeletePVar(playerid,"Dangbekhoa");
	Hidebekhoa(playerid);
	for(new i=1;i<37;i++) PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][i], 187644671);

	return 1;
}

stock bekhoahoanthanh(playerid)
{
	//for(new i=0;i<37;i++) ChonDung[playerid][i] = 0;
	//CancelSelectTextDraw(playerid);
	DeletePVar(playerid,"Dangbekhoa");
	DeletePVar(playerid,"bekhoaxe");
	Hidebekhoa(playerid);
	ChotKhoa[playerid] = 0;
	ChonSai[playerid] = 0;
	DaChon[playerid] = 0;
	//for(new i=1;i<37;i++) PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][i], 187644671);
	new vehicleid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,0,doors,bonnet,boot,objective);
	ChatHoTro(playerid,255,"Ban da be khoa thanh cong",5000);
	dabekhoathanhcong[playerid][veh_id] = vehicleid;
	SetPlayerCheckpoint(playerid, 2820.0168, -1538.4631, 10.4876, 2.0);
	CP[playerid] = 1;
    timduong[playerid] = 1;
	return 1;
}
CMD:testnezzzzz(playerid,params[])
{
	for(new i=0;i<37;i++) ChonDung[playerid][i] = 0;
	CancelSelectTextDraw(playerid);
	DeletePVar(playerid,"Dangbekhoa");
	Hidebekhoa(playerid);
	ChotKhoa[playerid] = 0;
	ChonSai[playerid] = 0;
	DaChon[playerid] = 0;
	for(new i=1;i<37;i++) PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][i], 187644671);
	new vehicleid = GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
    GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_ON,lights,0,doors,bonnet,boot,objective);
	ChatHoTro(playerid,255,"Ban da be khoa thanh cong",5000);
	dabekhoathanhcong[playerid][veh_id] = vehicleid;
	return 1;
}
CMD:batdauraxe(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 2820.0168, -1538.4631, 10.4876)) {
	if(GetPVarInt(playerid,"BatDauRaXe") == 1) return 1;
	new vehicleid = GetPlayerVehicleID(playerid);
	if(dabekhoathanhcong[playerid][veh_id] == vehicleid)
	{
		foreach(new vehowner: Player)
		{
			for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
			{
				if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[vehowner][d][pvId]))
				{
					ChatHoTro(playerid,255,"Ban dang tien hanh ra xe vui long doi",8000);
					SetTimerEx("OnPlayerRaXe",THOIGIANRAXE*1000,0,"i",playerid);
					SetPVarInt(playerid,"BatDauRaXe",1);
					TogglePlayerControllable(playerid, 0);
					return 1;
				}
			}
		}
	}
	else SendClientMessage(playerid, -1, "Day khong phai xe ma ban da be khoa duoc");
	SendClientMessage(playerid, -1, "Day khong phai la phuong tien cua nguoi choi");
	}else SendClientMessage(playerid, -1, "Ban Khong O Khu Vuc Ra Xe, Hay Den Khu Vuc Ra Xe!");
	return 1;
}
forward OnPlayerRaXe(playerid);
public OnPlayerRaXe(playerid)
{
	if(GetPVarInt(playerid,"BatDauRaXe") == 1)
	{
		foreach(new vehowner: Player)
		{
			for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
			{
				if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[vehowner][d][pvId]))
				{
					TogglePlayerControllable(playerid, 1);
					SetPVarInt(playerid,"BatDauRaXe",-1);
					// PlayerVehicleInfo[vehowner][d][pvTicket] += 2000;
					--PlayerCars;
					VehicleSpawned[vehowner]--;
					PlayerVehicleInfo[vehowner][d][pvSpawned] = 0;
					PlayerVehicleInfo[vehowner][d][pvHealth] = 255;
					// DestroyVehicle(XeCuaPlayer);
					DestroyVehicle(PlayerVehicleInfo[vehowner][d][pvId]);
					PlayerVehicleInfo[vehowner][d][pvId] = INVALID_PLAYER_VEHICLE_ID;
					g_mysql_SaveVehicle(vehowner, d);
					dabekhoathanhcong[playerid][veh_id] = INVALID_VEHICLE_ID;
					new rand = Random(3000,8000);
					new rand1 = Random(1,5);
					PlayerInfo[playerid][pSat] += rand1;
					PlayerInfo[vehowner][pCash] -= rand;
					PlayerInfo[playerid][pCash] += rand;
					new str[128];
					format(str, sizeof(str),"Ban da ra phuong tien cua %s phuong tien la: %s va nhan duoc mot so tien %d - mot it sat %d",GetPlayerNameEx(vehowner), VehicleName[PlayerVehicleInfo[vehowner][d][pvModelId] - 400],rand,rand1);
					SendClientMessageEx(playerid, -1, str);
					format(str, sizeof(str), "Xe cua ban %s cua ban da bi ra xe va ban bi tru di mot so tien %d", VehicleName[PlayerVehicleInfo[vehowner][d][pvModelId] - 400],rand);
					SendClientMessageEx(vehowner, -1, str);
				}
			}
		}
	}
	TogglePlayerControllable(playerid, 1);
	return 1;
}

stock BeKhoa_OnPlayerClickPTD(playerid, PlayerText:playertextid)
{
	if(playertextid == BeKhoa_TD[playerid][1])
	{
		if(ChonDung[playerid][1] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][1]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][1], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][1]);
			DaChon[playerid] += 1;
			ChonDung[playerid][1] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][1] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][1]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][1], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][1]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][2])
	{
		if(ChonDung[playerid][2] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][2]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][2], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][2]);
			DaChon[playerid] += 1;
			ChonDung[playerid][2] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][2] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][2]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][2], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][2]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][3])
	{
		if(ChonDung[playerid][3] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][3]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][3], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][3]);
			DaChon[playerid] += 1;
			ChonDung[playerid][3] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][3] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][3]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][3], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][3]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][4])
	{
		if(ChonDung[playerid][4] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][4]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][4], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][4]);
			DaChon[playerid] += 1;
			ChonDung[playerid][4] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][4] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][4]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][4], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][4]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][5])
	{
		if(ChonDung[playerid][5] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][5]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][5], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][5]);
			DaChon[playerid] += 1;
			ChonDung[playerid][5] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][5] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][5]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][5], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][5]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][6])
	{
		if(ChonDung[playerid][6] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][6]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][6], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][6]);
			DaChon[playerid] += 1;
			ChonDung[playerid][6] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][6] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][6]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][6], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][6]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][7])
	{
		if(ChonDung[playerid][7] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][7]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][7], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][7]);
			DaChon[playerid] += 1;
			ChonDung[playerid][7] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][7] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][7]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][7], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][7]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][8])
	{
		if(ChonDung[playerid][8] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][8]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][8], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][8]);
			DaChon[playerid] += 1;
			ChonDung[playerid][8] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][8] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][8]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][8], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][8]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][9])
	{
		if(ChonDung[playerid][9] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][9]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][9], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][9]);
			DaChon[playerid] += 1;
			ChonDung[playerid][9] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][9] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][9]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][9], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][9]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][10])
	{
		if(ChonDung[playerid][10] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][10]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][10], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][10]);
			DaChon[playerid] += 1;
			ChonDung[playerid][10] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][10] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][10]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][10], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][10]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][11])
	{
		if(ChonDung[playerid][11] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][11]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][11], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][11]);
			DaChon[playerid] += 1;
			ChonDung[playerid][11] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][11] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][11]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][11], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][11]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][12])
	{
		if(ChonDung[playerid][12] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][12]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][12], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][12]);
			DaChon[playerid] += 1;
			ChonDung[playerid][12] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][12] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][12]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][12], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][12]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][13])
	{
		if(ChonDung[playerid][13] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][13]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][13], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][13]);
			DaChon[playerid] += 1;
			ChonDung[playerid][13] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][13] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][13]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][13], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][13]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][14])
	{
		if(ChonDung[playerid][14] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][14]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][14], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][14]);
			DaChon[playerid] += 1;
			ChonDung[playerid][14] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][14] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][14]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][14], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][14]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][15])
	{
		if(ChonDung[playerid][15] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][15]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][15], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][15]);
			DaChon[playerid] += 1;
			ChonDung[playerid][15] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][15] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][15]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][15], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][15]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][16])
	{
		if(ChonDung[playerid][16] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][16]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][16], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][16]);
			DaChon[playerid] += 1;
			ChonDung[playerid][16] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][16] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][16]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][16], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][16]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][17])
	{
		if(ChonDung[playerid][17] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][17]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][17], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][17]);
			DaChon[playerid] += 1;
			ChonDung[playerid][17] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][17] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][17]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][17], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][17]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][18])
	{
		if(ChonDung[playerid][18] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][18]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][18], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][18]);
			DaChon[playerid] += 1;
			ChonDung[playerid][18] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][18] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][18]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][18], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][18]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][19])
	{
		if(ChonDung[playerid][19] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][19]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][19], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][19]);
			DaChon[playerid] += 1;
			ChonDung[playerid][19] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][19] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][19]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][19], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][19]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][20])
	{
		if(ChonDung[playerid][20] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][20]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][20], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][20]);
			DaChon[playerid] += 1;
			ChonDung[playerid][20] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][20] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][20]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][20], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][20]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][21])
	{
		if(ChonDung[playerid][21] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][21]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][21], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][21]);
			DaChon[playerid] += 1;
			ChonDung[playerid][21] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][21] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][21]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][21], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][21]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][22])
	{
		if(ChonDung[playerid][22] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][22]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][22], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][22]);
			DaChon[playerid] += 1;
			ChonDung[playerid][22] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][22] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][22]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][22], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][22]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][23])
	{
		if(ChonDung[playerid][23] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][23]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][23], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][23]);
			DaChon[playerid] += 1;
			ChonDung[playerid][23] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][23] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][23]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][23], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][23]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][24])
	{
		if(ChonDung[playerid][24] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][24]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][24], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][24]);
			DaChon[playerid] += 1;
			ChonDung[playerid][24] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][24] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][24]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][24], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][24]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][25])
	{
		if(ChonDung[playerid][25] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][25]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][25], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][25]);
			DaChon[playerid] += 1;
			ChonDung[playerid][25] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][25] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][25]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][25], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][25]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][26])
	{
		if(ChonDung[playerid][26] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][26]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][26], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][26]);
			DaChon[playerid] += 1;
			ChonDung[playerid][26] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][26] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][26]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][26], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][26]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][27])
	{
		if(ChonDung[playerid][27] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][27]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][27], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][27]);
			DaChon[playerid] += 1;
			ChonDung[playerid][27] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][27] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][27]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][27], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][27]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][28])
	{
		if(ChonDung[playerid][28] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][28]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][28], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][28]);
			DaChon[playerid] += 1;
			ChonDung[playerid][28] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][28] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][28]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][28], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][28]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][29])
	{
		if(ChonDung[playerid][29] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][29]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][29], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][29]);
			DaChon[playerid] += 1;
			ChonDung[playerid][29] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][29] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][29]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][29], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][29]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][30])
	{
		if(ChonDung[playerid][30] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][30]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][30], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][30]);
			DaChon[playerid] += 1;
			ChonDung[playerid][30] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][30] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][30]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][30], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][30]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][31])
	{
		if(ChonDung[playerid][31] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][31]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][31], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][31]);
			DaChon[playerid] += 1;
			ChonDung[playerid][31] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][31] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][31]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][31], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][31]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][32])
	{
		if(ChonDung[playerid][32] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][32]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][32], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][32]);
			DaChon[playerid] += 1;
			ChonDung[playerid][32] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][32] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][32]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][32], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][32]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][33])
	{
		if(ChonDung[playerid][33] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][33]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][33], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][33]);
			DaChon[playerid] += 1;
			ChonDung[playerid][33] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][33] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][33]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][33], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][33]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][34])
	{
		if(ChonDung[playerid][34] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][34]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][34], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][34]);
			DaChon[playerid] += 1;
			ChonDung[playerid][34] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][34] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][34]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][34], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][34]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][35])
	{
		if(ChonDung[playerid][35] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][35]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][35], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][35]);
			DaChon[playerid] += 1;
			ChonDung[playerid][35] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][35] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][35]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][35], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][35]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	if(playertextid == BeKhoa_TD[playerid][36])
	{
		if(ChonDung[playerid][36] == 1)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][36]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][36], -1);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][36]);
			DaChon[playerid] += 1;
			ChonDung[playerid][36] = 2;
			if(DaChon[playerid] >= 14) bekhoahoanthanh(playerid);
		}
		else if(ChonDung[playerid][36] == 0)
		{
			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][36]);
			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][36], -16776961);
			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][36]);
			ChonSai[playerid] += 1;
			if(ChonSai[playerid] >= 3) bekhoathatbai(playerid);
		}

	}
	return 1;
}

stock Showbekhoa(playerid)
{
	for(new i=0;i<37;i++) PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][i]);

	return 1;
}

forward Daxemxongbekhoa(playerid);
public Daxemxongbekhoa(playerid)
{
    Hidebekhoa(playerid);
	for(new i=1;i<37;i++) PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][i], 187644671);
	Showbekhoa(playerid);
	SelectTextDraw(playerid, 0x000000);
}

stock randombekhoa(playerid)
{
	new checkitsound = 0,Chot[14];
	while(ChotKhoa[playerid] < 14)
	{
		new rand = Random(1,36),chaylai=0;
		for(new i=0;i<checkitsound;i++){
			if(chaylai == 1) break;
			if(rand == Chot[i])
			{
				chaylai=1;
				break;
			}
		}
		if(chaylai == 0)
		{
			Chot[checkitsound] = rand;
			checkitsound += 1;
			ChotKhoa[playerid] += 1;
   			PlayerTextDrawHide(playerid, BeKhoa_TD[playerid][rand]);
   			PlayerTextDrawColor(playerid, BeKhoa_TD[playerid][rand], -1);
   			PlayerTextDrawShow(playerid, BeKhoa_TD[playerid][rand]);
			ChonDung[playerid][rand] = 1;			
		}
	}
	SetTimerEx("Daxemxongbekhoa", 5000, 0, "dd", playerid);
	return 1;
}

stock Batdaubekhoa(playerid)
{
	Showbekhoa(playerid);
	randombekhoa(playerid);
	return 1;
}

CMD:bekhoa(playerid,params[])
{
	if(PlayerInfo[playerid][pXabeng] < 1) return SendClientMessageEx(playerid, -1, "Ban khong co xa beng de be khoa");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, -1, "Ban khong co o tren xe de tien hanh be khoa");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessageEx(playerid, -1, "Ban Khong Ngoi Ghe Lai Xe!");
	SetPVarInt(playerid,"Dangbekhoa",1); 
	SetPVarInt(playerid, "bekhoaxe", 60);
    SetTimerEx("bekhoaxe", 1000, 0, "ii", playerid);
    SetTimerEx("bekhoaxexong", Time_RAXE*1000, 0, "ii", playerid);
	//bekhoahoanthanh(playerid);
    new szMessage[256];
    new zone[MAX_ZONE_NAME];
    new vehicleid = GetPlayerVehicleID(playerid);
	GetPlayer3DZone(playerid, zone, sizeof(zone));
    format(szMessage, sizeof(szMessage), "[CCTV Thanh Pho]: Phat Hien Co Ten Trom Dang Be Khoa Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
    SendPoliceMessage(COLOR_RED, szMessage);
	return 1;
}


forward bekhoaxexong(playerid);
public bekhoaxexong(playerid)
{
	bekhoahoanthanh(playerid);
    return 1;
}

forward bekhoaxe(playerid);
public bekhoaxe(playerid)
{
    SetPVarInt(playerid, "bekhoaxe", GetPVarInt(playerid, "bekhoaxe")-1);
    new string[1280];
    format(string, sizeof(string), "Ban Dang Dung Xa Beng De Be Khoa, Vui Long Cho...", GetPVarInt(playerid, "bekhoaxe"));
    ChatHoTro(playerid, 255, string, 5000);

    if(GetPVarInt(playerid, "bekhoaxe") > 0) SetTimerEx("bekhoaxe", 1000, 0, "d", playerid);
    return 1;
}


CMD:tatbekhoa(playerid,params[])
{
	if(GetPVarInt(playerid,"Dangbekhoa") == 1)
	{
        bekhoathatbai(playerid);
        //PlayerTextDrawHide(playerid, BeKhoa_TD)
	}
	return 1;
}
