#include <a_samp>
#include <YSI_Coding\y_hooks>
#define GROUP_PWINVITE 5024
#define GROUP_QUANLY 5023











CMD:setpwinv(playerid, params[])
{
    new giveplayerid, str[128];
    if(sscanf(params,"u",giveplayerid)) return SendClientMessage(playerid, -1, "/groups [ID/NAME]");
    if(0 <= PlayerInfo[playerid][pLeader] < MAX_GROUPS) 
    {
        if(!IsPlayerConnected(giveplayerid))
        {
            SendClientMessage(playerid, -1, "Nguoi choi khong online");
            return 1;
        }
        if(giveplayerid != playerid)
        {
            format(str, sizeof(str),"Ban da cap quyen cho %s",GetPlayerNameEx(giveplayerid));
            SendClientMessage(playerid, -1, str);
            format(str, sizeof(str),"%s da cap quyen cho ban Power Invite",GetPlayerNameEx(playerid));
            SendClientMessage(giveplayerid, -1, str);
            PlayerInfo[giveplayerid][pPwInvite] = 1;
        }
        else SendClientMessage(playerid, COLOR_GREY,"Khong the thuc hien tren ban than minh");   
    }
    return 1;
}

CMD:pdload(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid))
	{
        SendClientMessageEx(playerid, COLOR_GREY, "   Khong the su dung khi ban dang tren mot chiec xe!");
        return 1;
    }

    new string[128], giveplayerid, seat;
    if(sscanf(params, "ud", giveplayerid, seat)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pdload [Nguoi choi] [ID Seat]");

    if(IsPlayerConnected(giveplayerid))
	{
        if(giveplayerid != INVALID_PLAYER_ID)
		{
            if(!(2 <= seat <= 3))
			{
                SendClientMessageEx(playerid, COLOR_GRAD1, "ID Seat khong duoc tren 3 duoi 2");
                return 1;
            }
            if(GetPVarInt(giveplayerid, "Injured") != 1)
			{
                SendClientMessageEx(playerid, COLOR_GREY, "Benh nhan khong bi thuong, ban khong the dua len xe");
                return 1;
            }
            if(IsPlayerInAnyVehicle(giveplayerid))
			{
                SendClientMessageEx(playerid, COLOR_GREY, "Benh nhan do dang tren mot chiec xe, ban khong the dua len xe");
                return 1;
            }
            if (ProxDetectorS(8.0, playerid, giveplayerid))
			{
                if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the tai benh nhan!"); return 1; }
                if(PlayerInfo[giveplayerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay voi nguoi choi dang o tu");
                new carid = gLastCar[playerid];
                if(IsACop(playerid))
				{
                    if(IsVehicleOccupied(carid, seat)) {
						SendClientMessageEx(playerid, COLOR_GREY, "Nghe do dang co nguoi dung.");
						return 1;
					}
					if(IsPlayerInRangeOfVehicle(giveplayerid, carid, 10.0) && IsPlayerInRangeOfVehicle(playerid, carid, 10.0)) {
						format(string, sizeof(string), "* Ban da duoc ap giai len xe boi nhan vien chinh phu: %s.", GetPlayerNameEx(playerid));
						SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Ban da dua doi tuong %s len xe", GetPlayerNameEx(giveplayerid));
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s da %s len xe.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SetPVarInt(giveplayerid, "EMSAttempt", 4);
						ClearAnimations(giveplayerid);
						IsPlayerEntering{giveplayerid} = true;
						PutPlayerInVehicle(giveplayerid,carid,seat);
						TogglePlayerControllable(giveplayerid, false);
					}
					else SendClientMessageEx(playerid, COLOR_GREY, "Ban can o gan mot phuong tien");
                }
                else
				{
                     SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong phai la cnhan vien chinh phu");
                }
            }
            else
			{
                SendClientMessageEx(playerid, COLOR_GREY, " Ban khong o gan nguoi hoac xe cua ban!");
                return 1;
            }
        }
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
        return 1;
    }
    return 1;
}
hook OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
    if (damagedid == INVALID_PLAYER_ID) return 1;
	if (playerid == INVALID_PLAYER_ID) return 1;

	if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 3)//Toan than
    {
        SetPlayerArmour(damagedid, -25);
        SetPlayerHealth(damagedid, -25);//Ban co the thay doi thanh bao nhiu cung duoc
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 4)//Hang
    {
        SetPlayerArmour(damagedid, -20);
        SetPlayerHealth(damagedid, -20);//Ban co the thay doi thanh bao nhiu cung duoc
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 5)//Tay trai
    {
        SetPlayerArmour(damagedid, -35);
        SetPlayerHealth(damagedid, -35);//Ban co the thay doi thanh bao nhiu cung duoc
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 6)//Tay phai
    {
        SetPlayerArmour(damagedid, -35);
        SetPlayerHealth(damagedid, -35);//Ban co the thay doi thanh bao nhiu cung duoc
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 7)//Chan trai
    {
        SetPlayerArmour(damagedid, -30);
        SetPlayerHealth(damagedid, -30);//Ban co the thay doi thanh bao nhiu cung duoc
        ApplyAnimation(damagedid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 0, 0, 1);
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 8)//Chan Phai
    {
        SetPlayerArmour(damagedid, -30);
        SetPlayerHealth(damagedid, -30);//Ban co the thay doi thanh bao nhiu cung duoc
        ApplyAnimation(damagedid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 0, 0, 1);
    }
    if(playerid != INVALID_PLAYER_ID && weaponid == 24 && weaponid == 25 && weaponid == 26 && weaponid == 27 && weaponid == 28 && weaponid == 29 && weaponid == 30 && weaponid == 31 && weaponid == 32 && weaponid == 33 && weaponid == 34 && bodypart == 9)//Dau
    {
    	SendClientMessage(damagedid, COLOR_GREY, "Vo so");
        SetPlayerArmour(damagedid, -95);
        SetPlayerHealth(damagedid, -95);//Ban co the thay doi thanh bao nhiu cung duoc
    }
    return 1;
}