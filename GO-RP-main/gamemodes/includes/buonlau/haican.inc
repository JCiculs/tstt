

#include <a_samp>
#include <YSI_Coding\y_hooks>

#define DIALOG_BANCANSA 2602

#define MARIJUANA 18 // So luong Spawn
#define INVALID_FLOAT -1

#define THUHOACH_TIME 1
#define TIME_RESPAWN_CANSA 1
#define TIME_CHEBIEN_CANSA 1

#define GIATUICANSA 9000000

enum marijuana_enum {
	marijuana_id,
	Text3D:marijuana_label,
	bool:marijuana_status,
	Float:marijuana_X,
	Float:marijuana_Y,
	Float:marijuana_Z,
}

new DynamicCP_Harvest[3]; // 0 = Che bien // 1 = Ban

new TimeHarvest[MAX_PLAYERS];
new CopOnline;
new bool:HarvestCan[MAX_PLAYERS] = false;
new Marijuana[MARIJUANA][marijuana_enum];
new Float:marijuna_pos[MARIJUANA][] = {
	{-752.0267,-155.4852,66.7585},
	{-779.7448,-148.6225,64.8706},
	{-786.3397,-153.7541,64.6450},
	{-783.9090,-160.2401,65.7670},
	{-790.3037,-164.8857,66.2199},
	{-788.8755,-169.3046,66.6728},
	{-784.7871,-171.7937,66.9977},
	{-781.5194,-176.4840,67.5919},
	{-775.8143,-174.9296,67.5188},
	{-759.2983,-147.2068,65.8696},
	{-750.8389,-140.3765,66.2484},
	{-734.7426,-141.6215,67.2484},
	{-725.9036,-154.6706,66.9533},
	{-730.0795,-167.1839,66.4559},
	{-744.2148,-170.5108,67.7431},
	{-763.8676,-172.7794,67.3950},
	{-777.9866,-167.1106,66.6121},
	{-778.8672,-156.8395,65.4396}
};

stock IsPlayerNearMarijuana(playerid, Float:range) {
	for(new i = 0 ; i < MARIJUANA; i ++) {
		if(Marijuana[i][marijuana_X] != INVALID_FLOAT && IsPlayerInRangeOfPoint(playerid, range, Marijuana[i][marijuana_X],Marijuana[i][marijuana_Y],Marijuana[i][marijuana_Z]+0.5)) {
			return i;
		}
	}
	return INVALID_FLOAT;
}

forward MarijuanaCreate(iMar);
public MarijuanaCreate(iMar) {
	Marijuana[iMar][marijuana_label] = CreateDynamic3DTextLabel("[{00cc00}Cay Can Sa{ffffff}]", -1, marijuna_pos[iMar][0],marijuna_pos[iMar][1],marijuna_pos[iMar][2]-0.2, 5);
	Marijuana[iMar][marijuana_id] = CreateDynamicObject(19473, marijuna_pos[iMar][0],marijuna_pos[iMar][1],marijuna_pos[iMar][2]-1.2, 0,0,0);

	Marijuana[iMar][marijuana_X] = marijuna_pos[iMar][0],
	Marijuana[iMar][marijuana_Y] = marijuna_pos[iMar][1],
	Marijuana[iMar][marijuana_Z] = marijuna_pos[iMar][2];

	Marijuana[iMar][marijuana_status] = false;
	printf("[MARIJUANA] Marijuana %d | X%f | Y%f | Z%f", iMar, Marijuana[iMar][marijuana_X],Marijuana[iMar][marijuana_Y],Marijuana[iMar][marijuana_Z]);
	return 1;
}

forward OnPlayerHarvestMarijuana(playerid, iMar);
public OnPlayerHarvestMarijuana(playerid, iMar) {

	// Player
	ClearAnimations(playerid);
	HarvestCan[playerid] = false;
	PlayerInfo[playerid][pCansa] ++; // Can sa + 1
	PlayerInfo[playerid][pGoiPot] ++; // goi pot + 1
	TogglePlayerControllable(playerid, true);
	SendClientMessage(playerid, -1, "[ VKRP ] [{00b300}Can sa{ffffff}]: Ban da nhan duoc 1 can sa !");
	SendClientMessage(playerid, -1, "[VkRP ] [{00b300}Can sa{ffffff}]: Ban da nhan duoc 1 Goi pot !");
	// Marijuana Var
	Marijuana[iMar][marijuana_X] = INVALID_FLOAT; //
	DestroyDynamicObject(Marijuana[iMar][marijuana_id]);
	DestroyDynamic3DTextLabel(Marijuana[iMar][marijuana_label]);
	SetTimerEx("MarijuanaCreate", TIME_RESPAWN_CANSA*1000, 0, "d", iMar);
	// Debug
	printf("Destroy Marijuana %d", iMar);
	return 1;
}
forward OnPlayerCBCannabisss(playerid);
public OnPlayerCBCannabisss(playerid) {
	if(PlayerInfo[playerid][pGoiPot] >= 5) {
		PlayerInfo[playerid][pGoiPot] -= 5;
		PlayerInfo[playerid][pPot] ++;
		SendClientMessage(playerid, -1, "[ ve ka rp ] [{00b300}Can sa{ffffff}]: Ban nhan duoc 1 pot");
	}
	else {
		SetPVarInt(playerid, "DangCheBien", 0);
		TogglePlayerControllable(playerid, true); // Freeze player
		SendClientMessage(playerid, -1, "[ ve ca ro pe ] [{00b300}Can sa{ffffff}]: Ban da doi thanh cong");
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	}
	return 1;
}
forward OnPlayerCBCannabis(playerid);
public OnPlayerCBCannabis(playerid) {
	if(PlayerInfo[playerid][pCansa] >= 2) {
		PlayerInfo[playerid][pCansa] -= 2;
		PlayerInfo[playerid][pTuicansa] ++;
		SendClientMessage(playerid, -1, "[ vkrp ] [{00b300}Can sa{ffffff}]: Ban da nhan 1 tui can sa!");
	}
	else {
		SetPVarInt(playerid, "DangCheBien", 0);
		TogglePlayerControllable(playerid, true); // Freeze player
		SendClientMessage(playerid, -1, "[ VKRP ] [{00b300}Can sa{ffffff}]: Ban da che bien thanh cong!");
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	}
	return 1;
}

