/*
	made by liv javier
*/

#include <YSI_Coding\y_hooks>
#include <a_samp>

#define DIALOG_TRAODOI 557	
#define DIALOG_BANDA 556
#define DIALOG_BANDA1 555
#define DIALOG_KHAITHAC 2222
#define GIATIEN 10 // 5k

enum _:E_MINERAL_INFO {
	_type,
	_object, 
	_attack_id,
	Text3D:_text,
	Float:_health,
}

new 
	Pool:minerals;

new mineral_modelid[][] = {
	{3929, 3930, 3931}, {3929, 3930, 3931}
};

new Float:arr_Pos[][] = {
{617.50677, 865.66235, -43.57732,   0.00000, 0.00000, 0.00000},
{617.80701, 859.85663, -43.75608,   0.00000, 0.00000, 0.00000},
{611.78522, 850.84802, -43.75608,   0.00000, 0.00000, 0.00000},
{622.66357, 857.10095, -43.75608,   0.00000, 0.00000, 0.00000},
{623.80548, 851.02936, -43.57732,   0.00000, 0.00000, 0.00000},
{612.38989, 855.96600, -43.57732,   0.00000, 0.00000, 0.00000},
{615.60638, 847.47266, -43.57732,   0.00000, 0.00000, 0.00000},
{626.62146, 861.97333, -43.57732,   0.00000, 0.00000, 0.00000},
{618.43317, 849.43359, -43.75608,   0.00000, 0.00000, 0.00000},
{611.70697, 862.81769, -43.75608,   0.00000, 0.00000, 0.00000},
{618.89642, 856.55243, -43.75608,   0.00000, 0.00000, 0.00000},
{633.12347, 865.91248, -43.88033,   0.00000, 0.00000, 0.00000},
{632.54541, 870.75598, -43.57732,   0.00000, 0.00000, 0.00000},
{627.01068, 860.48450, -43.57732,   0.00000, 0.00000, 0.00000},
{602.72723, 909.15588, -44.67065,   0.00000, 0.00000, 0.00000},
{615.17908, 922.14258, -40.84667,   0.00000, 0.00000, 0.00000},
{597.91345, 895.74731, -45.37469,   0.00000, 0.00000, 0.00000},
{580.85797, 900.56732, -43.97705,   0.00000, 0.00000, 0.00000},
{570.65326, 922.57538, -43.56522,   0.00000, 0.00000, 0.00000},
{565.05090, 913.38776, -43.54873,   0.00000, 0.00000, 0.00000},
{553.21021, 901.47681, -43.44570,   0.00000, 0.00000, 0.00000},
{546.70905, 919.35242, -36.17729,   0.00000, 0.00000, 357.92047},
{470.31958, 883.04755, -29.70611,   0.00000, 0.00000, 0.00000},
{483.00626, 881.84827, -31.57804,   0.00000, 0.00000, 0.00000},
{508.41364, 835.79388, -27.46652,   0.00000, 0.00000, 0.00000},
{567.37732, 803.97437, -29.66911,   0.00000, 0.00000, 0.00000}


};

hook OnGameModeInit() {
	new 
		index = 0;
		
	minerals = pool_new();
	do {
		Mineral_Create(random(2), index, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]);
	}
	while(++index < sizeof(arr_Pos));

	CreateActor(16, 2284.5396,-2211.0012,13.5469,224.5612); // npc khoangsan
	CreateDynamic3DTextLabel("{66CC66}Job:Khai thac\n\n(N)\t{FFFF99}Cap do yeu cau:1",COLOR_YELLOW,2284.5396,-2211.0012,13.5469+0.5,4.0);// Pizza (LS)
	//CreateActor(16, 1831.0551,-1092.1512,23.8379,275.1662);
	//CreateDynamic3DTextLabel("{66FF33}Dia Diem:3\n{99FF00}Phu Kien\t{EE0000}(N)", COLOR_YELLOW, 602.1800,868.0037,-42.9609+0.6,18.0);
	//CreateDynamic3DTextLabel("{66FF33}Dia Diem:2\n{99FF00}Che tao\t{EE0000}(Y)", COLOR_YELLOW, 1831.0551,-1092.1512,23.8379+0.6,18.0);
	printf("[MINERAL]: Load %d mineral, %d location...", pool_size(minerals), sizeof(arr_Pos));
}

