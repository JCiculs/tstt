#include <YSI_Coding\y_hooks>


#define         TRUCKER_VEHICLE_PRICE_RENT_LOW      5000
#define         TRUCKER_VEHICLE_PRICE_RENT_HIGH     8000
#define         TRUCKER_VEHICLE_SKILL_LOW           422
#define         TRUCKER_VEHICLE_SKILL_HIGH          543
#define         TRUCKER_VEHICLE_SKILL_LOW_NAME      "Bobcat"
#define         TRUCKER_VEHICLE_SKILL_HIGH_NAME     "Sadler"

enum Delivery_E
{
    dName[128],
    Float:dPosX,
    Float:dPosY,
    Float:dPosZ,
    dType
};
enum e_trstock
{
    stock_Danger,
    stock_Name[10],
    stock_Price,
    stock_Level,
    stock_Amount
};
new 
    HoldingBox[MAX_PLAYERS],
    BoxType[MAX_PLAYERS];

enum e_ptruck {
    tr_pVeh,
    tr_pVehRent,
    tr_pVehOwner,
    tr_pVehBox,
    tr_pVehType[7]
}
new TruckerPInfo[MAX_PLAYERS][e_ptruck];

/* new const CargoType[][] = 
{
    "Thuc an",
    "Nuoc uong",
    "Quan ao",
    "Vat lieu",
    "14/7 Items",
    "Vat lieu",
    "Ma tuy",
    "Vu khi",
}; */
new TruckerStock[][e_trstock] = {
    {0, "Vat lieu", 1000, 1, 40},      // 0
    {0, "Thuc an", 1000, 1, 40},       // 1
    {0, "Nuoc uong", 1000, 1, 40},     // 2
    {0, "Quan ao", 1000, 1, 40},       // 3
    {1, "Vat lieu", 2500, 2, 30},      // 4
    {1, "Ma tuy", 2500, 2, 30},         // 5
    {1, "Vu khi", 3000, 2, 30}         // 7
};

new DeliveryPoint[][Delivery_E] = 
{
    {"Nuoc Uong",     1154.0758,-1457.7233,15.7969,   1},
    {"Nuoc Uong",     1181.5801,-895.6475,43.2920,    1},
    {"Thuc An",   1831.1660,-1842.3566,13.5781,   2},
    {"Thuc An",   2141.8855,-1191.9597,23.9922,   2},
    {"Quan ao",     1103.1710,-1458.0597,15.7969,   3},
    {"Quan ao",     2131.6555,-1149.3217,24.2781,   3},
    {"Vat Lieu",    -90.5872, -1592.3298, 3.0043,   4},
    {"Vat Lieu",    -72.2189,-1184.7729,1.7500,     4},
    {"Vat lieu",    1707.7863,1025.8832,10.8203,    4},
    {"Ma tuy",      782.5085,354.4234,19.5786,      5},// bat hop phap
    {"Ma tuy",      1460.6835,-631.5534,95.7182,    5}, // bat hop phap
    {"Ma tuy",      1917.5175,173.5261,37.2662,     5}, // bat hop phap
    {"Vu Khi",      1630.8148,983.5129,10.8203,     7}, // bat hop phap
    {"Vu Khi",      1395.8634,459.3445,20.1972,     7}, // bat hop phap
    {"Vu khi",      -81.7324,-1175.2028,2.0791,     7} // bat hop phap
};

new 
    Product_Price[sizeof(DeliveryPoint)],
    Product_Demand[sizeof(DeliveryPoint)];

stock GetDeliveryPointID(playerid) // return -1 for null
{
    for(new i; i < sizeof(DeliveryPoint); i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, DeliveryPoint[i][dPosX], DeliveryPoint[i][dPosY], DeliveryPoint[i][dPosZ])) 
            return i;
    }

    return -1;
}

stock GetMaxTruckBox(vehicleid)
{
    if(GetVehicleModel(vehicleid) == 479) return 4;
    if(GetVehicleModel(vehicleid) == 440) return 5;

    return 3;
}

