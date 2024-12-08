
#include <YSI_Coding\y_hooks>

#define SZ: sizeof 
#define FRtime:!%1(%2) forward %1(%2); public %1(%2)
enum oil_info {
	o_health,
	o_respawn, 
	Text3D:o_name,
	// 
	o_occupyid, // Nguoi chiem
}
#define THOIGIANDOI 2
new const Float: Pst_Oil[][] = {
{2757.6926,-3336.6191,-0.5155,276.9236}, // khaithac
{2820.4033,-3329.0039,-1.1385,276.9236}, // khaithac
{2687.2280,-3347.2883,-1.0598,6.9765}, // khaithac
{2820.4033,-3329.0039,-1.1385,276.9236}, // khaithac
{2890.9082,-3316.6716,-1.3733,230.1738}
};
new ThoiGianDoiDau[MAX_PLAYERS];
new OilInfo[SZ: Pst_Oil][oil_info];
task UpdateGiaDau[1200000](){
	new str[300];
	new giadau = Random(500,1000);
	giadauhientai = giadau;
	format(str,sizeof(str),"{cea809}[PETROLEUM JOB]{FFFFFF}: Gia dau hien tai da tang gia la %d hay nhanh chong ban chung",giadauhientai);
	SendClientMessageToAll(-1, str);
}
new daumo[1];
new PlayerText:dautext[MAX_PLAYERS][1];

