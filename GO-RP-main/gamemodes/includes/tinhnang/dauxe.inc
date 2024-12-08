#include <YSI_Coding\y_hooks>
#include <a_samp>

new vitrispawnxe;

enum DAUXE
{
	Float:DAUXE_X,
	Float:DAUXE_Y,
	Float:DAUXE_Z,
	Float:DAUXE_ROT,
	DAUXE_VITRI
}

new Float:POSCX[7][DAUXE] = {
	{2052.4736,-1904.0708,13.3182,359.6847,1},
	{2055.9885,-1904.1984,13.3186,359.8235,2},
	{2059.1721,-1904.1106,13.3181,359.9498,3},
	{2062.4133,-1904.2009,13.3185,359.9498,4},
	{2065.5945,-1904.1067,13.3178,359.9922,5},
	{2062.2014,-1919.5162,13.3190,180.7251,6},
	{2065.4167,-1919.8828,13.3178,179.7531,7}
};

//new vitridau[sizeof(POSCX)];

hook OnGameModeInit()
{
	vitrispawnxe = 6;
	CreatePickup(1239, 1, 2069.3335,-1915.8473,13.5469,-1);
	CreateDynamic3DTextLabel("Garage Dau Xe [Y] De Cat/Lay Phuong Tien.",COLOR_YELLOW,2069.3335,-1915.8473,13.5469+0.5,5.0);
	new tmpobjid;
	tmpobjid = CreateObject(4639, 2051.692138, -1921.273315, 14.246892, 0.000000, 0.000000, 180.000000); 
	SetObjectMaterial(tmpobjid, 0, 19076, "xmastree1", "goldplate", 0x00000000);
	tmpobjid = CreateObject(4639, 2069.908935, -1908.376220, 14.246892, 0.000000, 0.000000, 180.000000); 
	SetObjectMaterial(tmpobjid, 0, 19076, "xmastree1", "goldplate", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(994, 2071.711669, -1907.397827, 12.546875, 0.000000, 0.000000, 90.000000); 
	tmpobjid = CreateObject(994, 2060.762939, -1922.362548, 12.546875, 0.000000, 0.000000, 0.000000); 
	tmpobjid = CreateObject(997, 2068.021728, -1922.368774, 12.546875, 0.000000, 0.000000, 0.000000); 
	tmpobjid = CreateObject(994, 2071.716552, -1922.273437, 12.546875, 0.000000, 0.000000, 90.000000); 
	tmpobjid = CreateObject(792, 2048.942626, -1921.666259, 12.886877, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19982, 2071.713623, -1916.064453, 12.546875, 0.000000, 0.000000, 90.000000); 
	tmpobjid = CreateObject(19982, 2060.827880, -1922.365478, 12.546875, 0.000000, 0.000000, 360.000000); 
	tmpobjid = CreateObject(1297, 2050.223632, -1901.484497, 15.906892, 0.000000, 0.000000, 135.900024); 
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	/*if(IsPlayerInRangeOfPoint(playerid,20.0,2060.7583,-1911.8917,13.5469)){
		for(new i = 0;i<sizeof(POSCX);i++)
		{
			if(IsPlayerInRangeOfPoint(playerid,2.0,POSCX[i][DAUXE_X],POSCX[i][DAUXE_Y],POSCX[i][DAUXE_Z])){
				vitridau[i] = 0;
				break;
			}
		}
	}*/
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == VEHICLESTORAGE && response) {
		if(listitem == GetPlayerVehicleSlots(playerid)) {
			new szstring[128];
			SetPVarInt(playerid, "MiscShop", 7);
			format(szstring, sizeof(szstring), "Them slot xe\nCredits cua ban: %s\nChi phi: {FFD700}%s{A9C4E4}\nCredits con lai: %s", number_format(PlayerInfo[playerid][pCredits]), number_format(ShopItems[23][sItemPrice]), number_format(PlayerInfo[playerid][pCredits]-ShopItems[23][sItemPrice]));
			return ShowPlayerDialog(playerid, DIALOG_MISCSHOP2, DIALOG_STYLE_MSGBOX, "Mua them mot slot xe", szstring, "Mua", "Huy bo");
		}
		
		if(PlayerVehicleInfo[playerid][listitem][pvSpawned]) {

			new
				iVehicleID = PlayerVehicleInfo[playerid][listitem][pvId];

			if((!IsVehicleOccupied(iVehicleID) || IsPlayerInVehicle(playerid, iVehicleID)) && !IsVehicleInTow(iVehicleID)) {


				GetVehicleHealth(iVehicleID, VehicleHealth[iVehicleID]);
				new Float:vPos[3];
				GetVehiclePos(iVehicleID, vPos[0], vPos[1], vPos[2]);
   				if (GetPVarInt(playerid, "Refueling") == PlayerVehicleInfo[playerid][listitem][pvId])
					SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the cat chiec xe nay khi dang duoc tiep nhien lieu.");
				else if(!IsPlayerInRangeOfPoint(playerid,30.0,vPos[0],vPos[1],vPos[2])) return ChatHoTro(playerid,255,"Chiec xe cua ban khong duoc dat o Garage",5000);
				else {
					--PlayerCars;
					VehicleSpawned[playerid]--;
					PlayerVehicleInfo[playerid][listitem][pvSpawned] = 0;
					PlayerVehicleInfo[playerid][listitem][pvHealth] = VehicleHealth[iVehicleID];
					PlayerVehicleInfo[playerid][listitem][pvFuel] = VehicleFuel[iVehicleID];
					DestroyVehicle(iVehicleID);
					PlayerVehicleInfo[playerid][listitem][pvId] = INVALID_PLAYER_VEHICLE_ID;
					g_mysql_SaveVehicle(playerid, listitem);

					new vstring[128];
					format(vstring, sizeof(vstring), "Ban da cat %s. Chiec xe da duoc chinh vao kho xe cua ban", VehicleName[PlayerVehicleInfo[playerid][listitem][pvModelId] - 400]);
					SendClientMessageEx(playerid, COLOR_WHITE, vstring);
					CheckPlayerVehiclesForDesync(playerid);
				}
			}
			else SendClientMessageEx(playerid, COLOR_WHITE, "Chiec xe nay hien dang bi mat cap - Ban khong the chinh xe vao kho xe cua ban luc nay.");
		}
		else if(PlayerVehicleInfo[playerid][listitem][pvImpounded]) {
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lay mot chiec xe khi dang bi thu giu. Neu muon lay lai ban toi DMV de nop tien phat xe.");
		}
		else if(PlayerVehicleInfo[playerid][listitem][pvDisabled]) {
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lay khi xe dang bi vo hieu hoa tai slot. No bi vo hieu hoa do cap do VIP cua ban (Xe han che).");
		}
		else if((PlayerInfo[playerid][pRVehRestricted] > gettime() || PlayerVehicleInfo[playerid][listitem][pvRestricted] > gettime()) && IsRestrictedVehicle(PlayerVehicleInfo[playerid][listitem][pvModelId]))
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep lay chiec xe han che nay");
        }
		else if(!PlayerVehicleInfo[playerid][listitem][pvSpawned]) {
			if(PlayerInfo[playerid][pDonateRank] == 0 && VehicleSpawned[playerid] >= 2) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu khong co VIP ban chi co the lay 2 xe cung mot luc.");
			}
			else if(PlayerInfo[playerid][pDonateRank] == 1 && VehicleSpawned[playerid] >= 2) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu Bronze VIP ban co the lay 2 xe cung mot luc");
			}
			else if(PlayerInfo[playerid][pDonateRank] == 2 && VehicleSpawned[playerid] >= 2) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu Silver VIP ban co the lay 2 xe cung mot luc.");
			}
			else if(PlayerInfo[playerid][pDonateRank] == 3 && VehicleSpawned[playerid] >= 3) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu Gold VIP ban co the lay 3 xe cung mot luc.");
			}
			else if(PlayerInfo[playerid][pDonateRank] == 4 && VehicleSpawned[playerid] >= 5) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu Platinum VIP ban co the lay 5 xe cung mot luc.");
			}
			else if(PlayerInfo[playerid][pDonateRank] == 5 && VehicleSpawned[playerid] >= 5) {
				SendClientMessageEx(playerid, COLOR_GREY, "Neu VIP Moderator ban co the lay 5 xe cung mot luc.");
			}
			else if(!(0 <= PlayerInfo[playerid][pDonateRank] <= 5)) {
				SendClientMessageEx(playerid, COLOR_GREY, "Ban co mot cap do VIP khong hop le.");
			}
			else if((PlayerVehicleInfo[playerid][listitem][pvModelId]) < 400) {
				SendClientMessageEx(playerid, COLOR_GREY, "The vehicle slot is empty.");
			}
			else {

				new	iVeh;

				/*if(vitridau[rand] == 1){
					for(new i=0;i<sizeof(POSCX);i++){
						if(vitridau[i] != 1){
							rand = i;
							break;
						}
					}
				}*/

				iVeh = CreateVehicle(PlayerVehicleInfo[playerid][listitem][pvModelId], POSCX[vitrispawnxe][DAUXE_X], POSCX[vitrispawnxe][DAUXE_Y], POSCX[vitrispawnxe][DAUXE_Z], POSCX[vitrispawnxe][DAUXE_ROT],PlayerVehicleInfo[playerid][listitem][pvColor1], PlayerVehicleInfo[playerid][listitem][pvColor2], -1);
				//vitridau[rand] = 1;
				vitrispawnxe -= 1;
				if(vitrispawnxe == 0) vitrispawnxe = 6;

                SetVehicleVirtualWorld(iVeh, 0);
                LinkVehicleToInterior(iVeh, 0);
				++PlayerCars;
				VehicleSpawned[playerid]++;
				PlayerVehicleInfo[playerid][listitem][pvSpawned] = 1;
				PlayerVehicleInfo[playerid][listitem][pvId] = iVeh;
				if(PlayerVehicleInfo[playerid][listitem][pvLocked] == 1) LockPlayerVehicle(playerid, iVeh);
				LoadPlayerVehicleMods(playerid, listitem);
				g_mysql_SaveVehicle(playerid, listitem);

				new vstring[64];
				format(vstring, sizeof(vstring), "Ban da lay %s cua ban ra khoi kho.", VehicleName[PlayerVehicleInfo[playerid][listitem][pvModelId] - 400]);
				SendClientMessageEx(playerid, COLOR_WHITE, vstring);
				CheckPlayerVehiclesForDesync(playerid);
				Vehicle_ResetData(iVeh);
				//SetVehicleHealth(iVeh, VehicleHealth[iVeh]);
				SetVehicleHealth(iVeh, PlayerVehicleInfo[playerid][listitem][pvHealth]);
				VehicleHealth[iVeh] = PlayerVehicleInfo[playerid][listitem][pvHealth];
				VehicleFuel[iVeh] = PlayerVehicleInfo[playerid][listitem][pvFuel];
				if(PlayerVehicleInfo[playerid][listitem][pvHealth] <= 600)
				{
					SendClientMessage(playerid, COLOR_RED, "[Vehicles] {FFFFFF}Phuong tien hu hong nang hay di bao tri");
				}

				if (VehicleFuel[iVeh] > 100.0) VehicleFuel[iVeh] = 100.0;
				else if (VehicleHealth[iVeh] > 1000.0) VehicleHealth[iVeh] = 1000.0;
			}
		}
		else SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lay mot chiec xe khong ton tai.");
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid,3.0,2069.3335,-1915.8473,13.5469))
		{
			new zone[MAX_ZONE_NAME];
			if(PlayerTied[playerid] != 0 || PlayerCuffed[playerid] != 0 || PlayerInfo[playerid][pJailTime] > 0 || GetPVarInt(playerid, "Injured")) return ChatHoTro(playerid, 255, "Ban khong the lam dieu nay vao luc nay.",5000);
			if(PlayerInfo[playerid][pFreezeCar] == 0 || PlayerInfo[playerid][pAdmin] >= 2)
			{
				new 
		            status[32],
		            vstring[4096] = "Ten\tDo ben\tTrang thai\tTinh trang\n", 
		            icount = GetPlayerVehicleSlots(playerid);
				
		        for(new i, iModelID; i < icount; i++) 
		        {
					if((iModelID = PlayerVehicleInfo[playerid][i][pvModelId] - 400) >= 0) 
		            {
						Get3DZone(PlayerVehicleInfo[playerid][i][pvPosX], PlayerVehicleInfo[playerid][i][pvPosY], PlayerVehicleInfo[playerid][i][pvPosZ], zone, sizeof(zone));
		                switch(PlayerVehicleInfo[playerid][i][pvHealth])
		                {
		                    case 0..600: status = "{ba1e1e}(Hu hong)";
		                    case 601..900: status = "{2b82e3}(Trung binh)";
		                    default: status = "{67f045}(Tot)";
		                }
		                if(!PlayerVehicleInfo[playerid][i][pvSpawned])
							format(vstring, sizeof(vstring), "%s\n%s\t%0.2f\t%s\tTrong kho", vstring, VehicleName[iModelID],PlayerVehicleInfo[playerid][i][pvHealth], status);
						else format(vstring, sizeof(vstring), "%s\n%s\t%0.2f\t%s\tDa lay", vstring, VehicleName[iModelID],PlayerVehicleInfo[playerid][i][pvHealth], status);
						//format(vstring, sizeof(vstring), "Ten\tVi tri\tDo ben\tTrang thai\n%s%s\t%s\t%0.2f\t(Dang dung)", vstring, VehicleName[iModelID],zone,PlayerVehicleInfo[playerid][i][pvHealth]);
					}
					else strcat(vstring, "\nTrong\n");
				}
				format(vstring, sizeof(vstring), "%s\n{40FFFF}Them slot xe {FFD700}(Credits: %s){A9C4E4}", vstring, number_format(ShopItems[23][sItemPrice]));
				ShowPlayerDialog(playerid, VEHICLESTORAGE, DIALOG_STYLE_TABLIST_HEADERS, "Phuong tien", vstring, "Chinh xe", "Huy bo");
			}
			else return SendClientMessageEx(playerid, COLOR_GRAD2, "Chiec xe nay da bi thu boi so canh sat, vui long toi DMV de lam thu tuc lay xe ra.");
			return 1;
		}
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(gPlayerLogged{playerid} == 1)
	{
		if(reason == 1)
		{
			new Float:pos[3];
			for(new v = 0; v < MAX_PLAYERVEHICLES; v++) 
			{
				if(PlayerVehicleInfo[playerid][v][pvId] != INVALID_PLAYER_VEHICLE_ID)
				{
					GetVehiclePos(PlayerVehicleInfo[playerid][v][pvId], pos[0], pos[1], pos[2]);
					if((2000<pos[0]<2100) && (-1950<pos[1]<-1850)){}
					else {
						//PlayerVehicleInfo[playerid][v][pvTicket] = 200;
						//PlayerVehicleInfo[playerid][v][pvImpounded] = 1;
						DestroyVehicle(PlayerVehicleInfo[playerid][v][pvId]);
						PlayerVehicleInfo[playerid][v][pvId] = INVALID_PLAYER_VEHICLE_ID;
						g_mysql_SaveVehicle(playerid, v);
					}
				}
			}
				
		}
		UnloadPlayerVehicles(playerid);
	}
}
