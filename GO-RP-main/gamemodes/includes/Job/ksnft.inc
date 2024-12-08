#include <YSI_Coding\y_hooks>
#include <a_samp>


#define MAX_STONES 34 
#define MAX_STONES_AVAILABLE 20
#define INVALID_STONE -1 // Khong dung vao day
#define MAX_SLOT_STONE 3 // Khong dung vao day
#define DIALOG_KHAITHAC 2222
#define GIATIEN 10 
#define KSLAMHEALTH 30
#define KSDOHEALTH 50
#define KSVANGHEALTH 80
#define NPCBORAX 1805.9064,-1571.0281,13.4702


enum e_dd_data {
	dd_Stone, // Object ID
	Text3D:dd_Name, // Label stone
	dd_Attacked_Player, // Nguoi so huu

	Float:dd_Cro[3], // Vi Tri

	dd_Health,
	dd_Type,
	dd_location,
}
enum char_dd_data {
	PlayerTime_daoda,
	Player_Attack_Stone,
	Player_Stone_Count,
	// Object
	//Player_Object_Slot[MAX_SLOT_Stone], // Object Attachment
	Player_Object_DYNS[MAX_SLOT_STONE], // Object duoi dat
}

new char_daoda[MAX_PLAYERS][char_dd_data];
new daoda[MAX_STONES][e_dd_data];

new Float:Stone_Default[MAX_STONES][] = {
{1567.7190, -2001.0422, 31.3972},
{1573.2552,-2004.9930,32.7688},
{1579.6194,-2005.6633,33.9462},
{1584.8851,-2003.1768,34.6067},
{1588.2819,-1997.9225,34.6563},
{1587.3143,-1990.1268,33.6838},
{1594.7502,-1985.6643,33.8067},
{1599.7520,-1978.0251,33.0303},
{1607.9718,-1975.1317,31.9634},
{1610.5084,-1979.8043,31.7095},
{1617.7089,-1985.1696,30.8263},
{1615.7906,-1992.0173,31.1310},
{1621.3160,-1999.1029,30.9434},
{1619.4324,-2006.4841,31.8912},
{1615.3563,-2015.2267,33.2658},
{1612.6271,-2027.1023,32.9270},
{1602.1909,-2032.2092,34.7991},
{1591.4712,-2035.6324,36.4633},
{1575.0540,-2037.6395,34.8980},
{1577.0461,-2047.2191,32.8974},
{1567.7877,-2056.0901,30.6264},
{1554.5725,-1958.7395,25.5564},
{1552.6300,-1951.1816,24.5536},
{1551.1316,-1942.5167,24.2474},
{1552.0725,-1933.7369,24.4397},
{1557.9014,-1927.0414,25.5431},
{1567.1173,-1923.4060,24.5844},
{1578.4813,-1923.7197,24.8287},
{1586.5616,-1930.0342,27.0229},
{1596.5308,-1933.0591,27.6468},
{1605.0959,-1924.5872,26.5734},
{1612.6204,-1928.8400,26.8973},
{1621.2709,-1932.6346,27.1511},
{1625.7924,-1922.6949,25.9922}
};

new stone_location[MAX_STONES+1]; // de xac dinh vi tri con trong cua khoang san
new stone_available[MAX_STONES+1]; // de xac dinh khoang san co ton tai hay k

// stone tu tao
new slotstone;


hook OnPlayerConnect(playerid)
{
	char_daoda[playerid][Player_Stone_Count] = 0;
	char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;
	for(new i = 0 ; i < 3 ; i ++) {
		//if(IsValidObject(char_daoda[playerid][Player_Object_DYNS][i])) DestroyObject(char_daoda[playerid][Player_Object_DYNS][i]);
		char_daoda[playerid][Player_Object_DYNS][i] = INVALID_OBJECT_ID;
	}
	return true;
}

