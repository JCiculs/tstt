//include
#include <a_samp>
#include <YSI_Coding\y_hooks>
//define
#define LAYHANG 8848


//new
new Dalayhang[MAX_VEHICLES];
//new XeBuonLau[MAX_PLAYERS];
new Timelayhang[MAX_PLAYERS];
new Thongbao[MAX_PLAYERS];
//dialog
CMD:kiemtra(playerid, params[])
{
    if(!IsACop(playerid))
    {
        SendClientMessage(playerid, COLOR_WHITE, "[!] Ban Khong Phai Police.");
    }
    new truckcontentnames[10];
    new vehicleid = GetPlayerVehicleID(playerid);
    if(Dalayhang[vehicleid] == 1)
    { 
        SendClientMessageEx(playerid, COLOR_GREEN, "{FF0606}Xe Nay Dang Duoc Van Chuyen Vu Khi Pham Phap.");
        format(truckcontentnames, sizeof(truckcontentnames), "{FF0606}Xe Nay Dang Duoc Van Chuyen Vu Khi Pham Phap."); 
    }
    return 1;
}

CMD:lockbuonlau(playerid) {
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY,"Ban khong duoc phep su dung lenh nay!");
    
    if(buonlau_lock == 1) 
    {
        buonlau_lock = 0;
        SendClientMessage(playerid, -1, "Da Mo Lock Buon Lau");
    }
    else
    {
        buonlau_lock = 0;
        SendClientMessage(playerid, -1, "Da lock Buon Lau");
    }
    return 1;
}