CMD:xemdau(playerid,params[])
{
	new string[128];
	format(string, 128, "So Luong Dau Sach.: %d", PlayerInfo[playerid][pDauSach]);
	SendClientMessage(playerid, -1, string);
	format(string, 128, "So Luong Dau [chua che bien]: %d", PlayerInfo[playerid][pDau]);
	SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:bandau(playerid){
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 1928.8125,-1776.2394,13.5469))
	{
		new s[128];
		format(s,sizeof(s),"{cea809}Tram xang (1){FFFFFF}\nGia dau hien tai: %d\nSo dau hien co cua ban la: {cea809}%d\nNhap so luong ban can ban",giadauhientai,PlayerInfo[playerid][pDauSach]);
		return ShowPlayerDialog(playerid, DIALOG_BANDAU, DIALOG_STYLE_INPUT,"Nhap so luong can ban",s,"Xac nhan","Huy");
	}
	else return SendClientMessage(playerid, COLOR_GREY, "Ban khongo cay xang");
	//return Businesses[2][bInventoryCapacity] = 100;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new str[3000];
	if(dialogid == DIALOG_BANDAU){
		if(response){
			if(strval(inputtext) >= 1){
			    if(Businesses[2][GasPumpGallons][0] > 1000 && Businesses[2][GasPumpGallons][1] > 1000) return SendClientMessageEx(playerid, -1,"Cay xang da du dau, khong can nhap them");
				if(PlayerInfo[playerid][pDauSach] < strval(inputtext)) return SendClientMessage(playerid, COLOR_GREY,"Ban khong co nhieu dau den the");
				new Float: dausang=strval(inputtext);
				switch(random(2))
				{
				    case 0:{
						Businesses[2][GasPumpGallons][0] += dausang;
						format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][0], Businesses[2][GasPumpSaleGallons][0], Businesses[2][GasPumpGallons][0], Businesses[2][GasPumpCapacity][0]);
						UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][0], COLOR_YELLOW, str);
					}
				    case 1:{
						Businesses[2][GasPumpGallons][1] += dausang;
						format(str,sizeof(str),"Gia xang: $%.2f\nGia ban: $%.2f\nXang A93: %.3f\nXang co san: %.2f/%.2f A93", Businesses[2][bGasPrice], Businesses[2][GasPumpSalePrice][1], Businesses[2][GasPumpSaleGallons][1], Businesses[2][GasPumpGallons][1], Businesses[2][GasPumpCapacity][1]);
						UpdateDynamic3DTextLabelText(Businesses[2][GasPumpSaleTextID][1], COLOR_YELLOW, str);
					}
				}
				PlayerInfo[playerid][pCash] += strval(inputtext)*giadauhientai;
				PlayerInfo[playerid][pDauSach] -= strval(inputtext);
				SaveBusiness(2);
				format(str,sizeof(str),"Ban da ban: %.2f lit dau va nhan duoc so tien $%d",dausang,strval(inputtext)*giadauhientai);
				SendClientMessageEx(playerid,-1,str);
			}
			else SendClientMessage(playerid, COLOR_GREY, "Chi co the ban tren 1 lit");		}
		else
		{

		}
	}
	return 1;
}
hook OnGameModeInit() { 
	giadauhientai = 30;
	//printf("Te: %d", SZ(Pst_Oil));
	for(new i = 0 ; i < SZ: Pst_Oil; i ++) {
		// Create
		OilInfo[i][o_name] = CreateDynamic3DTextLabel("...", -1, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2]+2, 12);
		CreateDynamicObject(3474, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2]-3.5,0,0,0);
		//
		OilInfo[i][o_health] = 100;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
		UpdateOilInfo(i);
	}
	daumo[0] = CreateDynamicCP(2524.7512,-2630.5659,13.6378, 1, .streamdistance = 2);
	return 1;
}
stock ShowDauText(playerid)
{
	dautext[playerid][0] = CreatePlayerTextDraw(playerid, 323.000000, 340.500640, "So dau da lay duoc: 100");
	PlayerTextDrawLetterSize(playerid, dautext[playerid][0], 0.400000, 1.600000);
	PlayerTextDrawTextSize(playerid, dautext[playerid][0], 0.000000, 173.000000);
	PlayerTextDrawAlignment(playerid, dautext[playerid][0], 2);
	PlayerTextDrawColor(playerid, dautext[playerid][0], -65281);
	PlayerTextDrawUseBox(playerid, dautext[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, dautext[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, dautext[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, dautext[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, dautext[playerid][0], 255);
	PlayerTextDrawFont(playerid, dautext[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, dautext[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, dautext[playerid][0], 0);
	for(new i = 0; i < sizeof([dautext]); i ++)
	{
		PlayerTextDrawShow(playerid, dautext[playerid][i]);
	}
	return 1;
}
public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == daumo[0])
	{
		if(GetPVarInt(playerid,"DangDoiDau") == 0)
		{
			if(PlayerInfo[playerid][pDau] < 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co dau");
			if(PlayerInfo[playerid][pDauSach] == 20)
			{
				PlayerTextDrawHide(playerid, dautext[playerid][0]);
				SendClientMessage(playerid, COLOR_TWYELLOW,"Ban chi co the mang toi da {FFFFFF}20ml dau");
				return 1;
			}
			ThoiGianDoiDau[playerid] = SetTimerEx("OnPlayerDoiDau", THOIGIANDOI*1000,1,"i",playerid);
			TogglePlayerControllable(playerid, 0);
			SetPVarInt(playerid, "DangDoiDau",1);
		}
	}
	return 1;
}
forward OnPlayerDoiDau(playerid);
public OnPlayerDoiDau(playerid){
	if(GetPVarInt(playerid, "DangDoiDau") == 1){
		if(PlayerInfo[playerid][pDau] >= 1){
			if(PlayerInfo[playerid][pDauSach] == 20 && PlayerInfo[playerid][pDonateRank] < 1)
			{
				SetPVarInt(playerid, "DangDoiDau",-1);
				TogglePlayerControllable(playerid, 1);
				PlayerTextDrawHide(playerid, dautext[playerid][0]);
				SendClientMessage(playerid, COLOR_TWYELLOW,"Ban chi co the mang toi da {FFFFFF}20ml dau");
				return 1;
			}
			else if(PlayerInfo[playerid][pDauSach] >= 50 && PlayerInfo[playerid][pDonateRank] > 1)
			{
				SetPVarInt(playerid, "DangDoiDau",-1);
				TogglePlayerControllable(playerid, 1);
				PlayerTextDrawHide(playerid, dautext[playerid][0]);
				SendClientMessage(playerid, COLOR_TWYELLOW,"[VIP]: Ban chi co the mang toi da {FFFFFF}50ml dau");
				return 1;
			}
			new str[128];
			format(str, sizeof(str),"So dau sach hien tai cua ban la: ~y~%dml",PlayerInfo[playerid][pDauSach]);
			PlayerTextDrawSetString(playerid, dautext[playerid][0], str);
			PlayerTextDrawShow(playerid, dautext[playerid][0]);
			PlayerInfo[playerid][pDau] --;
			PlayerInfo[playerid][pDauSach] ++;
		}
		else{
			SetPVarInt(playerid, "DangDoiDau",-1);
			TogglePlayerControllable(playerid, 1);
			SendClientMessage(playerid, COLOR_GREY, "Ban Da Che Bien Dau Thanh Cong [/xemdau] de kiem tra");
		}
	}
	return 1;
}
hook OnPlayerConnect(playerid) {
	SetPVarInt(playerid, "OccupyID", -1);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {
	if(GetPVarInt(playerid, "OccupyID") != -1) {
		new i = GetPVarInt(playerid, "OccupyID");
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1);
		OilInfo[i][o_respawn] = gettime() + 10;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;		
		UpdateOilInfo(i);
	}
	DeletePVar(playerid, "DangDoiDau");
	return 1;
}

hook OnPlayerDeath(playerid) {
	if(GetPVarInt(playerid, "OccupyID") != -1) {
		new i = GetPVarInt(playerid, "OccupyID");
		OilInfo[i][o_respawn] = gettime() + 10;
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;		
		PlayerTextDrawHide(playerid, dautext[playerid][0]);
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1);
		UpdateOilInfo(i);
	}	
	return 1;
}


UpdateOilInfo(i) {
	new string[128];
	format(string, 128, "{1AC3E7}Khu vuc khai thac dau\n{FFFFFF}Trang thai: %d%%\nSo huu: {e52b0a}%s", OilInfo[i][o_health], GetoNameEx(OilInfo[i][o_occupyid]));
	UpdateDynamic3DTextLabelText(OilInfo[i][o_name], -1, string);
}

SetOilRespawn(i, s) {
	OilInfo[i][o_health] = 100;
	OilInfo[i][o_respawn] = gettime() + s;
	OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
}

stock GetoNameEx(i) {
	new name[32];
	if(i == INVALID_PLAYER_ID) name = "Khong so huu";
	else GetPlayerName(i, name, 64);
	return name;
}

stock CheckRangeOil(playerid) {
	for(new i = 0; i < SZ: Pst_Oil; i ++) {
		if(IsPlayerInRangeOfPoint(playerid, 6, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2])) {
			return i;
		}
	}
	return -1;
}

FRtime:!StartOccupy(playerid, i) {
	new ran = 1+random(15);
	if(IsPlayerInRangeOfPoint(playerid, 10, Pst_Oil[i][0],Pst_Oil[i][1],Pst_Oil[i][2])) {
		if(OilInfo[i][o_health] - ran > 0) {
			OilInfo[i][o_health] -= ran; 
		}
		else { // <
			SetOilRespawn(i, 30); // 90 giay khai thac 
			KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
			printf("PVariable :%d", GetPVarInt(playerid, "PlayerOccupy"));

			new str[128], rand = 1 + random(3); // 1 dầu
			GiveDau(playerid, rand);
			format(str, 128, "Ban nhan duoc %d dau", rand);
			SendClientMessage(playerid, -1, str);
			SetPVarInt(playerid, "OccupyID", -1); 
		}
	}
	else {
		OilInfo[i][o_respawn] = gettime() + 60; // 60 giay moi co the khai thac tiep
		OilInfo[i][o_occupyid] = INVALID_PLAYER_ID;
		KillTimer(GetPVarInt(playerid, "PlayerOccupy"));
		SetPVarInt(playerid, "OccupyID", -1); 
		SendClientMessage(playerid, -1, "Ban da di qua xa khu vuc khai thac");
	}
	UpdateOilInfo(i);
	return 1;
}

CMD:khaithac(playerid) {
	if(GetPVarInt(playerid, "OccupyID") != -1) return 1;
	new i = CheckRangeOil(playerid);
	if(PlayerInfo[playerid][pDau] >= 20) return SendClientMessage(playerid, -1, "Ban da khai thac du so luong vui long di ban");
	if(i == -1) {
		SendClientMessage(playerid, -1, "Ban khong the khai thac o day.");
	}
	else {
		new str[128];
		if(OilInfo[i][o_occupyid] != INVALID_PLAYER_ID) {
			format(str, 128, "Dang duoc khai thac boi %s", GetoNameEx(OilInfo[i][o_occupyid]));
			SendClientMessage(playerid, -1, str);
		}
		else {
			if(OilInfo[i][o_respawn] > gettime()) {
				format(str, 128, "Con %ds nua de co the khai thac o day ...", OilInfo[i][o_respawn] - gettime());
				SendClientMessage(playerid, -1, str);
			}
			else {
				OilInfo[i][o_occupyid] = playerid;
				SetPVarInt(playerid, "OccupyID", i);
				SendClientMessage(playerid, -1, "Ban dang chiem khu nay. Vui long khong roi khoi day 10.0m");
				SetPVarInt(playerid, "PlayerOccupy", SetTimerEx("StartOccupy", 5000, true, "dd", playerid, i));
				//printf("PVariable :%d", GetPVarInt(playerid, "PlayerOccupy"));
				UpdateOilInfo(i);
			}
		}
	}
	return 1;
}  
forward GiveDau(playerid,value);
public GiveDau(playerid,value){
	new query[128];
	PlayerInfo[playerid][pDau] += value;
	format(query, sizeof(query), "UPDATE accounts SET `Dau` =%d WHERE `id` = %d", PlayerInfo[playerid][pDau], GetPlayerSQLId(playerid));
	mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
	return 1;
}