hook OnGameModeInit()
{
	slotstone = MAX_STONES_AVAILABLE;
	for(new i=0; i <= MAX_STONES; i++){
		stone_available[i] = 0;
		stone_location[i] = 0;
	} 
	new z = 0;
	new vang = random(MAX_STONES_AVAILABLE);
	new red[2]; red[0] = random(MAX_STONES_AVAILABLE);
	while(red[0] == vang) red[0] = random(MAX_STONES_AVAILABLE);
	red[1] = random(MAX_STONES_AVAILABLE);
	while(red[1] == red[0] || red[1] == vang) red[1] = random(MAX_STONES_AVAILABLE);

	LOOP:(z,MAX_STONES_AVAILABLE) {
		if(z == vang) CreateStone(z, 2);
		else if(z == red[0] || z == red[1]) CreateStone(z, 1);
		else CreateStone(z, 0);
	}	

	CreateActor(284, NPCBORAX,219.2223); // npc khoangsan
	CreateDynamic3DTextLabel("{D7DF01}Nguoi tham dinh\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de tuong tac\nBorax",COLOR_YELLOW,NPCBORAX+1.5,10.0);

	return true;
}


/* ========= Functions ========= */
forward CreateStone(i_Stone, type);
forward OnPlayerCompleteDaoda(playerid, iStone);

forward CountDownStoneFinish(playerid, i_Stone, time);

forward CreateStoneCustom(playerid, i_Stone, type);
/* ===== Public Func ===== */
public CreateStone(i_Stone, type) {

	new modelid = 3929;
	daoda[i_Stone][dd_Attacked_Player] = INVALID_PLAYER_ID;

	new count = random(MAX_STONES);
	while(stone_location[count] == 1) count = random(MAX_STONES);
	stone_location[count] = 1;
	daoda[i_Stone][dd_location] = count;
	stone_available[i_Stone] = 1;

	SetStonePostion(i_Stone, Stone_Default[count][0], Stone_Default[count][1], Stone_Default[count][2]);
	daoda[i_Stone][dd_Stone] = CreateObject(modelid, Stone_Default[count][0], Stone_Default[count][1], Stone_Default[count][2]-1, 0,0,0);

	//new rand = random(3);
	new str[128];

	switch(type)
	{
		case 0:{
			daoda[i_Stone][dd_Health] = KSLAMHEALTH;
			format(str, sizeof(str), "{2ECCFA}Khoang San Lam [ID: %d]\n 30/30",i_Stone);
		}
		case 1:{
			daoda[i_Stone][dd_Health] = KSDOHEALTH;
			format(str, sizeof(str), "{FF0000}Khoang San Do [ID: %d]\n 50/50",i_Stone);
		}
		case 2:{
			daoda[i_Stone][dd_Health] = KSVANGHEALTH;
			format(str, sizeof(str), "{FFFF00}Khoang San Vang [ID: %d]\n 80/80",i_Stone);
		}
	}
	daoda[i_Stone][dd_Type] = type;	

	daoda[i_Stone][dd_Name] = CreateDynamic3DTextLabel(str, -1, Stone_Default[count][0], Stone_Default[count][1], Stone_Default[count][2]-1, 5);

	return 1;
}
public OnPlayerCompleteDaoda(playerid, iStone) {
	
	if(IsPlayerInRangeOfPoint(playerid, 3.0, daoda[iStone][dd_Cro][0],daoda[iStone][dd_Cro][1],daoda[iStone][dd_Cro][2])) {
		GetFrogKidPos(playerid);
		//RemovePlayerAttachedObject(playerid, 9);	
		SetStoneAttacked(iStone, INVALID_PLAYER_ID);
		char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;

		stone_location[daoda[iStone][dd_location]] = 0;
		stone_available[iStone] = 0;

		SetStonePostion(iStone, -1,-1,-1);
	
		DestroyObject(daoda[iStone][dd_Stone]);
		DestroyDynamic3DTextLabel(daoda[iStone][dd_Name]);

		new i;
		switch(daoda[iStone][dd_Type])
		{
			case 0: i = 5;
			case 1: i = 7;
			case 2: i = 10; 
		}
		SetTimerEx("CreateStone", 60000*i, 0, "dd", iStone, daoda[iStone][dd_Type]); // Respawn da
		

		RemovePlayerAttachedObject(playerid, 1);
		ClearAnimations(playerid);
		PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
	}
	return 1;
}