stock PlayerTruckSkill(playerid)
{
    new lv = 0;
    new level = PlayerInfo[playerid][pTruckSkill];
    if(level >= 0 && level < 50) lv = 1;
    else if(level >= 51 && level < 200) lv = 2;
    else if(level >= 201 && level < 450) lv = 3;
    else if(level >= 451 && level < 700) lv = 4;
    else if(level >= 701) lv = 5;
    return lv;
}

/* stock GetTruckID(carid)
{

    for(new i; i < 10; i ++)
        if(TruckerInfo[i][tID] == carid) return i;

    return -1;
} */
stock GetTruckID(carid)
{
    if(TruckerPInfo[playerid][tr_pVeh] == carid) return carid;
    return -1;
}

stock DisplayOrders(playerid)
{
	new szDialog[2048];
	for (new i, j; i < MAX_BUSINESSES; i++)
	{
	    if (Businesses[i][bOrderState] == 1)
	    {
	        if(Businesses[i][bType] > 0)
	        {
		    	format(szDialog, sizeof(szDialog), "%s%s\t%s\n", szDialog, Businesses[i][bName], GetInventoryType(i));
				ListItemTrackId[playerid][j++] = i;
			}
		}
	}

	if (!szDialog[0])
	{

        new
            stockSize = sizeof(TruckerStock),
            string[1028];
        strcat(string, "Ten hang hoa\tNguy hiem\tGia tien\tSo luong hang");
        for(new i = 0; i < stockSize; i++)
            format(string, sizeof(string), "%s\n%s\t%s\t$%s\t   {bebebe}%d", string, TruckerStock[i][stock_Name], TruckerStock[i][stock_Danger] ? "{AA3333}Nguy hiem" : "{33AA33}An toan", number_format(TruckerStock[i][stock_Price]), TruckerStock[i][stock_Amount]);

		ShowPlayerDialog(playerid, DIALOG_LOADTRUCKL, DIALOG_STYLE_TABLIST_HEADERS, "Ban muon lay mat hang nao?", string, "Lua chon", "Thoat");
	}
	else
	    ShowPlayerDialog(playerid, DIALOG_LOADTRUCK, DIALOG_STYLE_LIST, "Don dat hang co san", szDialog, "Co", "Dong lai");
	return 1;
}
stock Trucker_GetPriceRent(vehicleid)
{
    return vehicleid == TRUCKER_VEHICLE_SKILL_LOW ? TRUCKER_VEHICLE_PRICE_RENT_LOW : vehicleid == TRUCKER_VEHICLE_SKILL_HIGH ? TRUCKER_VEHICLE_PRICE_RENT_HIGH : 0;
}
//gia tien truck
forward ProductChange();
public ProductChange()
{
    for(new i = 0; i <= 6; i++) TruckerStock[i][stock_Amount] = 30;
    for(new i; i < sizeof(DeliveryPoint); i ++)
    {
        if(DeliveryPoint[i][dType] == 1) Product_Price[i] = Random(200, 1000);
        else if(DeliveryPoint[i][dType] == 2) Product_Price[i] = Random(200, 1000);
        else if(DeliveryPoint[i][dType] == 3) Product_Price[i] = Random(200, 1000);
        else if(DeliveryPoint[i][dType] == 4) Product_Price[i] = Random(200, 1000);
        else if(DeliveryPoint[i][dType] == 5) Product_Price[i] = Random(1000, 2000);
        else if(DeliveryPoint[i][dType] == 6) Product_Price[i] = Random(1000, 2000);
        else if(DeliveryPoint[i][dType] == 7) Product_Price[i] = Random(1000, 2000);

        Product_Demand[i] = Random(50, 100);
    }

    SetTimerEx("ProductChange", 60000 * 45, true, "");
    return 1;
}
stock Trucker_DestroyCar(playerid)
{
    TruckerPInfo[playerid][tr_pVehBox] = 0;
    for(new d = 0; d < 7; d++)
    {
        TruckerPInfo[playerid][tr_pVehType][d] = 0;
    }
    DestroyVehicle(TruckerPInfo[playerid][tr_pVeh]);
    TruckerPInfo[playerid][tr_pVeh] = INVALID_VEHICLE_ID;
    TruckerPInfo[playerid][tr_pVehRent] = 0;
    TruckerPInfo[playerid][tr_pVehOwner] = -1;
    HoldingBox[playerid] = 0;
    BoxType[playerid] = 0;
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_WALK))
    {	
        if(PlayerInfo[playerid][pJob] == 20)
        {
            if(IsPlayerInAnyVehicle(playerid))
                return SendClientMessage(playerid, COLOR_GRAD2, "Khong the lam dieu nay tren xe.");

            // new closest = GetClosestCar(playerid);
            new vehicleid = TruckerPInfo[playerid][tr_pVeh];
            new Float:vPos[3];
            GetVehiclePos(vehicleid, vPos[0], vPos[1], vPos[2]);
            if(IsPlayerInRangeOfPoint(playerid, 2.0, 2197.7661,-2663.6111,13.5469))
            {
                if(HoldingBox[playerid])
                {
                    // RemainingStock[BoxType[playerid] - 1]++;
                    TruckerStock[BoxType[playerid] - 1][stock_Amount]++;
                    new stringz[130];
                    format(stringz, sizeof(stringz), "[Crate]{FFFFFF} Ban da dua thung hang %s%s{FFFFFF} vao lai kho.", TruckerStock[BoxType[playerid]-1][stock_Danger] ? "{AA3333}" : "{33AA33}", TruckerStock[BoxType[playerid]-1][stock_Name]);
                    SendClientMessage(playerid, 0xF63737FF, stringz);
                    BoxType[playerid] = 0;
                    HoldingBox[playerid] = 0;
	
                    ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, false, false, false, false, 0, 1);
                    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);	
                    RemovePlayerAttachedObject(playerid, 9);
                }
                else {
                    new stringz[150];
                    format(stringz, sizeof(stringz), "Lay dong phuc:\tID (%d)\n\
                                                    Thue xe:\t%s\n\
                                                    {ffa500}> Mua hang hoa tai day", 133, TruckerPInfo[playerid][tr_pVeh] == INVALID_VEHICLE_ID? "{bebebe}(Chua thue)": GetVehicleName(TruckerPInfo[playerid][tr_pVeh]));
                    ShowPlayerDialog(playerid, DIALOG_TRUCKER_INFO, DIALOG_STYLE_TABLIST, "Trucker", stringz, "Chon", "Thoat");
                }
            }
            
            else if(IsPlayerInRangeOfVehicle(playerid, vehicleid, 4.0))
            {
                new bool:engine,bool:lights,bool:alarm,bool:doors,bool:bonnet,bool:boot,bool:objective;
                GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
                // carslot = GetTruckID(closest);

                if(HoldingBox[playerid] == 0) return 1;
                if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
                    return SendClientMessage(playerid, COLOR_GRAD2, "Cop xe chua duoc mo.");
                if(TruckerPInfo[playerid][tr_pVehBox] >= GetMaxTruckBox(vehicleid))
                    return SendClientMessage(playerid, COLOR_GRAD2, "Chiec xe tai nay khong the chua them.");

                for(new i; i < GetMaxTruckBox(vehicleid); i ++)
                {
                    if(TruckerPInfo[playerid][tr_pVehType][i] == 0) {
                        TruckerPInfo[playerid][tr_pVehType][i] = BoxType[playerid];
                        break;
                    }
                }
                TruckerPInfo[playerid][tr_pVehBox]++;
                new msg[150];
                format(msg, sizeof(msg), "[Crate]{FFFFFF} Ban da chat hang %s%s{FFFFFF} len xe tai.", TruckerStock[BoxType[playerid]-1][stock_Danger] ? "{AA3333}" : "{33AA33}", TruckerStock[BoxType[playerid]-1][stock_Name]);
                SendClientMessage(playerid, 0xF63737FF, msg);
                HoldingBox[playerid] = 0;
                BoxType[playerid] = 0;	
                ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, false, false, false, false, 0, 1);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);	
                RemovePlayerAttachedObject(playerid, 9);
            }

            if(GetDeliveryPointID(playerid) != -1)
            {
                new 
                    delivery = GetDeliveryPointID(playerid),
                    d_type = DeliveryPoint[delivery][dType];
                if(HoldingBox[playerid] != 0)
                {
                    if(BoxType[playerid] != d_type)
                        return SendClientMessage(playerid, COLOR_GRAD2, "Mat hang nay khong duoc thu mua tai day.");
                    if(Product_Demand[delivery] == 0)   
                        return SendClientMessage(playerid, COLOR_GRAD2, "Diem mua hang nay khong con nhu cau nua.");

                    ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, false, false, false, false, 0, 1);
                    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);		
                    RemovePlayerAttachedObject(playerid, 9);

                    new msg[200];
                    if(BoxType[playerid] < 5)
                    {
                        GivePlayerCash(playerid, Product_Price[delivery]);
                        format(msg, sizeof(msg), "[Trucker - Hop Phap]{FFFFFF} Ban da giao mat hang nay cho {FFA629}%s{FFFFFF} va nhan duoc {04F000}$%s{FFFFFF}.", DeliveryPoint[delivery][dName], number_format(Product_Price[delivery]));
                        SendClientMessage(playerid, 0xF63737FF, msg);
                    }
                    else 
                    {
                        PlayerInfo[playerid][pTienBan] += Product_Price[delivery];
                        format(msg, sizeof(msg), "[Trucker - Pham Phap]{FFFFFF} Ban da giao mat hang nay cho {FFA629}%s{FFFFFF} va nhan duoc {AA3333}$%s{FFFFFF} tien ban.", DeliveryPoint[delivery][dName], number_format(Product_Price[delivery]));
                        SendClientMessage(playerid, 0xF63737FF, msg);
                    }
                    
                    HoldingBox[playerid] = 0;
                    BoxType[playerid] = 0;
                
                    if(DoubleXP) {
                        SendClientMessage(playerid, COLOR_YELLOW, "Ban da duoc 2 diem ky nang Truck thay vi 1 diem. (Nhan doi XP)");
                        PlayerInfo[playerid][pTruckSkill] += 2;
                        PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE + 3;
                    }
                    else if(PlayerInfo[playerid][pDoubleEXP] > 0 && !DoubleXP)
                    {

                        format(msg, sizeof(msg), "Ban da duoc 2 ky nang truck thay vi 1 diem. Ban co %d gio con lai de nhan doi EXP token.", PlayerInfo[playerid][pDoubleEXP]);
                        SendClientMessage(playerid, COLOR_YELLOW, msg);
                        PlayerInfo[playerid][pTruckSkill] += 2;
                        PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE + 3;
                    }
                    else
                    {
                        PlayerInfo[playerid][pTruckSkill] += 1;
                        PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE + 1;
                    }
                }
            }
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_TRUCKER_INFO) // TRUCKER JOB LEGAL GOODS
	{
 		if(response)
		{
            switch(listitem)
            {
                case 0:
                {
                    // if(PlayerInfo[playerid][pJob] != 16 && PlayerInfo[playerid][pJob2] != 2)
                    //     SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban khong phai nhan vien van chuyen hang hoa.");
                    if(GetPlayerSkin(playerid) == 133)
                        SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban dang mac dong phuc lam viec roi !.");
                    else
                    {
                        // new skinid = GetPlayerSkin(playerid);
                        // PlayerInfo[playerid][pDongPhucTruck] = skinid;
                        SetPlayerSkin(playerid, 133);
                        PlayerInfo[playerid][pModel] = 133;
                        SendClientMessage(playerid, -1, "{FFFF00}>{FFFFFF} Ban da lay dong phuc lam viec, gio hay bat dau thue xe bat dau cong viec.");
                    }   	
                }
                case 1:
                {
                     if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20)
                         SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban khong phai nhan vien van chuyen hang hoa.");
                    if(GetPlayerSkin(playerid) != 133)
                        SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban khong mac dong phuc nhan vien van chuyen hang.");
                    else if(PlayerInfo[playerid][pVW] != 0)
                        SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban dang khong o noi dang ky xe cho hang the gioi that");   
                    // else if(TruckerPInfo[playerid][tr_pVeh] != INVALID_VEHICLE_ID)
                    //     SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban da dang ky xe cho hang roi");   
                    else
                    {
                        new carList[150];
                        new stringz[150];
                        format(carList, sizeof(carList), "1. Benson\t{f4a460}1 -> 2\t{f0e68c}$5.000\n\
                                                        2. Walton\t{f4a460}3 -> 4\t{f0e68c}$5.000\n\
                                                        3. Rumpo\t{f4a460}5\t{f0e68c}$5.000\n");
                        format(stringz, sizeof(stringz), "Ten\tLevel Truck\tGia tien\n%s{696969}---> Tra xe", carList);
                        ShowPlayerDialog(playerid, DIALOG_TRUCKER_RENTCAR, DIALOG_STYLE_TABLIST_HEADERS, "Trucker - Rent Car", stringz, "Chon", "<<");
                    }
                }
                case 2:
                {
                     if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20)
                        SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban khong phai nhan vien van chuyen hang hoa.");
                    if(GetPlayerSkin(playerid) != 133)
                        SendClientMessage(playerid, -1, "{f4a460}[Trucker Job]{FFFFFF} Ban khong mac dong phuc nhan vien van chuyen hang.");
                    else if(TruckerPInfo[playerid][tr_pVeh] == INVALID_VEHICLE_ID)
                        SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban chua dang ky xe cho hang.");
                    else 
                        DisplayOrders(playerid);   
                }
            }
        }
    }        
    if(dialogid == DIALOG_TRUCKER_RENTCAR) // TRUCKER JOB LEGAL GOODS
	{
 		if(response)
		{
            if(listitem == 0)
            {
                new vehicleid = TruckerPInfo[playerid][tr_pVeh];
                if(vehicleid != INVALID_VEHICLE_ID)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban da dang ky xe cho hang roi . Vui long tra xe de co the thue lai");
                else if(PlayerInfo[playerid][pCash] < 5000)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban khong co du tien de thue xe.");
                else
                {
                    TruckerPInfo[playerid][tr_pVeh] = CreateVehicle(499, 2224.4780,-2639.5083,13.4263,283.3091, random(10), random(10), -1); //thue xe trucker
                    LinkVehicleToInterior(TruckerPInfo[playerid][tr_pVeh], GetPlayerInterior(playerid));
                    VehicleFuel[TruckerPInfo[playerid][tr_pVeh]] = 100.0;
                    TruckerPInfo[playerid][tr_pVehRent] = 499;
                    TruckerPInfo[playerid][tr_pVehOwner] = playerid;
                    // KhoaXeTruck[TruckerPInfo[playerid][tr_pVeh]] = 0;
                    PutPlayerInVehicle(playerid, TruckerPInfo[playerid][tr_pVeh], 0);
                    PlayerInfo[playerid][pCash] -= 5000;

                    SendClientMessage(playerid, -1, "{FFFF00}>{FFFFFF} Ban da thue chiec xe {FFFF00}Benson{FFFFFF} voi gia {FFFF00}$5.000.");
                }    
            }
            if(listitem == 1)
            {
                new vehicleid = TruckerPInfo[playerid][tr_pVeh];
                if(vehicleid != INVALID_VEHICLE_ID)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban da dang ky xe cho hang roi . Vui long tra xe de co the thue lai");
                else if(PlayerInfo[playerid][pCash] < 5000)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban khong co du tien de thue xe.");
                else if(PlayerTruckSkill(playerid) < 3)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban chua du level trucker de thue phuong tien nay de cho hang.");
                else
                {
                    TruckerPInfo[playerid][tr_pVeh] = CreateVehicle(479, 2224.4780,-2639.5083,13.4263,283.3091, random(10), random(10), -1); //thue xe trucker
                    LinkVehicleToInterior(TruckerPInfo[playerid][tr_pVeh], GetPlayerInterior(playerid));
                    VehicleFuel[TruckerPInfo[playerid][tr_pVeh]] = 100.0;
                    TruckerPInfo[playerid][tr_pVehRent] = 479;
                    TruckerPInfo[playerid][tr_pVehOwner] = playerid;
                    // KhoaXeTruck[TruckerPInfo[playerid][tr_pVeh]] = 0;
                    PutPlayerInVehicle(playerid, TruckerPInfo[playerid][tr_pVeh], 0);
                    PlayerInfo[playerid][pCash] -= 5000;

                    SendClientMessage(playerid, -1, "{FFFF00}>{FFFFFF} Ban da thue chiec xe {FFFF00}Walton{FFFFFF} voi gia {FFFF00}$5.000.");
                }
            }
            if(listitem == 2)
            {
                new vehicleid = TruckerPInfo[playerid][tr_pVeh];
                if(vehicleid != INVALID_VEHICLE_ID)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban da dang ky xe cho hang roi . Vui long tra xe de co the thue lai");
                else if(PlayerInfo[playerid][pCash] < 5000)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban khong co du tien de thue xe.");
                else if(PlayerTruckSkill(playerid) < 5)
                    SendClientMessage(playerid, -1, "{AA3333}>{FFFFFF} Ban chua du level trucker de thue phuong tien nay de cho hang.");
                else
                {
                    TruckerPInfo[playerid][tr_pVeh] = CreateVehicle(440, 2224.4780,-2639.5083,13.4263,283.3091, random(10), random(10), -1); //thue xe trucker
                    LinkVehicleToInterior(TruckerPInfo[playerid][tr_pVeh], GetPlayerInterior(playerid));
                    VehicleFuel[TruckerPInfo[playerid][tr_pVeh]] = 100.0;
                    TruckerPInfo[playerid][tr_pVehRent] = 440;
                    TruckerPInfo[playerid][tr_pVehOwner] = playerid;
                    // KhoaXeTruck[TruckerPInfo[playerid][tr_pVeh]] = 0;
                    PutPlayerInVehicle(playerid, TruckerPInfo[playerid][tr_pVeh], 0);
                    PlayerInfo[playerid][pCash] -= 5000;

                    SendClientMessage(playerid, -1, "{FFFF00}>{FFFFFF} Ban da thue chiec xe {FFFF00}Rumpo{FFFFFF} voi gia {FFFF00}$5.000.");
                }
            }
            if(listitem == 3)
            {
                new vehicleid = TruckerPInfo[playerid][tr_pVeh];
                if(vehicleid == INVALID_VEHICLE_ID)
                    SendClientMessage(playerid, 2, "{AA3333}>{FFFFFF} Ban chua dang ky xe cho hang, khong the tra xe.");
                else
                {
                    Trucker_DestroyCar(playerid);
                    SendClientMessage(playerid, -1, "{FFFF00}>{FFFFFF} Ban da tra xe lai cho cong ty.");
                }
            }
        }
    }
    if(dialogid == DIALOG_LOADTRUCKL) // TRUCKER JOB LEGAL GOODS
	{
 		if(response)
		{
            if(HoldingBox[playerid] == 1)
                return SendClientMessage(playerid, COLOR_GRAD2, "[!] Tren tay ban dang co mot kien hang.");
            if(TruckerStock[listitem][stock_Amount] == 0)
                return SendClientMessage(playerid, COLOR_GRAD2, "> Mat hang nay khong con nua de giao.");

            // RemainingStock[listitem]--;
            TruckerStock[listitem][stock_Amount]--;
            HoldingBox[playerid] = 1;
            BoxType[playerid] = listitem + 1;
            ApplyAnimation(playerid, "CARRY", "liftup", 4.1, false, false, false, false, 0, 1);
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
            SetPlayerAttachedObject(playerid,  9, 1271, 5, 0.044377, 0.029049, 0.161334, 265.922912, 9.904896, 21.765972, 0.500000, 0.500000, 0.500000);	
            new msg[200];	
            format(msg, sizeof(msg), "[Crate]{FFFFFF} Ban da lay kien hang %s%s{FFFFFF} ->{AA3333} L-ALT{FFFFFF} de chat hang len xe.", TruckerStock[BoxType[playerid]-1][stock_Danger] ? "{AA3333}" : "{33AA33}", TruckerStock[BoxType[playerid]-1][stock_Name]);
            //GivePlayerCash(playerid, Product_Price[delivery]);
            SendClientMessage(playerid, 0xF63737FF, msg);
		}
	}

    if(dialogid == DIALOG_TRUCKCAR)
    {
        if(response)
        {
            // new closest = GetClosestCar(playerid);
            // new carslot = GetTruckID(closest);
            new vehicleid = TruckerPInfo[playerid][tr_pVeh];
            if(TruckerPInfo[playerid][tr_pVehType][listitem] != 0)
            {
                if(IsPlayerInAnyVehicle(playerid))
                    return SendClientMessage(playerid, COLOR_GRAD2, "Khong the lam dieu nay tren xe.");
                if(HoldingBox[playerid] == 1)
                    return SendClientMessage(playerid, COLOR_GRAD2, "Tren tay ban dang co mot kien hang.");

                new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
                GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
                if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
                    return SendClientMessage(playerid, COLOR_GRAD2, "Cop xe chua duoc mo.");

                HoldingBox[playerid] = 1;
                BoxType[playerid] = TruckerPInfo[playerid][tr_pVehType][listitem];
                ApplyAnimation(playerid, "CARRY", "liftup", 4.1, false, false, false, false, 0, 1);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
                SetPlayerAttachedObject(playerid,  9, 1271, 5, 0.044377, 0.029049, 0.161334, 265.922912, 9.904896, 21.765972, 0.500000, 0.500000, 0.500000);	

                TruckerPInfo[playerid][tr_pVehBox]--;
                TruckerPInfo[playerid][tr_pVehType][listitem] = 0;
            }
        }
    }

    if(dialogid == DIALOG_TRUCK_DELIVERY)
    {
        if(response)
        {
            SetPlayerCheckpoint(playerid, DeliveryPoint[listitem][dPosX], DeliveryPoint[listitem][dPosY], DeliveryPoint[listitem][dPosZ], 3.0);
            new msg[150];
            
            format(msg, sizeof(msg), "[Trucker]{FFFFFF} Diem giao hang da duoc danh dau (Khoang cach: %d SAM)", 
                            floatround(GetPlayerDistanceFromPoint(playerid, DeliveryPoint[listitem][dPosX], DeliveryPoint[listitem][dPosY], DeliveryPoint[listitem][dPosZ])));
            SendClientMessage(playerid, 0xF63737FF, msg);
        }
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
    TruckerPInfo[playerid][tr_pVehBox] = 0;
    for(new d = 0; d < 7; d++)
    {
        TruckerPInfo[playerid][tr_pVehType][d] = 0;
    }
    TruckerPInfo[playerid][tr_pVeh] = INVALID_VEHICLE_ID;
    TruckerPInfo[playerid][tr_pVehRent] = 0;
    TruckerPInfo[playerid][tr_pVehOwner] = -1;
    HoldingBox[playerid] = 0;
    BoxType[playerid] = 0;
    return 1;
}
hook OnPlayerDisconnect(playerid)
{
    
    if(TruckerPInfo[playerid][tr_pVeh] != INVALID_VEHICLE_ID)
    {
        Trucker_DestroyCar(playerid);
    }
    HoldingBox[playerid] = 0;
    BoxType[playerid] = 0;
    return 1;
}