forward Mineral_Create(const type, i_pos, Float:X, Float:Y, Float:Z);
public Mineral_Create(const type, i_pos, Float:X, Float:Y, Float:Z) {
	static 
		_mineral[E_MINERAL_INFO], modelid, rand_make, Float:health;

	if(type >= 2) return print(":INVALID TYPE");

	rand_make = random(sizeof(mineral_modelid) + 1);
	modelid = mineral_modelid[type][rand_make];
	health = ((!type) ? (random(321) + 2000.5123) : random(1000) + 2000.1123) + float(66);

	_mineral[_type] = type;
	_mineral[_health] = health;
	_mineral[_attack_id] = 0xFFF;

	_mineral[_object] = CreateDynamicObject(modelid, X, Y, Z-0.7, 0.0, 0.0, 0.0);
	_mineral[_text] = CreateDynamic3DTextLabel(#, -1, X, Y, Z-0.4, type ? 15.0 : 10.0);		
	new index = pool_add_arr(minerals, _mineral);
	return Mineral_Update(index, health, 0xFFF);
}

Mineral_Respawn(const index, const sec = 240) {
	static _mineral[E_MINERAL_INFO];
	if(pool_get_arr_safe(minerals, index, _mineral)) {
		if(IsValidDynamicObject(_mineral[_object])) {
			DestroyDynamicObject(_mineral[_object]);
		}
		if(IsValidDynamic3DTextLabel(_mineral[_text])) {
			DestroyDynamic3DTextLabel(_mineral[_text]);
		}

		pool_set_cell(minerals, index, _health,    -1.0);	
		pool_set_cell(minerals, index, _attack_id, 0xFFF);	
		pool_set_cell(minerals, index, _text,   	_:_mineral[_text]);	
		pool_set_cell(minerals, index, _object, 	_mineral[_object]);
	
		await task_ms(sec * 1000);

		new 
			rand_make, type = random(2),
			modelid, Float:health = ((!type) ? (random(321) + 2000.5123) : random(1000) + 6000.1123) + float(66);
		
		rand_make = random(sizeof(mineral_modelid) + 1);
		modelid = mineral_modelid[type][rand_make];

		pool_set_cell(minerals, index, _object, CreateDynamicObject(modelid, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]-0.7, 0.0, 0.0, 0.0));
		pool_set_cell(minerals, index, _text,   _:CreateDynamic3DTextLabel(#, -1, arr_Pos[index][0], arr_Pos[index][1], arr_Pos[index][2]-0.4, type ? 15.0 : 10.0));
		Mineral_Update(index, health);
	}
}

Mineral_Update(const index, const Float:health, const attack_id = 0xFFF) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			if(IsValidDynamic3DTextLabel(_mineral[_text])) {
				new _string[128], attack_name[24 + 2];
				if(attack_id == 0xFFF) 
					strcat(attack_name, "{cc6600}(/khaithac)");
				else 
					format(attack_name, 26, "{e68a00}[%s]", GetPlayerNameEx(attack_id));

				format(_string, sizeof(_string), "[{3399ff}KHOANG SAN{ffffff}]\nLoai: {3399ff}%s{ffffff}\nHP: {ff0000}%0.2f\n%s", _mineral[_type] ? ("Nho") : ("Nho"), health, attack_name);
				UpdateDynamic3DTextLabelText(_mineral[_text], -1, _string);
			}
			pool_set_cell(minerals, index, _health,    health);
			pool_set_cell(minerals, index, _attack_id, attack_id);			
		}
		return index;
	}
	return 0;
}

mineral_get_type(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_type];
		}
	}
	return -1;	
}

mineral_get_attacked(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_attack_id];
		}
	}
	return 0xFFF;	
}

