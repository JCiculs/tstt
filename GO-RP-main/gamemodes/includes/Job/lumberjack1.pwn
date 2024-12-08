// check chat go cu bao 3/3 out ra vao lai van bi 3/3 khong the chat itpe
#include <YSI_Coding\y_hooks>
#define dangcuacay 1
/* ========= Defines ========= */
#define MAX_TREES 13  
#define INVALID_TREE -1 // Khong dung vao day
#define MAX_SLOT_TREE 3 // Khong dung vao day
#define DIADIEM_TRAGO 2561.0884,-908.4086,83.6813  // Dia diem tra go
#define giago 50
#define giagoban 20
#define LOOP:(%1,%2) for(%1 = 0 ; %1 < %2; %1 ++) // Khong dung vao day
#define GetFrogKidPos(%1) new Float:FrPos[3]; GetPlayerPos(%1, FrPos[0], FrPos[1], FrPos[2]) // Ko dung vo cai nay
/* ========= Enum & Variable ========= */
enum e_lj_data {
	lj_Tree, // Object ID
	Text3D:lj_Name, // Label cay
	lj_Attacked_Player, // Nguoi so huu

	Float:lj_Cro[3], // Vi Tri
}
enum char_lj_data {
	PlayerTime_LumberJack,
	Player_Attack_Tree,
	Player_Tree_Count,
	// Object & Vehicle
	//Player_Object_Slot[MAX_SLOT_TREE], // Object Attachment
	Player_Object_DYN[MAX_SLOT_TREE], // Object duoi dat
	Player_Vehicle_ID,
}
new batdaulumberjack[MAX_PLAYERS];
new SoGoHienTai[MAX_PLAYERS];
new DeoBietTen[MAX_PLAYERS] = 0;
new soluonggo;
new char_lumberjack[MAX_PLAYERS][char_lj_data];
new LumberJack[MAX_TREES][e_lj_data];
new const Float:Tree_Default[MAX_TREES][] = {
{2554.0317,-873.1331,85.1396,35.8830}, // cay
{2551.7979,-865.9297,85.2697,15.2029}, // cay1
{2554.8481,-858.1810,84.7373,341.7386}, // cay2
{2564.7480,-858.4143,83.5169,267.0392}, // cay3
{2575.7271,-863.9980,82.1441,237.7109}, // cay4
{2581.6199,-855.2332,80.9097,331.0851}, // cay5
{2579.6428,-845.1363,80.7609,12.5708}, // cay6
{2575.3323,-835.4927,81.4800,26.2322}, // cay7
{2567.5784,-828.6834,83.3958,51.1738}, // cay8
{2557.8311,-824.3920,85.5700,67.8432}, // cay9
{2546.8816,-819.5950,87.2693,65.7126}, // cay10
{2540.3848,-824.6667,87.9176,155.7126}, // cay11
{2534.5737,-830.3735,88.4491,103.2126} // cay12
};
/* ========= Callbacks ========= */
hook OnGameModeInit(playerid) {
	new i = 0;
	LOOP:(i,MAX_TREES) {
		CreateTree(i);
	}
	CreateActor(1,1099.1829,-1471.6946,15.7969,256.3485);
	CreateDynamic3DTextLabel("\n[{66CC99}LUMBER JACK]{FFFFFF}\n{66CC99}NPC Trao doi\n{CCFF00}(Y)",COLOR_YELLOW,1099.1829,-1471.6946,15.7969+0.5,4.0);
	CreateDynamic3DTextLabel("\n[{66CC99}LUMBER JACK]{FFFFFF}\n{66CC99}NPC Mua cua\n{CCFF00}(Y)",COLOR_YELLOW,2561.0884,-908.4086,83.6813+0.5,4.0);
	CreateActor(1,2561.0884,-908.4086,83.6813,5.8199); // npctrago
	CreateObject(1463, 2562.84302, -909.27795, 83.27822,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2564.39990, -908.49463, 82.98243,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2564.22339, -909.20154, 82.69183,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2562.85400, -907.94037, 82.77732,   0.00000, 0.00000, 2.10627);
	CreateObject(1463, 2563.14307, -909.13953, 82.98243,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2563.14673, -909.01141, 83.61003,   0.00000, 0.00000, 2.32796);
	CreateObject(1463, 2562.97681, -908.48181, 82.99483,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2564.35278, -908.65930, 83.41116,   0.00000, 0.00000, 2.32392);
	CreateObject(1463, 2564.31909, -908.09784, 82.67429,   0.00000, 0.00000, 2.10627);
	CreateObject(1463, 2564.32935, -909.22400, 82.99483,   0.00000, 0.00000, 2.32392);
		
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5.0,2561.0884,-908.4086,83.6813))
	    {
			return cmd_npc(playerid);
	    }
	}
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 5.0,1099.1829,-1471.6946,15.7969))
	    {
			return cmd_worktrade(playerid);
	    }
	}
	if(newkeys & KEY_YES)
	{
			cmd_cuacay(playerid);
	}
	return 1;
}
hook OnPlayerUpdate(playerid)
{
	if(batdaulumberjack[playerid] == 1)
	{
		new str[128];
		format(str,sizeof(str),"GO:%d",SoGoHienTai[playerid]);
		PlayerTextDrawSetString(playerid, LumberJackTextDraw[playerid],str);
		PlayerTextDrawShow(playerid, LumberJackTextDraw[playerid]);
	}
	return 1;
}
hook OnPlayerConnect(playerid) {

	char_lumberjack[playerid][Player_Tree_Count] = 0;
	char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;
	char_lumberjack[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
	for(new i = 0 ; i < 3 ; i ++) {
		//if(IsValidObject(char_lumberjack[playerid][Player_Object_DYN][i])) DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
		char_lumberjack[playerid][Player_Object_DYN][i] = INVALID_OBJECT_ID;
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason) {
	if(char_lumberjack[playerid][Player_Vehicle_ID] != INVALID_VEHICLE_ID) {
		DestroyVehicle(char_lumberjack[playerid][Player_Vehicle_ID]);
	}
	batdaulumberjack[playerid] = 0;

	if(char_lumberjack[playerid][Player_Attack_Tree] != INVALID_TREE) {
		SetTreeAttacked(char_lumberjack[playerid][Player_Attack_Tree], INVALID_PLAYER_ID); 
		LumberJack[char_lumberjack[playerid][Player_Attack_Tree]][lj_Attacked_Player] = INVALID_PLAYER_ID;
		KillTimer(char_lumberjack[playerid][PlayerTime_LumberJack]);
	}
	if(char_lumberjack[playerid][Player_Tree_Count] > 0) {
		for(new i = 0; i < char_lumberjack[playerid][Player_Tree_Count]; i ++) {
			if(IsValidObject(char_lumberjack[playerid][Player_Object_DYN][i])) {
				DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
			}
		}
	}
	return 1;
}
/*hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
	
	if(newkeys & KEY_YES) {
		if(GetPVarInt(playerid, "TraHangLumberJack") == 0) {
			if(IsPlayerInRangeOfPoint(playerid, 15, DIADIEM_TRAGO) && char_lumberjack[playerid][Player_Tree_Count] > 0) {
				new Float:X,Float:Y,Float:Z;
				GetVehiclePos(char_lumberjack[playerid][Player_Vehicle_ID], X,Y,Z);		
				if(IsPlayerInRangeOfPoint(playerid, 2.2, X,Y,Z)) {
					SetPVarInt(playerid, "TraHangLumberJack", 1);
					char_lumberjack[playerid][Player_Tree_Count]--;
					SetPlayerCheckpoint(playerid, DIADIEM_TRAGO, 3);
					new i = char_lumberjack[playerid][Player_Tree_Count];
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);	
					SetPlayerAttachedObject(playerid, 9, 1463, 1, 0.1539, 0.5870, 0.0000, 0.0000, 84.7999, 0.0000, 0.8460, 0.4109, 0.4190, 0xFFFFFFFF, 0xFFFFFFFF);				
					
					DestroyObject(char_lumberjack[playerid][Player_Object_DYN][i]);
				}
			}
		}
	}
	return 1;
}*/
hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(batdaulumberjack[playerid] == 1)
	{
		for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        }
		PlayerTextDrawHide(playerid, LumberJackTextDraw[playerid]);
		batdaulumberjack[playerid] = 0;
	}
	if(DeoBietTen[playerid] == 1)
	{
		DeoBietTen[playerid] = 0;
		DisableCheckPoint(playerid);
		SendClientMessage(playerid, -1, "Khong bug");
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid, 0);
	}
}
hook OnPlayerEnterCheckpoint(playerid) {
	
	if(IsPlayerInRangeOfPoint(playerid, 5.0, DIADIEM_TRAGO))
	{
		if(DeoBietTen[playerid] == 1)
		{
			switch(random(2))
			{
				case 0:
				{
					SoGoHienTai[playerid] += 5;
					//ClearAnimations(playerid);
				}
				case 1:
				{
					//ClearAnimations(playerid);
					SendClientMessage(playerid, -1, "Ban nhan duoc 1 go nho (dung de che tao)");
					//PlayerInfo[playerid][pHatGiong] += 1;
					PlayerInfo[playerid][pGo] ++;
				}
			}
			//ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
			SendClientMessage(playerid, -1, "So go hien tai cua ban da duoc cap nhap goc phai man hinh");
			RemovePlayerAttachedObject(playerid, 0);
			DisablePlayerCheckpoint(playerid);
			SoGoHienTai[playerid] += 5;
			DeoBietTen[playerid] = 0;
			ClearAnimations(playerid);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		}
	}
	return 1;
}
/* ========= Functions ========= */
forward CreateTree(i_tree);
forward OnPlayerCompleteSawing(playerid, iTree);
/* ===== Public Func ===== */
public CreateTree(i_tree) {
	new 
		Tree_Object_ID[] = {708,691,616}; // ID Object cua cay 

	new modelid = Tree_Object_ID[random(sizeof Tree_Object_ID)];
	LumberJack[i_tree][lj_Attacked_Player] = INVALID_PLAYER_ID;

	SetTreePostion(i_tree, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2]);
	LumberJack[i_tree][lj_Tree] = CreateObject(modelid, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2]-2, 0,0,0);
	LumberJack[i_tree][lj_Name] = CreateDynamic3DTextLabel("{0f8d47}[CAY CO THU]{FFFFFF}\n(Y)", -1, Tree_Default[i_tree][0], Tree_Default[i_tree][1], Tree_Default[i_tree][2], 5);
	return 1;
}
public OnPlayerCompleteSawing(playerid, iTree) {
	//new iTree = char_lumberjack[playerid][Player_Attack_Tree]; // Luu tru bien khi cua cay
	if(IsPlayerInRangeOfPoint(playerid, 1.7, LumberJack[iTree][lj_Cro][0],LumberJack[iTree][lj_Cro][1],LumberJack[iTree][lj_Cro][2])) {
		GetFrogKidPos(playerid);
		TogglePlayerControllable(playerid, 1);
		RemovePlayerAttachedObject(playerid, 9);	
		SetTreeAttacked(iTree, INVALID_PLAYER_ID);
		char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;

	//	new Player_ID_Tree = CheckPlayerLJ_Invalid(playerid);
		SetTreePostion(iTree, -1,-1,-1);
	
		DestroyObject(LumberJack[iTree][lj_Tree]);
		DestroyDynamic3DTextLabel(LumberJack[iTree][lj_Name]);
		//DestroyObject(char_lumberjack[playerid][Player_Object_DYN][Player_ID_Tree]);
		

	
		SetTimerEx("CreateTree", 15000, 0, "d", iTree); // Respawn cay
		
		DeoBietTen[playerid] ++;

		//
		
		//new string[128];
		//new i = char_lumberjack[playerid][Player_Tree_Count];
		//char_lumberjack[playerid][Player_Object_DYN][i] = CreateObject(1463, FrPos[0], FrPos[1], FrPos[2],0,0,0);
		//format(string, 128, "[{ccccff}LumberJack{ffffff}]: %d/%d Cay", i+1,MAX_SLOT_TREE);
		//SendClientMessage(playerid, -1, string);
		/*switch(i) {
			case 0: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.0000, 0.2000, 0.0000, 0.0000, 0.0000);
			case 1: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.2000, 0.0000, 0.0000, 0.0000);
			case 2: AttachObjectToVehicle(char_lumberjack[playerid][Player_Object_DYN][i], char_lumberjack[playerid][Player_Vehicle_ID], 0.0000, -1.7999, 0.6999, 0.0000, 0.0000, 0.0000);
		}*/
		ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 1, 0, 0, 0, 0);
		// await task_ms(1500);
		SetTimerEx("CuaCayXong", 1500, false, "d", playerid);
	}
	else {
		SetTreeAttacked(iTree, INVALID_PLAYER_ID);
		char_lumberjack[playerid][Player_Attack_Tree] = INVALID_TREE;
		SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]: Ban da di qua xa cay!");
	}
	return 1;
}
forward CuaCayXong(playerid);
public CuaCayXong(playerid)
{
	ClearAnimations(playerid);
	PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
	SetPlayerAttachedObject(playerid, 1, 341, 17, -0.5600, -0.1589, -0.0339, 11.8999, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // chnsaw attached to the Neck of ntv_Ntv
	SetPlayerAttachedObject(playerid, 0, 1463, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
	char_lumberjack[playerid][Player_Tree_Count]++;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
	SetPlayerCheckpoint(playerid, DIADIEM_TRAGO, 3);
}
/* ===== Plain Func ===== */
SetTreePostion(i_tree, Float:X,Float:Y,Float:Z) {
	LumberJack[i_tree][lj_Cro][0] = X;
	LumberJack[i_tree][lj_Cro][1] = Y;
	LumberJack[i_tree][lj_Cro][2] = Z;
	return 1;
}
SetTreeAttacked(i_tree, i = INVALID_PLAYER_ID) {
	LumberJack[i_tree][lj_Attacked_Player] = i;
	return 1;
}

/* ===== Stock Func ===== */
stock IsPlayerRangeTree(playerid, Float:range) {
	new i = 0;
	LOOP:(i, MAX_TREES) {
		if(IsPlayerInRangeOfPoint(playerid, range, LumberJack[i][lj_Cro][0],LumberJack[i][lj_Cro][1],LumberJack[i][lj_Cro][2])) {
			return i; // tra ve object neu co cay ke ben 
		}
	}
	return INVALID_TREE;
}
stock CheckPlayerLJ_Invalid(playerid) {
	new i = 0;
	LOOP:(i, 99) {
		if(char_lumberjack[playerid][Player_Object_DYN][i] == INVALID_OBJECT_ID) {
			return i;
		}
	}
	return -1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new str[3000];
	if(dialogid == DIALOG_WORKTRADE)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(!vehicleCountCheck(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Garage cua ban da het cho vui long xoa bot hoac gui cho ai do");
				if(PlayerInfo[playerid][pGo] < 50) return SendClientMessage(playerid, -1, "Ban khong du go nho");
				PlayerInfo[playerid][pGo] -= 50;
				SendClientMessage(playerid, -1, "Ban da doi thanh cong 50 go, nhan lai duoc la mot chiec xe Intruder");
				CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 546, 1055.6815,-1496.6393,13.5469,161.3065, 5, 5, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			}
			if(listitem == 1)
			{
				format(str, sizeof(str), "So go hien tai cua ban:%d\nNhap so luong ban can ban\nGia hien tai go la %d",PlayerInfo[playerid][pGo],giago);
				ShowPlayerDialog(playerid, DIALOG_WORKSELL, DIALOG_STYLE_INPUT, "Nhap so luong",str,"Ban","Huy");
			}
			if(listitem == 2)
			{
				format(str, sizeof(str), "So go hien tai o cua hang la %d\nGia hien tai %d\nNhap so luong can mua",soluonggo,giagoban);
				ShowPlayerDialog(playerid, DIALOG_WORKBUY, DIALOG_STYLE_INPUT, "Nhap so luong",str,"Mua","Huy");
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pGo] >= 5){
					SendClientMessage(playerid, -1, "Doi 5 go thanh mot mon do the thao (gay bong chay)");
					GivePlayerValidWeapon(playerid, 5, 60000);
					PlayerInfo[playerid][pGo] -= 5;
				}
			}
		}
	}
	if(dialogid == DIALOG_WORKSELL)
	{
		if(response)
		{
			if(strval(inputtext) > 0)
			{
				if(PlayerInfo[playerid][pGo] >= strval(inputtext))
				{
					PlayerInfo[playerid][pGo] -= strval(inputtext);
					PlayerInfo[playerid][pCash] += strval(inputtext)*giago;
					soluonggo += strval(inputtext);
					format(str, sizeof(str),"Ban da so luong go %d nhan lai duoc %d$ so tien tu viec ban go",strval(inputtext),strval(inputtext)*giago);
					SendClientMessage(playerid, -1, str);
				}
				else SendClientMessage(playerid, -1, "Cua hang khong du so hang ban can mua");
			}
			else SendClientMessage(playerid, -1, "Gia tri tren 1");
		}
	}
	if(dialogid == DIALOG_WORKBUY)
	{
		if(response)
		{
			if(strval(inputtext) > 0)
			{
				if(soluonggo >= strval(inputtext))
				{
					if(PlayerInfo[playerid][pCash] >= strval(inputtext)*giagoban)
					{
						PlayerInfo[playerid][pCash] -= strval(inputtext)*giagoban;
						PlayerInfo[playerid][pGo] += strval(inputtext);
						soluonggo -= strval(inputtext);
						format(str, sizeof(str),"Ban da mua mot so luong go nho %d (/balo) de kiem tra",strval(inputtext));
						SendClientMessage(playerid, -1, str);
					}
					else SendClientMessage(playerid, -1, "Ban khong du tien");
				}
				else SendClientMessage(playerid, -1, "Hien tai cua hang khong du go");
			}
			else SendClientMessage(playerid, -1, "Gia tri tren 1");
		}
	}
	return 1;
}
CMD:worktrade(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1099.1829,-1471.6946,15.7969))
	{
		ShowPlayerDialog(playerid, DIALOG_WORKTRADE, DIALOG_STYLE_TABLIST_HEADERS, "TRAO DOI GO","Ten\tGo\tSo luong\nIntruder (Xe)\t50\t1\nBan\nMua\nGay bong chay\t5\t1","{ae0202 }Chon","{FFFFFF}Huy");
	}
	else SendClientMessage(playerid, -1, "Ban khong gan NPC");
	return 1;
}
CMD:npc(playerid)
{
	//if(TimerLumberJack <= 0) return SendClientMessage(playerid, -1, "Khung gio lam viec la 16h den 18h");
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, DIADIEM_TRAGO))
		return SendClientMessage(playerid, -1, "Khong the thuc hien");
	if(batdaulumberjack[playerid] == 0)
	{
		SetPlayerAttachedObject(playerid, 0, 341, 17, -0.5600, -0.1589, -0.0339, 11.8999, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // chnsaw attached to the Neck of ntv_Ntv
		batdaulumberjack[playerid] = 1;
		SendClientMessage(playerid, -1,"Ban da bat dau cong viec");
	}
	else
	{
		for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        }
		new str[64];
		format(str,sizeof(str), "Nhan duoc so tien tu viec lam go %d$",SoGoHienTai[playerid]*3);
		SendClientMessage(playerid, -1, str);
		SendClientMessage(playerid, -1, "Ban da ngung cong viec");
		PlayerInfo[playerid][pCash] += SoGoHienTai[playerid]*3;
		SoGoHienTai[playerid] -= SoGoHienTai[playerid];
		PlayerTextDrawHide(playerid, LumberJackTextDraw[playerid]);
		batdaulumberjack[playerid] = 0;
		Misc_Save();
		OnPlayerStatsUpdate(playerid);

	}
	return 1;
}
CMD:cuacay(playerid) {
	if(batdaulumberjack[playerid] == 1) {
		new iTree = IsPlayerRangeTree(playerid, 1.7); 
		/*if(iTree == INVALID_TREE) { // Khong dung gan cay nao
			SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]: Ban khong dung gan cay nao!");
		}
		if(DeoBietTen[playerid] == 1)
		{
			return SendClientMessage(playerid, -1, "Ban da co go tren tay hay dem di vao nha kho moi co the tiep tuc");
		}*/
		//else { // Da xac nhan duoc cay 
			if(LumberJack[iTree][lj_Attacked_Player] != INVALID_PLAYER_ID) { // Kiem tra cay da bi tan cong chua
				// '!=' Thuoc da co nguoi tan cong
				new name[32],string[128];
				GetPlayerName(LumberJack[iTree][lj_Attacked_Player], name, 32); // Lay ten cua nguoi so huu
				format(string, 128, "[{0f8d47}LUMBER JACK{ffffff}]: %s hien dang cua cay nay", name);
				SendClientMessage(playerid, -1, string);
			}
			else { // Else thuoc cay chua co nguoi so huu
				if(char_lumberjack[playerid][Player_Attack_Tree] != INVALID_TREE) { // Kiem tra nguoi choi co so huu cay nao khong
					// '!=' Thuoc dang tan cong 
					SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]: Khong the lam dieu do vao luc nay!");
				}
				else { // Nguoi choi khong cua cay
					if(IsPlayerInAnyVehicle(playerid)) { // Tren xe khong duoc chat
						SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]: Khong the lam dieu do vao luc nay!");
					}
					else {
						if(GetPVarInt(playerid, "Injured") == 1) {					
							SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]: Khong the lam dieu do vao luc nay!");
						}
						else { // Bat dau cua cay, da thoa mang dieu kien
							SetTreeAttacked(iTree, playerid); // Set cay da co nguoi cua
							char_lumberjack[playerid][Player_Attack_Tree] = iTree; // Luu tru bien
							
							for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
							{
								if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
							}			
							SetPlayerArmedWeapon(playerid, 0);
							TogglePlayerControllable(playerid, 0);
							SetPlayerAttachedObject(playerid, 9, 341, 6);
							ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, 1, 0, 0, 1, 0, 1);

							char_lumberjack[playerid][PlayerTime_LumberJack] = SetTimerEx("OnPlayerCompleteSawing", 15000, 0, "dd", playerid, iTree);
							LoaderStarting(playerid, dangcuacay, "[!] Dang Chat Go...", 0.5,  dangcuacay*15000);
						//	printf("DEBUG: Tree%d", iTree);
						}
					}
				}
			}
		}
	//}
	//else SendClientMessage(playerid, -1, "[{0f8d47}LUMBER JACK{ffffff}]:Ban can bat dau cong viec truoc khi lam viec");
	return 1;
}
