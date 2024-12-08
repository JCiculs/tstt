//include
#include <a_samp>
#include <YSI_Coding\y_hooks>
//define
#define LAYHANG 8848


//new
new Dalayhang[MAX_PLAYERS];
new XeBuonLau[MAX_PLAYERS];
new Timelayhang[MAX_PLAYERS];
new Thongbao[MAX_PLAYERS];
//dialog


//command
CMD:buonlau(playerid,params)
{
	if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessageEx(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi dang trong su kien Hunger Games!");
    if(IsPlayerConnected(playerid)) {
        new strcmp[32];
        if(isnull(params)) {
            SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /chapnhan [name]");
            SendClientMessageEx(playerid, COLOR_GREY, "layhang, huybo");
            return 1;
        }
        if(strcmp(params, "layhang", true) == 0)
		{
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"{D7DF01}Make Delivery{FFFFFF} Hay di chuyen den vi tri tren Mini-Maps de nhan hang");
            SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"{D7DF01}Make Delivery{FFFFFF} BOSS khong dan hang do la gi, vat pham se duoc random");
            SetPlayerCheckpoint(playerid,-71.3729,-1121.0305,1.0781,306.8484,3.0);
            CP[playerid] = 302;
            Dalayhang[playerid] = 1;
            Timelayhang[playerid] = 120;
            return 1;
        }
        if(strcmp(params, "huybo", true) == 0)
        {
            SendClientMessage(playerid, COLOR_WHITE, "Ban da huy bo don giao hang");
            CP[playerid] = 0;
            DisableCheckPoint(playerid);
            return 1;
        }
    }
    
}
//public
public OnPlayerEnterCheckpoint(playerid)
{
    if(CP[playerid] = 302) {
        switch(random(100)) {
            case 0..50
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}SHOTGUN");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 303;
            }
            case 51..80
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}DEAGLE");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 304;
            }
            case 81..100
            {
                SetPlayerCheckpoint(playerid,2802.6646,-1420.7982,16.2500,3.0);
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {ffffff}Ban da lay hang thanh cong");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[NOTE..] {C3C6C3}UZI");
                SendClientMessage(playerid, COLOR_WHITE, "{00ff00}----------------------------------------------");
                Thongbao[playerid] = 1;
                CP[playerid] = 305;
            }
        }
    }
    else if(CP[playerid] = 303)
    {
        SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[INVENTORY] {ffffff}+1 Shotgun - {ff0000}/myguns");
        GivePlayerValidWeapon(playerid,25,5);
    }
    else if(CP[playerid] = 304)
    {
        SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[INVENTORY] {ffffff}+1 Shotgun - {ff0000}/myguns");
        GivePlayerValidWeapon(playerid,24,5);
    }
    else if(CP[playerid] = 305)
    {
        SendClientMessage(playerid, COLOR_WHITE, "{00ff00}[INVENTORY] {ffffff}+1 Shotgun - {ff0000}/myguns");
        GivePlayerValidWeapon(playerid,28,5);
    }
    return 1;
}