//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

//Job Trucker
// Credits : nDP
#include <YSI_Coding\y_hooks>

#define    DIALOG_LAYHANGTRUCKER         (17519)

new bool:onTrucker247[MAX_PLAYERS];
new bool:onTruckerX[MAX_PLAYERS];
//===========================================================================//

//================================ CMD =======================================//
 CMD:layhang(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, -382.8980,-1426.0128,26.2992)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o noi lay hang Trucker.");
	if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
            ShowPlayerDialog(playerid, DIALOG_LAYHANGTRUCKER, DIALOG_STYLE_LIST, "Giao hang", "Binh thuong (24/7)\nNguy Hiem", "Dong y", "Huy bo");
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai Nguoi dua hang!");
	return 1;
}

//============================================================================//

hook OnPlayerEnterCheckpoint(playerid)
{
    if(onTrucker247[playerid]) // if it's true
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
            PlayerInfo[playerid][pCash] += 0;
	        SendClientMessageEx(playerid, COLOR_GREY, "He Thong Dang Bao Tri Job Trucker , Mong Cac Ban Quay Lai Sau <3.");
	        DisablePlayerCheckpoint(playerid);
	        onTrucker247[playerid] = false;
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
    }
    if(onTruckerX[playerid]) // if it's true
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(IsATruckerCar(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
			PlayerInfo[playerid][pCash] += 0;
	        SendClientMessageEx(playerid, COLOR_GREY, "He Thong Dang Bao Tri Job Trucker , Mong Cac Ban Quay Lai Sau <3.");
	        DisablePlayerCheckpoint(playerid);
	        onTruckerX[playerid] = false;
	    }
	    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong lai chiec xe tai cho hang hoa yeu cau!");
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_LAYHANGTRUCKER)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
                SendClientMessageEx(playerid, COLOR_GREY, "Dia diem da duoc danh dau tren ban do, hay giao den do.");
                SetPlayerCheckpoint(playerid, 1446.2496,-1353.2422,13.5469, 3.0);
                onTrucker247[playerid] = true;
                return 1;
			}
			if(listitem == 1)
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Dia diem da duoc danh dau tren ban do, hay giao den do.");
                SetPlayerCheckpoint(playerid, 1446.2496,-1353.2422,13.5469, 3.0);
                onTruckerX[playerid] = true;
                return 1;
			}
		}
	}
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