public CountDownStoneFinish(playerid, i_Stone, time) {
	if(IsPlayerInRangeOfPoint(playerid, 3.0, daoda[i_Stone][dd_Cro][0],daoda[i_Stone][dd_Cro][1],daoda[i_Stone][dd_Cro][2])) {
		if(time < 10) {
	        new string[6];
	        format(string, sizeof string, "~w~%d", 10-time);
	        GameTextForPlayer(playerid, string, 1000, 3);		
			SetTimerEx("CountDownStoneFinish", 1000, 0, "ddd", playerid, i_Stone, time+1);
		}
		else {

	        if(daoda[i_Stone][dd_Health] > 1) {
	        	new str[128];
	        	switch(daoda[i_Stone][dd_Type])
	        	{
					case 0:{
						format(str, sizeof(str), "{2ECCFA}Khoang San Lam [ID: %d]\n %d/30",i_Stone,daoda[i_Stone][dd_Health]-1);
						//ChatHoTro(playerid, 255, "+1 quang",5000);
						GameTextForPlayer(playerid, "~w~+1 quang", 1000, 1);
						PlayerInfo[playerid][pQuathuong] += 1;
					}
					case 1:{
						format(str, sizeof(str), "{FF0000}Khoang San Do [ID: %d]\n %d/50",i_Stone,daoda[i_Stone][dd_Health]-1);
						//ChatHoTro(playerid, 255, "+2 quang",5000);
						GameTextForPlayer(playerid, "~w~+2 quang", 1000, 1);
						PlayerInfo[playerid][pQuathuong] += 2;
					}
					case 2:{
						format(str, sizeof(str), "{FFFF00}Khoang San Vang [ID: %d]\n %d/80",i_Stone,daoda[i_Stone][dd_Health]-1);
						//ChatHoTro(playerid, 255, "+3 quang",5000);
						GameTextForPlayer(playerid, "~w~+3 quang", 1000, 1);
						PlayerInfo[playerid][pQuathuong] += 3;
					}
	        	}
				RemovePlayerAttachedObject(playerid, 1);
				ClearAnimations(playerid);	
				SetStoneAttacked(i_Stone, INVALID_PLAYER_ID);
				char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;	

	        	UpdateDynamic3DTextLabelText(daoda[i_Stone][dd_Name], 0xFFFFFFFF,str);		
	        	daoda[i_Stone][dd_Health] -= 1;
	        }		
	        else {
				SetTimerEx("OnPlayerCompleteDaoda", 100, 0, "dd", playerid, i_Stone);
	        }
		}
	}
	else {
		ChatHoTro(playerid, 255, "That bai vi ban da di chuyen ra khoi khu vuc dao da", 5000);
		RemovePlayerAttachedObject(playerid, 1);
		ClearAnimations(playerid);	
		SetStoneAttacked(i_Stone, INVALID_PLAYER_ID);
		char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;	
	}
	return 1;
}


public CreateStoneCustom(playerid, i_Stone, type)
{
	new modelid = 3929;
	daoda[i_Stone][dd_Attacked_Player] = INVALID_PLAYER_ID;


	stone_available[i_Stone] = 1;

	new Float:Pos[3];
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);

	SetStonePostion(i_Stone, Pos[0], Pos[1], Pos[2]);
	daoda[i_Stone][dd_Stone] = CreateObject(modelid, Pos[0], Pos[1], Pos[2]-1, 0,0,0);

	new str[128];

	switch(type)
	{
		case 0:{
			daoda[i_Stone][dd_Health] = KSLAMHEALTH;
			format(str, sizeof(str), "{2ECCFA}Khoang San Lam [ID: %d]\n 30/30",i_Stone);
		}
		case 1:{
			daoda[i_Stone][dd_Health] = KSDOHEALTH;
			format(str, sizeof(str), "{FF0000}Khoang San Do [ID: %d]\n 50/50",i_Stone);
		}
		case 2:{
			daoda[i_Stone][dd_Health] = KSVANGHEALTH;
			format(str, sizeof(str), "{FFFF00}Khoang San Vang [ID: %d]\n 80/80",i_Stone);
		}
	}
	daoda[i_Stone][dd_Type] = type;	

	daoda[i_Stone][dd_Name] = CreateDynamic3DTextLabel(str, -1, Pos[0], Pos[1], Pos[2]-1, 5);	
}


