#include <a_samp>
#include <YSI_Coding\y_hooks>

new Float:GhepxeFloats[MAX_PLAYERS][3];


#define TRUNGTHU 8787
#define			GHEPXE					(7772) 		

//new
new TrungThu[MAX_PLAYERS];
//new Banh[MAX_PLAYERS];


task PhatBanhTrungThu[2000000]()
{
    foreach(new i: Player)
    {
		new giveplayerid;
        SendClientMessageToAll(COLOR_WHITE,"{00FF00}[TRUNG THU GIFT] {ffffff}Ban duoc 1 phieu doi qua, hay den Ganton");
        PlayerInfo[giveplayerid][pBanh] += 1;
        return 1;
    }
} 
CMD:chobanhs(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 7)
	{
		new string[128], giveplayerid, money;
		if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givemoney [player] [money]");

		if(money < 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "You cannot give less than $1!");
		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[playerid][pBanh] += money;
			format(string, sizeof(string), "Ban da cho %s $%s !",GetPlayerNameEx(giveplayerid), number_format(money));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has given %s $%s (/givemoney)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), number_format(money));
			Log("logs/stats.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:traodoi(playerid,params[])
{
    if(TrungThu[playerid] < 3)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 2289.4475,-1743.2357,13.5469) || IsPlayerInRangeOfPoint(playerid, 3.0, 2289.3279,-1741.2294,13.5469))
		{
            SendClientMessage(playerid, COLOR_WHITE,"{ff0000}[TRUNG THU] {ffffff}MENU");
            ShowPlayerDialog(playerid, TRUNGTHU, DIALOG_STYLE_TABLIST_HEADERS, "Che tao dan",
                        "Ten dan\tGia Tri\n\
                        1 Phieu Ghep Xe\t2 Banh\n\
                        5 Crack\t3 Banh\n\
                        5 Pot\t3 Banh\n\
                        Uzi\t5 Banh\n\
                        1 SVIP 7 Day\t13 Banh\n\
                        Uranus\t23 Banh\n\
                        RandomCar Box\t35 Banh\n\
                        VIP Platinum 1 Moths\t50 Banh",
                        "Trao Doi", "Huy bo");
            return 1;
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
    if(dialogid == GHEPXE)
 	{
  		if(response)
    	{
     		if(PlayerInfo[playerid][pManhxe] >= 5)
			{
			    if(GetPVarInt(playerid, "Move") == 0)
			    {
					SetPVarInt(playerid, "TimeGhepXe", 30);
                	SetTimerEx("GhepXe", 700, 0, "d", playerid);
                	SetPVarInt(playerid, "Move", 1);
                	GetPlayerPos(playerid, GhepxeFloats[playerid][0], GhepxeFloats[playerid][1], GhepxeFloats[playerid][2]);
                	SendClientMessage(playerid, COLOR_YELLOW, "Vui long khong di chuyen.");
                }
                else SendClientMessage(playerid, COLOR_GRAD2, "Ban dang tien hanh ghep xe.");
			 }
	         else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co du 5 manh ghep xe.");
    	}
    }
    if(dialogid == TRUNGTHU)
    {
        if(listitem == 0)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 2)
                {
                    PlayerInfo[playerid][pBanh] -= 2;
                    //TrungThu[playerid] += 1;
                    PlayerInfo[playerid][pManhxe] += 5;
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 2 banh trung thu lay 5 manh xe [/ghepxe]");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
//			else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 1)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 3)
                {
                    PlayerInfo[playerid][pBanh] -= 3;
                    //TrungThu[playerid] += 1;
                    PlayerInfo[playerid][pCrack] += 3;
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 3 banh trung thu lay 2 Crack");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
	//		else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 2)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 3)
                {
                    PlayerInfo[playerid][pBanh] -= 3;
                 //   TrungThu[playerid] += 1;
                    PlayerInfo[playerid][pPot] += 3;
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 3 banh trung thu lay 2 Pot");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
	//		else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 3)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 5)
                {
                    PlayerInfo[playerid][pBanh] -= 5;
                //    TrungThu[playerid] += 1;
                    GivePlayerValidWeapon(playerid,28,99999);
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 5 banh trung thu lay UZI");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
	//		else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 4)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 13)
                {
                    PlayerInfo[playerid][pBanh] -= 13;
               //     TrungThu[playerid] += 1;
                    PlayerInfo[playerid][pSVIPVoucher] += 1;
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 13 banh trung thu lay SVIP 7 Day");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
	//		else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 5)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 23)
                {
                    PlayerInfo[playerid][pBanh] -= 23;
              //      TrungThu[playerid] += 1;
                    SendClientMessage(playerid, COLOR_WHITE, "F8 Gui len DISCORD.");
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 23 banh trung thu lay Uranus");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
	//		else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 6)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 35)
                {
                    PlayerInfo[playerid][pBanh] -= 35;
              //      TrungThu[playerid] += 1;
                    SendClientMessage(playerid, COLOR_WHITE, "F8 Gui len DISCORD.");
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 35 banh trung thu lay RandomCar Box");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
      //      else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
        if(listitem == 7)
		{
    		//if(TrungThu[playerid] < 3)
            {
                if(PlayerInfo[playerid][pBanh] > 50)
                {
                    PlayerInfo[playerid][pBanh] -= 50;
              //      TrungThu[playerid] += 1;
                    PlayerInfo[playerid][pPVIPVoucher] += 1;
                    SendClientMessage(playerid, COLOR_WHITE, "Ban da trao doi 50 banh trung thu lay Platinum VIP 1 Moths");
                    return 1;
                }
                else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
            }
        //    else return SendClientMessage(playerid, COLOR_WHITE, "Ban khong du banh trung thu.");
		}
    }
}

CMD:ghepxe(playerid, params[])
{
	if(PlayerInfo[playerid][pManhxe] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban chua co manh xe nao.");
	if(!vehicleCountCheck(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Kho xe da day, Ban khong the mua them xe duoc nua - Ban co the mua them slot xe cua ban thong qua /vstorage.");
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 2314.5154,-1742.1925,13.3828))
	{
 		ShowPlayerDialog(playerid, GHEPXE, DIALOG_STYLE_MSGBOX, "GHEP XE","{FFFFFF}Ban co chac chan muon ghep xe\nTi le thanh cong: {ff1900}49%\n{FFFFFF}Chi phi: {ff1900}5 manh ghep xe", "Dong y", "Huy bo");
	}
	else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong o dia diem ghep xe.");
	return 1;
}

forward GhepXe(playerid);
public GhepXe(playerid)
{
    SetPVarInt(playerid, "TimeGhepXe", GetPVarInt(playerid, "TimeGhepXe")-1);
    new string[128];
    format(string, sizeof(string), "Dang ghep xe %d giay", GetPVarInt(playerid, "TimeGhepXe"));

    GameTextForPlayer(playerid, string, 1100, 3);

    if(GetPVarInt(playerid, "TimeGhepXe") > 0) SetTimerEx("GhepXe", 700, 0, "d", playerid);

    if(GetPVarInt(playerid, "TimeGhepXe") <= 0)
    {
   	   new Float:posX, Float:posY, Float:posZ;
   	   GetPlayerPos(playerid, posX, posY, posZ);
       if(GhepxeFloats[playerid][0] != posX || GhepxeFloats[playerid][1] != posY || GhepxeFloats[playerid][2] != posZ)
       {
	   	   SendClientMessageEx(playerid, COLOR_YELLOW, "Ghep xe that bai ban da di chuyen, hay su dung '/ghepxe' de ghep lai");
 	       DeletePVar(playerid, "Move");
   	       return 1;
       }
       switch(random(100))
       {
 			case 0..80:
		 	{
				DeletePVar(playerid, "Move");
				DeletePVar(playerid, "TimeGhepXe");
    			format(string, sizeof(string), "~y~Da ghep xong");
				GameTextForPlayer(playerid, string, 5000, 3);
 				SendClientMessageEx(playerid, COLOR_WHITE,"Ghep xe that bai, ban bi mat 5 manh xe.");
				format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) da ghep xe that bai", GetPlayerNameEx(playerid), playerid);
				ABroadCast( COLOR_YELLOW, string, 2 );
		 		PlayerInfo[playerid][pManhxe] -= 5;
			}
			case 81..100:
			{
				switch(random(151))
				{
					case 0..50:
					{
	    				DeletePVar(playerid, "Move");
					    DeletePVar(playerid, "TimeGhepXe");
					    PlayerInfo[playerid][pManhxe] -= 5;
						new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 543, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
						SendClientMessageEx(playerid, COLOR_GREEN, "Ban ghep xe thanh cong, nhan duoc 1 chiec xe Sadler.");
						format(string, sizeof(string), "~y~Da ghep xong");
						GameTextForPlayer(playerid, string, 5000, 3);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) ghep xe thanh cong, nhan duoc SADLER.", GetPlayerNameEx(playerid), playerid);
						ABroadCast( COLOR_YELLOW, string, 2 );
					}
					case 51..90:
					{
	    				DeletePVar(playerid, "Move");
					    DeletePVar(playerid, "TimeGhepXe");
					    PlayerInfo[playerid][pManhxe] -= 5;
						new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 422, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
						SendClientMessageEx(playerid, COLOR_GREEN, "Ban ghep xe thanh cong, nhan duoc 1 chiec xe Bobcab.");
						format(string, sizeof(string), "~y~Da ghep xong");
						GameTextForPlayer(playerid, string, 5000, 3);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) ghep xe thanh cong, nhan duoc Bobcab.", GetPlayerNameEx(playerid), playerid);
						ABroadCast( COLOR_YELLOW, string, 2 );
					}
					case 91..120:
					{
	    				DeletePVar(playerid, "Move");
					    DeletePVar(playerid, "TimeGhepXe");
					    PlayerInfo[playerid][pManhxe] -= 5;
						new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 589, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
						SendClientMessageEx(playerid, COLOR_GREEN, "Ban ghep xe thanh cong, nhan duoc 1 chiec xe Club.");
						format(string, sizeof(string), "~y~Da ghep xong");
						GameTextForPlayer(playerid, string, 5000, 3);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) ghep xe thanh cong, nhan duoc Club.", GetPlayerNameEx(playerid), playerid);
						ABroadCast( COLOR_YELLOW, string, 2 );
					}
					case 121..140:
					{
	    				DeletePVar(playerid, "Move");
					    DeletePVar(playerid, "TimeGhepXe");
					    PlayerInfo[playerid][pManhxe] -= 5;
						new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 543, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
						SendClientMessageEx(playerid, COLOR_GREEN, "Ban ghep xe thanh cong, nhan duoc 1 chiec xe Sadler.");
						format(string, sizeof(string), "~y~Da ghep xong");
						GameTextForPlayer(playerid, string, 5000, 3);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) ghep xe thanh cong, nhan duoc SADLER.", GetPlayerNameEx(playerid), playerid);
						ABroadCast( COLOR_YELLOW, string, 2 );
					}
					case 141..150:
					{
	    				DeletePVar(playerid, "Move");
					    DeletePVar(playerid, "TimeGhepXe");
					    PlayerInfo[playerid][pManhxe] -= 5;
						new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 412, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]+7, arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
						SendClientMessageEx(playerid, COLOR_GREEN, "Ban ghep xe thanh cong, nhan duoc 1 chiec may bay VooDoo.");
						format(string, sizeof(string), "~y~Da ghep xong");
						GameTextForPlayer(playerid, string, 5000, 3);
						format(string, sizeof(string), "{AA3333}AdmWarning{FFFF00}: %s (ID %d) ghep xe thanh cong, nhan duoc VooDoo.", GetPlayerNameEx(playerid), playerid);
						ABroadCast( COLOR_YELLOW, string, 2 );
					}
				}
			}
  		}
	}
	return 1;
}

