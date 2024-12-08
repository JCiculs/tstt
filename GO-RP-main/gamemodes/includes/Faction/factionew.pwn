/* -------------------------------- INCLUDE -------------------------------- */
#include <YSI_Coding\y_hooks>

/* -------------------------------- CALLBACK -------------------------------- */
hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    if(weaponid == 0 && GetPVarInt(playerid, "KhongChe") == 1)
	{
        new string[120];
		//Khong Che
		SetPVarInt(playerid, "DangKhongChe", 1);
		ApplyAnimation(playerid,  "ped", "EV_dive", 4.0, false, true, true, true, -1);
        format(string, sizeof(string), "{1e90ff}[+]{FFFFFF} Ban dang khong che doi tuong %s ", GetPlayerNameEx(damagedid));
		SendClientMessage(playerid, -1, string);
        SetTimerEx("TackledPlayer", 10000, false, "i", playerid);
		SetPVarInt(playerid, "KhongCheTime", gettime()+40);
		//Bi Khong Che
		SetPVarInt(damagedid, "DangBiKhongChe", 1);
		ApplyAnimation(damagedid, "PARACHUTE", "FALL_skyDive_DIE", 4.0, false, true, true, true, -1);
        format(string, sizeof(string), "{AA3333}[!]{FFFFFF} Ban dang bi si quan %s khong che ", GetPlayerNameEx(playerid));
		SendClientMessage(damagedid, -1, string);
        SetTimerEx("TackledTarget", 10000, false, "i", damagedid);
		SendClientMessage(damagedid, COLOR_LIGHTRED, "Ban dang bi khong che !");
		SetPlayerChatBubble(damagedid, "(( Dang bi khong che ))", COLOR_YELLOW, 60.0, 10000);
		//
		format(string, sizeof(string), "* Officer %s dang khong che doi tuong %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(damagedid));
		ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
    return 1;
}
hook OnplayerDisconnect(playerid, reason)
{
    if(GetPVarInt(playerid, "KhongChe") == 1)
    {
        DeletePVar(playerid, "KhongChe");
        DeletePVar(playerid, "DangKhongChe");
    }
    return 1;
}
forward TackledPlayer(playerid);
public TackledPlayer(playerid)
{
    DeletePVar(playerid, "KhongChe");
    DeletePVar(playerid, "DangKhongChe");
	ClearAnimations(playerid);
    SendClientMessage(playerid, -1, "{FF0000}[!]{FFFFFF} Thoi gian khong che da het tac dung");
    return 1;
}
forward TackledTarget(playerid);
public TackledTarget(playerid)
{
    DeletePVar(playerid, "DangBiKhongChe");
	ClearAnimations(playerid);
    SendClientMessage(playerid, -1, "{FF0000}[+]{FFFFFF} Thoi gian khong che da het tac dung");
    return 1;
}
/* -------------------------------- FUNCTION -------------------------------- */

/* -------------------------------- COMMANDS -------------------------------- */
CMD:kc(playerid, params[]) {
	return cmd_khongche(playerid, params);
}
CMD:hit(playerid, params[]) {
	return cmd_khongche(playerid, params);
}
CMD:khongche(playerid, params[])
{
	if(!IsACop(playerid))
		SendClientMessage(playerid, COLOR_GRAD1, "[!] Ban khong duoc su dung lenh nay");
	// else if(GetPVarInt(playerid, "KhongChe") != 0)
	// 	SendClientMessage(playerid, COLOR_GREY, "[!] Ban dang bat che do khong che !");
	else if(gettime() < GetPVarInt(playerid, "KhongCheTime"))
    {
        new string[150];
        format(string, sizeof(string), "[!] Ban phai cho %ds nua moi co the tiep tuc su dung lenh nay", GetPVarInt(playerid, "KhongCheTime") - gettime());
		SendClientMessage(playerid, COLOR_GREY, string);
    }
	else 
	{
		if(GetPVarInt(playerid, "KhongChe") == 0)
		{
			SetPVarInt(playerid, "KhongChe", 1);
			// SetPVarInt(playerid, "KhongCheTime", gettime()+30);
			SendClientMessage(playerid, COLOR_GRAD2, "Ban co 30 giay de di chuyen den vi tri va khong che toi pham '{AA3333}HIT{BFC0C2}'.");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Danh vao doi tuong de khong che");
		}
		else
		{
			DeletePVar(playerid, "KhongChe");
			SendClientMessage(playerid, COLOR_GRAD2, "{AA3333}[!]{FFFFFF} Ban da tat che do khong che");
			SendClientMessage(playerid, COLOR_RED, "[OFF] Tat che do khong che");
		}
	}
	return 1;
}
CMD:beanbag(playerid, params[])
{
    #if defined zombiemode
	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessage(playerid, COLOR_GREY, "Zombies khong the su dung.");
	#endif
	new string[128];
	if(!IsACop(playerid))
		SendClientMessage(playerid, COLOR_GRAD2, "Ban khong phai la nhan vien chinh phu!");
	else if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0)
		SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the lay sung dien, ban dang bi han che vu khi!");
	else if(PlayerInfo[playerid][pDuty] == 0)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban chua Onduty");
	else if(IsPlayerInAnyVehicle(playerid))
		SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay, ban dang trong xe.");
	else if(GetPVarInt(playerid, "IsInArena") >= 0 || GetPVarInt( playerid, "EventToken") != 0)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban khong the lam dieu nay bay gio");
	else if(PlayerCuffedTime[playerid] > 0 || GetPVarInt(playerid, "Injured") == 1 || PlayerInfo[playerid][pJailTime] > 0 || PlayerCuffed[playerid] >= 1)
		SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
	else if(PlayerInfo[playerid][pHasTazer] < 1)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban khong co sung dien!");
	else if(pTazer{playerid} == 1)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban dang su dung sung dien loai khac!");
	else if(GetPlayerWeapon(playerid) != 25)
		SendClientMessage(playerid, COLOR_GRAD1, "[!] Ban dang khong cam khau shotgun tren tay");	
	else {
		if(pTazer{playerid} == 0)
		{
			format(string, sizeof(string), "* %s lay khau sung cao su ra.", GetPlayerNameEx(playerid));
			ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			// GivePlayerValidWeapon(playerid, 25, 50);
			pTazer{playerid} = 2;
			
		}
		else if(pTazer{playerid} == 2)
		{
			format(string, sizeof(string), "* %s cat khau sung cao su vao.", GetPlayerNameEx(playerid));
			ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			pTazer{playerid} = 0;
		}
	}
	return 1;
}
CMD:tz(playerid, params[]) {
	return cmd_tazer(playerid, params);
}
CMD:sungdien(playerid, params[]) {
	return cmd_tazer(playerid, params);
}
CMD:tazer(playerid, params[])
{
    #if defined zombiemode
	if(zombieevent == 1 && GetPVarType(playerid, "pIsZombie")) return SendClientMessageEx(playerid, COLOR_GREY, "Zombies khong the su dung.");
	#endif
	new string[128];
	if(!IsACop(playerid))
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong phai la nhan vien chinh phu!");
	else if(PlayerInfo[playerid][pConnectHours] < 2 || PlayerInfo[playerid][pWRestricted] > 0)
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the lay sung dien, ban dang bi han che vu khi!");
	else if(PlayerInfo[playerid][pDuty] == 0)
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban chua Onduty");
	else if(IsPlayerInAnyVehicle(playerid))
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay, ban dang trong xe.");
	else if(GetPVarInt(playerid, "IsInArena") >= 0 || GetPVarInt( playerid, "EventToken") != 0)
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the lam dieu nay bay gio");
	else if(PlayerCuffedTime[playerid] > 0 || GetPVarInt(playerid, "Injured") == 1 || PlayerInfo[playerid][pJailTime] > 0 || PlayerCuffed[playerid] >= 1)
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
	else if(PlayerInfo[playerid][pHasTazer] < 1)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban khong co sung dien!");
	else if(pTazer{playerid} == 2)
		SendClientMessage(playerid, COLOR_GRAD1, "Ban dang su dung sung dien loai khac");
	else {
		if(pTazer{playerid} == 0)
		{
			pTazerReplace{playerid} = PlayerInfo[playerid][pGuns][2];
			if(PlayerInfo[playerid][pGuns][2] != 0) RemovePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][2]);
			format(string, sizeof(string), "* %s lay khau sung dien ra khoi bao.", GetPlayerNameEx(playerid));
			ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			GivePlayerValidWeapon(playerid, 23, 60000);
			pTazer{playerid} = 1;
		}
		else
		{
			RemovePlayerWeapon(playerid, 23);
			GivePlayerValidWeapon(playerid, pTazerReplace{playerid}, 66666);
			format(string, sizeof(string), "* %s cat khau sung dien vao bao.", GetPlayerNameEx(playerid));
			ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			pTazer{playerid} = 0;
		}
	}
	return 1;
}
CMD:handcuff(playerid, params[])
{
	if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai nhan vien chinh phu");
	if(GetPVarInt(playerid, "Injured") == 1 || PlayerCuffed[ playerid ] >= 1 || PlayerInfo[ playerid ][ pJailTime ] > 0 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
	if(PlayerInfo[playerid][pHasCuff] < 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong co chiec cong tay nao!");

	new string[128], giveplayerid, Float:health, Float:armor;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /handcuff [Player]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "nguoi choi khong hop le.");
	if(!ProxDetectorS(8.0, playerid, giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Nguoi do khong o gan ban.");
	if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "Ban khong the tu cong tay minh!"); return 1; }
	format(string, sizeof(string), "* Ban da bi cong tay boi %s.", GetPlayerNameEx(playerid));
	SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Ban da cong tay %s, su dung /uncuff de thao cong.", GetPlayerNameEx(giveplayerid));
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s da cong tay %s lai.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	GameTextForPlayer(giveplayerid, "~r~Cong tay", 2500, 3);
	// ClearAnimations(giveplayerid);
	GetPlayerHealth(giveplayerid, health);
	GetPlayerArmour(giveplayerid, armor);
	SetPVarFloat(giveplayerid, "cuffhealth",health);
	SetPVarFloat(giveplayerid, "cuffarmor",armor);
	SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_CUFFED);
	PlayerCuffed[giveplayerid] = 2;
	SetPVarInt(giveplayerid, "PlayerCuffed", 2);
	PlayerCuffedTime[giveplayerid] = 300;

	if(GetPVarType(giveplayerid, "IsTackled"))
	{
		format(string, sizeof(string), "* %s da lay chiec cong tu trong nguoi ra va cong tay %s lai.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}