CMD:truck(playerid, const params[])
{
    if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
    {

        new choice[32];
        if(sscanf(params, "s[32]", choice))
        {
            SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /truck [tuy chon]");
            SendClientMessage(playerid, COLOR_GRAD2, "Tuy chon: giaohang, hanghoa");
            return 1;
        }

        if(strcmp(choice, "giaohang", false) == 0)
        {
            new str[2048], szResult[56];
            format(str, sizeof(str), "{FFFFFF}Dia diem\tGia mat hang\tNhu cau\n");
            for(new i; i < sizeof(DeliveryPoint); i ++)
            {
                if(Product_Demand[i] >= 80) szResult = "{f4a460}Cao";
                else if(40 < Product_Demand[i] < 80) szResult = "{bebebe}Trung binh";
                else szResult = "{D00B0B}Thap";
                format(str, sizeof(str), "%s{FFA629}%d. {FFFFFF}%s\t{ffa500}$%s\t%s{FFFFFF}\n", str, i+1, DeliveryPoint[i][dName], number_format(Product_Price[i]), szResult);
            }
            ShowPlayerDialog(playerid, DIALOG_TRUCK_DELIVERY, DIALOG_STYLE_TABLIST_HEADERS, "Diem giao hang", str, "Danh dau", "Dong");
        }
        else if(strcmp(choice, "hanghoa", false) == 0)
        {
            new vehicle = TruckerPInfo[playerid][tr_pVeh],
                str[368]; // lấy ID phương tiện gần người chơi nhất;
            new Float:vPos[3];
            GetVehiclePos(vehicle, vPos[0], vPos[1], vPos[2]);
            if(IsPlayerInRangeOfVehicle(playerid, vehicle, 4.0) && !IsPlayerInAnyVehicle(playerid)) 
            {
                for(new i; i < GetMaxTruckBox(vehicle); i ++)
                {
                    new box_type = TruckerPInfo[playerid][tr_pVehType][i];
                    if(box_type != 0)
                    {
                        format(str, sizeof(str), "%s{FFA229}%d.{FFFFFF} %s\n", str, i+1, TruckerStock[box_type - 1][stock_Name], TruckerStock[box_type - 1][stock_Danger] ? "{AA3333}Nguy hiem" : "{33AA33}An toan");
                    }
                    else {
                        format(str, sizeof(str), "%s{FFA229}%d.{6B6B6B} Trong\n", str, i+1);
                    }
                }
                new stringz[60];
                format(stringz, sizeof(stringz), "Thung hang cua {EB1E1E}%s %d", GetVehicleName(vehicle), vehicle);
                ShowPlayerDialog(playerid, DIALOG_TRUCKCAR, DIALOG_STYLE_LIST, stringz, str, "Lay", "Dong");
            }
        }
    }
    return 1;
}

hook OnGameModeInit()
{
    ProductChange();

    for(new i; i < sizeof(DeliveryPoint); i++)
    {
        new string[70];
        format(string, sizeof(string), "[Delivery Point] %s\n{FFFFFF}L-ALT", DeliveryPoint[i][dName]);
        CreateDynamic3DTextLabel(string, 
            0xFFA629FF, 
            DeliveryPoint[i][dPosX], DeliveryPoint[i][dPosY], DeliveryPoint[i][dPosZ]+0.6,
            20.0);
        CreateDynamicPickup(1239, 23, DeliveryPoint[i][dPosX], DeliveryPoint[i][dPosY], DeliveryPoint[i][dPosZ]);
    }

    CreateDynamic3DTextLabel("Ocean Docks Warehouse\n{FFFFFF}L-ALT", 0xFFA629FF, 2197.7661, -2663.6111, 13.5469+0.6, 20.0);
    CreateDynamicPickup(1239, 23, 2197.7661, -2663.6111, 13.5469);
    return 1;
}

CMD:skilltruckzzzz(playerid, const params[])
{
    PlayerInfo[playerid][pTruckSkill] += 150;
    return 1;
}