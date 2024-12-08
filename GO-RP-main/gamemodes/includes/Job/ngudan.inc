#include <YSI_Coding\y_hooks>

native GameTextStr(playerid, AmxString:string, time, style) = GameTextForPlayer;

#define GIACA 8
#define DIALOG_BANCA 222
new const Float:fish_zone_arr[][] = {
	{649.0, -2935.0, 980.0, -2677.0},
	{2684.0, -3000.0, 3000.0, -2736.0}

};
//native MessageStr(playerid, color, AmxString:message) = SendClientMessage;
hook OnGameModeInit() {
	
/*	CreateVehicle(453, 440.1919, -1914.8008, 0.7372, 0.0000, -1, -1, 100);
	CreateVehicle(453, 406.2140, -1914.5294, 0.7372, 0.0000, -1, -1, 100);
	CreateVehicle(453, 414.6005, -1915.6956, 0.7372, 0.0000, -1, -1, 100);
	CreateVehicle(453, 422.9385, -1915.3271, 0.7372, 0.0000, -1, -1, 100);
	CreateVehicle(453, 431.4988, -1915.1947, 0.7372, 0.0000, -1, -1, 100);
	CreateVehicle(453, 2328.4148, -2414.5483, 0.3506, 42.1657, -1, -1, 100);
	CreateVehicle(453, 2295.8513, -2436.6475, 0.3506, 42.1657, -1, -1, 100);
	CreateVehicle(453, 2303.5718, -2431.1633, 0.3506, 42.1657, -1, -1, 100);
	CreateVehicle(453, 2312.1011, -2425.2334, 0.3506, 42.1657, -1, -1, 100);
	CreateVehicle(453, 2320.8916, -2419.3379, 0.3506, 42.1657, -1, -1, 100);*/

	CreateDynamic3DTextLabel("{66CC66}Thu Mua hai san\n\nSu dung (Y)",COLOR_YELLOW,388.0399,-1899.0303,7.8359+0.5,4.0);//banca
	CreateActor(53, 388.0399,-1899.0303,7.8359,88.3198);
	for(new i = 0; i < 2; i ++) {
		fishZone[i] = CreateDynamicRectangle
		(
			fish_zone_arr[i][0],
			fish_zone_arr[i][1],
			fish_zone_arr[i][2],
			fish_zone_arr[i][3]
		);
	}
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5.0, 388.0399,-1899.0303,7.8359))
			cmd_banca(playerid);
	}
	return 1;
}

hook OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == fishZone[0] || areaid == fishZone[1])
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da vao khu vuc danh ca (/ngudan).");
		SetPVarInt(playerid, "KhuVucThaLuoi", 1);
	}
	return 1;
}
hook OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == fishZone[0] || areaid == fishZone[1])
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da vao khu vuc danh ca.");
		DeletePVar(playerid, "KhuVucThaLuoi");
	}	
	return 1;
}
hook OnPlayerConnect(playerid) {

	PlayerInfo[playerid][static_working] = 0;
}

in_fisherman_area(const playerid) {
	new 
		Float:X, Float:Y, Float:Z;
	
	GetPlayerPos(playerid, X, Y, Z);
	#pragma unused X, Y

	for(new i = 0; i < 10; i ++) {
		if(IsPlayerInDynamicArea(playerid, fishZone[i]) && Z < 100.000) {
			return 1;
		}
	}	
	return 0;
}


CMD:banca(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 388.0399,-1899.0303,7.8359))
	{
		new string[128];
		format(string, 128, "\nSo kg ca ma ban co: %d\nDon Gia: $%d/kg\nNhap so luong ban muon ban:", PlayerInfo[playerid][pKGFish], GIACA);
		ShowPlayerDialog(playerid, DIALOG_BANCA, DIALOG_STYLE_INPUT, "Ban can gi nao?", string,"Ban","Huy");
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan noi ban ca");
	}
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_BANCA) {
		if(response) {
			if(strval(inputtext) > 50) {
				if(PlayerInfo[playerid][pKGFish] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pKGFish] -= strval(inputtext);
					GivePlayerCash(playerid, strval(inputtext)*GIACA);
					format(string, 128, "[FISHERMAN]: Ban da ban duoc :%d kg ca nhan duoc $%d", strval(inputtext), strval(inputtext)*GIACA);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				}
				else
					SendClientMessage(playerid, COLOR_LIGHTBLUE,"[FISHERMAN]: So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, COLOR_LIGHTBLUE,"[FISHERMAN]: So luong can ban phai lon hon 50kg");
		}
	}
	return 1;
}

CMD:kiemtrahaisan(playerid)
{
	new string[128];
	format(string, 129, "So kg ca ban co: %dkg", PlayerInfo[playerid][pKGFish]);
	SendClientMessage(playerid, -1, string);
	return 1;
	
}

CMD:ngungthaluoi(playerid)
{
	PlayerInfo[playerid][static_working] = 0;
	SendClientMessage(playerid, COLOR_WHITE, "[!] Ban da ngung tha luoi thanh cong...");
	return 1;
}

CMD:thaluoi(playerid,params[]) {
		if(GetPVarInt(playerid,"KhuVucThaLuoi") == 1)
		if(!PlayerInfo[playerid][static_working]) {
			if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 453) return SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Ban can o tren thuyen danh ca");
			
			new 
				rand;
			if(PlayerInfo[playerid][pKGFish] > 1000)
				return SendClientMessage(playerid, -1, "Ban da dat so luong ca hay dem ve ban");
			PlayerInfo[playerid][static_working] = 1;
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Dang tha luoi...");
			while(PlayerInfo[playerid][static_working]) {
				task_yield(1);
				if(!IsPlayerConnected(playerid) || !in_fisherman_area(playerid) || GetVehicleModel(GetPlayerVehicleID(playerid)) != 453) 
					break;

				if(random(5) + PlayerInfo[playerid][pKGFish] >= 1000) {
					PlayerInfo[playerid][pKGFish] = 1000;
					break;
				}
				if(random(3) != 0) {
					MessageStr(playerid, COLOR_LIGHTBLUE, str_format("Ban nhan duoc them %dkg | KG: %d", (rand = random(5)), PlayerInfo[playerid][pKGFish] + rand));
					PlayerInfo[playerid][pKGFish] += rand;
				}
				await task_ms(3000);
			}
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "[FISHERMAN]: Ban da tha luoi xong /kiemtrahaisan de kiem tra");
			PlayerInfo[playerid][static_working] = 0;
		}
		return 1;
}