/* ===== Plain Func ===== */
SetStonePostion(i_Stone, Float:X,Float:Y,Float:Z) {
	daoda[i_Stone][dd_Cro][0] = X;
	daoda[i_Stone][dd_Cro][1] = Y;
	daoda[i_Stone][dd_Cro][2] = Z;
	return 1;
}
SetStoneAttacked(i_Stone, i = INVALID_PLAYER_ID) {

	new str[128];
	switch(daoda[i_Stone][dd_Type])
	{
		case 0:{
			format(str, sizeof(str), "{2ECCFA}Khoang San Lam [ID: %d]\n %d/30\n [Nguoi khai thac - %s]",i_Stone,daoda[i_Stone][dd_Health], GetPlayerNameEx(i));
		}
		case 1:{
			format(str, sizeof(str), "{FF0000}Khoang San Do [ID: %d]\n %d/50\n [Nguoi khai thac - %s]",i_Stone,daoda[i_Stone][dd_Health], GetPlayerNameEx(i));
		}
		case 2:{
			format(str, sizeof(str), "{FFFF00}Khoang San Vang [ID: %d]\n %d/80\n [Nguoi khai thac - %s]",i_Stone,daoda[i_Stone][dd_Health], GetPlayerNameEx(i));
		}
	}
	UpdateDynamic3DTextLabelText(daoda[i_Stone][dd_Name], 0xFFFFFFFF,str);

	daoda[i_Stone][dd_Attacked_Player] = i;
	return 1;
}

/* ===== Stock Func ===== */
stock IsPlayerRangeStone(playerid, Float:range) {
	new i = 0;
	LOOP:(i, MAX_STONES) {
		if(IsPlayerInRangeOfPoint(playerid, range, daoda[i][dd_Cro][0],daoda[i][dd_Cro][1],daoda[i][dd_Cro][2])) {
			return i; // tra ve object neu co da ke ben 
		}
	}
	return INVALID_STONE;
}
stock CheckPlayerdd_Invalid(playerid) {
	new i = 0;
	LOOP:(i, 99) {
		if(char_daoda[playerid][Player_Object_DYNS][i] == INVALID_OBJECT_ID) {
			return i;
		}
	}
	return -1;
}

CMD:khaithacs(playerid)
{
	new iStone = IsPlayerRangeStone(playerid, 1.7);
	if(iStone == INVALID_STONE) { // Khong dung gan da nao
		SendClientMessage(playerid, -1, "[{ccccff}Dao da{ffffff}]: Ban khong dung gan cuc da nao!");
		return 1;
	}
	if(daoda[iStone][dd_Attacked_Player] != INVALID_PLAYER_ID) { // Kiem tra da da bi tan cong chua
		// '!=' Thuoc da co nguoi tan cong
		new name[32],string[128];
		GetPlayerName(daoda[iStone][dd_Attacked_Player], name, 32); // Lay ten cua nguoi so huu
		format(string, 128, "[{ccccff}Dao Da{ffffff}]: Da nay dang bi %s khai thac", name);
		SendClientMessage(playerid, -1, string);
	}
	else { // Else thuoc da chua co nguoi so huu
		if(char_daoda[playerid][Player_Attack_Stone] != INVALID_STONE) { // Kiem tra nguoi choi co so huu da nao khong
			// '!=' Thuoc dang tan cong 
			SendClientMessage(playerid, -1, "[{ccccff}Dao Da{ffffff}]: Ban dang dao mot cuc da khac!");
		}
		else { // Nguoi choi khong cua da
			if(IsPlayerInAnyVehicle(playerid)) { // Tren xe khong duoc chat
				SendClientMessage(playerid, -1, "[{ccccff}Dao Da{ffffff}]: Ban phai xuong xe de dao da!");
			}
			else { // Bat dau cua da, da thoa mang dieu kien
				SetStoneAttacked(iStone, playerid); // Set da da co nguoi cua
				char_daoda[playerid][Player_Attack_Stone] = iStone; // Luu tru bien
				
				for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
				}			
				SetPlayerArmedWeapon(playerid, 0);
				ClearAnimations(playerid);
				//TogglePlayerControllable(playerid, 0);
				SetPlayerAttachedObject(playerid, 1, 2237, 6,0.086999,-0.063999,0.000000,0.000000,-160.799942,0.000000,1.000000,1.000000,1.000000);
				ApplyAnimation(playerid, "SWORD", "sword_4", 4.0999, 1, 0, 0, 0, 0);
			//	printf("DEBUG: Tree%d", iStone);


				//char_daoda[playerid][PlayerTime_daoda] = SetTimerEx("OnPlayerCompleteDaoda", 10000, 0, "dd", playerid, iStone);
				SetTimerEx("CountDownStoneFinish", 1000, 0, "ddd", playerid, iStone, 1);
			}
		}
	}	
	return true;
}