//command
CMD:buonlau(playerid,params[])
{
    if(buonlau_lock == 1)
    {
        SendClientMessageEx(playerid, COLOR_GREY, "Chuc nang nay hien tai dang tam khoa boi admin.");
        return 1;
    }
    //if (policeonline >= 1) return SendClientMessageEx(playerid, COLOR_YELLOW2, "Hien tai khong co canh sat lam viec de ban co the buon lau");
	if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi dang trong su kien Hunger Games!");
    if(IsPlayerConnected(playerid)) {
        //new strcmp[32];
        if(isnull(params)) {
            SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /buonlau [name]");
            SendClientMessageEx(playerid, COLOR_GREY, "layhang, thuexe, huybo");
            return 1;
        }
		if(strcmp(params, "thuexe", true) == 0)
		{
            //new Float:X,Y,Z,A;
            //GetPlayerPos(playerid,X,Y,Z,A);
            //XeBuonLau[playerid] = CreateVehicle(413, 2458.1853,-2114.6025,13.2082,3.3464+1, 3, 3, -1);
            SetPlayerCheckpoint(playerid,2458.1853,-2114.6025,13.2082,3.0);
            //VehicleFuel[XeBuonLau[playerid]] = 100.0;
            CP[playerid] = 11;
            SendClientMessageEx(playerid, COLOR_RED,"{D7DF01}Make Delivery{FFFFFF} Ban da lay xe tu BOSS, hay lay no tai trucker job");
        }
        if(strcmp(params, "layhang", true) == 0)
		{
            new vehicleid = GetPlayerVehicleID(playerid);
            if(GetVehicleModel(vehicleid) == 414 || GetVehicleModel(vehicleid) == 422)
            {
                if(PlayerInfo[playerid][pCash] < 20000) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co du 10,000$ de mua hang cam!");
                {
                    PlayerInfo[playerid][pCash] -= 20000;
                    SendClientMessage(playerid, -1, "{FF0000}[!] {FFFFFF}Ban da mua thung hang cam, Hay di chuyen den muc tieu da thong bao");

                    SendClientMessageEx(playerid, COLOR_RED,"{D7DF01}[!]{FFFFFF} Hay di chuyen den diem lay hang, da duoc danh dau trong GPS");
                    SendClientMessageEx(playerid, COLOR_RED,"{D7DF01}[!]{FFFFFF} Nguoi ban khong tiet lo vat pham, vat pham se duoc random");
                    SetPlayerCheckpoint(playerid,-71.3729,-1121.0305,1.0781,3.0);
                    CP[playerid] = 302;
                    //new vehicleid = GetPlayerVehicleID(playerid);
                    Dalayhang[vehicleid] = 1;
                    Timelayhang[playerid] = 120;
                }
            }
            else return SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
        }
        if(strcmp(params, "huybo, true") == 0)
        {
            SendClientMessage(playerid, COLOR_WHITE, "Ban da huy bo don giao hang");
            CP[playerid] = 0;
            DisableCheckPoint(playerid);
        }
    }
    else  SendClientMessageEx(playerid, COLOR_GREY, "Hien Tai Khong Canh Sat Dang Hoat Dong");
    return 1;
}
//public
hook OnPlayerEnterCheckpoint(playerid)
{
    if(CP[playerid] == 302) {
        switch(random(135))
        {
            case 0..50:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}SHOTGUN");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                //ItemName = 1;
                CP[playerid] = 303;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
            case 51..80:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}DEAGLE");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 304;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
            case 81..100:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}UZI");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 305;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
            case 101..120:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}9mm");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 306;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
            case 121..130:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}AK47");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 307;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
            case 131..135:
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}10 Crack");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 308;
                new szMessage[256];
                new zone[MAX_ZONE_NAME];
                new vehicleid = GetPlayerVehicleID(playerid);
                GetPlayer3DZone(playerid, zone, sizeof(zone));
                format(szMessage, sizeof(szMessage), "[CCTV Flint]: Phat Hien Co Van Chuyen Hang Cam Tren Phuong Tien %s, Tai Khu Vuc %s", GetVehicleName(vehicleid), zone);
                SendPoliceMessage(COLOR_RED, szMessage);
            }
        }
    }
    else if(CP[playerid] == 303)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(GetVehicleModel(vehicleid) == 414 || GetVehicleModel(vehicleid) == 422)
        {
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+1 Shotgun - {ff0000}/myguns");
            GivePlayerValidWeapon(playerid,25,60000);
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
//            new vehicleid = GetPlayerVehicleID(playerid);
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
    else if(CP[playerid] == 304)
    {
        if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414 || GetPlayerVehicleID(playerid) != 422)
		{
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+1 Deagle - {ff0000}/myguns");
            GivePlayerValidWeapon(playerid,24,60000);
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
            new vehicleid = GetPlayerVehicleID(playerid); 
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
    else if(CP[playerid] == 305)
    {
        if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414 || GetPlayerVehicleID(playerid) != 422)
		{
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+1 Mac Uzi - {ff0000}/myguns");
            GivePlayerValidWeapon(playerid,28,60000);
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
            new vehicleid = GetPlayerVehicleID(playerid);
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
    else if(CP[playerid] == 306)
    {
        if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414 || GetPlayerVehicleID(playerid) != 422)
        {
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+1 9mm - {ff0000}/myguns");
            GivePlayerValidWeapon(playerid,22,60000);
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
            new vehicleid = GetPlayerVehicleID(playerid);
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
     else if(CP[playerid] == 307)
    {
        if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414 || GetPlayerVehicleID(playerid) != 422)
        {
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+1 AK47 - {ff0000}/myguns");
            GivePlayerValidWeapon(playerid,30,60000);
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
            new vehicleid = GetPlayerVehicleID(playerid);
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
    else if(CP[playerid] == 308)
    {
        if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 414 || GetPlayerVehicleID(playerid) != 422)
        {
            SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[Hang Cam] {ffffff}+10 Crack - {ff0000}/tuido");
            //GivePlayerValidWeapon(playerid,34,60000);
            PlayerInfo[playerid][pCrack] += 10;
            DisableCheckPoint(playerid);
            DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
            DestroyDynamic3DTextLabel(Text3DTrucker[playerid]); 
            DeletePVar(playerid,"DalayXe");
            new vehicleid = GetPlayerVehicleID(playerid);
            Dalayhang[vehicleid] = 0;
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Day khong phai xe trucker");
    }
    else if(CP[playerid] == 11)
    {
        DisableCheckPoint(playerid);
    }
    return 1;
}

    //task
task Timelayhangs[1000]()
{
    foreach(new i: Player)
	{
        if(Timelayhang[i] > 0)
        {
            Timelayhang[i]--;
        }
        else
            Timelayhang[i] = 0;

        if(IsACop(i) & Thongbao[i] == 1)
            SendClientMessage(i, COLOR_RED, "{00ff00(NOTE WARNING WANTED) {ffffff}Phat hien doi tuong nao do dang lay hang cam tai khu vuc bien gioi");
    }
    return 1;
}