Float:mineral_get_health(const index) {
	if(index < pool_size(minerals)) {
		static _mineral[E_MINERAL_INFO];
		if(pool_get_arr_safe(minerals, index, _mineral)) {
			return _mineral[_health];
		}
	}
	return 0.132;
}

player_get_mineral_Id(const playerid) {
	static 
		_mineral[E_MINERAL_INFO];
	
	for_pool(i: minerals) {
		if(iter_get_arr_safe(i, _mineral, sizeof(_mineral))) {
			if(_mineral[_attack_id] == playerid) {
				return iter_get_key(i);
			}
		}
	}
	return -1;
}

player_get_nearest_mineral(const playerid, const Float:distance_ = 15.0) {

	new index, Float:max_distance = distance_, Float:cur_dist;

	index = -1;
    for(new i = 0, _mineral[E_MINERAL_INFO]; i < sizeof(arr_Pos); i ++) {
        if(i < pool_size(minerals)) {
	        pool_get_arr_safe(minerals, i, _mineral);
	        if(_mineral[_health] > 0) {
		        if((cur_dist = GetPlayerDistanceFromPoint(playerid, arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) < max_distance) {
		            max_distance = cur_dist;
		            index = i;
		        }
		    }
		}
    }
    return index;
}
CMD:khaithac(playerid) {

	//if(TimerKhoangSan == 0) return SendClientMessage(playerid, -1, "Khung gio lam viec 13h den 15h hang ngay");
	if(PlayerInfo[playerid][pJob] != 22 && PlayerInfo[playerid][pJob2] != 22) return SendClientMessageEx(playerid,COLOR_GREY,"ban chua nhan viec");
	if(player_get_mineral_Id(playerid) != -1) 
		SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban dang khai thac, su dung (/dungkhaithac) de nhat may khai thac len.");
	
	else {
		new i = player_get_nearest_mineral(playerid, 15.0);
		if(i != -1) {
			if(IsPlayerInRangeOfPoint(playerid, (!mineral_get_type(i) ? 3.0 : 8.5), arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) {
				if(mineral_get_attacked(i) == 0xFFF) {
					SetPVarInt(playerid, "DANGDAO", 1);
					SetPlayerAttachedObject(playerid, 1, 19631, 6, 0.443999, 0.060999, -0.007999, -128.6, 173.7, -85.5, 1.0, 1.0, 1.0);
        			//SetPlayerAttachedObject(playerid, 1, 337, 1, 0.1879, 0.5830, 0.0000);
					//AttachObjectToPlayer(dumemay, playerid, 1.5, 0.5, 0.0, 0.0, 1.5, 2);
					Mineral_Update(i, mineral_get_health(i), playerid);
					SetTimerEx("OnMineralExploit", 3000, 0, "dd", playerid, i);
					ApplyAnimation(playerid, "SWORD", "sword_4", 4.0999, 1, 0, 0, 0, 0);
					TogglePlayerControllable(playerid, 0);
					SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da bat dau khai thac.");
				}	
				else SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da co nguoi khai thac.");
			}
		}
		else SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban khong dung gan khoang san.");
	}
	return 1;
}

CMD:dungkhaithac(playerid) {
	new i = player_get_mineral_Id(playerid);
	if(i != -1) {
		Mineral_Update(i, mineral_get_health(i), 0xFFF);
		SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da dung khai thac.");
	}
	return 1;	
}
/*CMD:khoangsan(playerid)
{
	new string[128];
	format(string, 128, "So Luong Sat: %d", PlayerInfo[playerid][pSat]);
	SendClientMessage(playerid, -1, string);
	format(string, 128, "So Luong Da: %d", PlayerInfo[playerid][pDong]);
	SendClientMessage(playerid, -1, string);
	return 1;
}*/
CMD:ketthuclamviec(playerid)
{
	if(GetPVarInt(playerid, "TELEPORTKS") == 1) //ban khong dang lam viec
	{
		PlayerInfo[playerid][pVW] = 0;
		SetPlayerPos(playerid, 2284.5396,-2211.0012,13.5469);
		DeletePVar(playerid, "TELEPOPTKS");
		SendClientMessage(playerid, -1, "Ban da ket thuc lam viec va tro ve vi tri ban dau");
	}
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_KHAITHAC)
    {
        if(response) 
        {
            if(listitem == 0)
            {
				ShowPlayerDialog(playerid, CHAPNHANCONGVIEC, DIALOG_STYLE_MSGBOX, "Cong viec", "Ban co chac chan rang muon nhan cong viec nay hay khong", "Co", "Khong");
		        return cmd_xinviec(playerid, "");
		}
            if(listitem == 1)
			{
				if(PlayerInfo[playerid][pJob] == 22) 
				{
					SetPVarInt(playerid, "TELEPORTKS", 1);
					PlayerInfo[playerid][pVW] = 5;
					SendClientMessage(playerid, -1, "Ban da den noi lam viec neu ban muon quay ve hay (/ketthuclamviec)");
					SetPlayerPos(playerid, 649.4482,848.3168,-42.9609);
					SetPlayerSkin(playerid, 16);
					PlayerInfo[playerid][pModel] = 16;
				}
				else if(PlayerInfo[playerid][pJob2] == 22)
				{
					SetPVarInt(playerid, "TELEPORTKS", 1);
					PlayerInfo[playerid][pVW] = 5;
					SendClientMessage(playerid, -1, "Ban da den noi lam viec neu ban muon quay ve hay (/ketthuclamviec)");
					SetPlayerPos(playerid, 649.4482,848.3168,-42.9609);
					SetPlayerSkin(playerid, 16);
					PlayerInfo[playerid][pModel] = 16;					
				}
				else 
				{
					SendClientMessage(playerid, COLOR_GREY, "Ban chua nhan cong viec");
				}
			} 
			if(listitem == 2)
			{
				new string[128];
				format(string, 128, "\nSo luong da hien tai cua ban la: %d\nGia:$%d/Da\nNhap so luong ban muon ban:", PlayerInfo[playerid][pDong], GIATIEN);
				ShowPlayerDialog(playerid, DIALOG_BANDA, DIALOG_STYLE_INPUT, "Ban da", string,"Ban","Huy");

			} 
        }
    }

	if(dialogid == DIALOG_BANDA) {
		if(response) {
			if(strval(inputtext) > 0) {
				if(PlayerInfo[playerid][pDong] >= strval(inputtext)) {
					new string[128];
					PlayerInfo[playerid][pDong] -= strval(inputtext);
					GivePlayerCash(playerid, strval(inputtext)*GIATIEN);
					format(string, 128, "[{66ff33}KHAI THAC{ffffff}]:Ban nhan duoc %d so tien tu viec ban da $%d", strval(inputtext), strval(inputtext)*GIATIEN);
					SendClientMessage(playerid, -1, string);
				}
				else
					SendClientMessage(playerid, -1,"[{66ff33}KHAI THAC{ffffff}] So luong khong hop le! hay kiem tra lai so luong cua ban");
			}
			else
				SendClientMessage(playerid, -1,"[{66ff33}KHAI THAC{ffffff}] So luong can ban phai lon hon 0!");
		}

	}
	if(dialogid == DIALOG_TRAODOI) {
	  	if(response) {
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pThep] <= 3)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 3 thep khong the che tao");
				}
				if(PlayerInfo[playerid][pSat] <= 3)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 3 sat khnog the che tao");
				}
				SendClientMessage(playerid, -1, "{0099CC}Ban da che tao thanh cong mot khau sung sdpistool");
				GivePlayerWeapon(playerid, 23, 15); // sdpistool
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pThep] <= 3)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 3 thep khong the che tao");
				}
				if(PlayerInfo[playerid][pSat] <= 3)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 3 sat khnog the che tao");
				}
				SendClientMessage(playerid, -1, "{0099CC}Ban da che tao thanh cong mot khau sung 9mm");
				GivePlayerWeapon(playerid, 22, 15); // 9mm
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pThep] <= 5)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 5 thep khong the che tao");
				}
				if(PlayerInfo[playerid][pSat] <= 3)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 3 sat khnog the che tao");
				}
				SendClientMessage(playerid, -1, "{0099CC}Ban da che tao thanh cong mot khau sung Shotgun");
				GivePlayerWeapon(playerid, 25, 7); // Shotgun
			}
		}
	}
	return 1;
}

