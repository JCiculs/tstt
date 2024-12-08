#include <a_samp>
#include <YSI_Coding\y_hooks>

#define DIALOG_BANCANSA 2602

#define MARIJUANA 18 // So luong Spawn
#define INVALID_FLOAT -1
#define GIATUICANSA 35
#define TUICANSA (1999)
//#define THUHOACH_TIME 1
#define TIME_RESPAWN_CANSA 1
#define TIME_CHEBIEN_CANSA 1
#define HAICANSA 1
enum marijuana_enum {
	marijuana_id,
	Text3D:marijuana_label,
	bool:marijuana_status,
	Float:marijuana_X,
	Float:marijuana_Y,
	Float:marijuana_Z,
}

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
	Marijuana[iMar][marijuana_label] = CreateDynamic3DTextLabel("{04B404}Marijuana{04B404}", -1, marijuna_pos[iMar][0],marijuna_pos[iMar][1],marijuna_pos[iMar][2]-0.2, 5);
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
	PlayerInfo[playerid][pCansap] += 10; // Can sa + 1
	PlayerInfo[playerid][pTienBan] += 70; // Tien Ban +1
	TogglePlayerControllable(playerid, true);
	SendClientMessage(playerid, -1, "[He Thong]: Ban vua hai can sa nhan duoc 10 la can sa va 70 tien ban");
	// Marijuana Var
	Marijuana[iMar][marijuana_X] = INVALID_FLOAT; //
	DestroyDynamicObject(Marijuana[iMar][marijuana_id]);
	DestroyDynamic3DTextLabel(Marijuana[iMar][marijuana_label]);
	SetTimerEx("MarijuanaCreate", TIME_RESPAWN_CANSA*55000, 0, "d", iMar);
	// Debug
	printf("Destroy Marijuana %d", iMar);
	return 1;
}

hook OnGameModeInit() {
	new i = 0;
	while(i < MARIJUANA) {
		MarijuanaCreate(i);
		i ++;
	}
	
	CreateActor(72, 2786.4319,-1417.5588,16.2500,275.5424);

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
CMD:lockcansa(playerid) {
	if(PlayerInfo[playerid][pAdmin] >= 7) {
	    CopOnline = (CopOnline == 1 ? (CopOnline = 0) : (CopOnline = 1));
	    SendClientMessage(playerid, -1, CopOnline == 1 ? ("Ban da unlock") : ("Ban da lock"));
	}
	return 1;
}

CMD:haicanzz(playerid) {
	new iMarijuana = IsPlayerNearMarijuana(playerid, 1);
    //if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "[Loi He Thong - Can Sa]: Vui long xuong xe");
	//if(CopOnline <= 0) return  SendClientMessage(playerid, -1, "[ {FF0000}Pham Phap{FF0000} ] [{00b300}Can sa{ffffff}]: Server can co cops moi co the lam viec nay!");
	if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pJailTime] > 0 || GetPVarInt(playerid, "Injured")) return SendClientMessageEx( playerid, COLOR_WHITE, "Ban khong the lam dieu do vao luc nay" );
     if(IsACop(playerid)) return 1; //SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang la nguoi cua chinh phu , khong the hai can sa.");
	//if(iMarijuana == INVALID_FLOAT) SendClientMessage(playerid, -1, "[{FF0000}Pham Phap{FF0000}] [Can sa]: Ban khong dung gan cay nao de thu hoach ca!");
	else {
		if(Marijuana[iMarijuana][marijuana_status] == false) {
			if(HarvestCan[playerid] == false) {
				if(PlayerInfo[playerid][pCansap] < 5000) {
					HarvestCan[playerid] = true; // Bat dau hai
					Marijuana[iMarijuana][marijuana_status] = true; // Chuyen trang thai tu chua bi hai thanh bi hai cua can sa
					TogglePlayerControllable(playerid, false); // Freeze nguoi choi lai.
					SetPVarInt(playerid, "_iMarijuana", iMarijuana);
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, 1, 0, 0, 1, 0); // Thuc hien thanh dong (RP)
					TimeHarvest[playerid] = SetTimerEx("OnPlayerHarvestMarijuana", HAICANSA*10000, 0, "ii", playerid, iMarijuana); // Timer thu hoach
	            	LoaderStarting(playerid, HAICANSA, "DANG HAI CAN SA", 0.5,  HAICANSA*10000);
					//TimeHarvest[playerid] = SetTimerEx("OnPlayerHarvestMarijuana", HAICANSA*10000, 0, "ii", playerid, iMarijuana); // Timer thu hoach
					//TimeHarvest[playerid] = SetTimerEx("OnPlayerHarvestMarijuana", HAICANSA*10000, 0, "ii", playerid, iMarijuana); // Timer thu hoach
                    SetPVarInt(playerid, "SpamCanSa", 0);
				}
				else
					SendClientMessage(playerid, -1, "[He Thong] : Can sa da day` Ban can di che bien");
			}
			else
				SendClientMessage(playerid, -1, "[He Thong]: Ban khong the thuc hien vao luc nay!");
		}
		else
			SendClientMessage(playerid, -1, "[He Thong]: Cay nay dang co nguoi thu hoach");
	}
	return 1;
}

CMD:cansa(playerid) {
	new string[32+11];
	format(string, 32+11, "[He Thong]La Can Sa: %d", PlayerInfo[playerid][pCansap]); //pCansa
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "[He Thong]Hat Giong: %d", PlayerInfo[playerid][pHatGiong]);
	SendClientMessage(playerid, -1, string);
	format(string, 32+11, "[He Thong]Tien Ban: %d", PlayerInfo[playerid][pTienBan]);
	SendClientMessage(playerid, -1, string);
	return 1;
}
CMD:kttuicansa(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checktuicansa [Player]");


    new szString[128];
	format(szString, sizeof(szString), "[He Thong]%s - Tui Can Sa: %s",GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pTuicansa]));
	SendClientMessageEx(playerid, COLOR_CYAN, szString);
	return 1;
}
CMD:ktcansa(playerid, params[])
{
    new Player;
    if(sscanf(params, "u", Player))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ktcansa [Player]");
	new str[100];
	format(str, sizeof(str), "Can sa: %d\nTien Ban: %d", number_format(PlayerInfo[Player][pCansap]), number_format(PlayerInfo[Player][pTienBan]));
	ShowPlayerDialog(playerid, TUICANSA, DIALOG_STYLE_LIST, "Kien tra can sa", str, "Dong Y", "Huy Bo");
	return 1;
}

/*CMD:vitricansa(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[ He Thong ] di theo checkpoint de di toi khu can sa");
	SetPlayerCheckpoint(playerid, -752.0267,-155.4852,66.7585, 3.0);
    CP[playerid] = 252000;
	return 1;
}

CMD:vitribancansa(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[He Thong] di theo checkpoint de di toi khu ban can sa");
	SetPlayerCheckpoint(playerid, -2733.8834,25.0581,4.6172, 3.0);
    CP[playerid] = 252000;
	return 1;
}

CMD:vitrichebien(playerid, params[])
{
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
    SendClientMessage(playerid, -1, "[ He Thong] di theo checkpoint de di toi khu ban can sa");
	SetPlayerCheckpoint(playerid, -2538.8834,40.0581,8.6172, 3.0);
    CP[playerid] = 252000;
	return 1;
}*/

forward AntiSpamCanSa(playerid);
public AntiSpamCanSa(playerid)
{
    SetPVarInt(playerid, "SpamCanSa", 0);
    return 1;
}