// nguoi tham dinh
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, NPCBORAX)){
			new str[256];
			format(str, sizeof(str), "Day la nguoi tham dinh cac loai quang\nSo luong tham dinh: 10 quang/lan\nSo quang hien tai ban dang so huu: %d quang\nNhung vat pham co the nhan duoc: Dong, Sat, Vang, Bach kim, Kim cuong",PlayerInfo[playerid][pQuathuong]);
			ShowPlayerDialog(playerid, 2222, DIALOG_STYLE_MSGBOX, "Nguoi tham dinh",str,"Tham dinh","Huy bo");
		}
	}

	return true;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == 2222)
	{
		if(response)
		{
			if(PlayerInfo[playerid][pQuathuong] >= 10) {
				new rand = random(100),type;
				switch(rand)
				{
					case 0..40: type = 1;
					case 41..70: type = 2;
					case 71..85: type = 3;
					case 86..95: type = 4;
					case 96..100: type = 5;
				}
				switch(type)
				{
					case 1:{
						SendClientMessageEx(playerid,-1,"[{848484}Tham Dinh{FFFFFF}] Ban da nhan duoc 10 {8A4B08}Dong {FFFFFF}tu viec tham dinh");
						ChatHoTro(playerid,255,"+10 Dong",5000);
					}
					case 2:{
						SendClientMessageEx(playerid,-1,"[{848484}Tham Dinh{FFFFFF}] Ban da nhan duoc 10 {D8D8D8}Sat {FFFFFF}tu viec tham dinh");
						ChatHoTro(playerid,255,"+10 Sat",5000);
					}
					case 3:{
						SendClientMessageEx(playerid,-1,"[{848484}Tham Dinh{FFFFFF}] Ban da nhan duoc 10 {FFFF00}Vang {FFFFFF}tu viec tham dinh");
						ChatHoTro(playerid,255,"+10 Vang",5000);
					}
					case 4:{
						SendClientMessageEx(playerid,-1,"[{848484}Tham Dinh{FFFFFF}] Ban da nhan duoc 10 {CEF6F5}Bach Kim {FFFFFF}tu viec tham dinh");
						ChatHoTro(playerid,255,"+10 Bach Kim",5000);
					}
					case 5:{
						SendClientMessageEx(playerid,-1,"[{848484}Tham Dinh{FFFFFF}] Ban da nhan duoc 10 {04B4AE}Kim Cuong {FFFFFF}tu viec tham dinh");
						ChatHoTro(playerid,255,"+10 Kim Cuong",5000);
					}
				}
				PlayerInfo[playerid][pQuathuong] -= 10;
			}
			else ChatHoTro(playerid, 255, "~r~Co loi xay ra: ~w~Ban khong du quang de tham dinh",5000);
		}
		else ChatHoTro(playerid, 255,"Cam on ban da ghe tham",5000);
	}
	return true;
}