forward OnMineralExploit(const playerid, const i);
public OnMineralExploit(const playerid, const i) {
	if(IsPlayerConnected(playerid)) {
		new 
			_mineral[E_MINERAL_INFO], Float:rand_attack = mineral_get_health(i) - (100.01319 + random(300));
		
		pool_get_arr_safe(minerals, i, _mineral);
		if(IsPlayerInRangeOfPoint(playerid, 15.0, arr_Pos[i][0], arr_Pos[i][1], arr_Pos[i][2])) {
			
			//printf("%f | f%f", _mineral[_health], mineral_get_health(i));

			if(rand_attack <= 50.0) {
				// Mineral_Update(i, rand_attack - 1, 0xFFF);
			switch(random(10)) {
				case 0: {
				PlayerInfo[playerid][pSat] ++; 
				SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da nhan duoc 1 Sat (/khoangsan)"); 
				}				
				default: {
				PlayerInfo[playerid][pDong] ++;
				SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da nhan duoc 1 Da (/khoangsan)"); 
				}	
			}
			if(GetPVarInt(playerid, "DANGDAO") == 1)
			{
				ClearAnimations(playerid);
				DeletePVar(playerid, "DANGDAO");
				TogglePlayerControllable(playerid, 1);
				RemovePlayerAttachedObject(playerid, 1);
			}
			TogglePlayerControllable(playerid, 1);
			SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Da khai thac xong.");
			Mineral_Respawn(i, 300); // 300 = 5p
			}
			else {
				Mineral_Update(i, rand_attack, playerid);
				SetTimerEx("OnMineralExploit", 3000, 0, "dd", playerid, i);
				}
			}
			else {

			SendClientMessageEx(playerid, -1, "[{66ff33}KHAI THAC{ffffff}]: Ban da di qua xa khoang san.");
			Mineral_Update(i, mineral_get_health(i), 0xFFF);
		}
	}
	else Mineral_Update(i, mineral_get_health(i), 0xFFF);
}