hook OnGameModeInit() {
	new i = 0;
	while(i < MARIJUANA) {
		MarijuanaCreate(i);
		i ++;
	}

	CreateDynamicObject(1578, -734.9782, 1546.1810, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(2370, -734.8424, 1545.8629, 37.9039, 0.0000, 0.0000, -0.6999); //Shop_set_1_Table
	CreateDynamicObject(1578, -734.9782, 1546.8013, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1546.8013, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1546.1707, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.9782, 1545.5705, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green
	CreateDynamicObject(1578, -734.2282, 1545.5601, 38.7007, 0.0000, 0.0000, 0.0000); //drug_green

    CreateActor(72, -94.8834,-1595.0581,2.6172,80.3660);
    CreateActor(72, -69.3503,-1546.2924,3.0043,236.7527);
	DynamicCP_Harvest[0] = CreateDynamicCP(-2538.8764,40.1532,8.9959, 1, .streamdistance = 2); // Che bien
	DynamicCP_Harvest[1] = CreateDynamicCP(-2733.8034,25.8081,4.6172, 1, .streamdistance = 2); // Ban
	DynamicCP_Harvest[2] = CreateDynamicCP(-380.8940,1113.2659,19.6427, 1, .streamdistance = 2);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	if(HarvestCan[playerid] == true) { // Kiem tra neu nguoi choi dang thu hoach
		KillTimer(TimeHarvest[playerid]); // Dung timer.
		Marijuana[GetPVarInt(playerid, "_iMarijuana")][marijuana_status] = false; // Cay co the thu hoach
	}
	if(GetPVarInt(playerid, "DangCheBien") == 1) {
		KillTimer(PlayerInfo[playerid][pChebienTime]);
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid) {
	if(checkpointid == DynamicCP_Harvest[0]) {// Che bien
		if(PlayerInfo[playerid][pCansa] >= 2) { // 2 can sa = 1 tui can sa
			if(GetPVarInt(playerid, "DangCheBien") == 0)
			{
			TogglePlayerControllable(playerid, false); // Freeze player
			SetPVarInt(playerid, "DangCheBien", 1);
			SendClientMessage(playerid, -1,"[{00b300}Can sa{ffffff}]: Dang che bien!!!!");
			PlayerInfo[playerid][pChebienTime] = SetTimerEx("OnPlayerCBCannabis", TIME_CHEBIEN_CANSA*1000, 1, "i", playerid);
			}
		}
		else
			SendClientMessage(playerid, -1,"[ VKRP ] [{00b300}Can sa{ffffff}]: Ban can phai co 2 can sa de co the che bien!");
	}
	if(checkpointid == DynamicCP_Harvest[1]) { // Ban can sa
		if(PlayerInfo[playerid][pTuicansa] > 0) {
			new string[128];
			format(string, 128, "\n [ VKRP ] Tui can sa cua ban: %d\n[VKRP]Gia tien $%d/tui\n[VKRP]Nhap so luong ban muon ban:", PlayerInfo[playerid][pTuicansa], GIATUICANSA);
			ShowPlayerDialog(playerid, DIALOG_BANCANSA, DIALOG_STYLE_INPUT, "Ban can sa", string,"Ban","Huy");
		}
		else
			SendClientMessage(playerid, -1,"[ Ve Ka Ro Pe ] [{00b300}Can sa{ffffff}]: Ban can phai co tui can sa de buoc vao day!");
	}
	if(checkpointid == DynamicCP_Harvest[2]) {
		if(PlayerInfo[playerid][pGoiPot] >= 5) {
			if(GetPVarInt(playerid, "DangCheBien") == 0)
			{
			TogglePlayerControllable(playerid, false);
			SetPVarInt(playerid, "DangCheBien", 1);
			SendClientMessage(playerid, -1,"Dang doi pot xin vui long doi.........");
			PlayerInfo[playerid][pChebienTime] = SetTimerEx("OnPlayerCBCannabisss", TIME_CHEBIEN_CANSA*1000, 1, "i", playerid);
			}
		}
		else
			SendClientMessage(playerid, -1,"[{00b300}Can sa{ffffff}]: Ban can phai co 5 Goi pot");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_BANCANSA) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pTuicansa] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pTuicansa] -= strval(inputtext);
					GivePlayerCash(playerid, strval(inputtext)*GIATUICANSA);
					format(string, 128, "[ V.K.R.P ] [{00b300}Can sa{ffffff}]: Ban da ban %d tui can va nhan duoc $%d", strval(inputtext), strval(inputtext)*GIATUICANSA);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"[ VkRp ] [{00b300}Can sa{ffffff}]: So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"[ vKrP ] [{00b300}Can sa{ffffff}]: So luong can ban phai lon hon 0!");
		}
	}
	return 1;
}
CMD:haican(playerid) {
	new iMarijuana = IsPlayerNearMarijuana(playerid, 1);
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "[{00b300}Can sa{ffffff}]: Vui long xuong xe");
	if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pJailTime] > 0 || GetPVarInt(playerid, "Injured")) return SendClientMessageEx( playerid, COLOR_WHITE, "Ban khong the lam dieu do vao luc nay" );
	if(iMarijuana == INVALID_FLOAT) SendClientMessage(playerid, -1, "[ VKRP ] [{00b300}Can sa{ffffff}]: Ban khong dung gan cay nao de thu hoach ca!");
	else {
		if(Marijuana[iMarijuana][marijuana_status] == false) {
			if(HarvestCan[playerid] == false) {
				if(PlayerInfo[playerid][pCansa] < 50) {
					HarvestCan[playerid] = true; // Bat dau hai
					Marijuana[iMarijuana][marijuana_status] = true; // Chuyen trang thai tu chua bi hai thanh bi hai cua can sa
					TogglePlayerControllable(playerid, false); // Freeze nguoi choi lai.
					SetPVarInt(playerid, "_iMarijuana", iMarijuana);
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, 1, 0, 0, 1, 0); // Thuc hien thanh dong (RP)
					SendClientMessage(playerid, -1, " [ VKRP ] [{00b300}Can sa{ffffff}]: Ban dang hai can sa ...");
					TimeHarvest[playerid] = SetTimerEx("OnPlayerHarvestMarijuana", THUHOACH_TIME*1000, 0, "ii", playerid, iMarijuana); // Timer thu hoach
				}
				else
					SendClientMessage(playerid, -1, "[ VKRP ] [{00b300}Can sa{ffffff}]: Can sa da day` ! Ban can di che bien");
			}
			else
				SendClientMessage(playerid, -1, "[ VKRP ] [{00b300}Can sa{ffffff}]: Ban khong the thuc hien vao luc nay!");
		}
		else
			SendClientMessage(playerid, -1, "[ VKRP ] {00b300}Can sa{ffffff}]: Cay nay dang co nguoi thu hoach");
	}
	return 1;
}