CMD:gotoks(playerid, params[])
{
	new index;
	if(sscanf(params, "d",index)) return SendClientMessageEx(playerid,-1,"Su dung: /gotoks [ID]");
	if(PlayerInfo[playerid][pAdmin] < 2) return ChatHoTro(playerid,255,"~r~Warning: ~w~ Falied!",5000); 
	if(stone_available[index] == 0) return ChatHoTro(playerid, 255, "Cuc da nay dang trong thoi gian tai tao",5000);
	SetPlayerPos(playerid, daoda[index][dd_Cro][0],daoda[index][dd_Cro][1],daoda[index][dd_Cro][2]);
	new str[128];
	format(str,sizeof(str),"Ban da dich chuyen thanh cong den khoang san ID: ~r~%d",index);
	SetPlayerInterior(playerid,0);
	PlayerInfo[playerid][pInt] = 0;
	SetPlayerVirtualWorld(playerid, 0);
	PlayerInfo[playerid][pVW] = 0;
	ChatHoTro(playerid,255,str,5000);
	return true;
}

CMD:editks(playerid, params[])
{
	new model[32],index,type;
	if(sscanf(params, "s[32]dd",model, index, type)){
		SendClientMessage(playerid,-1,"Su dung: /editks [Tao/Xoa] [ID] [Loai]");
		SendClientMessage(playerid, -1, "{848484}[1]: Khoang san Lam");
		SendClientMessage(playerid, -1, "{848484}[2]: Khoang san Do");
		SendClientMessage(playerid, -1, "{848484}[3]: Khoang san Vang");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] < 2) return ChatHoTro(playerid,255,"~r~Warning: ~w~ Falied!",5000); 
	if(strcmp(model, "tao", true) == 0)
	{
		if(type != 1 && type != 2 && type !=3) return ChatHoTro(playerid, 255,"~r~Falied: ~w~ Vui long chon lai Loai da!",5000);
		if(stone_available[index] != 0 || index < 20) return SendClientMessage(playerid, -1, "[Edit Khoang San] {FF0000}Failied: {FFFFFF}Khoang san nay da ton tai!");
		CreateStoneCustom(playerid, index, type-1);
		new str[128];
		format(str,128, "[Edit Khoang San] Ban da tao thanh cong 1 khoang san voi ID: %d",index);
		SendClientMessage(playerid, -1, str);
	}
	else if(strcmp(model, "xoa", true) == 0)
	{
		if(stone_available[index] == 0) return SendClientMessage(playerid, -1, "[Edit Khoang San] {FF0000}Failied: {FFFFFF}Khoang san nay khong ton tai!");
		if(index < 20) return SendClientMessage(playerid, -1, "[Edit Khoang San] {FF0000}Failied: {FFFFFF}Khoang san nay la cua he thong khong the xoa!");

		SetStoneAttacked(index, INVALID_PLAYER_ID);

		stone_location[daoda[index][dd_location]] = 0;
		stone_available[index] = 0;

		SetStonePostion(index, -1,-1,-1);
	
		DestroyObject(daoda[index][dd_Stone]);
		DestroyDynamic3DTextLabel(daoda[index][dd_Name]);

		new str[128];
		format(str,128, "[Edit Khoang San] Ban da xoa khoang san ID: %d",index);
		SendClientMessage(playerid, -1, str);		
	}
	return true;
}

CMD:ksnext(playerid)
{
	if(PlayerInfo[playerid][pAdmin] < 2) return ChatHoTro(playerid,255,"~r~Warning: ~w~ Falied!",5000);
	for(new i = 20;i<MAX_STONES;i++) {
		if(stone_available[i] == 0)
		{
			SendClientMessage(playerid, 0xFF0000FF, "{FF0000}Khoang san tiep theo dang trong slot");
			new str[128];
			format(str,128,"ID: %d co the tao",i);
			SendClientMessage(playerid, -1, str);
			return 1;
		}
	}
	return true;
}