hook OnPlayerDisconnect(playerid, reason) {
	new i = player_get_mineral_Id(playerid);
	if(i != -1) {
		Mineral_Update(i, mineral_get_health(i), 0xFFF);
	}
}
hook OnPlayerEnterCheckpoint(playerid)
{
	if(CP[playerid] == 3)
	{
        CP[playerid] = 0;
    	ShowPlayerDialog(playerid, DADENNOINHANVIECLAM, DIALOG_STYLE_MSGBOX, "Notice", "Ban da den vi tri (Bam N) De tuong tac", "O", "");
        DisablePlayerCheckpoint(playerid);
    }	
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
 	if(newkeys & KEY_NO)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2284.5396,-2211.0012,13.5469))
		{
		ShowPlayerDialog(playerid, DIALOG_KHAITHAC, DIALOG_STYLE_LIST, "Ban can gi nao?", "Nhan Viec\nnoi lam viec\nBan", "{ae0202}Chon","{FFFFFF}Huy");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1094.9432,-1431.0245,22.7710))
		{
		ShowPlayerDialog(playerid, DIALOG_BANDA, DIALOG_STYLE_LIST, "Xin chao toi co the giup gi cho ban?", "Ban", "{ae0202}Chon","{FFFFFF}Huy");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1831.0551,-1092.1512,23.8379))
		{
		ShowPlayerDialog(playerid, DIALOG_TRAODOI, DIALOG_STYLE_LIST, "Ban muon che tao gi?", "Sdpistool\t (15 Vien dan)\n9mm\t (15 Vien dan)\nShotgun\t (8 Vien dan)", "{ae0202}Chon","{FFFFFF}Huy");
		}
 	}
	return 1;
}