CMD:cansa(playerid) {
	new string[32+11];
	format(string, 32+11, "[ VKRP ] Can sa : %d", PlayerInfo[playerid][pCansa]);
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "[ V.K.R.P ] Tui can sa : %d", PlayerInfo[playerid][pTuicansa]);
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "[ V-K-R-P  ]Goi pot : %d", PlayerInfo[playerid][pGoiPot]);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:kttuicansa(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checktuicansa [Player]");


    new szString[128];
	format(szString, sizeof(szString), "[ VKRP ]%s - Tui Can  sa: {FFD700}%s",GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pTuicansa]));
	SendClientMessageEx(playerid, COLOR_CYAN, szString);
	return 1;
}
CMD:ktcansa(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkcansa [Player]");


    new szString[128];
	format(szString, sizeof(szString), "[ V.K.R.P ] %s - Can  sa: {FFD700}%s",GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pCansa]));
	SendClientMessageEx(playerid, COLOR_CYAN, szString);
	return 1;
}

CMD:vitricansa(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[ VKRP] di theo checkpoint de di toi khu can sa");
	SetPlayerCheckpoint(playerid, -752.0267,-155.4852,66.7585, 3.0);
    CP[playerid] = 252000;
	return 1;
}

CMD:vitribancansa(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[VKRP] di theo checkpoint de di toi khu ban can sa");
	SetPlayerCheckpoint(playerid, -2733.8834,25.0581,4.6172, 3.0);
    CP[playerid] = 252000;
	return 1;
}

CMD:vitrichebien(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[ VKRP] di theo checkpoint de di toi khu ban can sa");
	SetPlayerCheckpoint(playerid, -2538.8834,40.0581,8.6172, 3.0);
    CP[playerid] = 252000;
	return 1;
}


