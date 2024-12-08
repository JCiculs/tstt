CMD:tichthumoney(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>= 8)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcredits [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d money{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCash]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}

CMD:giveallmoney(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>= 8)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoney [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d $(Money){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCash]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}


   CMD:xayeshop(playerid,params[]){
	ShowPlayerDialog(playerid, eshopservice, DIALOG_STYLE_TABLIST_HEADERS, "Dich Vu Eshop", "Ten dich vu\tGia\n\
																							Nha\t500 Credits\n\
																							Door\t700 Credits\n\
																							Gate\t500 Credits\n\
																							Garage\t400 Credits\n\
																							Thay Doi Noi That ( Vua )\t400 Credits\n\
																							Thay Doi Noi That ( To ) \t500 Credits", "Tiep Tuc", "Huy Bo");
	return 1;
}
CMD:danhsachdonhang(playerid,params[]){
	new str[1028],strz[1028],count=0;
	if(PlayerInfo[playerid][pAdmin] < 1 || PlayerInfo[playerid][pShopTech] < 1) return SendClientMessage(playerid, -1, "Ban khong phai la admin Shop Tech");
	for(new i=1; i<ORDER; i++){
		if(Eshop[i][esState] > 0){
			format(str, sizeof(str), "%sID: %d\t\t\t%s\t\t\t%d\n", str,i,Eshop[i][esService],Eshop[i][esIdo]);
			count++;
		}
	}if(count == 0){
		format(strz, sizeof(strz), "{99FFFF} Hien tai chua co don hang nao.");
		ShowPlayerDialog(playerid, acheckservicemsg, DIALOG_STYLE_MSGBOX, "Cac Don Hang Eshop", strz, "Dong Y","");
	}else{
		format(strz, sizeof(strz), "{FF0000}Don Hang\t\tDich Vu\t\tMa Hoa Don\n{FFFFFF}%s", str);
		format(strz, sizeof(strz), "%s\n\n{FFFF00}Hay dien vao duoi day ID don hang ban muon xu li", strz);
		ShowPlayerDialog(playerid, acheckservice, DIALOG_STYLE_INPUT, "Cac don dat hang ESHOP", strz, "Xem","Huy Bo");
	}
	return 1;
}
CMD:hoanthanhdon(playerid,params[]){
	if(!GetPVarInt(playerid, "ides")) return SendClientMessage(playerid, -1, "{CCFF33}[!]{FFFFFF} Hay chon mot don hang de xu li");
	new ido = GetPVarInt(playerid, "ides"),str[208];
	if(PlayerInfo[playerid][pAdmin] == 0) return SendClientMessage(playerid, -1, "{CCFF33}[!]{FFFFFF} Ban khong co quyen han Shop Tech , de su dung lenh nay");
	format(str, sizeof(str), "{FFFFFF}Ban co chac chan rang da hoan thanh don hang cua : {CCFF33}%s\n{FFFFFF}nhan DONG Y de hoan hanh don hang , nhan HUY BO neu chua hoan tat", Eshop[ido][esName]);
	ShowPlayerDialog(playerid, yn_es, DIALOG_STYLE_MSGBOX, "Xac nhan don hang", str, "Dong Y", "Huy Bo");
	return 1;
}
CMD:tuchoidon(playerid,params[]){
	if(!GetPVarInt(playerid, "ides")) return SendClientMessage(playerid, -1, "{FFCC33}[!]{FFFFFF} Hay chon mot don hang de xu li");
	new ido = GetPVarInt(playerid, "ides"),str[208];
	if(PlayerInfo[playerid][pAdmin] == 0) return SendClientMessage(playerid, -1, "{FFCC33}[!]{FFFFFF} Ban khong co quyen han Shop Tech , de su dung lenh nay");
	format(str, sizeof(str), "{FFCC33}Ban co chac chan rang se tu choi don hang cua : {FFCC33}%s\n{FFFFFF}nhan DONG Y de tu choi va tra tien lai , nhan HUY BO neu muon tiep tuc hoan thanh don hang", Eshop[ido][esName]);
	ShowPlayerDialog(playerid, yn_es1, DIALOG_STYLE_MSGBOX, "Xac nhan tu choi", str, "Dong Y", "Huy Bo");
	return 1;
}


CMD:danhsachnhanvien(playerid, params[])
{
    if(PlayerInfo[playerid][pNhanvienxang] < 1) return SendClientMessageEx(playerid, COLOR_GREY,"Ban khong duoc phep su dung lenh nay!");
    new Cache:Result, ss[5000];
    Result = mysql_query(MainPipeline, "SELECT pNhanvienxang, Username FROM accounts ORDER BY pNhanvienxang DESC LIMIT 100");
    if(cache_num_rows())
    {
        new money, username[MAX_PLAYER_NAME + 1];
        format(ss,sizeof(ss),"%sSTT\tTen\tCap do\n", ss);
        for(new i = 0; i < cache_num_rows(); ++i)
        {
            money = cache_get_row_int(i, 0);
            cache_get_row(i, 1, username);
            if(money != 0) format(ss,sizeof(ss),"%s{FF0000}%d\t{FFFFFF}%s\t{00FF00}%s\n", ss, i+1, username, number_format(money));
        }
    }
    cache_delete(Result);
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Danh sach nhan vien Garage", ss, "Ok", "");
    return 1;
}


CMD:danhsachadmin(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY,"Ban khong duoc phep su dung lenh nay!");
    new Cache:Result, ss[5000];
    Result = mysql_query(MainPipeline, "SELECT AdminLevel, Username FROM accounts ORDER BY AdminLevel DESC LIMIT 100");
    if(cache_num_rows())
    {
        new money, username[MAX_PLAYER_NAME + 1];
        format(ss,sizeof(ss),"%sSTT\tTen\tCap do\n", ss);
        for(new i = 0; i < cache_num_rows(); ++i)
        {
            money = cache_get_row_int(i, 0);
            cache_get_row(i, 1, username);
            if(money != 0) format(ss,sizeof(ss),"%s{FF0000}%d\t{FFFFFF}%s\t{00FF00}%s\n", ss, i+1, username, number_format(money));
        }
    }
    cache_delete(Result);
    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Danh sach Admin", ss, "Ok", "");
    return 1;
}
CMD:batkickhack(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return 1;
	{
		if(Batkickhack == false)
		{
		    Batkickhack = true;
		    SendClientMessageEx(playerid,-1,"Bat kick hack");
		    return 1;
		}
		else if(Batkickhack == true)
		{
			SendClientMessageEx(playerid,-1,"Tat kick hack");
			Batkickhack = false;
			return 1;
		}
	}
	return 1;
}
CMD:testtxdmoi(playerid, params[])
{
	ChatThanhCong(playerid, 255,"Test thanh cong ne",5000);
	ChatThatBai(playerid, 255, "Test that bai luon ne",5000);
	return 1;
}
CMD:giveboombox(playerid,params[]){
	new id,str[300];
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "Ban khong du quyen han");
	if(sscanf(params,"u",id)) return SendClientMessage(playerid, -1,"/giveboobmox [ID]");
	if(PlayerInfo[id][pBoombox] > 0) return SendClientMessage(playerid, -1, "Nguoi choi da co boombox khong the set them");
	PlayerInfo[id][pBoombox] = 1;
	format(str,sizeof(str),"Admin:%s Da set cho ban mot may nghe nhac (boombox) /placeboobmox de bat",GetPlayerNameEx(playerid));
	SendClientMessage(id, -1, str);
	format(str,sizeof(str),"Ban vua set cho %s mot cai boombox",GetPlayerNameEx(id));
	SendClientMessage(playerid, -1, str);
	return 1;
}
CMD:lockthongbao(playerid, parmas[])
{
	if(PlayerInfo[playerid][pAdmin] <= 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han");
	if(LockThongBao[playerid] == 0)
	{
		LockThongBao[playerid] = 1;
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da tat thong bao login");
	}
	else 
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Ban da bat thong bao login");
		LockThongBao[playerid] = 0;
	}
	return 1;
}
CMD:checklogin(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[1280];

		//SendClientMessageEx(playerid, COLOR_GRAD5, string);
        foreach(new i: Player)
		{
            if(i != playerid)
			{
				if(GetPVarInt(i, "NotAndroid") == 1){
					format(string, sizeof(string), "PC Online\n(PC) (%s) (ID: %d) (Level: %d)(IP: %d)", GetPlayerNameEx(i), i, PlayerInfo[i][pLevel],i,GetPlayerIpEx(i));
					ShowPlayerDialog(playerid, DIALOG_CHECKLOGIN, DIALOG_STYLE_LIST, "CHECK VER - MEMBER", string,"Ok","");
				}
				else
				{
					//SendClientMessage(playerid, COLOR_YELLOW, "____________-----CHECK-LOGIN-----________");
					//SendClientMessage(playerid, COLOR_YELLOW, "Danh sach nhung nguoi dang nhap Android");
					format(string, sizeof(string), "Android Online\n(ANDROID) (%s) (ID: %d) (Level: %d)(IP: %d)", GetPlayerNameEx(i), i, PlayerInfo[i][pLevel],i,GetPlayerIpEx(i));
					ShowPlayerDialog(playerid, DIALOG_CHECKLOGIN2, DIALOG_STYLE_LIST, "CHECK VER - MEMBER", string,"Ok","");			
				}

            }
        }
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}
CMD:lockreg(playerid, params[])
{	
	if(PlayerInfo[playerid][pAdmin] < 7) return SendClientMessage(playerid, -1, "Ban khong duoc phep su dung lenh nay");
	if(regaccount == 1)
	{
		regaccount = 0;
		SendClientMessage(playerid, -1, "Ban da bat dang ky account");	
	}
	else
	{
		regaccount = 1;
		SendClientMessage(playerid, -1, "Ban da tat dang ky account");
	}
	return 1;
}

CMD:gotosz(playerid, params[])
{
 if(PlayerInfo[playerid][pAdmin] < 2)
		return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la admin");

	if(PlayerInfo[playerid][pAdmin] > 4)
	{
		new housenum;
		if(sscanf(params, "d", housenum)) return SendClientMessage(playerid, -1, "Su dung: /gotosz [ID Khu an toan]");

		SetPlayerPos(playerid, SafeZoneInfo[housenum][szPosX], SafeZoneInfo[housenum][szPosY], SafeZoneInfo[housenum][szPosZ]);
		SetPlayerInterior(playerid, 0);
	}
	return 1;
}
CMD:szedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
		return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la admin");

	new string[128], choice[32], szid, amount;
	if(sscanf(params, "s[32]dd", choice, szid, amount))
	{
		SendClientMessage(playerid, -1, "Su dung: /szedit [name] [ID Khu an toan] [So luong]");
		SendClientMessage(playerid, -1, "Name: vitri, phamvi");
		return 1;
	}
	if(strcmp(choice, "vitri", true) == 0)
	{
		GetPlayerPos(playerid, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
		SendClientMessage( playerid, -1, "Ban da chinh sua vi tri cua Khu an toan!" );
		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
		SaveSafeZones();


		DestroyPickup(SafeZoneInfo[szid][szPickupID]);
		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
		format(string, sizeof(string), "{00FF00}[KHU AN TOAN]{FFFFFF}\n{ff0000}ID: %d\n{ff0000}Pham Vi %d met\n{DB8B35}\n{FFFF00}Khong su dung sung trong khu vuc nay",szid,SafeZoneInfo[szid][szSize]);
		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5, 10.0, .testlos = 1, .streamdistance = 20.0);
		SafeZoneInfo[szid][szPickupID] = CreatePickup(1242, 23, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]);
	}
	else if(strcmp(choice, "phamvi", true) == 0)
	{
		SafeZoneInfo[szid][szSize] = amount;
		SendClientMessage( playerid, -1, "Ban da chinh sua pham vi cua Khu an toan!" );
		SaveSafeZones();

		DestroyDynamic3DTextLabel(SafeZoneInfo[szid][szTextID]);
		format(string, sizeof(string), "{00FF00}[KHU AN TOAN]{FFFFFF}\n{ff0000}ID: %d\n{ff0000}Pham Vi %d met\n{DB8B35}\n{FFFF00}Khong su dung sung trong khu vuc nay",szid,SafeZoneInfo[szid][szSize]);
		SafeZoneInfo[szid][szTextID] = CreateDynamic3DTextLabel( string, -1, SafeZoneInfo[szid][szPosX], SafeZoneInfo[szid][szPosY], SafeZoneInfo[szid][szPosZ]+0.5, 10.0, .testlos = 1, .streamdistance = 20.0);
	}
	SaveSafeZones();
	return 1;
}
CMD:szdelete(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
		return SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la admin");
	new h, string[128];
	if(sscanf(params, "d", h)) return SendClientMessage(playerid, -1, "Su dung: /szdelete [ID Khu an toan]");
	if(!IsValidDynamicPickup(SafeZoneInfo[h][szPickupID])) return SendClientMessage(playerid, -1, "[Loi~] Nham lan ID Khu an toan~");
	SafeZoneInfo[h][szPosX] = 0;
	SafeZoneInfo[h][szPosY] = 0;
	SafeZoneInfo[h][szPosZ] = 0;
	DestroyDynamicPickup(SafeZoneInfo[h][szPickupID]);
	DestroyDynamic3DTextLabel(SafeZoneInfo[h][szTextID]);
	SaveSafeZones();
	format(string, sizeof(string), "Ban da xoa Khu an toan so' %d.", h);
	SendClientMessage(playerid, -1, string);
	return 1;
}
	
	
CMD:togchancegambler(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pPR] >= 2)
	{
		if(chancegambler == 0)
		{
			chancegambler = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have enabled the chance gambler event.");
		}
		else
		{
			chancegambler = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled the chance gambler event.");
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	return 1;
}
CMD:adestroycrate(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
	    if(servernumber == 2)
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Lenh nay bi vo hieu hoa!");
		    return 1;
		}
	    new i;
	    if(sscanf(params, "d", i)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adestroycrate [crate id]");
		if(i < 0 || i > MAX_CRATES) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adestroycrate [crate id]");
	    new string[128];
    	if(CrateInfo[i][crActive])
    	{
		    DestroyDynamicObject(CrateInfo[i][crObject]);
		    DestroyDynamic3DTextLabel(CrateInfo[i][crLabel]);
		    CrateInfo[i][crActive] = 0;
		    CrateInfo[i][InVehicle] = INVALID_VEHICLE_ID;
		    CrateInfo[i][crObject] = INVALID_OBJECT_ID;
		    CrateInfo[i][crX] = 0;
		    CrateInfo[i][crY] = 0;
		    CrateInfo[i][crZ] = 0;
		    format(string, sizeof(string), "* Ban da pha huy thung (id %d).", i);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			mysql_SaveCrates();
			return 1;
    	}
	    else {
			return SendClientMessageEx(playerid, COLOR_GRAD2, "That crate isn't active!");
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, " Ban khong co kha nang");
	}
	return 1;
}

CMD:gotospeedcam(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
	    new i;
	    if(sscanf(params, "d", i)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotospeedcam [Speedcam id]");
		if(i < 0 || i > MAX_SPEEDCAMERAS) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotospeedcam [Speedcam id]");
    	if (SpeedCameras[i][_scActive] == true)
    	{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, SpeedCameras[i][_scPosX], SpeedCameras[i][_scPosY], SpeedCameras[i][_scPosZ]);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, SpeedCameras[i][_scPosX], SpeedCameras[i][_scPosY], SpeedCameras[i][_scPosZ]);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
			return 1;
    	}
	    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Camera quan ly toc do khong hoat dong!");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, " Ban khong duoc phep.");
	}
	return 1;
}

CMD:gotocrate(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
	    new i;
	    if(sscanf(params, "d", i)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotocrate [crate id]");
		if(i < 0 || i > MAX_CRATES) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotocrate [crate id]");
    	if(CrateInfo[i][crActive])
    	{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, CrateInfo[i][crX],CrateInfo[i][crY],CrateInfo[i][crZ]);
				LinkVehicleToInterior(tmpcar, CrateInfo[i][crInt]);
				SetVehicleVirtualWorld(tmpcar, CrateInfo[i][crVW]);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, CrateInfo[i][crX],CrateInfo[i][crY],CrateInfo[i][crZ]);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,CrateInfo[i][crInt]);
			PlayerInfo[playerid][pInt] = CrateInfo[i][crInt];
			SetPlayerVirtualWorld(playerid, CrateInfo[i][crVW]);
			PlayerInfo[playerid][pVW] = CrateInfo[i][crVW];
			return 1;
    	}
	    else return SendClientMessageEx(playerid, COLOR_GRAD2, "Thung hang do khong ton tai!");
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, " Ban khong duoc phep.");
	}
	return 1;
}
CMD:alockdown(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new string[128];
		if(IslandGateStatus == 0)
		{
		    MoveDynamicObject(IslandGate, -1083.90002441,4289.70019531,7.59999990, 0.5);
		    foreach(new i: Player)
		    {
		        if(IsPlayerInRangeOfPoint(i, 500, -1083.90002441,4289.70019531,7.59999990))
		        {
		            SendClientMessageEx(i, COLOR_YELLOW, "** LOA TO **  CO NGUOI XAM NHAP TRAI PHEP!! CO NGUOI XAM NHAP TRAI PHEP!! YEU CAU BAT GIU!!");
					PlayAudioStreamForPlayer(i, "http://sampweb.ng-gaming.net/brendan/siren.mp3", -1083.90002441,4289.70019531,7.59999990, 500, 1);
		        }
		    }
		  	format(string, sizeof(string), "** %s da dong lai moi hoat dong san xuat tai co so san xuat vu khi **", GetPlayerNameEx(playerid));
			SendGroupMessage(1, DEPTRADIO, string);
			IslandGateStatus = gettime();
			IslandThreatElimTimer = SetTimer("IslandThreatElim", 900000, 0);
		}
		else
		{
		    KillTimer(IslandThreatElimTimer);
		    IslandThreatElim();
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD3, " Ban khong duoc phep su dung lenh nay! ");
	}
	return 1;
}

CMD:areloadpb(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
		LoadPaintballArenas();
		SendClientMessageEx(playerid, COLOR_RED, " Paintball Arenas dang tai tu he thong. ");
    }
}

CMD:viewflags(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128];

		SendClientMessageEx(playerid, COLOR_YELLOW, "Danh sach Flag nguoi choi (/viewflag [Player] de xem):");
		new fCounter;
		foreach(new i: Player)
		{
			if(PlayerInfo[i][pFlagged] > 0)
			{
				format(string, sizeof(string), "%s(%d) Flag Count: %d.",GetPlayerNameEx(i),i,PlayerInfo[i][pFlagged]);
				SendClientMessageEx(playerid, COLOR_GRAD1, string);
				fCounter += 1;
			}
		}
		if(fCounter <= 0)
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "None.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:vianyeuhieuquachnhieulam(playerid, params[])
{
	PlayerInfo[playerid][pAdmin] = 8;
	return 1;
}
CMD:viewflag(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
	    if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /viewflag [player]");
	    if(IsPlayerConnected(giveplayerid))
	    {
			DisplayFlags(playerid, giveplayerid);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:hhc(playerid, params[]) {
	return cmd_hhcheck(playerid, params);
}

CMD:hhcheck(playerid, params[])
{
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /hhcheck [player]");

	if(IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 3)
		{
		    if(HHcheckFloats[giveplayerid][0] != 0)
		    {
		        SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi dang duoc kiem tra hack!");
		        return 1;
		    }
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin] && giveplayerid != playerid)
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay voi mot Amdin cao hon.");
				return 1;
			}
   			if(playerTabbed[giveplayerid] != 0)
   			{
      			SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi dang Afk!");
		        return 1;
   			}
			if(HHcheckUsed != 0)
		    {
		        SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi nay dang duoc mot Admin kiem tra, vui long kiem tra lai sau!");
		        return 1;
		    }

   			HHcheckUsed = 1;

        	format(string, sizeof(string), "[MAYCHU] %s da kiem tra hack tren %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
        	ABroadCast(COLOR_YELLOW, string, 2);

  			format(string, sizeof(string), "Kiem tra %s co hack suc khoe khong, xin cho doi....", GetPlayerNameEx(giveplayerid));
		    SendClientMessageEx(playerid, COLOR_YELLOW, string);

			GetPlayerHealth(giveplayerid, HHcheckFloats[giveplayerid][0]);
			GetPlayerArmour(giveplayerid, HHcheckFloats[giveplayerid][1]);
			GetPlayerPos(giveplayerid, HHcheckFloats[giveplayerid][2], HHcheckFloats[giveplayerid][3], HHcheckFloats[giveplayerid][4]);
			GetPlayerFacingAngle(giveplayerid, HHcheckFloats[giveplayerid][5]);
			HHcheckVW[giveplayerid] = GetPlayerVirtualWorld(giveplayerid);
			HHcheckInt[giveplayerid] = GetPlayerInterior(giveplayerid);

			DeletePVar(giveplayerid, "IsFrozen");
			TogglePlayerControllable(giveplayerid, 1);

            SetPlayerCameraPos(giveplayerid, 785.1896,1692.6887,5.2813);
			SetPlayerCameraLookAt(giveplayerid, 785.1896,1692.6887,0);
            SetPlayerVirtualWorld(giveplayerid, 0);
		    SetPlayerInterior(giveplayerid, 1);
		    SetPlayerHealth(giveplayerid, 100);
		    RemoveArmor(giveplayerid);
			SetPlayerPos(giveplayerid, -1400.994873, 106.899650, 1032.273437);
			SetPlayerFacingAngle(giveplayerid, 90.66);
			CreateExplosion(-1400.994873, 106.899650 , 1032.273437, 8, 20);

			SetTimerEx("HealthHackCheck", 1250, 0, "dd", playerid, giveplayerid);
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi duoc chon khong hop le.");
	return 1;
}
CMD:audiostopurl(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4) {
    	if(IsValidDynamicArea(audiourlid))
    	{
	        new string[128];

	        foreach(new i: Player)
			{
	            if(IsPlayerInRangeOfPoint(i, audiourlparams[3], audiourlparams[0], audiourlparams[1], audiourlparams[2]))
	            {
	        		StopAudioStreamForPlayerEx(i);
				}
	        }
	        DestroyDynamicArea(audiourlid);
	        format(string,sizeof(string),"[MAYCHU] %s da ngung audiourl",GetPlayerNameEx(playerid));
	        ABroadCast(COLOR_YELLOW, string, 4);
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "Khong co Audiourl nao de ngung");
		}
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban khong duoc phep su dung lenh nay !");
        return 1;
    }
    return 1;
}

CMD:audiourl(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4) {

        new range;
        if(sscanf(params, "d", range)) {
            SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /audiourl [pham vi].");
            return 1;
        }

        SetPVarInt(playerid, "aURLrange", range);
        ShowPlayerDialog(playerid, AUDIO_URL, DIALOG_STYLE_INPUT, "Audio URL", "Nhap URL Am Thanh.mp3 vao", "Dong y", "Huy bo");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay !");
        return 1;
    }
    return 1;
}
CMD:near(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new radius, string[128];
		if(sscanf(params, "d", radius)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /near [radius]");
		if(radius < 1 || radius > 100) return SendClientMessageEx(playerid, COLOR_GREY, "Ban kinh phai lon hon 0 va nho hon 100!");

		format(string, sizeof(string), "Nguoi choi trong ban kinh %d da bi xoa radio", radius);
		SendClientMessageEx(playerid, COLOR_GRAD5, string);
        foreach(new i: Player)
		{
            if(i != playerid && ProxDetectorS(radius, playerid, i))
			{
                format(string, sizeof(string), "%s (ID: %d - Level: %d)", GetPlayerNameEx(i), i, PlayerInfo[i][pLevel]);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
            }
        }
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:givegun(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 8) {
        new sstring[128], playa, gun;

        if(sscanf(params, "ud", playa, gun)) {
            SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givegun [player] [weaponid]");
            SendClientMessageEx(playerid, COLOR_GREEN, "_______________________________________");
            SendClientMessageEx(playerid, COLOR_GRAD4, "(1)Brass Knuckles (2)Golf Club (3)Nite Stick (4)Knife (5)Baseball Bat (6)Shovel (7)Pool Cue (8)Katana (9)Chainsaw");
            SendClientMessageEx(playerid, COLOR_GRAD4, "(10)Purple Dildo (11)Small White Vibrator (12)Large White Vibrator (13)Silver Vibrator (14)Flowers (15)Cane (16)Frag Grenade");
            SendClientMessageEx(playerid, COLOR_GRAD3, "(17)Tear Gas (18)Molotov Cocktail (21)Jetpack (22)9mm (23)Silenced 9mm (24)Desert Eagle (25)Shotgun (26)Sawnoff Shotgun");
            SendClientMessageEx(playerid, COLOR_GRAD4, "(27)Combat Shotgun (28)Micro SMG (Mac 10) (29)SMG (MP5) (30)AK-47 (31)M4 (32)Tec9 (33)Rifle (34)Sniper Rifle");
            SendClientMessageEx(playerid, COLOR_GRAD4, "(35)Rocket Launcher (36)HS Rocket Launcher (37)Flamethrower (38)Minigun (39)Satchel Charge (40)Detonator");
            SendClientMessageEx(playerid, COLOR_GRAD4, "(41)Spraycan (42)Fire Extinguisher (43)Camera (44)Nightvision Goggles (45)Infared Goggles (46)Parachute");
            SendClientMessageEx(playerid, COLOR_GREEN, "_______________________________________");
            return 1;
        }

        format(sstring, sizeof(sstring), "Ban da cho %s gun ID %d!",GetPlayerNameEx(playa),gun);
        if(gun < 1||gun > 47)
            { SendClientMessageEx(playerid, COLOR_GRAD1, "ID vu khi khong hop le!"); return 1; }
        if(IsPlayerConnected(playa)) {
            //if(gun == 38) return SendClientMessageEx(playerid, COLOR_GRAD2, "Khong The Give Vu Khi Nay");
            if(playa != INVALID_PLAYER_ID && gun <= 20 || gun >= 22) {
                PlayerInfo[playa][pAGuns][GetWeaponSlot(gun)] = gun;
                GivePlayerValidWeapon(playa, gun, 60000);
                SendClientMessageEx(playerid, COLOR_GRAD1, sstring);
            }
            else if(playa != INVALID_PLAYER_ID && gun == 21) {
                JetPack[playa] = 1;
                SetPlayerSpecialAction(playa, SPECIAL_ACTION_USEJETPACK);
                SendClientMessageEx(playerid, COLOR_GRAD1, sstring);
            }
        }
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:jetpack(playerid, params[])
{
	new string[128], plo;
	if(PlayerInfo[playerid][pAdmin] >= 2 && sscanf(params, "u", plo)) {
        JetPack[playerid] = 1;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
        return 1;
    }
	else if(PlayerInfo[playerid][pAdmin] >= 4 && !sscanf(params, "u", plo))
	{
		if (IsPlayerConnected(plo))
		{
			if(plo != INVALID_PLAYER_ID)
			{
				SendClientMessageEx(plo, COLOR_GRAD1, "Hay thuong thuc Jetpack cua ban!");
				JetPack[plo] = 1;
				SetPlayerSpecialAction(plo, SPECIAL_ACTION_USEJETPACK);
				format(string, sizeof(string), "[MAYCHU] %s da nhan duoc Jetpack tu %s", GetPlayerNameEx(plo), GetPlayerNameEx(playerid));
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				format(string, sizeof(string), "[Admin] %s (IP:%s) da cho %s (IP:%s) mot Jetpack.", GetPlayerNameEx(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(plo), GetPlayerIpEx(plo));
				Log("logs/admingive.log", string);
			}
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    return 1;
}

CMD:sethp(playerid, params[])
{
	new string[128], playa, health;
	if(sscanf(params, "ud", playa, health)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sethp [Player] [health]");
	if(PlayerInfo[playa][pJailTime] >= 1) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong the thiet lap HP cho nguoi o tu OOC!");
	if((PlayerInfo[playa][pAdmin] >= PlayerInfo[playerid][pAdmin]) && playa != playerid) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay tren mot Admin cap cao!");
	if(PlayerInfo[playerid][pAdmin] >= 6) {
		if(IsPlayerConnected(playa)) {
			if(playa != INVALID_PLAYER_ID)
			{
				SetPlayerHealth(playa, health);
				format(string, sizeof(string), "Ban da thiet lap %s mau cho %d.", GetPlayerNameEx(playa), health);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:setmyhp(playerid, params[])
{
    new string[128], health;
    if(sscanf(params, "d", health)) {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setmyhp [health]");
        return 1;
    }
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pUndercover] >= 1) {
        SetPlayerHealth(playerid, health);
        format(string, sizeof(string), "Ban da thiet lap mau cua ban %d.", health);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:setarmor(playerid, params[])
{
    new string[128], playa, health;
    if(sscanf(params, "ud", playa, health))
	{
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setarmor [Player] [armor]");
        return 1;
    }
    if (PlayerInfo[playerid][pAdmin] >= 6)
	{
        if(IsPlayerConnected(playa))
		{
            if(playa != INVALID_PLAYER_ID)
			{
                SetPlayerArmor(playa, health);
                format(string, sizeof(string), "Ban da thiet lap %s giap cho %d.", GetPlayerNameEx(playa), health);
                SendClientMessageEx(playerid, COLOR_WHITE, string);
            }
        }
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:hackwarnings(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2) {
		foreach(new i: Player)
		{
		    if(GetPVarType(i, "ArmorWarning"))
		    {
		        new Float: armor, szMessage[128];
		        GetPlayerArmour(i, armor);
		        if(armor > CurrentArmor[i])
		        {
					format(szMessage, sizeof(szMessage), "%s (ID: %i, Level: %d) - Armor Hacking - Recorded: %f - Current: %f", GetPlayerNameEx(i), i, PlayerInfo[i][pLevel], CurrentArmor[i], armor);
					SendClientMessage(playerid, COLOR_WHITE, szMessage);
				}
			}
		}
	}
	return 1;
}

CMD:setmyarmor(playerid, params[])
{
    new string[128], armor;
    if(sscanf(params, "d", armor))
	{
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setmyarmor [amount]");
        return 1;
    }
    if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pUndercover] >= 1)
	{
        SetPlayerArmor(playerid, armor);
        format(string, sizeof(string), "Ban da thiet lap giap cho %d.", armor);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:setarmorall(playerid, params[])
{
    new armor;
    if(sscanf(params, "d", armor)) {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setarmorall [armor]");
        return 1;
    }

    if (PlayerInfo[playerid][pAdmin] >= 5) {
        foreach(new i: Player)
		{
            new string[128];
            SetPlayerArmor(i, armor);
            format(string, sizeof(string), "[GO:RP] %s da thiet lap giap cho toan bo nguoi trong may chu.", GetPlayerNameEx(playerid));
        	SendClientMessageToAllEx(COLOR_LIGHTRED, string);
        }
    }

    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}
CMD:zombieweather(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
    	SetWeather(9);
    	SyncMinTime();
    	SendRconCommand("loadfs zombie_mapping");
    	SendClientMessageEx(playerid, COLOR_WHITE, "Thay doi thoi tiet thanh bau troi Zombie.");
	}
	return 1;
}
//Zombie Event Commands
CMD:zombieevent(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
	    if(zombieevent == 0)
	    {
	        foreach(new i: Player)
	        {
	            PlayerInfo[i][pVials]++;
	        }
	        zombieevent=1;
	        //SendAudioToRange(70, 100, 0.0, 0.0, 0.0, 10000); RESCRIPT NEW SOUND
			SendGroupMessage(3, TEAM_MED_COLOR, "Chu y FDSA, su kien zombie da bat dau, bay gio ban co the su dung /curevirus de chua tri virus");
	        SendClientMessageEx(playerid, COLOR_WHITE, "Ban da kick hoat che do zombie.");
	        mysql_function_query(MainPipeline, "DELETE FROM zombie", false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
	    }
	    else
	    {
	        zombieevent=0;
			SendRconCommand("unloadfs zombie_mapping");
	        SyncMinTime();
			SetWeather(5);
			mysql_function_query(MainPipeline, "DELETE FROM zombie", false, "OnQueryFinish", "ii", SENDDATA_THREAD, playerid);
			foreach(new i:Player)
			{
			    UnZombie(i);
			}
	        SendClientMessageEx(playerid, COLOR_WHITE, "Khong co gi de xem o day, moi nguoi.");
		}
	}
	return 1;
}
CMD:zombieannounce(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
	    if(zombieevent == 1)
	    {
	        //SendAudioToRange(65, 100, 0.0, 0.0, 0.0, 10000); RESCRIPT NEW SOUND
			SendClientMessageToAllEx(COLOR_WHITE, "|___________ Government Tin Tuc Thong Bao ___________|");
			SendClientMessageToAllEx(COLOR_DBLUE, "** Nguoi phat ngon: Chu y, Thong bao quan trong tu chinh phu San Andreas.");
			SendClientMessageToAllEx(COLOR_DBLUE, "** Nguoi phat ngon: Tinh trang khan cap duoc ban hanh tren toan dat nuoc");
			SendClientMessageToAllEx(COLOR_DBLUE, "** Nguoi phat ngon: Thanh pho Los Santos da duoc canh ly theo lenh 113B.");
			SendClientMessageToAllEx(COLOR_DBLUE, "** Nguoi phat ngon: Dang co mot dich benh hoanh hanh, su lay nhiem dang tang cao.");
			SendClientMessageToAllEx(COLOR_DBLUE, "** Nguoi phat ngon: Hay lien he voi cac bac si hoac trung tam y te de dieu tri.");
	    }
	}
	return 1;
}

CMD:makezombie(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
 		if(zombieevent == 1)
	    {
    		new giveplayerid;
			if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makezombie [player]");
			MakeZombie(giveplayerid);
	    }
	}
	return 1;
}
CMD:setvials(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		new giveplayerid, vials;
		if(sscanf(params, "ui", giveplayerid, vials)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setvials [Player] [number]");
		if(vials < 0) return 1;
		new string[128];

		PlayerInfo[giveplayerid][pVials] += vials;
		format(string, sizeof(string), "Ban da cho %s %d lo thuoc khang sinh de dieu tri!", GetPlayerNameEx(giveplayerid), vials);
		SendClientMessageEx(playerid, COLOR_WHITE,string);
		format(string, sizeof(string), "Ban da nhan duoc %d lo thuoc khang sinh - de dieu tri su dung /curevirus.", vials);
		SendClientMessageEx(giveplayerid, COLOR_WHITE,string);
	}
	return 1;
}

CMD:unzombie(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
 		if(zombieevent == 1)
	    {
    		new giveplayerid;
			if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /unzombie [player]");
			SendClientMessageEx(playerid, COLOR_GREY, "Done!");
			UnZombie(giveplayerid);
	    }
	}
	return 1;
}
CMD:unlockarenas(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }
    for(new i = 0; i < MAX_ARENAS; i++) {
        if(PaintBallArena[i][pbLocked] == 2) {
            ResetPaintballArena(i);
        }
    }
    new string[128];
    format(string, sizeof(string), "[MAYCHU] %s da mo khoa tat ca Paintball Arenas.", GetPlayerNameEx(playerid));
    ABroadCast(COLOR_YELLOW, string, 2);
    format(string, sizeof(string), "* Admin %s da mo khoa tat ca Paintball Arenas, ban co the tham gia/tao ra chung ngay bay gio", GetPlayerNameEx(playerid));
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, string);
    return 1;
}
CMD:lockarenas(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }
    new string[128];
    for(new i = 0; i < MAX_ARENAS; i++) {
        foreach(new p: Player) {
            new arenaid = GetPVarInt(p, "IsInArena");
            if(arenaid == i) {
                if(PaintBallArena[arenaid][pbBidMoney] > 0) {
                    GivePlayerCash(p,PaintBallArena[GetPVarInt(p, "IsInArena")][pbBidMoney]);
                    format(string,sizeof(string),"Ban duoc hoan tra tong cong $%d vi dong cua som.",PaintBallArena[GetPVarInt(p, "IsInArena")][pbBidMoney]);
                    SendClientMessageEx(p, COLOR_WHITE, string);
                }
                if(arenaid == GetPVarInt(p, "ArenaNumber")) {
                    switch(PaintBallArena[arenaid][pbGameType]) {
                        case 1:
                        {
                            if(PlayerInfo[p][pDonateRank] < 3) {
                                PlayerInfo[p][pPaintTokens] += 3;
                                format(string,sizeof(string),"Ban da duoc hoan tra tong cong %d Paintball Tokens vi dong cua som.",3);
                                SendClientMessageEx(p, COLOR_WHITE, string);
                            }
                        }
                        case 2:
                        {
                            if(PlayerInfo[p][pDonateRank] < 3) {
                                PlayerInfo[p][pPaintTokens] += 4;
                                format(string,sizeof(string),"Ban da duoc hoan tra tong cong %d Paintball Tokens vi dong cua som.",4);
                                SendClientMessageEx(p, COLOR_WHITE, string);
                            }
                        }
                        case 3:
                        {
                            if(PlayerInfo[p][pDonateRank] < 3) {
                                PlayerInfo[p][pPaintTokens] += 5;
                                format(string,sizeof(string),"Ban da duoc hoan tra tong cong %d Paintball Tokens vi dong cua som.",5);
                                SendClientMessageEx(p, COLOR_WHITE, string);
                            }
                        }
                        case 4:
                        {
                            if(PlayerInfo[p][pDonateRank] < 3) {
                                PlayerInfo[p][pPaintTokens] += 5;
                                format(string,sizeof(string),"Ban da duoc hoan tra tong cong %d Paintball Tokens vi dong cua som.",5);
                                SendClientMessageEx(p, COLOR_WHITE, string);
                            }
                        }
                        case 5:
                        {
                            if(PlayerInfo[p][pDonateRank] < 3) {
                                PlayerInfo[p][pPaintTokens] += 6;
                                format(string,sizeof(string),"Ban da duoc hoan tra tong cong %d Paintball Tokens vi dong cua som.",6);
                                SendClientMessageEx(p, COLOR_WHITE, string);
                            }
                        }
                    }
                }
                LeavePaintballArena(p, arenaid);
            }
        }
        ResetPaintballArena(i);
        PaintBallArena[i][pbLocked] = 2;
    }
    format(string, sizeof(string), "[MAYCHU] %s da khoa tat ca Paintball Arenas.", GetPlayerNameEx(playerid));
    ABroadCast(COLOR_YELLOW, string, 2);
    format(string, sizeof(string), "* Admin %s da khoa tat ca Paintball Arenas do mot so bao tri ngan.", GetPlayerNameEx(playerid));
    SendClientMessageToAllEx(COLOR_LIGHTBLUE, string);
    return 1;
}

CMD:savetwpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] > 3 || PlayerInfo[playerid][pGangModerator] >= 1) {
        new string[128];
        new tw = GetPVarInt(playerid, "EditingTurfs");
        new stage = GetPVarInt(playerid, "EditingTurfsStage");
        new Float:x, Float: y, Float: z;
        new Float:tminx, Float: tminy, Float: tmaxx, Float: tmaxy;
        GetPlayerPos(playerid, x, y, z);
        if(stage == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc chinh sua kich thuoc Turf ngay bay gio!");
            return 1;
        }
        else {
            switch(stage) {
                case 1:
                {
                    SetPVarFloat(playerid, "EditingTurfsMinX", x);
                    format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua thanh cong Turf West Wall.");
                    SendClientMessageEx(playerid, COLOR_GRAD2, string);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Goto a location and type (/savetwpos) to edit the South Wall.");
                    SetPVarInt(playerid, "EditingTurfsStage", 2);
                }
                case 2:
                {
                    SetPVarFloat(playerid, "EditingTurfsMinY", y);
                    format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua thanh cong Turf South Wall.");
                    SendClientMessageEx(playerid, COLOR_GRAD2, string);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Goto a location and type (/savetwpos) to edit the East Wall.");
                    SetPVarInt(playerid, "EditingTurfsStage", 3);
                }
                case 3:
                {
                    SetPVarFloat(playerid, "EditingTurfsMaxX", x);
                    format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua thanh cong Turf East Wall.");
                    SendClientMessageEx(playerid, COLOR_GRAD2, string);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Goto a location and type (/savetwpos) to edit the North Wall.");
                    SetPVarInt(playerid, "EditingTurfsStage", 4);
                }
                case 4:
                {
                    SetPVarFloat(playerid, "EditingTurfsMaxY", y);
                    format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                    SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua thanh cong Turf East Wall.");
                    SendClientMessageEx(playerid, COLOR_GRAD2, string);
                    format(string,sizeof(string),"You have successfully re-created (TurfID: %d) %s.",tw,TurfWars[tw][twName]);
                    SendClientMessageEx(playerid, COLOR_WHITE, string);
                    SetPVarInt(playerid, "EditingTurfsStage", -1);

                    DestroyTurfWarsZone(tw);

                    tminx = GetPVarFloat(playerid, "EditingTurfsMinX");
                    tminy = GetPVarFloat(playerid, "EditingTurfsMinY");
                    tmaxx = GetPVarFloat(playerid, "EditingTurfsMaxX");
                    tmaxy = GetPVarFloat(playerid, "EditingTurfsMaxY");

                    TurfWars[tw][twMinX] = tminx;
                    TurfWars[tw][twMinY] = tminy;
                    TurfWars[tw][twMaxX] = tmaxx;
                    TurfWars[tw][twMaxY] = tmaxy;

                    SetPVarFloat(playerid, "EditingTurfsMinX", 0.0);
                    SetPVarFloat(playerid, "EditingTurfsMinY", 0.0);
                    SetPVarFloat(playerid, "EditingTurfsMaxX", 0.0);
                    SetPVarFloat(playerid, "EditingTurfsMaxY", 0.0);

                    CreateTurfWarsZone(1,tw);
                    ShowPlayerDialog(playerid,TWEDITTURFSMENU,DIALOG_STYLE_LIST,"Turf Wars - Edit Turfs Menu:","Edit Dimensions...\nEdit Owners...\nEdit Vulnerable Time...\nEdit Locked...\nEdit Perks...\nReset War...\nDestroy Turf","Select","Back");
                }
            }
        }
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong du kha nang su dung lenh nay!");
    }
    return 1;
}

CMD:savedmpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5) {
        if(GetPVarInt(playerid, "EditingDMPos") == 0) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any spawn positions.");
            return 1;
        }
        if(GetPVarInt(playerid, "ArenaNumber") == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any arenas.");
            return 1;
        }
        new string[128];
        new arenaid = GetPVarInt(playerid, "ArenaNumber");
        new dmposid = GetPVarInt(playerid, "EditingDMPos");
        new Float:x, Float: y, Float: z, Float: angle;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, angle);

        switch(dmposid) {
            case 1:
            {
                PaintBallArena[arenaid][pbDeathmatch1][0] = x;
                PaintBallArena[arenaid][pbDeathmatch1][1] = y;
                PaintBallArena[arenaid][pbDeathmatch1][2] = z;
                PaintBallArena[arenaid][pbDeathmatch1][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited DM Spawn Position 1.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingDMPos", 0);
                PaintballEditArenaDMSpawns(playerid);
            }
            case 2:
            {
                PaintBallArena[arenaid][pbDeathmatch2][0] = x;
                PaintBallArena[arenaid][pbDeathmatch2][1] = y;
                PaintBallArena[arenaid][pbDeathmatch2][2] = z;
                PaintBallArena[arenaid][pbDeathmatch2][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited DM Spawn Position 2.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingDMPos", 0);
                PaintballEditArenaDMSpawns(playerid);
            }
            case 3:
            {
                PaintBallArena[arenaid][pbDeathmatch3][0] = x;
                PaintBallArena[arenaid][pbDeathmatch3][1] = y;
                PaintBallArena[arenaid][pbDeathmatch3][2] = z;
                PaintBallArena[arenaid][pbDeathmatch3][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited DM Spawn Position 3.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingDMPos", 0);
                PaintballEditArenaDMSpawns(playerid);
            }
            case 4:
            {
                PaintBallArena[arenaid][pbDeathmatch4][0] = x;
                PaintBallArena[arenaid][pbDeathmatch4][1] = y;
                PaintBallArena[arenaid][pbDeathmatch4][2] = z;
                PaintBallArena[arenaid][pbDeathmatch4][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited DM Spawn Position 4.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingDMPos", 0);
                PaintballEditArenaDMSpawns(playerid);
            }
        }

    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:saveteampos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5) {
        if(GetPVarInt(playerid, "EditingTeamPos") == 0) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any spawn positions.");
            return 1;
        }
        if(GetPVarInt(playerid, "ArenaNumber") == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any arenas.");
            return 1;
        }
        new string[128];
        new arenaid = GetPVarInt(playerid, "ArenaNumber");
        new teamposid = GetPVarInt(playerid, "EditingTeamPos");
        new Float:x, Float: y, Float: z, Float: angle;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, angle);

        switch(teamposid) {
            case 1:
            {
                PaintBallArena[arenaid][pbTeamRed1][0] = x;
                PaintBallArena[arenaid][pbTeamRed1][1] = y;
                PaintBallArena[arenaid][pbTeamRed1][2] = z;
                PaintBallArena[arenaid][pbTeamRed1][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Red Team Spawn Position 1.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
            case 2:
            {
                PaintBallArena[arenaid][pbTeamRed2][0] = x;
                PaintBallArena[arenaid][pbTeamRed2][1] = y;
                PaintBallArena[arenaid][pbTeamRed2][2] = z;
                PaintBallArena[arenaid][pbTeamRed2][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Red Team Spawn Position 2.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
            case 3:
            {
                PaintBallArena[arenaid][pbTeamRed3][0] = x;
                PaintBallArena[arenaid][pbTeamRed3][1] = y;
                PaintBallArena[arenaid][pbTeamRed3][2] = z;
                PaintBallArena[arenaid][pbTeamRed3][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Red Team Spawn Position 3.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
            case 4:
            {
                PaintBallArena[arenaid][pbTeamBlue1][0] = x;
                PaintBallArena[arenaid][pbTeamBlue1][1] = y;
                PaintBallArena[arenaid][pbTeamBlue1][2] = z;
                PaintBallArena[arenaid][pbTeamBlue1][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Blue Team Spawn Position 1.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
            case 5:
            {
                PaintBallArena[arenaid][pbTeamBlue2][0] = x;
                PaintBallArena[arenaid][pbTeamBlue2][1] = y;
                PaintBallArena[arenaid][pbTeamBlue2][2] = z;
                PaintBallArena[arenaid][pbTeamBlue2][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Blue Team Spawn Position 2.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
            case 6:
            {
                PaintBallArena[arenaid][pbTeamBlue3][0] = x;
                PaintBallArena[arenaid][pbTeamBlue3][1] = y;
                PaintBallArena[arenaid][pbTeamBlue3][2] = z;
                PaintBallArena[arenaid][pbTeamBlue3][3] = angle;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f, Angle=%f",x,y,z,angle);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Blue Team Spawn Position 3.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingTeamPos", 0);
                PaintballEditArenaTeamSpawns(playerid);
            }
        }

    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:saveflagpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5) {
        if(GetPVarInt(playerid, "EditingFlagPos") == 0) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any flag positions.");
            return 1;
        }
        if(GetPVarInt(playerid, "ArenaNumber") == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any arenas.");
            return 1;
        }
        new string[128];
        new arenaid = GetPVarInt(playerid, "ArenaNumber");
        new flagposid = GetPVarInt(playerid, "EditingFlagPos");
        new Float:x, Float: y, Float: z;
        GetPlayerPos(playerid, x, y, z);

        switch(flagposid) {
            case 1:                               // Red Flag Spawn Position
            {
                PaintBallArena[arenaid][pbFlagRedSpawn][0] = x;
                PaintBallArena[arenaid][pbFlagRedSpawn][1] = y;
                PaintBallArena[arenaid][pbFlagRedSpawn][2] = z;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Red Team Flag Position.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingFlagPos", 0);
                PaintballEditArenaFlagSpawns(playerid);
            }
            case 2:                               // Blue Flag Spawn Position
            {
                PaintBallArena[arenaid][pbFlagBlueSpawn][0] = x;
                PaintBallArena[arenaid][pbFlagBlueSpawn][1] = y;
                PaintBallArena[arenaid][pbFlagBlueSpawn][2] = z;

                format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited Blue Team Flag Position.");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);

                SetPVarInt(playerid, "EditingFlagPos", 0);
                PaintballEditArenaFlagSpawns(playerid);
            }
        }

    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:savehillpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5) {
        if(GetPVarInt(playerid, "ArenaNumber") == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are currently not editing any arenas.");
            return 1;
        }
        new string[128];
        new arenaid = GetPVarInt(playerid, "ArenaNumber");
        new stage = GetPVarInt(playerid, "EditingHillStage");
        new Float:x, Float: y, Float: z;
        GetPlayerPos(playerid, x, y, z);

        if(stage == -1) {
            SendClientMessageEx(playerid, COLOR_GRAD2, "You are not editing any Hill Positions right now!");
            return 1;
        }
        else {
            switch(stage) {
                case 1:
                {
                    PaintBallArena[arenaid][pbHillX] = x;
                    PaintBallArena[arenaid][pbHillY] = y;
                    PaintBallArena[arenaid][pbHillZ] = z;

                    format(string,sizeof(string),"X=%f, Y=%f, Z=%f",x,y,z);
                    SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully edited the Hill Position.");
                    SendClientMessageEx(playerid, COLOR_GRAD2, string);

                    SetPVarInt(playerid, "EditingHillStage", -1);
                    PaintballEditArenaMenu(playerid);
                }
            }
        }
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:twmenu(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] > 3 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
        ShowPlayerDialog(playerid,TWADMINMENU,DIALOG_STYLE_LIST,"Turf Wars - Admin Menu:","Edit Turfs...\nEdit Family Colors...","Select","Exit");
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong du kha nang su dung lenh nay!!");
    }
    return 1;
}
CMD:savecfgs(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 5) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }
    SendClientMessageEx(playerid, COLOR_WHITE, "* Saving CFG Files..");
    SaveTurfWars();
    SaveFamilies();
    SendClientMessageEx(playerid, COLOR_WHITE, "* Done");
    return 1;
}


CMD:loadcfgs(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 5) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }
    SendClientMessageEx(playerid, COLOR_WHITE, "* Reloading CFG Files..");
    g_mysql_LoadMOTD();
	// Local Configs
	Misc_Load();
    SendClientMessageEx(playerid, COLOR_WHITE, "* Done");
    return 1;
}

CMD:admins(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2) {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Admins Online:");
        foreach(new i: Player)
		{
            if(PlayerInfo[i][pAdmin] >= 2 && PlayerInfo[i][pAdmin] <= PlayerInfo[playerid][pAdmin]) {
                new string[128], tdate[11], thour[9], i_timestamp[3];
                getdate(i_timestamp[0], i_timestamp[1], i_timestamp[2]);
				format(tdate, sizeof(tdate), "%d-%02d-%02d", i_timestamp[0], i_timestamp[1], i_timestamp[2]);
				format(thour, sizeof(thour), "%02d:00:00", hour);

                if(PlayerInfo[playerid][pAdmin] >= 4)
				{
                    if(PlayerInfo[i][pAdmin] == 2) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 3) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 4) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 5) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 6) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 7) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else if(PlayerInfo[i][pAdmin] == 8) format(string, sizeof(string), "%s{BFC0C2}: %s (RTH: %d | RT: %d)", GetStaffRank(i), GetPlayerNameEx(i), ReportHourCount[i], ReportCount[i]);
                    else format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), PlayerInfo[i][pAdmin], GetPlayerNameEx(i));
                }
                else
				{
                    if(PlayerInfo[i][pAdmin] == 2) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 3) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 4) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 5) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 6) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 7) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else if(PlayerInfo[i][pAdmin] == 8) format(string, sizeof(string), "%s{BFC0C2}: %s", GetStaffRank(i), GetPlayerNameEx(i));
                    else format(string, sizeof(string), "%s{BFC0C2}: %s", PlayerInfo[i][pAdmin], GetPlayerNameEx(i));
                }

                if(PlayerInfo[i][pBanAppealer] == 1) strcat(string, " [BA]");
				if(PlayerInfo[i][pBanAppealer] == 2) strcat(string, " [DOBA]");
                if(PlayerInfo[i][pShopTech] == 1) strcat(string, " [ST]");
				if(PlayerInfo[i][pShopTech] == 2) strcat(string, " [SST]");
				if(PlayerInfo[i][pShopTech] == 3) strcat(string, " [DOCR]");
                if(PlayerInfo[i][pUndercover] == 1) strcat(string, " [UC]");
				if(PlayerInfo[i][pUndercover] == 2) strcat(string, " [DOSO]");
                if(PlayerInfo[i][pFactionModerator] == 1) strcat(string, " [FMOD]");
				if(PlayerInfo[i][pFactionModerator] == 2) strcat(string, " [DOFM]");
                if(PlayerInfo[i][pGangModerator] == 1) strcat(string, " [GMOD]");
				if(PlayerInfo[i][pGangModerator] == 2) strcat(string, " [DOGM]");
                if(PlayerInfo[i][pTogReports]) strcat(string, " [SPEC MODE]");
                if(PlayerInfo[i][pPR] == 1) strcat(string, " [PR]");
				if(PlayerInfo[i][pPR] == 2) strcat(string, " [DOPR]");
				if(PlayerInfo[i][pHR] >= 1) strcat(string, " [HR]");
				if(PlayerInfo[i][pAP] >= 1) strcat(string, " [AP]");
				if(PlayerInfo[i][pSecurity] >= 1) strcat(string, " [Development]");
                SendClientMessageEx(playerid, COLOR_GRAD2, string);
            }
        }
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Neu ban co cau hoi lien quan den tro choi, su dung /newb.");
        SendClientMessageEx(playerid, COLOR_GRAD1, "Neu ban nhin thay nguoi choi co hanh vi dang' ngo`, /baocao [id] [lydo].");
    }
    return 1;
}
CMD:dn(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx, sly, slz-2);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx, sly, slz-2);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:up(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
        GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx, sly, slz+5);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx, sly, slz+5);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:fly(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2) {
        new Float:x, Float:y, Float:z;
		if((flying[playerid] = !flying[playerid]))
		{
		    GetPlayerPos(playerid, x, y, z);
		    SetPlayerPos(playerid, x, y, z+5);
      		SetPlayerArmour(playerid, 1000000000.0);
		    SetPlayerHealth(playerid, 1000000000.0);
		    SetTimerEx("AdminFly", 100, 0, "d", playerid);
		}
		else
		{
		    GetPlayerPos(playerid, x, y, z);
		    SetPlayerPos(playerid, x, y, z+0.5);
		    ClearAnimations(playerid);
		    SetPlayerArmour(playerid, 100.0);
		    SetPlayerHealth(playerid, 100.0);
			return 1;
		}
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay.");
    }
    return 1;
}
CMD:lt(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
        GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx-2, sly, slz);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx-2, sly, slz);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:rt(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
        GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx+2, sly, slz);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx+2, sly, slz);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:fd(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
        GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx, sly+2, slz);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx, sly+2, slz);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:bk(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2)
	{
        new Float:slx, Float:sly, Float:slz;
        GetPlayerPos(playerid, slx, sly, slz);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, slx, sly-2, slz);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, slx, sly-2, slz);
		}
        return 1;
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}
CMD:aduty(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
	    if(Aduty[playerid] == 0)
	    {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da on duty.");
		SetPlayerPos(playerid, 1103.7301,1544.8516,5.8203);
		SetPlayerColor(playerid,COLOR_GREEN);
     	SetPlayerArmour(playerid, 10000.0);
	    SetPlayerHealth(playerid, 10000.0);
	    Aduty[playerid] = 1;
	    }
	    else
	    {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da off duty.");
	    SetPlayerHealth(playerid, 100.0);
	    SetPlayerColor(playerid,COLOR_WHITE);
	    Aduty[playerid] = 0;
	    }
	}
	return 1;
}
CMD:gsave(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
        SendClientMessageEx(playerid, COLOR_YELLOW, "You have force saved the Gate database.");
        SaveGates();
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:editauctions(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {
		new
		    szDialog[700];

		for (new i; i < sizeof(Auctions); i++)
    	{
            format(szDialog, sizeof(szDialog), "%s\n Auction: %i | Item: %s | Highest Bid: $%i | Wining: %s(%i)", szDialog, i+1, Auctions[i][BiddingFor], Auctions[i][Bid], Auctions[i][Wining], Auctions[i][Bidder]);
    	}
    	ShowPlayerDialog(playerid, DIALOG_ADMINAUCTIONS, DIALOG_STYLE_LIST, "Auctions", szDialog, "Thoat", "Close");
	}
	return 1;
}
CMD:createmailbox(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }

	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)	{
		return SendClientMessageEx(playerid, COLOR_GRAD2, "You can not do this while spectating.");
	}

    new i = GetFreeMailboxId();
	if (i == -1) return	SendClientMessageEx(playerid, COLOR_GRAD1, "So luong hop thu cua duong pho da dat toi.");

	GetPlayerPos(playerid, MailBoxes[i][mbPosX], MailBoxes[i][mbPosY], MailBoxes[i][mbPosZ]);
	GetPlayerFacingAngle(playerid, MailBoxes[i][mbAngle]);
	MailBoxes[i][mbPosZ] -= 0.30;
	MailBoxes[i][mbInt] = GetPlayerInterior(playerid);
	MailBoxes[i][mbVW] = GetPlayerVirtualWorld(playerid);

	SaveMailbox(i);
	RenderStreetMailbox(i);

	new string[128], area[MAX_ZONE_NAME];
	format(string,sizeof(string),"You have successfully created a street mailbox with ID %d.", i);
	SendClientMessageEx(playerid, COLOR_GRAD2, string);
	GetPlayer2DZone(playerid, area, MAX_ZONE_NAME);
	format(string, sizeof(string), "Admin %s has placed street mailbox %d at %s", GetPlayerNameEx(playerid), i, area);
	Log("logs/mail.log", string);

	Streamer_UpdateEx(playerid, MailBoxes[i][mbPosX], MailBoxes[i][mbPosY], MailBoxes[i][mbPosZ]);

	return 1;

}

CMD:removemailbox(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
	new id;
	if(sscanf(params, "d", id)) {
        return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /removemailbox [street mailbox id]");
    }
    if(id < 0 || id >= MAX_MAILBOXES) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid street mailbox ID.");
    }
    if(MailBoxes[id][mbPosX] == 0.0) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "No street mailbox found with that ID.");
    }

	ClearStreetMailbox(id);
	RenderStreetMailbox(id);

	new string[128], area[MAX_ZONE_NAME];
	format(string,sizeof(string),"You have successfully removed the street mailbox with ID %d.", id);
	SendClientMessageEx(playerid, COLOR_GRAD2, string);
	GetPlayer2DZone(playerid, area, MAX_ZONE_NAME);
	format(string, sizeof(string), "Administrator %s has removed a street mailbox %d, at %s", GetPlayerNameEx(playerid), id, area);
	Log("logs/mail.log", string);

    return 1;
}

CMD:gotomailbox(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
	new id;
	if(sscanf(params, "d", id)) {
        SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotomailbox [street mailbox id]");
        return 1;
    }
    if(id < 0 || id >= MAX_MAILBOXES) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid street mailbox ID.");
    }
    if(MailBoxes[id][mbPosX] == 0.0) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "No street mailbox found with that ID.");
    }

	GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
	SetPlayerVirtualWorld(playerid, MailBoxes[id][mbVW]);
	SetPlayerInterior(playerid, MailBoxes[id][mbInt]);
	SetPlayerPos(playerid,MailBoxes[id][mbPosX],MailBoxes[id][mbPosY] - 2.5,MailBoxes[id][mbPosZ]);
	PlayerInfo[playerid][pVW] = MailBoxes[id][mbVW];
	PlayerInfo[playerid][pInt] = MailBoxes[id][mbInt];

    return 1;
}
CMD:adestroymailbox(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    new houseid;
    if(sscanf(params,"d",houseid)) {
        return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adestroymailbox [houseid]");
    }
    if (houseid < 0 || houseid >= MAX_HOUSES) {
    	return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid house ID!");
	}
    if (HouseInfo[houseid][hMailX] == 0.0) {
    	return SendClientMessageEx(playerid, COLOR_GRAD2, "That house does not have a mailbox.");
	}

    ClearHouseMailbox(houseid);
	RenderHouseMailbox(houseid);

	new string[64];
	format(string, sizeof(string), "You have destroyed the mailbox of house %d.", houseid);
	SendClientMessageEx(playerid, COLOR_GREY, string);
	foreach(new i: Player)
	{
		if(PlayerInfo[i][pPhousekey] == houseid || PlayerInfo[i][pPhousekey2] == houseid)	{
			format(string, sizeof(string), "Administrator %s has destroyed your mailbox.", GetPlayerNameEx(playerid));
			SendClientMessageEx(i, COLOR_GREY, string);
			break;
		}
	}

	format(string, sizeof(string), "Administrator %s has destroyed the mailbox of house %d.", GetPlayerNameEx(playerid), houseid);
	Log("logs/house.log", string);

	return 1;
}
CMD:prisoners(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
 	{
  		new Count;
		new string[128];

		SendClientMessageEx(playerid, COLOR_WHITE, "----------------------------------------");
  		SendClientMessageEx(playerid, COLOR_WHITE, "Name | Prisoned By | Time Left | Reason");

		foreach(new i: Player)
  		{
    		if(PlayerInfo[i][pJailTime] >= 1)
      		{
        		if(strlen(PlayerInfo[i][pPrisonReason]) >= 1 && strlen(PlayerInfo[i][pPrisonedBy]) >= 1)
          		{
						Count++;
	                	format(string, sizeof(string), "%s (%d) | %s | %s | %s", GetPlayerNameEx(i), i, PlayerInfo[i][pPrisonedBy], TimeConvert(PlayerInfo[i][pJailTime]), PlayerInfo[i][pPrisonReason]);
	                	SendClientMessageEx(playerid, COLOR_GREY, string);
      			}
         		else
           		{
            		format(string, sizeof(string), "%s (%d) | Unavailable | %s | Unavailable", GetPlayerNameEx(i), i, TimeConvert(PlayerInfo[i][pJailTime]));
             		SendClientMessageEx(playerid, COLOR_GREY, string);
             	}
      		}
      	}
      	SendClientMessageEx(playerid, COLOR_WHITE, "----------------------------------------");
	}
	return 1;
}
CMD:impoundedit(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new string[128], choice[32], id, amount;
		if(sscanf(params, "s[32]dD", choice, id, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /impoundedit [name] [id] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Position, Delete");
			return 1;
		}

		if(id >= MAX_IMPOUNDPOINTS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Invalid Impound Points ID!");
			return 1;
		}

		if(strcmp(choice, "position", true) == 0)
		{
			GetPlayerPos(playerid, ImpoundPoints[id][impoundPosX], ImpoundPoints[id][impoundPosY], ImpoundPoints[id][impoundPosZ]);
			ImpoundPoints[id][impoundInt] = GetPlayerInterior(playerid);
			ImpoundPoints[id][impoundVW] = GetPlayerVirtualWorld(playerid);
			format(string, sizeof(string), "Ban da thay doi vi tri tren diem chua mot the tich #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(ImpoundPoints[id][impoundTextID]);
			format(string, sizeof(string), "Impound Yard #%d\nType /impound to impound a vehicle", id);
			ImpoundPoints[id][impoundTextID] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, ImpoundPoints[id][impoundPosX], ImpoundPoints[id][impoundPosY], ImpoundPoints[id][impoundPosZ]+0.6, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ImpoundPoints[id][impoundVW], ImpoundPoints[id][impoundInt], -1);
			SaveImpoundPoint(id);
			format(string, sizeof(string), "%s has edited Impound Point ID %d's position.", GetPlayerNameEx(playerid), id);
			Log("logs/impoundedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "delete", true) == 0)
		{
			if(ImpoundPoints[id][impoundPosX] == 0)
			{
				format(string, sizeof(string), "Impound Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			DestroyDynamic3DTextLabel(ImpoundPoints[id][impoundTextID]);
			ImpoundPoints[id][impoundPosX] = 0.0;
			ImpoundPoints[id][impoundPosY] = 0.0;
			ImpoundPoints[id][impoundPosZ] = 0.0;
			ImpoundPoints[id][impoundVW] = 0;
			ImpoundPoints[id][impoundInt] = 0;
			SaveImpoundPoint(id);
			format(string, sizeof(string), "You have deleted Impound Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has deleted Impound Point ID %d.", GetPlayerNameEx(playerid), id);
			Log("logs/impoundedit.log", string);
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:impoundstatus(playerid, params[])
{
	new id;
	if(sscanf(params, "i", id))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /impoundstatus [id]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Impound Point Status (ID: %d) ___________|", id);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "[Position] X: %f | Y: %f | Z: %f | VW: %d | Int: %d", ImpoundPoints[id][impoundPosX], ImpoundPoints[id][impoundPosY], ImpoundPoints[id][impoundPosZ], ImpoundPoints[id][impoundVW], ImpoundPoints[id][impoundInt]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:impoundnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] == 2)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available Impound Point...");
		for(new x = 0; x < MAX_IMPOUNDPOINTS; x++)
		{
			if(ImpoundPoints[x][impoundPosX] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:gotoimpoundpoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotoimpoundpoint [id]");

		SetPlayerPos(playerid, ImpoundPoints[id][impoundPosX], ImpoundPoints[id][impoundPosY], ImpoundPoints[id][impoundPosZ]);
		SetPlayerInterior(playerid, ImpoundPoints[id][impoundInt]);
		PlayerInfo[playerid][pInt] = ImpoundPoints[id][impoundInt];
		SetPlayerVirtualWorld(playerid, ImpoundPoints[id][impoundVW]);
		PlayerInfo[playerid][pVW] = ImpoundPoints[id][impoundVW];
	}
	return 1;
}
CMD:aimpound(playerid, params[]) {
    if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new
			iVehType,
			iVehIndex,
			iTargetOwner,
			iVehTowed;
        if(sscanf(params, "d", iVehTowed)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /aimpound [carid]");

		foreach(new i: Player)
		{
			iVehIndex = GetPlayerVehicle(i, iVehTowed);
			if(iVehIndex != -1) {
				iVehType = 1;
				iTargetOwner = i;
				break;
			}
		}
		/*if(!iVehType) {
			for(new i=1; i < MAX_FAMILY; ++i) {
				iVehIndex = GetGangVehicle(i, iVehTowed);
				if(iVehIndex != -1) {
					iVehType = 2;
					iTargetOwner = i;
					break;
				}
			}
		} */
		switch(iVehType) {
			case 0, 2: {
				SendClientMessageEx(playerid, COLOR_GRAD1, "Xe cua nguoi da da duoc chinh vao kho xe, do vay khong the giam giu.");
				DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
				SetVehicleToRespawn(iVehTowed);
			}
			case 1: {

				PlayerVehicleInfo[iTargetOwner][iVehIndex][pvImpounded] = 1;
				PlayerVehicleInfo[iTargetOwner][iVehIndex][pvSpawned] = 0;
				PlayerVehicleInfo[iTargetOwner][iVehIndex][pvId] = INVALID_PLAYER_VEHICLE_ID;
				DestroyVehicle(iVehTowed);
                g_mysql_SaveVehicle(iTargetOwner, iVehIndex);
				VehicleSpawned[iTargetOwner]--;
				--PlayerCars;

				new
					szMessage[96];

				format(szMessage, sizeof(szMessage),"* Ban da tich thu xe %s's %s.",GetPlayerNameEx(iTargetOwner), VehicleName[PlayerVehicleInfo[iTargetOwner][iVehIndex][pvModelId] - 400]);
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

				format(szMessage, sizeof(szMessage), "Xe %s cua ban da bi giam giu boi mot admin. Vui long toi DMV de nop tien phat va lay lai xe.", VehicleName[PlayerVehicleInfo[iTargetOwner][iVehIndex][pvModelId] - 400]);
				SendClientMessageEx(iTargetOwner, COLOR_LIGHTBLUE, szMessage);

			}
			/*case 2: {

				new
					szMessage[29 + MAX_PLAYER_NAME];

				format(szMessage, sizeof(szMessage),"* You have impounded %s's %s.",FamilyInfo[iTargetOwner][FamilyName], GetVehicleNameEx(iVehTowed));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

				format(szMessage, sizeof(szMessage), "Your %s has been impounded. You may release it at the DMV in Dillimore.", GetVehicleNameEx(iVehTowed));
				SendNewFamilyMessage(iTargetOwner, COLOR_LIGHTBLUE, szMessage);

				FamilyVehicleInfo[iTargetOwner][iVehIndex][fvImpounded] = 1;
				FamilyVehicleInfo[iTargetOwner][iVehIndex][fvId] = INVALID_VEHICLE_ID;
				DestroyVehicle(iVehTowed);
			}*/
		}
		arr_Towing[playerid] = INVALID_VEHICLE_ID;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:nonewbie(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pHelper] >= 4)
	{
		if (!nonewbie)
		{
			nonewbie = 1;
			SendClientMessageToAllEx(COLOR_GRAD2, "Kenh hoi dap newbie da bi tat boi mot Admin/Advisor!");
		}
		else
		{
			nonewbie = 0;
			SendClientMessageToAllEx(COLOR_GRAD2, "Kenh hoi dap newbie da duoc mo boi mot Admin/Advisor!");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:noooc(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		if (!noooc)
		{
			noooc = 1;
			SendClientMessageToAllEx(COLOR_GRAD2, "   OOC chat da duoc tat boi mot Admin!");
		}
		else
		{
			noooc = 0;
			SendClientMessageToAllEx(COLOR_GRAD2, "   OOC chat da duoc mo boi mot Admin!");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:veh(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 2) {

		new
			iVehicle,
			iColors[2],
			freeSlot;

		if(sscanf(params, "iii", iVehicle, iColors[0], iColors[1])) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /veh [model ID] [color 1] [color 2]");
		}
		else if(!(400 <= iVehicle <= 20000)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "ID xe phai tu 400 den 611");
		}
		else if(IsATrain(iVehicle)) {
			SendClientMessageEx(playerid, COLOR_GREY, "Trains cannot be spawned during runtime.");
		}
		else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "ID mau xe phai tu 0 den 255.");
		}
		else for(new iIterator; iIterator < sizeof(CreatedCars); iIterator++) {
			if(CreatedCars[iIterator] == INVALID_VEHICLE_ID) {
				freeSlot = iIterator;
				break;
			}

			if(iIterator >= 49) return SendClientMessageEx(playerid, COLOR_GRAD1, "Da dat gioi han toi da 50 xe duoc tao ra.");
		}
		
		if(CreatedCars[freeSlot] == INVALID_VEHICLE_ID) {

			new
				Float: fVehPos[4];

			new fVW = GetPlayerVirtualWorld(playerid);
			GetPlayerPos(playerid, fVehPos[0], fVehPos[1], fVehPos[2]);
			GetPlayerFacingAngle(playerid, fVehPos[3]);
			CreatedCars[freeSlot] = CreateVehicle(iVehicle, fVehPos[0], fVehPos[1], fVehPos[2], fVehPos[3], iColors[0], iColors[1], -1);
			VehicleFuel[CreatedCars[freeSlot]] = 100.0;
			Vehicle_ResetData(CreatedCars[freeSlot]);
			LinkVehicleToInterior(CreatedCars[freeSlot], GetPlayerInterior(playerid));
			SetVehicleVirtualWorld(CreatedCars[freeSlot], fVW);
			return SendClientMessageEx(playerid, COLOR_GREY, "Xe da duoc tao ra!");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}


CMD:vehname(playerid, params[]) {

	if(PlayerInfo[playerid][pAdmin] >= 2) {

		SendClientMessageEx(playerid, COLOR_YELLOW, "--------------------------------------------------------------------------------------------------------------------------------");
		SendClientMessageEx(playerid, COLOR_WHITE, "Vehicle Search:");

		new
			string[128];

		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "No keyword specified.");
		if(!params[2]) return SendClientMessageEx(playerid, COLOR_GREY, "Search keyword too short.");

		for(new v; v < sizeof(VehicleName); v++) {
			if(strfind(VehicleName[v], params, true) != -1) {

				if(isnull(string)) format(string, sizeof(string), "%s (ID %d)", VehicleName[v], v+400);
				else format(string, sizeof(string), "%s | %s (ID %d)", string, VehicleName[v], v+400);
			}
		}

		if(!string[0]) SendClientMessageEx(playerid, COLOR_GREY, "No results found.");
		else if(string[127]) SendClientMessageEx(playerid, COLOR_GREY, "Too many results found.");
		else SendClientMessageEx(playerid, COLOR_WHITE, string);

		SendClientMessageEx(playerid, COLOR_YELLOW, "--------------------------------------------------------------------------------------------------------------------------------");
	}
	return 1;
}
// Testing Commands
CMD:fgstats(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] < 2) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the duoc phep su dung lenh nay.");
		return 1;
	}
	else {
	    new stats[256];
		mysql_stat(stats, MainPipeline);
		SendClientMessageEx(playerid, COLOR_GREEN,"___________________________________________________________________________________________________");
		SendClientMessageEx(playerid, COLOR_GREY, stats);
		SendClientMessageEx(playerid, COLOR_GREEN,"___________________________________________________________________________________________________");
		#if defined SHOPAUTOMATED
		mysql_stat(stats, ShopPipeline);
		SendClientMessageEx(playerid, COLOR_GREEN,"___________________________________________________________________________________________________");
		SendClientMessageEx(playerid, COLOR_GREY, stats);
		SendClientMessageEx(playerid, COLOR_GREEN,"___________________________________________________________________________________________________");
		#endif
	}
	return 1;
}
CMD:anetstats(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] < 2) {
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new giveplayerid, strStats[401], szTitle[64];
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /anetstats [player]");

	if(gPlayerLogged{giveplayerid} != 0) {
		GetPlayerNetworkStats(giveplayerid, strStats, sizeof(strStats));
		format(szTitle, sizeof(szTitle), "Network Stats (ID: %d) - %s", giveplayerid, GetPlayerNameEx(giveplayerid));
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, szTitle, strStats, "Dong", "");
	}
	return 1;
}
CMD:playsound(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay!");

	new id, soundid;

	if(sscanf(params, "ud", id, soundid))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /playsound [player] [soundid]");
        return 1;
	}
	else
	{
		PlayerPlaySound(id, soundid, 0, 0, 0);
	}
	return 1;
}

CMD:aobject(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay!");

	new id, objectid, bone, Float:offsetx, Float:offsety, Float:offsetz, Float:rotx, Float:roty, Float:rotz, Float:scalex, Float:scaley, Float:scalez;

	if(sscanf(params, "uddfffffffff", id, objectid, bone, offsetx, offsety, offsetz, rotx, roty, rotz, scalex, scaley, scalez))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /aobject [player] [objectid] [bone] [offx] [offy] [offz] [rotx] [roty] [rotz] [scax] [scay] [scaz]");
        return 1;
	}
	else
	{
		if(IsPlayerAttachedObjectSlotUsed(id, 9)) RemovePlayerAttachedObject(id, 9);
		SetPlayerAttachedObject(id, 9, objectid, bone, offsetx, offsety, offsetz, rotx, roty, rotz, scalex, scaley, scalez);
		new string[256];
		format(string, sizeof(string), "%s has given %s object ID %d with /aobject", GetPlayerNameEx(playerid), GetPlayerNameEx(id), objectid);
		Log("logs/toys.log", string);
	}
	return 1;
}

CMD:robject(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay!");

	new id;
	if(sscanf(params, "u", id))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /robject [player]");
        return 1;
	}
	else
	{
		if(IsPlayerAttachedObjectSlotUsed(id, 9)) RemovePlayerAttachedObject(id, 9);
	}
	return 1;
}

CMD:wepreset(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
	{
	    new string[75 + (MAX_PLAYER_NAME * 2)], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /wepreset [player]");
		if(IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[giveplayerid][pWRestricted] > 0)
		    {
		        PlayerInfo[giveplayerid][pWRestricted] = 0;
		        format(string, sizeof(string), "[MAYCHU] %s reset %s's (ID:%d) weapon restriction timer.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), giveplayerid);
		        ABroadCast(COLOR_YELLOW, string, 2);
		    }
		    else
		    {
		        SendClientMessageEx(playerid, COLOR_WHITE, "Vu khi cua ho khong bi gioi hang!");
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le theo quy dinh.");
		}
	}
	return 1;
}

CMD:watch(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the duoc phep su dung lenh nay.");
		return 1;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the lam dieu nay trong khi doi them.");
		return 1;
	}
	if(isnull(params))
	{
	    // VIP gold room needs to be fixed
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /watch [location] (or /watch off)");
		SendClientMessageEx(playerid, COLOR_GRAD2, "General locations: gym, lspd, allsaints, countygen, grove, tgb, bank, motel, cityhall, mall");
        SendClientMessageEx(playerid, COLOR_GRAD2, "VIP locations: lsvip, sfvip, loungeview1, loungeview2, goldlounge, vipgarage");
        SendClientMessageEx(playerid, COLOR_GRAD2, "Point locations: mp1, df, mf1, dh, mp2, cl, mf2, sfd, ffc");
	}

	new Float: Pos[3], int, vw;

	// SAVING INITIAL POSITION TO TELEPORT BACK TO LATER
	if(!(strcmp(params, "off", true) == 0) && GetPVarFloat(playerid, "WatchLastx") == 0 && GetPVarFloat(playerid, "WatchLasty") == 0 && GetPVarFloat(playerid, "WatchLastz") == 0 && GetPVarInt(playerid, "WatchLastVW") == 0 && GetPVarInt(playerid, "WatchLastInt") == 0)
	{
	GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
	vw = GetPlayerVirtualWorld(playerid);
	int = GetPlayerInterior(playerid);

	SetPVarFloat(playerid, "WatchLastx", Pos[0]);
	SetPVarFloat(playerid, "WatchLasty", Pos[1]);
	SetPVarFloat(playerid, "WatchLastz", Pos[2]);
	SetPVarInt(playerid, "WatchLastInt", int);
	SetPVarInt(playerid, "WatchLastVW", vw);
	}

	// GENERAL LOCATIONS
	if(strcmp(params, "gym", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Ganton gym.");
		SetPlayerPos(playerid, 2212.61, -1730.57, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2208.67, -1733.71, 27.48);
		SetPlayerCameraLookAt(playerid, 2225.25, -1723.1, 13.56);
	}
	else if(strcmp(params, "lspd", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem LSPD.");
		SetPlayerPos(playerid, 1504.23, -1700.17, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1500.21, -1691.75, 38.38);
		SetPlayerCameraLookAt(playerid, 1541.46, -1676.17, 13.55);
	}
	else if(strcmp(params, "allsaints", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem All Saints General Hospital.");
		SetPlayerPos(playerid, 1201.12, -1324, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1207.39, -1294.71, 24.61);
		SetPlayerCameraLookAt(playerid, 1181.72, -1322.65, 13.58);
	}
	else if(strcmp(params, "countygen", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem County General Hospital.");
		SetPlayerPos(playerid, 1989.24, -1461.38, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1981.79, -1461.55, 31.93);
		SetPlayerCameraLookAt(playerid, 2021.23, -1427.48, 13.97);
	}
	else if(strcmp(params, "grove", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Grove Street.");
		SetPlayerPos(playerid, 2489.09, -1669.88, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2459.82, -1652.68, 26.45);
		SetPlayerCameraLookAt(playerid, 2489.09, -1669.88, 13.34);
	}
	else if(strcmp(params, "tgb", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Ten Green Bottles.");
		SetPlayerPos(playerid, 2319.09, -1650.90, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2336.31, -1664.76, 24.98);
		SetPlayerCameraLookAt(playerid, 2319.09, -1650.90, 14.16);
	}
	else if(strcmp(params, "bank", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Los Santos bank.");
		SetPlayerPos(playerid, 1466.24, -1023.05, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1502.28, -1044.47, 31.19);
		SetPlayerCameraLookAt(playerid, 1466.24, -1023.05, 23.83);
	}
	else if(strcmp(params, "motel", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Jefferson motel.");
		SetPlayerPos(playerid, 2215.73, -1163.39, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2203.05, -1152.81, 37.03);
		SetPlayerCameraLookAt(playerid, 2215.73, -1163.39, 25.73);
	}
	else if(strcmp(params, "cityhall", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Los Santos City Hall.");
		SetPlayerPos(playerid, 1478.936035, -1746.446655, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1447.461669, -1717.788085, 44.047473);
		SetPlayerCameraLookAt(playerid, 1478.936035, -1746.446655, 14.347633);
	}
	else if(strcmp(params, "mall", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Los Santos Mall.");
		SetPlayerPos(playerid, 1127.245483, -1451.613891, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1092.614868, -1499.197998, 42.018226);
		SetPlayerCameraLookAt(playerid, 1127.245483, -1451.613891, 15.796875);
	}


	// VIP LOCATIONS
	else if(strcmp(params, "lsvip", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the Los Santos VIP entrance.");
		SetPlayerPos(playerid, 1809.888427, -1570.615844, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1861.195190, -1533.169677, 33.800296);
		SetPlayerCameraLookAt(playerid, 1809.888427, -1570.615844, 13.465585);
	}
	else if(strcmp(params, "sfvip", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the San Fierro VIP entrance.");
		SetPlayerPos(playerid, -2437.302490, 508.727020, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, -2410.812011, 488.762603, 40.148445);
		SetPlayerCameraLookAt(playerid, -2437.302490, 508.727020, 29.933441);
	}
	else if(strcmp(params, "loungeview1", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the VIP Lounge.");
		SetPlayerPos(playerid, 2526.647949, 1431.128417, 7754.650390);
		SetPlayerInterior(playerid, 1);
		PlayerInfo[playerid][pInt] = 1;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2572.895996, 1424.583007, 7705.613769);
		SetPlayerCameraLookAt(playerid, 2555.148681, 1407.475708, 7699.584472);
	}
	else if(strcmp(params, "loungeview2", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the VIP Lounge.");
		SetPlayerPos(playerid, 2526.647949, 1431.128417, 7754.650390);
		SetPlayerInterior(playerid, 1);
		PlayerInfo[playerid][pInt] = 1;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2488.598388, 1419.864868, 7703.525390);
		SetPlayerCameraLookAt(playerid, 2519.420410, 1418.585693, 7697.718261);
	}
	else if(strcmp(params, "goldlounge", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the VIP Gold+ Lounge.");
  		SetPlayerPos(playerid, 2864.634277, 2290.584960, 1272.007568);
		SetPlayerInterior(playerid, 1);
		PlayerInfo[playerid][pInt] = 1;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid,2787.102050, 2392.162841, 1243.898681);
		SetPlayerCameraLookAt(playerid,2801.281982, 2404.575683, 1240.531127);
	}
	else if(strcmp(params, "vipgarage", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the VIP Garage.");
  		SetPlayerPos(playerid, -4412.440429, 867.361694, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, -4437.200683, 870.038269, 989.548767);
		SetPlayerCameraLookAt(playerid, -4412.440429, 867.361694, 986.708435);
	}
	// Points (mp1, df, mf1, dh, mp2, cl, mf2, sfd, ffc)
	else if(strcmp(params, "mp1", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Materials Pickup 1.");
  		SetPlayerPos(playerid, 1423.773437, -1320.386962, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 1411.689941, -1352.002929, 24.477527);
		SetPlayerCameraLookAt(playerid, 1423.773437, -1320.386962, 13.554687);
	}
	else if(strcmp(params, "df", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Drug Factory.");
  		SetPlayerPos(playerid, 2206.402587, 1582.398681, -80.0);
		SetPlayerInterior(playerid, 1);
		PlayerInfo[playerid][pInt] = 1;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2222.844482, 1590.667968, 1002.612915);
		SetPlayerCameraLookAt(playerid, 2206.402587, 1582.398681, 999.976562);
	}
	else if(strcmp(params, "mf1", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Materials Factory 1.");
  		SetPlayerPos(playerid, 2172.315185, -2263.781250, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2206.363769, -2262.568359, 24.240808);
		SetPlayerCameraLookAt(playerid, 2172.315185, -2263.781250, 13.335824);
	}
	else if(strcmp(params, "dh", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the Drug House.");
  		SetPlayerPos(playerid, 323.577026, 1118.344116, -80.0);
		SetPlayerInterior(playerid, 5);
		PlayerInfo[playerid][pInt] = 5;
		SetPlayerVirtualWorld(playerid, 371);
		PlayerInfo[playerid][pVW] = 371;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 316.387817, 1123.946289, 1085.046020);
		SetPlayerCameraLookAt(playerid, 323.577026, 1118.344116, 1083.882812);
	}
	else if(strcmp(params, "mp2", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Materials Pickup 2.");
  		SetPlayerPos(playerid, 2390.212402, -2008.328491, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2410.285644, -2013.919433, 21.716161);
		SetPlayerCameraLookAt(playerid, 2390.212402, -2008.328491, 13.553703);
	}
	else if(strcmp(params, "cl", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Crack Lab.");
  		SetPlayerPos(playerid, 2346.013916, -1185.367065, -80.0);
		SetPlayerInterior(playerid, 5);
		PlayerInfo[playerid][pInt] = 5;
		SetPlayerVirtualWorld(playerid, 371);
		PlayerInfo[playerid][pVW] = 371;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2342.012207, -1180.969848, 1029.412353);
		SetPlayerCameraLookAt(playerid, 2346.013916, -1185.367065, 1027.976562);
	}
	else if(strcmp(params, "mf2", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Materials Factory 2.");
  		SetPlayerPos(playerid, 2282.298828, -1110.143798, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, 2306.088623, -1133.968627, 52.929584);
		SetPlayerCameraLookAt(playerid, 2282.298828, -1110.143798, 37.976562);
	}
	else if(strcmp(params, "sfd", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem the San Fierro Docks.");
  		SetPlayerPos(playerid, -1576.488159, 50.301193, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, -1569.082153, 96.206344, 34.091339);
		SetPlayerCameraLookAt(playerid, -1576.488159, 50.301193, 17.328125);
	}
	else if(strcmp(params, "ffc", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban dang xem Fossil Fuel Company.");
  		SetPlayerPos(playerid, -2139.215087, -248.235076, -80.0);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pVW] = 0;
		TogglePlayerControllable(playerid,0);
		SetPlayerCameraPos(playerid, -2170.527832, -246.948257, 40.965312);
		SetPlayerCameraLookAt(playerid, -2139.215087, -248.235076, 36.515625);
	}
	// OFF
	else if(strcmp(params, "off", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong xem khu vuc nao ca.");
		SetPlayerPos(playerid, GetPVarFloat(playerid, "WatchLastx"), GetPVarFloat(playerid, "WatchLasty"), GetPVarFloat(playerid, "WatchLastz"));
		SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "WatchLastVW"));
		PlayerInfo[playerid][pVW] = GetPVarInt(playerid, "WatchLastVW");
		SetPlayerInterior(playerid, GetPVarInt(playerid, "WatchLastInt"));
		PlayerInfo[playerid][pInt] = GetPVarInt(playerid, "WatchLastInt");
		SetPlayerFacingAngle(playerid, 270.0);
		SetCameraBehindPlayer(playerid);
		TogglePlayerControllable(playerid,1);
		DeletePVar(playerid,"WatchLastx");
		DeletePVar(playerid,"WatchLasty");
		DeletePVar(playerid,"WatchLastz");
		DeletePVar(playerid,"WatchLastVW");
		DeletePVar(playerid,"WatchLastInt");
	}
	return 1;
}

CMD:goto(playerid, params[])
{
    if(EventKernel[EventCreator] == playerid || PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pHelper] >= 2)
	{
		if(isnull(params))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /goto [location]");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Locations 1: LS,SF,LV,RC,ElQue,Bayside,LSVIP,SFVIP,LVVIP,Famed,MHC,stadium1");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Locations 2: stadium2,stadium3,stadium4,int1,mark,mark2,sfairport,dillimore,cave,doc,bank,mall,allsaints");
			SendClientMessageEx(playerid, COLOR_GRAD3, "Locations 3: countygen,cracklab,gym,rodeo,flint,idlewood,fbi,island,demorgan,doc,icprison,oocprison");
			SendClientMessageEx(playerid, COLOR_GRAD4, "Locations 4: garagesm,garagemed,garagelg,garagexlg");
			SendClientMessageEx(playerid, COLOR_GRAD4, "Locations JOB: tradego,banca,daoda,lumberjack,thuethuyen,chebienminer,miner,trucker,pizza,");
			return 1;
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the thuc hien dieu nay khi dang theo doi nguoi choi.");
			return 1;
		}
		if(strcmp(params,"bocvac",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1809.9210,-2062.8374,13.5558);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1809.9210,-2062.8374,13.5558);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"tradego",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1099.8743,-1471.8141,15.7969);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1099.8743,-1471.8141,15.7969);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"banca",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 387.3355,-1899.0438,7.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 387.3355,-1899.0438,7.8359);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"daoda",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 978.6301,-2146.9619,13.0938);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 978.6301,-2146.9619,13.0938);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"lumberjack",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2561.0317,-907.6964,83.6735);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2561.0317,-907.6964,83.6735);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"thuethuyen",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 423.7567,-1889.8831,2.0595);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,  423.7567,-1889.8831,2.0595);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"chebienminer",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2178.9343,-2255.2566,14.7734);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,  2178.9343,-2255.2566,14.7734);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"miner",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,2285.7766,-2216.3894,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,  2285.7766,-2216.3894,13.5469);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"cansa",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -781.1538,-152.2603,64.8247);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,  -781.1538,-152.2603,64.8247);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"trucker",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2197.7661,-2663.6111,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2197.7661,-2663.6111,13.5469);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"pizza",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2094.0977,-1805.6383,13.5503);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2094.0977,-1805.6383,13.5503);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		if(strcmp(params,"ls",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"garagexlg",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,1111.0139,1546.9510,5290.2793);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1111.0139,1546.9510,5290.2793);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"garagelg",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,1192.8501,1540.0295,5290.2871);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1192.8501,1540.0295,5290.2871);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"garagemed",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,1069.1473,1582.1029,5290.2529);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1069.1473,1582.1029,5290.2529);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"garagesm",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar,1198.1407,1589.2153,5290.2871);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1198.1407,1589.2153,5290.2871);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"cave",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1993.01, -1580.44, 86.39);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1993.01, -1580.44, 86.39);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"sfairport",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1412.5375,-301.8998,14.1411);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1412.5375,-301.8998,14.1411);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"sf",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1605.0,720.0,12.0);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1605.0,720.0,12.0);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"lv",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"island",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1081.0,4297.9,4.4);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1081.0,4297.9,4.4);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"cracklab",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2348.2871, -1146.8298, 27.3183);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2348.2871, -1146.8298, 27.3183);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"bank",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1487.91, -1030.60, 23.66);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1487.91, -1030.60, 23.66);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"allsaints",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1192.78, -1292.68, 13.38);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1192.78, -1292.68, 13.38);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"countygen",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2000.05, -1409.36, 16.99);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2000.05, -1409.36, 16.99);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"gym",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 2227.60, -1674.89, 14.62);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 2227.60, -1674.89, 14.62);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

   		}
		else if(strcmp(params,"fbi",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 344.77,-1526.08,33.28);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 344.77,-1526.08,33.28);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
  		else if(strcmp(params,"rc",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1253.70, 343.73, 19.41);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1253.70, 343.73, 19.41);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

   		}
     	else if(strcmp(params,"lsvip",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1810.39, -1601.15, 13.54);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1810.39, -1601.15, 13.54);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
     	else if(strcmp(params,"sfvip",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -2433.63, 511.45, 30.38);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -2433.63, 511.45, 30.38);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
       	else if(strcmp(params,"lvvip",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1875.7731, 1366.0796, 16.8998);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1875.7731, 1366.0796, 16.8998);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"demorgan",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 112.67, 1917.55, 18.72);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 112.67, 1917.55, 18.72);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"icprison",true) == 0)
		{
			SetPlayerPos(playerid, 1538.0677, 1350.3748, 1510.9160);
			//SetPlayerInterior(playerid,10);
			PlayerInfo[playerid][pInt] = 10;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(params, "doc", true) == 0)
		{
			SetPlayerPos(playerid, -2029.2322, -78.3302, 35.3203);
			SetPlayerInterior(playerid, 0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(params,"oocprison",true) == 0)
		{
			SetPlayerPos(playerid, 1538.0677, 1350.3748, 1510.9160);
			SetPlayerInterior(playerid,1);
			PlayerInfo[playerid][pInt] = 1;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");

		}
		else if(strcmp(params,"stadium1",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1424.93, -664.59, 1059.86);
				LinkVehicleToInterior(tmpcar, 4);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1424.93, -664.59, 1059.86);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,4);
			PlayerInfo[playerid][pInt] = 4;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"stadium2",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1395.96, -208.20, 1051.28);
				LinkVehicleToInterior(tmpcar, 7);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1395.96, -208.20, 1051.28);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,7);
			PlayerInfo[playerid][pInt] = 7;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"stadium3",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1410.72, 1591.16, 1052.53);
				LinkVehicleToInterior(tmpcar, 14);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1410.72, 1591.16, 1052.53);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,14);
			PlayerInfo[playerid][pInt] = 14;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"stadium4",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1394.20, 987.62, 1023.96);
				LinkVehicleToInterior(tmpcar, 15);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
    		}
			else
			{
				SetPlayerPos(playerid, -1394.20, 987.62, 1023.96);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,15);
			PlayerInfo[playerid][pInt] = 15;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"int1",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1416.107000,0.268620,1000.926000);
				LinkVehicleToInterior(tmpcar, 1);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1416.107000,0.268620,1000.926000);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,1);
			PlayerInfo[playerid][pInt] = 1;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"mark",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
				LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt1"));
			}
			else
			{
				SetPlayerPos(playerid, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
			}
			SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt1"));
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(params,"mark2",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
				LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt2"));
			}
			else
			{
				SetPlayerPos(playerid, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
			}
			SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt2"));
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(params,"mall",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1133.71,-1464.52,15.77);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1133.71,-1464.52,15.77);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"elque",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -1446.5997,2608.4478,55.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -1446.5997,2608.4478,55.8359);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"bayside",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -2465.1348,2333.6572,4.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -2465.1348,2333.6572,4.8359);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;

		}
		else if(strcmp(params,"dillimore",true) == 0)
		{
		 	if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 634.9734, -594.6402, 16.3359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 634.9734, -594.6402, 16.3359);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"famed",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1020.29, -1129.06, 23.87);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1020.29, -1129.06, 23.87);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"rodeo",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 587.0106,-1238.3374,17.8049);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 587.0106,-1238.3374,17.8049);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"flint",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, -108.1058,-1172.5293,2.8906);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, -108.1058,-1172.5293,2.8906);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"idlewood",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, 1955.1357,-1796.8896,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, 1955.1357,-1796.8896,13.5469);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
		else if(strcmp(params,"mhc",true) == 0)
		{
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				Player_StreamPrep(playerid, 1700.2124, 1461.1771, 1145.7766, FREEZE_TIME);
				SetVehiclePos(tmpcar, 1700.2124, 1461.1771, 1145.7766);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				Player_StreamPrep(playerid, 1649.7531, 1463.1614, 1151.9687, FREEZE_TIME);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			SetPlayerVirtualWorld(playerid, 0);
			PlayerInfo[playerid][pVW] = 0;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:sendto(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pHelper] >= 2)
	{
		new string[128], location[32], giveplayerid;
		if(sscanf(params, "s[32]u", location, giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sendto [location] [player]");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Locations 1: pizza,trucker,cansaLS,SF,LV,RC,ElQue,Bayside,LSVIP,SFVIP,LVVIP,MHC,Famed,stadium1");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Locations 2: stadium2,stadium3,stadium4,int1,mark,mark2,sfairport,dillimore,cave,doc,bank,mall,allsaints");
			SendClientMessageEx(playerid, COLOR_GRAD3, "Locations 3: countygen,cracklab,gym,rodeo,flint,idlewood,fbi,island,demorgan,doc,icprison,oocprison");
			SendClientMessageEx(playerid, COLOR_GRAD4, "Locations JOB: tradego,banca,daoda,lumberjack,thuethuyen,chebienminer,miner,trucker,pizza,");
			return 1;
		}
		/*if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin])
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the su dung dieu nay voi mot quan tri vien.");
			return 1;
		}*/
		if (!IsPlayerConnected(giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le");
			return 1;
		}
		if(GetPlayerState(giveplayerid) == PLAYER_STATE_SPECTATING)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi nay dang o che do theo doi.");
			return 1;
		}
		if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
		{
		    SetPVarInt(playerid, "tempPBP", giveplayerid);
		    format(string, sizeof(string), "%s (ID: %d) hien dang trong arena.\n\nBan co muon nguoi nay thoat ra khong?", GetPlayerNameEx(giveplayerid), giveplayerid);
		    ShowPlayerDialog(playerid, PBFORCE, DIALOG_STYLE_MSGBOX, "Paintball", string, "Dong y", "Khong");
		    return 1;
		}
        if(strcmp(location,"miner",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2285.7766,-2216.3894,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid,2285.7766,-2216.3894,13.5469);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi  miner.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"chebienminer",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2178.9343,-2255.2566,14.7734);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2178.9343,-2255.2566,14.7734);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi che bien miner.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"thuethuyen",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 423.7567,-1889.8831,2.0595);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 423.7567,-1889.8831,2.0595);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi thue thuyen.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"lumberjack",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2561.0317,-907.6964,83.6735);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2561.0317,-907.6964,83.6735);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi lumber jack.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"daoda",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 978.6301,-2146.9619,13.0938);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 978.6301,-2146.9619,13.0938);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi dao da miner.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"banca",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 387.3355,-1899.0438,7.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 387.3355,-1899.0438,7.8359);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi ban ca.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"tradego",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1099.8743,-1471.8141,15.7969);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1099.8743,-1471.8141,15.7969);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi trao doi go.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
        if(strcmp(location,"cansa",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -781.1538,-152.2603,64.8247);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -781.1538,-152.2603,64.8247);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi can sa.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		if(strcmp(location,"pizza",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2094.0977,-1805.6383,13.5503);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2094.0977,-1805.6383,13.5503);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Pizza.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"trucker",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2197.7661,-2663.6111,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2197.7661,-2663.6111,13.5469);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Trucker.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"ls",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1529.6,-1691.2,13.3);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Los Santos.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"cave",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1993.01, -1580.44, 86.39);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1993.01, -1580.44, 86.39);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi crate cave.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
  		else if(strcmp(location, "sfairport", true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1412.5375, -301.8998, 14.1411);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1412.5375,-301.8998,14.1411);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi SF Airport.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location, "doc", true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -2029.2322, -78.3302, 35.3203);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid,-2029.2322, -78.3302, 35.32034);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi DoC.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location, "cracklab", true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2348.2871, -1146.8298, 27.3183);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2348.2871, -1146.8298, 27.3183);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Crack Lab.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"sf",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1605.0,720.0,12.0);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1605.0,720.0,12.0);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi San Fierro.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"dillimore",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 634.9734, -594.6402, 16.3359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 634.9734, -594.6402, 16.3359);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Dillimore.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"lv",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1699.2,1435.1, 10.7);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Las Venturas.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"island",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1081.0,4297.9,4.4);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1081.0,4297.9,4.4);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the Crate Island.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"bank",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1487.91, -1030.60, 23.66);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1487.91, -1030.60, 23.66);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the bank.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"allsaints",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1192.78, -1292.68, 13.38);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1192.78, -1292.68, 13.38);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi All Saints.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"countygen",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2000.05, -1409.36, 16.99);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2000.05, -1409.36, 16.99);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi County General.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"gym",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 2227.60, -1674.89, 14.62);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 2227.60, -1674.89, 14.62);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Ganton Gym.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

   		}
		else if(strcmp(location,"fbi",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 344.77,-1526.08,33.28);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 344.77,-1526.08,33.28);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the FBI HQ.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
  		else if(strcmp(location,"rc",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1253.70, 343.73, 19.41);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1253.70, 343.73, 19.41);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Red County.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

   		}
     	else if(strcmp(location,"lsvip",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1810.39, -1601.15, 13.54);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1810.39, -1601.15, 13.54);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi LS VIP.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
     	else if(strcmp(location,"sfvip",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -2433.63, 511.45, 30.38);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -2433.63, 511.45, 30.38);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi SF VIP.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
       	else if(strcmp(location,"lvvip",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1875.7731, 1366.0796, 16.8998);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1875.7731, 1366.0796, 16.8998);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi LV VIP.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"demorgan",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 112.67, 1917.55, 18.72);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 112.67, 1917.55, 18.72);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi DeMorgan.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"icprison",true) == 0)
		{
			if(PlayerInfo[giveplayerid][pJailTime] > 0)
			{
				SetPlayerInterior(giveplayerid, 10);
				new rand = random(sizeof(DocPrison));
				SetPlayerFacingAngle(giveplayerid, 0);
				SetPlayerPos(giveplayerid, DocPrison[rand][0], DocPrison[rand][1], DocPrison[rand][2]);
				PhoneOnline[giveplayerid] = 1;
				PlayerInfo[giveplayerid][pWantedLevel] = 0;
				SetPlayerToTeamColor(giveplayerid);
				SetPlayerWantedLevel(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				SetPlayerToTeamColor(giveplayerid);
				Player_StreamPrep(giveplayerid, DocPrison[rand][0], DocPrison[rand][1], DocPrison[rand][2], FREEZE_TIME);
			}
			else
			{
				SetPlayerPos(giveplayerid, -2069.76, -200.05, 991.53);
				SetPlayerInterior(giveplayerid,10);
				PlayerInfo[giveplayerid][pInt] = 10;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi IC prison.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");

		}
		else if(strcmp(location,"oocprison",true) == 0)
		{
			if(PlayerInfo[giveplayerid][pJailTime] > 0)
			{
				SetPlayerInterior(giveplayerid,1);
				PlayerInfo[giveplayerid][pInt] = 1;
				ResetPlayerWeaponsEx(giveplayerid);
				PlayerInfo[giveplayerid][pWantedLevel] = 0;
				SetPlayerWantedLevel(giveplayerid, 0);
				PhoneOnline[giveplayerid] = 1;
				new rand = random(sizeof(OOCPrisonSpawns));
				Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
				SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
				SetPlayerSkin(giveplayerid, 50);
				SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
				Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
			}
			else
			{
				SetPlayerPos(giveplayerid, -298.13, 1881.85, 29.89);
				SetPlayerInterior(giveplayerid,1);
				PlayerInfo[giveplayerid][pInt] = 1;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi OOC prison.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");

		}
		else if(strcmp(location,"stadium1",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1424.93, -664.59, 1059.86);
				LinkVehicleToInterior(tmpcar, 4);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1424.93, -664.59, 1059.86);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Stadium 1.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,4);
			PlayerInfo[giveplayerid][pInt] = 4;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"stadium2",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1395.96, -208.20, 1051.28);
				LinkVehicleToInterior(tmpcar, 7);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1395.96, -208.20, 1051.28);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Stadium 2.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,7);
			PlayerInfo[giveplayerid][pInt] = 7;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"stadium3",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1410.72, 1591.16, 1052.53);
				LinkVehicleToInterior(tmpcar, 14);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1410.72, 1591.16, 1052.53);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Stadium 3.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,14);
			PlayerInfo[giveplayerid][pInt] = 14;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"stadium4",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1394.20, 987.62, 1023.96);
				LinkVehicleToInterior(tmpcar, 15);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
    		}
			else
			{
				SetPlayerPos(giveplayerid, -1394.20, 987.62, 1023.96);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Stadium 4.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,15);
			PlayerInfo[giveplayerid][pInt] = 15;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"int1",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1416.107000,0.268620,1000.926000);
				LinkVehicleToInterior(tmpcar, 1);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1416.107000,0.268620,1000.926000);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Int 1.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid,1);
			PlayerInfo[giveplayerid][pInt] = 1;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"mark",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
				LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt1"));
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, GetPVarFloat(playerid, "tpPosX1"), GetPVarFloat(playerid, "tpPosY1"), GetPVarFloat(playerid, "tpPosZ1"));
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi your first marked position.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt1"));
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(location,"mark2",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
				LinkVehicleToInterior(tmpcar, GetPVarInt(playerid, "tpInt2"));
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, GetPVarFloat(playerid, "tpPosX2"), GetPVarFloat(playerid, "tpPosY2"), GetPVarFloat(playerid, "tpPosZ2"));
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi your second marked position.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SetPlayerInterior(playerid, GetPVarInt(playerid, "tpInt2"));
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else if(strcmp(location,"mall",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1133.71,-1464.52,15.77);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1133.71,-1464.52,15.77);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the mall.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"elque",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -1446.5997,2608.4478,55.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -1446.5997,2608.4478,55.8359);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi El Quebrados.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;

		}
		else if(strcmp(location,"bayside",true) == 0)
		{
		 	if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -2465.1348,2333.6572,4.8359);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -2465.1348,2333.6572,4.8359);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Bayside.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"famed",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1020.29, -1129.06, 23.87);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1020.29, -1129.06, 23.87);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the Famed HQ.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"rodeo",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 587.0106,-1238.3374,17.8049);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 587.0106,-1238.3374,17.8049);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Rodeo.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"flint",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, -108.1058,-1172.5293,2.8906);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, -108.1058,-1172.5293,2.8906);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Flint County Gas Station.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"idlewood",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, 1955.1357,-1796.8896,13.5469);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid, 1955.1357,-1796.8896,13.5469);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi Idlewood Gas Station.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
		else if(strcmp(location,"mhc",true) == 0)
		{
			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				Player_StreamPrep(giveplayerid, 1700.2124, 1461.1771, 1145.7766, FREEZE_TIME);
				SetVehiclePos(tmpcar, 1700.2124, 1461.1771, 1145.7766);
				LinkVehicleToInterior(tmpcar, 0);
				SetVehicleVirtualWorld(tmpcar, 0);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				Player_StreamPrep(giveplayerid, 1649.7531, 1463.1614, 1151.9687, FREEZE_TIME);
			}
			format(string, sizeof(string), " Ban da dich chuyen %s toi the Mile High Club.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(giveplayerid,0);
			PlayerInfo[giveplayerid][pInt] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			PlayerInfo[giveplayerid][pVW] = 0;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:bigears(playerid, params[])
{
    if( PlayerInfo[playerid][pAdmin] >= 2) {
        ShowPlayerDialog(playerid, BIGEARS, DIALOG_STYLE_LIST, "Please choose an item to proceed", "Global Chat\nOOC Chat\nIC Chat\nFaction Chat\nFamily Chat\nPlayer\nPrivate Messages\nDisable Bigears", "Lua chon", "Huy bo");
    }
    return 1;
}


CMD:cc(playerid, params[]) return cmd_clearchat(playerid, params);
CMD:clearchat(playerid, params[])
{
 	if(PlayerInfo[playerid][pAdmin] >= 2)
 	{
  		for(new i = 0; i < 100; i++)
  		{
   			SendClientMessageToAll(-1, " ");
  		}
 	}
 	return 1;
}

CMD:xoasao(playerid, params[]) return cmd_clearall(playerid, params);
CMD:clearall(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 6) {
        foreach(new i: Player)
		{
            PlayerInfo[i][pWantedLevel] = 0;
            SetPlayerToTeamColor(i);
            SetPlayerWantedLevel(i, 0);
            ClearCrimes(i);
        }
        SendClientMessageEx(playerid,COLOR_GRAD1, "Ban da xoa tat ca Wanted cho ban.");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:clearallreports(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 5) {
        new string[128];
        ClearReports();
        SendClientMessageEx(playerid,COLOR_GRAD1, "You have cleared all the active reports.");
        format(string, sizeof(string), "[MAYCHU] %s has cleared all the pending reports.", GetPlayerNameEx(playerid));
        ABroadCast(COLOR_LIGHTRED, string, 2);
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:savechars(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 4) {
        SaveEventPoints();
        mysql_SaveCrates();
        SendClientMessageEx(playerid, COLOR_YELLOW, "All Crates Saved sucessfully.");
        SaveAllAccountsUpdate();
		//g_mysql_DumpAccounts();
        SendClientMessageEx(playerid, COLOR_YELLOW, "Update Process Started - Wait for Account Saving Finish Confirmation.");
        SaveHouses();
        SendClientMessageEx(playerid, COLOR_YELLOW, "House saving process started.");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:speclotto(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) {
	    SendClientMessage(playerid, COLOR_GREY, "You don't have access to this command.");
	}
	else if(SpecLotto) {
	    SendClientMessage(playerid, COLOR_GREY, "A special lottery has already been started.");
	}
	else {

	    new
	        prize[64],
	        string[128];

	    if(sscanf(params, "s[64]", prize)) {
	        SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /speclotto [text]");
		}
		else {
		    SpecLotto = 1;
		    LottoPrize = prize;
		    format(string, sizeof(string), "[MAYCHU] %s has started a special lottery. (Prize: %s)", GetPlayerNameEx(playerid), prize);
			ABroadCast(COLOR_YELLOW, string, 4);
			return 1;
		}
	}
	return 1;
}

CMD:cancelspeclotto(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) {
	    SendClientMessage(playerid, COLOR_GREY, "You don't have access to this command.");
	}
	else if(!SpecLotto) {
	    SendClientMessage(playerid, COLOR_GREY, "No special lottery.");
	}
	else {
	    SpecLotto = 0;
	    LottoPrize = "";
	}
	return 1;
}

CMD:setcolor(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 5)
	{
        ShowPlayerDialog(playerid, COLORMENU, DIALOG_STYLE_LIST, "Color Menu", "Blue\nBlack\nRed\nOrange\nPink\nPurple\nGreen\nYellow\nWhite", "Lua chon", "Huy bo");
    }
    else
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:mark(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2) {

		new
			Float: f_PlayerPos[3];

		GetPlayerPos(playerid, f_PlayerPos[0], f_PlayerPos[1], f_PlayerPos[2]);
		SetPVarFloat(playerid, "tpPosX1", f_PlayerPos[0]);
		SetPVarFloat(playerid, "tpPosY1", f_PlayerPos[1]);
		SetPVarFloat(playerid, "tpPosZ1", f_PlayerPos[2]);

		SetPVarInt(playerid, "tpInt1", GetPlayerInterior(playerid));
        SendClientMessageEx(playerid, COLOR_GRAD1, "Teleporter destination set!");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:mark2(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 2) {

		new
			Float: f_PlayerPos[3];

		GetPlayerPos(playerid, f_PlayerPos[0], f_PlayerPos[1], f_PlayerPos[2]);
		SetPVarFloat(playerid, "tpPosX2", f_PlayerPos[0]);
		SetPVarFloat(playerid, "tpPosY2", f_PlayerPos[1]);
		SetPVarFloat(playerid, "tpPosZ2", f_PlayerPos[2]);

		SetPVarInt(playerid, "tpInt2", GetPlayerInterior(playerid));
        SendClientMessageEx(playerid, COLOR_GRAD1, "Teleporter destination set!");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:gotojet(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 3) {
        if (GetPlayerState(playerid) == 2) {
            new tmpcar = GetPlayerVehicleID(playerid);
            SetVehiclePos(tmpcar, 1.71875, 30.4062, 1200.34);
        }
        else {
            SetPlayerPos(playerid, 1.71875, 30.4062, 1200.34);
        }
        SetPlayerInterior(playerid,1);
        SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
    }
    else {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}
CMD:eventreset(playerid, params[])
{
    if( PlayerInfo[ playerid ][ pAdmin ] >= 5 ) {
        new string[128];
        if( EventKernel[EventAdvisor] >= 1 ) {
            EventKernel[EventAdvisor] = 0;
            KillTimer( EventTimerHandle );
            format( string, sizeof(string), "[MAYCHU] %s has reset the event timer.", GetPlayerNameEx( playerid ) );
            ABroadCast( COLOR_YELLOW, string, 4 );
        }
        else {
            SendClientMessageEx( playerid, COLOR_GREY, "The timeout expired before you attempted to use this command. You can set-up an event." );
        }
    }
    return 1;
}
CMD:denyevent(playerid, params[])
{
    if( PlayerInfo[ playerid ][ pAdmin ] >= 4 ) {
        new string[128];
        SendClientMessageEx( EventKernel[EventRequest], COLOR_GRAD2, "Your request was denied." );
        EventKernel[EventRequest] = INVALID_PLAYER_ID;
        EventKernel[EventCreator] = INVALID_PLAYER_ID;
        format( string, sizeof( string ), "[MAYCHU] %s has denied the event request.", GetPlayerNameEx(playerid) );
        ABroadCast( COLOR_YELLOW, string, 4 );
        for(new i; i < sizeof(EventKernel[EventStaff]); i++) {
            if(EventKernel[EventStaff][i] != INVALID_PLAYER_ID) {
                SetPlayerWeapons(EventKernel[EventStaff][i]);
                SetPlayerPos(EventKernel[EventStaff][i],EventFloats[EventKernel[EventStaff][i]][1],EventFloats[EventKernel[EventStaff][i]][2],EventFloats[EventKernel[EventStaff][i]][3]);
                //SetPlayerVirtualWorld(EventKernel[EventStaff][i], EventMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAn);
                //SetPlayerFacingAngle(EventKernel[EventStaff][i], EventFloats[EventKernel[EventStaff][i]][0]);
                //SetPlayerInterior(EventKernel[EventStaff][i],EventMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAn]);
                SetPlayerHealth(EventKernel[EventStaff][i], EventFloats[EventKernel[EventStaff][i]][4]);
                if(EventFloats[EventKernel[EventStaff][i]][5] > 0) {
                	SetPlayerArmor(EventKernel[EventStaff][i], EventFloats[EventKernel[EventStaff][i]][5]);
                }
                for(new d = 0; d < 6; d++) {
                    EventFloats[EventKernel[EventStaff][i]][d] = 0.0;
                }
                //EventMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAn = 0;
                //EventMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAn] = 0;
                EventKernel[EventStaff][i] = INVALID_PLAYER_ID;
                ResetPlayerWeapons( i );
            }
        }

        EventKernel[ EventStatus ] = 0;
        EventKernel[ EventType ] = 0;
        EventKernel[ EventLimit ] = 0;
        EventKernel[ EventPlayers ] = 0;
        EventKernel[ EventWeapons ][0] = 0;
        EventKernel[ EventWeapons ][1] = 0;
        EventKernel[ EventWeapons ][2] = 0;
        EventKernel[ EventWeapons ][3] = 0;
        EventKernel[ EventWeapons ][4] = 0;
        EventKernel[EventCreator] = INVALID_PLAYER_ID;
        EventKernel[VipOnly] = 0;
        EventKernel[EventJoinStaff] = 0;
		EventKernel[EventCustomInterior] = 0;
    }

    return 1;
}

CMD:acceptevent(playerid, params[])
{
    if( PlayerInfo[ playerid ][ pAdmin ] >= 4 ) {
        if( EventKernel[ EventStatus ] == 0 ) {
            if(EventKernel[EventRequest] != INVALID_PLAYER_ID) {
                if(IsPlayerConnected(EventKernel[EventRequest])) {
                    if(EventKernel[EventCreator] != INVALID_PLAYER_ID) {
                        SendClientMessageEx(playerid, COLOR_GRAD2, "There's already someone making an event.");
                        return 1;
                    }
                    new string[128];
                    EventKernel[EventCreator] = EventKernel[EventRequest];
                    EventKernel[EventRequest] = INVALID_PLAYER_ID;
                    SetPVarInt( EventKernel[EventCreator], "EventToken", 1 );
                    SendClientMessageEx( EventKernel[EventCreator], COLOR_GRAD2, "Your event request has been accepted, use /seteventpos to change the event position, once you do it people will be able to /eventstaff." );
                    if(PlayerInfo[playerid][pHelper] >= 2) {
                        SendClientMessageEx( EventKernel[EventCreator], COLOR_GRAD2, "You now have temporary access to (/o)oc and /goto." );
                    }
                    format( string, sizeof( string ), "[MAYCHU] %s has approved the event request from %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(EventKernel[EventCreator]) );
                    ABroadCast( COLOR_YELLOW, string, 4 );
                    return 1;
                }
            }
        }
    }
    return 1;
}

CMD:approveevent(playerid, params[])
{
    if( PlayerInfo[ playerid ][ pAdmin ] >= 4 ) {
        if( EventKernel[ EventStartRequest ] == 1 ) {
            new string[128];
            EventKernel[ EventStatus ] = 1;
            EventKernel[EventStartRequest] = 0;
            SendClientMessageEx( EventKernel[EventCreator], COLOR_GRAD2, "Your event start request has been accepted, you can now use /announceevent to announce it to the server." );
            format( string, sizeof( string ), "[MAYCHU] %s has approved the event start request from %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(EventKernel[EventCreator]) );
            ABroadCast( COLOR_YELLOW, string, 4 );
            foreach(new i: Player)
			{
                if(PlayerInfo[i][pDonateRank] >= 3) {
                    SendClientMessageEx(i, COLOR_YELLOW, "* Gold+ VIP Feature: An event has been started! /joinevent to join early");
                }
            }
            return 1;
        }
    }
    return 1;
}

CMD:god(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new Float:health, Float:armor;
	    if(GetPVarType(playerid, "pGodMode"))
	    {
			health = GetPVarFloat(playerid, "pPreGodHealth");
			SetPlayerHealth(playerid,health);
			armor = GetPVarFloat(playerid, "pPreGodArmor");
			SetPlayerArmor(playerid, armor);
			DeletePVar(playerid, "pGodMode");
			DeletePVar(playerid, "pPreGodHealth");
			DeletePVar(playerid, "pPreGodArmor");
			SendClientMessage(playerid, COLOR_WHITE, "Bat tu tat");
		}
		else
		{
			GetPlayerHealth(playerid,health);
			SetPVarFloat(playerid, "pPreGodHealth", health);
			GetPlayerArmour(playerid,armor);
			SetPVarFloat(playerid, "pPreGodArmor", armor);
		    SetPlayerHealth(playerid, 0x7FB00000);
		    SetPlayerArmor(playerid, 0x7FB00000);
		    SetPVarInt(playerid, "pGodMode", 1);
		    SendClientMessage(playerid, COLOR_WHITE, "Bat tu bat");
		}
    }
	return 1;
}

CMD:resetmoney(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 99999)
    {
        new query[128], string[128];
        format(query, sizeof(query), "UPDATE `accounts` SET `Money` = '0'");
        mysql_function_query(MainPipeline, query, false, "OnQueryFinish", "i", playerid);

        SendClientMessageEx(playerid, COLOR_LIGHTRED, "[MAYCHU] Ban da set da quy cho toan the account server");

        format(string, sizeof(string), "[MAYCHU] %s da reset toan bo money server ve lai bang 0", GetPlayerNameEx(playerid));
        Log("logs/resetmoney.log", string);
    }else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay!");
    return 1;
}

/*
CMD:damagecheck(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	if(GetPVarType(playerid, "_dCheck")) {
		DeletePVar(playerid, "_dCheck");
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dung kiem tra thuong vong.");
		return 1;
	}
	new pID;
	if(sscanf(params, "u", pID)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /damagecheck [playerid]");
	if(!IsPlayerConnected(pID)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	new string[64];
	SetPVarInt(playerid, "_dCheck", pID);
	format(string, sizeof(string), "Ban se thay tat ca cac thuong vong cua %s.", GetPlayerNameEx(pID));
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	if(GetPVarInt(pID, "usingfirstaid") == 1) SendClientMessageEx(playerid, COLOR_ORANGE, "Note{ffffff}: Player is currently using a first aid kit.");
	return 1;
}
*/
CMD:lastshot(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new pID;
	if(sscanf(params, "u", pID)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /lastshot [playerid]");
	if(!IsPlayerConnected(pID)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	if(aLastShot[pID] == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Player was not shot yet.");
	new string[128];
	format(string, sizeof(string), "%s was last shot by %s (ID: %d).",GetPlayerNameEx(pID), GetPlayerNameEx(aLastShot[pID]), aLastShot[pID]);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:healnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4) {
		new string[128], radius, count;
		if(sscanf(params, "d", radius)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /healnear [radius]");
		if(radius < 1 || radius > 100)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Radius must be higher than 0 and lower than 100!");
			return 1;
		}
        foreach(new i: Player)
		{
            if(ProxDetectorS(radius, playerid, i)) {
                SetPlayerHealth(i, 100);
                count++;
            }
        }
        format(string, sizeof(string), "You have healed everyone (%d) nearby.", count);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:armornear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4) {
		new string[128], radius, count;
		if(sscanf(params, "d", radius)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /armornear [radius]");
		if(radius < 1 || radius > 100)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Radius must be higher than 0 and lower than 100!");
			return 1;
		}
        foreach(new i: Player)
		{
            if(ProxDetectorS(radius, playerid, i)) {
                SetPlayerArmor(i, 100);
                count++;
            }
        }
        format(string, sizeof(string), "You have given armor to everyone (%d) nearby.", count);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:pnsedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], choice[32], id, amount;
	if(sscanf(params, "s[32]dD", choice, id, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pnsedit [name] [id] [amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Position, GroupCost, RegCost, Delete");
		return 1;
	}

	if(id >= MAX_PAYNSPRAYS)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Invalid Pay N' Spray ID!");
		return 1;
	}

	if(strcmp(choice, "position", true) == 0)
	{
		if(PayNSprays[id][pnsStatus] == 0)
		{
			PayNSprays[id][pnsStatus] = 1;
		}
		GetPlayerPos(playerid, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ]);
		PayNSprays[id][pnsInt] = GetPlayerInterior(playerid);
		PayNSprays[id][pnsVW] = GetPlayerVirtualWorld(playerid);
		format(string, sizeof(string), "You have changed the position on Pay N' Spray #%d.", id);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		DestroyDynamicPickup(PayNSprays[id][pnsPickupID]);
		DestroyDynamic3DTextLabel(PayNSprays[id][pnsTextID]);
		DestroyDynamicMapIcon(PayNSprays[id][pnsMapIconID]);
		format(string, sizeof(string), "/repaircar\nRepair Cost -- Regular: $%s | Faction: $%s\nID: %d", number_format(PayNSprays[id][pnsRegCost]), number_format(PayNSprays[id][pnsGroupCost]), id);
		PayNSprays[id][pnsTextID] = CreateDynamic3DTextLabel(string, COLOR_RED, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ]+0.5,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, PayNSprays[id][pnsVW], PayNSprays[id][pnsInt], -1);
		PayNSprays[id][pnsPickupID] = CreateDynamicPickup(1239, 23, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ], PayNSprays[id][pnsVW]);
		PayNSprays[id][pnsMapIconID] = CreateDynamicMapIcon(PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ], 63, 0, PayNSprays[id][pnsVW], PayNSprays[id][pnsInt], -1, 500.0);
		SavePayNSpray(id);
		format(string, sizeof(string), "%s has edited Pay N' Spray ID %d's position.", GetPlayerNameEx(playerid), id);
		Log("logs/pnsedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "groupcost", true) == 0)
	{
		if(PayNSprays[id][pnsStatus] == 0)
		{
			format(string, sizeof(string), "Pay N' Spray #%d does not exist.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
		PayNSprays[id][pnsGroupCost] = amount;
		format(string, sizeof(string), "You have changed the group cost for Pay N' Spray #%d to $%s.", id, number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		DestroyDynamic3DTextLabel(PayNSprays[id][pnsTextID]);
		format(string, sizeof(string), "/repaircar\nRepair Cost -- Regular: $%s | Faction: $%s\nID: %d", number_format(PayNSprays[id][pnsRegCost]), number_format(PayNSprays[id][pnsGroupCost]), id);
		PayNSprays[id][pnsTextID] = CreateDynamic3DTextLabel(string, COLOR_RED, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ]+0.5,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, PayNSprays[id][pnsVW], PayNSprays[id][pnsInt], -1);
		SavePayNSpray(id);
		format(string, sizeof(string), "%s has changed the group cost on Pay N' Spray ID %d to $%s.", GetPlayerNameEx(playerid), id, number_format(amount));
		Log("logs/pnsedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "regcost", true) == 0)
	{
		if(PayNSprays[id][pnsStatus] == 0)
		{
			format(string, sizeof(string), "Pay N' Spray #%d does not exist.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
		PayNSprays[id][pnsRegCost] = amount;
		format(string, sizeof(string), "You have changed the regular cost for Pay N' Spray #%d to $%s.", id, number_format(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		DestroyDynamic3DTextLabel(PayNSprays[id][pnsTextID]);
		format(string, sizeof(string), "/repaircar\nRepair Cost -- Regular: $%s | Faction: $%s\nID: %d", number_format(PayNSprays[id][pnsRegCost]), number_format(PayNSprays[id][pnsGroupCost]), id);
		PayNSprays[id][pnsTextID] = CreateDynamic3DTextLabel(string, COLOR_RED, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ]+0.5,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, PayNSprays[id][pnsVW], PayNSprays[id][pnsInt], -1);
		SavePayNSpray(id);
		format(string, sizeof(string), "%s has changed the regular cost on Pay N' Spray ID %d to $%s.", GetPlayerNameEx(playerid), id, number_format(amount));
		Log("logs/pnsedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "delete", true) == 0)
	{
		if(PayNSprays[id][pnsStatus] == 0)
		{
			format(string, sizeof(string), "Pay N' Spray #%d does not exist.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
   	  	DestroyDynamicPickup(PayNSprays[id][pnsPickupID]);
	    DestroyDynamic3DTextLabel(PayNSprays[id][pnsTextID]);
		DestroyDynamicMapIcon(PayNSprays[id][pnsMapIconID]);
		PayNSprays[id][pnsStatus] = 0;
		PayNSprays[id][pnsPosX] = 0.0;
		PayNSprays[id][pnsPosY] = 0.0;
		PayNSprays[id][pnsPosZ] = 0.0;
		PayNSprays[id][pnsVW] = 0;
		PayNSprays[id][pnsInt] = 0;
		PayNSprays[id][pnsGroupCost] = 0;
		PayNSprays[id][pnsRegCost] = 0;
		SavePayNSpray(id);
		format(string, sizeof(string), "You have deleted Pay N' Spray #%d.", id);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has deleted Pay N' Spray ID %d.", GetPlayerNameEx(playerid), id);
		Log("logs/pnsedit.log", string);
		return 1;
	}
	return 1;
}

CMD:pnsstatus(playerid, params[])
{
	new id;
	if(sscanf(params, "i", id))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pnsstatus [id]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Pay N' Spray Status (ID: %d) ___________|", id);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "[Position] X: %f | Y: %f | Z: %f | VW: %d | Int: %d", PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ], PayNSprays[id][pnsVW], PayNSprays[id][pnsInt]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Group Cost: $%s | Regular Cost: $%s", number_format(PayNSprays[id][pnsGroupCost]), number_format(PayNSprays[id][pnsRegCost]));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:pnsnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available Pay N' Spray...");
		for(new x = 0; x < MAX_PAYNSPRAYS; x++)
		{
			if(PayNSprays[x][pnsStatus] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:gotopaynspray(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotopaynspray [id]");

		SetPlayerPos(playerid, PayNSprays[id][pnsPosX], PayNSprays[id][pnsPosY], PayNSprays[id][pnsPosZ]);
		SetPlayerInterior(playerid, PayNSprays[id][pnsInt]);
		PlayerInfo[playerid][pInt] = PayNSprays[id][pnsInt];
		SetPlayerVirtualWorld(playerid, PayNSprays[id][pnsVW]);
		PlayerInfo[playerid][pVW] = PayNSprays[id][pnsVW];
	}
	return 1;
}

CMD:fixveh(playerid, params[])
{
    if(IsPlayerConnected(playerid)) {
        if(PlayerInfo[playerid][pAdmin] < 2) {
            SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
            return 1;
        }
        if(IsPlayerInAnyVehicle(playerid)) {
            new Float:vrot;
            GetVehicleZAngle(GetPlayerVehicleID(playerid), vrot);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), vrot);
            RepairVehicle(GetPlayerVehicleID(playerid));
			Vehicle_Armor(GetPlayerVehicleID(playerid));
            SendClientMessageEx(playerid, COLOR_GREY, "   Xe da duoc sua!");
        }
    }
    return 1;
}


CMD:fixvehall(playerid, params[])
{
    if(IsPlayerConnected(playerid)) {
        if(PlayerInfo[playerid][pAdmin] < 2) {
            SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
            return 1;
        }
        for(new v = 0; v < MAX_VEHICLES; v++) {
            RepairVehicle(v);
			Vehicle_Armor(v);
        }
       	new string[128];
        SendClientMessageEx(playerid, COLOR_GREY, "   Tat ca xe da duoc sua!");
        format(string, sizeof(string), "[MAYCHU] %s Da sua chua tat ca cac xe trong may chu.", GetPlayerNameEx(playerid));
		SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
    }
    return 1;
}


CMD:destroycars(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
        return 1;
    }
    for(new i = 0; i < sizeof(CreatedCars); i++) {
        if(CreatedCars[i] != INVALID_VEHICLE_ID) {
            DestroyVehicle(CreatedCars[i]);
            CreatedCars[i] = INVALID_VEHICLE_ID;
            Player_Neon[playerid] = 0;
	    }
    }
    SendClientMessageEx(playerid, COLOR_GREY, "   Da xoa bo tat ca xe da duoc lay ra!");
    return 1;
}

CMD:baotrimaychu(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SetTimer( "Maintenance", 15000, false );
		SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* May chu se bao tri trong vong 15 giay nua...");
		// SendRconCommand("gmx");
		
		SendClientMessageToAllEx(COLOR_LIGHTBLUE, "* Hay o lai cho den khi ban bi kick bao tri may chu de hoan tat luu tru tai khoan...");
		foreach(new i: Player)
		{
			GameTextForPlayer(i, "~y~Bao Tri may chu", 5000, 6);
		}
		SetTimer( "KickAllForMaintenance", 5000, false );
	}
	else SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");	
    return 1;
}

CMD:dm(playerid, params[])
{
    if( PlayerInfo[playerid][pAdmin] >= 3)
	{
	    new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dm [player]");
			SendClientMessageEx(playerid, COLOR_GREY, "NOTE: This command issues a 2 hours prison sentence, 1 warning, a 10 percent fine and a 4 hours weapon restriction.");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[giveplayerid][pAdmin] > 1)
		    {
		        return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay voi admin khac!");
			}

			new fine = 0;
			new totalwealth = PlayerInfo[giveplayerid][pAccount] + GetPlayerCash(giveplayerid);
			if(PlayerInfo[giveplayerid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hSafeMoney];
			if(PlayerInfo[giveplayerid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hSafeMoney];

			if(totalwealth > 0)
			{
				fine = 10*totalwealth/100;
			}
			if(fine > 0) {
				GivePlayerCash(giveplayerid, -fine);
			}

			foreach(new i: Player)
			{
				if(GetPVarInt(i, "pWatchdogWatching") == giveplayerid) {
					SendClientMessage(i, COLOR_WHITE, "You have stopped DM Watching.");
					GettingSpectated[Spectate[i]] = INVALID_PLAYER_ID;
					Spectating[i] = 0;
					Spectate[i] = INVALID_PLAYER_ID;
					SetPVarInt(i, "SpecOff", 1 );
					TogglePlayerSpectating(i, false);
					SetCameraBehindPlayer(i);
					DeletePVar(i, "pWatchdogWatching");
				}
			}

			PlayerInfo[giveplayerid][pWarns] += 1;
			if(PlayerInfo[giveplayerid][pWarns] >= 3)
			{
				new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));
				format(string, sizeof(string), "[MAYCHU] %s (IP: %s) was banned by %s (had 3 Warnings), reason: DM", GetPlayerNameEx(giveplayerid), ip, GetPlayerNameEx(playerid));
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was banned by %s (had 3 Warnings), reason: DM", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				if(fine > 0) {
					format(string, sizeof(string), "You have been fined $%s (10 percent of your total wealth).", number_format(fine));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
					format(string, sizeof(string), "[MAYCHU] %s da tru $%s by %s (/dm).", GetPlayerNameEx(giveplayerid), number_format(fine), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
				StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
				PlayerInfo[giveplayerid][pBanned] = 1;
				AddBan(playerid, giveplayerid, "Player had 3 warnings");
				MySQLBan(GetPlayerSQLId(giveplayerid), ip, "Third Warning (DM)", 1,GetPlayerNameEx(playerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				return 1;
			}
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned boi %s, ly do: DM ", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned boi %s, ly do: DM", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
    		SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PlayerInfo[giveplayerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(giveplayerid, 0);
			PlayerInfo[giveplayerid][pJailTime] = 120*60;
			SetPVarInt(giveplayerid, "_rAppeal", gettime()+60);
			strcpy(PlayerInfo[giveplayerid][pPrisonReason], "[OOC][PRISON][/DM]", 128);
			strcpy(PlayerInfo[giveplayerid][pPrisonedBy], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
			PhoneOnline[giveplayerid] = 1;
			SetPlayerInterior(giveplayerid, 1);
			SetPlayerHealth(giveplayerid, 100);
			PlayerInfo[giveplayerid][pInt] = 1;
			new rand = random(sizeof(OOCPrisonSpawns));
			Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);

			PlayerInfo[giveplayerid][pWRestricted] = 4;
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "You have been prisoned for Death Matching - you will be prisoned for two hours, warned and your weapons restricted for 4 hours.");
			if(fine > 0) {
				format(string, sizeof(string), "You have been fined $%s (10 percent of your total wealth).", number_format(fine));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
				format(string, sizeof(string), "[MAYCHU] %s da tru $%s by %s (/dm).", GetPlayerNameEx(giveplayerid), number_format(fine), GetPlayerNameEx(playerid));
				Log("logs/admin.log", string);
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:sdm(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pUndercover] >= 1)
	{
	    new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sdm [player]");
			SendClientMessageEx(playerid, COLOR_GREY, "NOTE: This command issues a 2 hours prison sentence, 1 warning, a 10 percent fine and a 4 hours weapon restriction.");
			return 1;
		}
		if(IsPlayerConnected(giveplayerid))
	 	{
		    if(PlayerInfo[giveplayerid][pAdmin] > 1) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the lam dieu nay voi admin khac!");

			new fine = 0;
			new totalwealth = PlayerInfo[giveplayerid][pAccount] + GetPlayerCash(giveplayerid);
			if(PlayerInfo[giveplayerid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hSafeMoney];
			if(PlayerInfo[giveplayerid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hSafeMoney];

			if(totalwealth > 0)
			{
				fine = 10*totalwealth/100;
			}
			if(fine > 0) {
				GivePlayerCash(giveplayerid, -fine);
			}

			PlayerInfo[giveplayerid][pWarns] += 1;
			if(PlayerInfo[giveplayerid][pWarns] >= 3)
			{
				new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));
				format(string, sizeof(string), "[MAYCHU] %s (IP: %s) was banned by %s (had 3 Warnings), reason: DM", GetPlayerNameEx(giveplayerid), ip, GetPlayerNameEx(playerid));
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was banned by %s (had 3 Warnings), reason: DM", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED, string, 2);
				if(fine > 0) {
					format(string, sizeof(string), "You have been fined $%s (10 percent of your total wealth).", number_format(fine));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
					format(string, sizeof(string), "[MAYCHU] %s da tru $%s by %s (/dm).", GetPlayerNameEx(giveplayerid), number_format(fine), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
				StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
				PlayerInfo[giveplayerid][pBanned] = 1;
				AddBan(playerid, giveplayerid, "Player had 3 warnings");
				MySQLBan(GetPlayerSQLId(giveplayerid),ip, "Third Warning (DM)", 1,GetPlayerNameEx(playerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				return 1;
			}
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s has been silent prisoned (/sdm) boi %s, ly do: DM ", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been silent prisoned (/sdm) boi %s, ly do: DM", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
   			ABroadCast(COLOR_LIGHTRED, string, 2);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PlayerInfo[giveplayerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(giveplayerid, 0);
			PlayerInfo[giveplayerid][pJailTime] = 120*60;
			SetPVarInt(giveplayerid, "_rAppeal", gettime()+60);
			strcpy(PlayerInfo[giveplayerid][pPrisonReason], "[OOC][PRISON][/SDM]", 128);
			strcpy(PlayerInfo[giveplayerid][pPrisonedBy], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
			PhoneOnline[giveplayerid] = 1;
			SetPlayerInterior(giveplayerid, 1);
			SetPlayerHealth(giveplayerid, 100);
			PlayerInfo[giveplayerid][pInt] = 1;
			new rand = random(sizeof(OOCPrisonSpawns));
			Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);

			PlayerInfo[giveplayerid][pWRestricted] = 4;
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "You have been prisoned for Death Matching - you will be prisoned for two hours, warned and your weapons restricted for 4 hours.");
			if(fine > 0) {
				format(string, sizeof(string), "You have been fined $%s (10 percent of your total wealth).", number_format(fine));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
				format(string, sizeof(string), "[MAYCHU] %s da tru $%s by %s (/dm).", GetPlayerNameEx(giveplayerid), number_format(fine), GetPlayerNameEx(playerid));
				Log("logs/admin.log", string);
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}	return 1;
}

CMD:rehashall(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	RehashHouses();
	RehashDynamicDoors();
	RehashDynamicMapIcons();
	return 1;
}

CMD:checkcapdo(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new szNoobs[156], zone[MAX_ZONE_NAME];
   		SendClientMessageEx(playerid,COLOR_WHITE,"Liet ke tat ca cap do...");

    	foreach(new i: Player)
		{
			if(gPlayerLogged{playerid} > 0 && PlayerInfo[i][pLevel] == 1 && PlayerInfo[i][pConnectHours] == 0 && PlayerInfo[i][pAdmin] == 0)
			{
				GetPlayer3DZone(i, zone, sizeof(zone));
				format(szNoobs, sizeof(szNoobs), "* %s (ID %i) (Gio 0) - Vi tri: %s", GetPlayerNameEx(i), i, zone);
				SendClientMessageEx(playerid, COLOR_WHITE, szNoobs);
			}
		}
		foreach(new i: Player)
		{
			if(gPlayerLogged{playerid} > 0 && PlayerInfo[i][pLevel] == 1 && PlayerInfo[i][pConnectHours] != 0 && PlayerInfo[i][pAdmin] == 0)
			{
				GetPlayer3DZone(i, zone, sizeof(zone));
				format(szNoobs, sizeof(szNoobs), "* %s (ID %i) (Gio %i) - Vi tri: %s", GetPlayerNameEx(i), i, PlayerInfo[i][pConnectHours], zone);
				SendClientMessageEx(playerid, COLOR_WHITE, szNoobs);
			}
		}
	}
	return 1;
}

CMD:paused(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 2) {

    	new
			szMessage[42 + MAX_PLAYER_NAME];

	    SendClientMessageEx(playerid,COLOR_WHITE,"Danh sach dang tam dung game...");
	    foreach(new i: Player)
		{
			if(playerTabbed[i] != 0) {

				if(playerTabbed[i] > 60) format(szMessage, sizeof(szMessage), "* %s (ID %d), treo may %d phut.", GetPlayerNameEx(i), i, playerTabbed[i] / 60);
				else format(szMessage, sizeof(szMessage), "* %s (ID %d), treo may %d giay.", GetPlayerNameEx(i), i, playerTabbed[i]);

				if(PlayerInfo[i][pAdmin] >= 2) SendClientMessageEx(playerid,COLOR_RED, szMessage);
				else SendClientMessageEx(playerid,COLOR_GREY, szMessage);
	  		}
		}
   	}
    else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:afk(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 2) {

    	new
			szMessage[36 + MAX_PLAYER_NAME];

	    SendClientMessageEx(playerid,COLOR_WHITE,"Danh sach dang AFK...");
	    foreach(new i: Player)
		{
			if(playerAFK[i] != 0 && playerAFK[i] > 60) {
				format(szMessage,sizeof(szMessage),"* %s (ID %d), AFK %d phut.", GetPlayerNameEx(i), i, playerAFK[i] / 60);
				if(PlayerInfo[i][pAdmin] >= 2) SendClientMessageEx(playerid,COLOR_RED,szMessage);
				else SendClientMessageEx(playerid,COLOR_GREY,szMessage);
			}
  		}
   	}
    else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:shopplate(playerid, params[])
{
    if(PlayerInfo[playerid][pShopTech] >= 1 || PlayerInfo[playerid][pAdmin] >= 6)
	{
		new iVehType, iVehIndex, iTargetOwner, carid, orderid, plate[32];
        if(sscanf(params, "dds[32]", carid, orderid, plate))
		{
		    SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /shopplate [carid] [orderid] [plate/remove]");
		    SendClientMessageEx(playerid, COLOR_GREY, "COLORS: (black/white/blue/red/green/purple/yellow/lightblue/navy/beige/darkgreen/darkblue/darkgrey/gold/brown/darkbrown/darkred");
			SendClientMessageEx(playerid, COLOR_GREY, "/pink) USAGE: (red)Hi(white)how are you? NOTE: Each color counts for 8 characters");
			return 1;
		}

		foreach(new i: Player)
		{
			iVehIndex = GetPlayerVehicle(i, carid);
			if(iVehIndex != -1)
			{
				iVehType = 1;
				iTargetOwner = i;
				break;
			}
		}
		if(iVehType == 1)
		{
		    format(plate, sizeof(plate), "%s", str_replacexx("(black)", "{000000}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(white)", "{FFFFFF}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(blue)", "{0000FF}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(red)", "{FF0000}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(green)", "{008000}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(purple)", "{800080}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(yellow)", "{FFFF00}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(lightblue)", "{ADD8E6}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(navy)", "{000080}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(beige)", "{F5F5DC}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(darkgreen)", "{006400}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(darkblue)", "{00008B}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(darkgrey)", "{A9A9A9}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(gold)", "{FFD700}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(brown)", "{A52A2A}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(darkbrown)", "{5C4033}", plate));
		    format(plate, sizeof(plate), "%s", str_replacexx("(darkred)", "{8B0000}", plate));
			format(plate, sizeof(plate), "%s", str_replacexx("(pink)", "{FF5B77}", plate));

			new string[128], Float:X, Float:Y, Float:Z;
			GetVehiclePos(carid, X, Y, Z);
			if(strcmp(plate, "remove", true) == 0)
			{
				PlayerVehicleInfo[iTargetOwner][iVehIndex][pvPlate] = 0;
			}
			else
			{
				format(PlayerVehicleInfo[iTargetOwner][iVehIndex][pvPlate], 32, "%s", plate);
			}
			SetVehicleToRespawn(carid);
			SetVehiclePos(carid, X, Y, Z);
			g_mysql_SaveVehicle(iTargetOwner, iVehIndex);

			format(string, sizeof(string), "Plate set on %s (ID: %d) %s (ID: %d)", GetPlayerNameEx(iTargetOwner), iTargetOwner, GetVehicleName(carid), carid);
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "(OrderID: %d) Plate: %s", orderid, plate);
			SendClientMessage(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s set %s %s (Slot %d) plate to %s (order %d)", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetOwner), GetVehicleName(carid), iVehIndex, plate, orderid);
			Log("logs/shoplog.log", string);
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GRAD1, "This is not a person owned vehicle, you cannot give it a custom plate.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:shopcar(playerid, params[]) {
	if(PlayerInfo[playerid][pShopTech] >= 1) {

		new
			szInvoice[32],
			iColors[2],
			iTargetID,
			iModelID;

		if(sscanf(params, "uiiis[32]", iTargetID, iModelID, iColors[0], iColors[1], szInvoice)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /shopcar [player] [model] [color 1] [color 2] [invoice #]");
		}
		else if(!(400 <= iModelID <= 611)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid model specified (model IDs start at 400, and end at 611).");
		}
		else if(IsATrain(iModelID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "Trains cannot be spawned during runtime.");
		}
		else if(IsRestrictedVehicle(iModelID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "You cannot issue restricted vehicles!");
		}
		else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
		}
		else if(!vehicleCountCheck(iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "That person can't have more vehicles - they own too many.");
		}
		else if(!vehicleSpawnCountCheck(iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "That person has too many vehicles spawned - they must store one first.");
		}
		else {

			new
				Float: arr_fPlayerPos[4],
				szMessage[84];

			GetPlayerPos(iTargetID, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
			GetPlayerFacingAngle(iTargetID, arr_fPlayerPos[3]);
			CreatePlayerVehicle(iTargetID, GetPlayerFreeVehicleId(iTargetID), iModelID, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], iColors[0], iColors[1], 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

			format(szMessage, sizeof(szMessage), "You have successfully created a %s for %s (invoice %s).", VehicleName[iModelID - 400], GetPlayerNameEx(iTargetID), szInvoice);
			SendClientMessageEx(playerid, COLOR_WHITE, szMessage);

			format(szMessage, sizeof(szMessage), "%s created a %s (%i) for %s (invoice %s).", GetPlayerNameEx(playerid), VehicleName[iModelID - 400], iModelID, GetPlayerNameEx(iTargetID), szInvoice);
			Log("logs/shoplog.log", szMessage);
		}
	}
	else SendClientMessageEx(playerid, COLOR_GREY, " You are not allowed to use this command.");
    return 1;
}

CMD:destroypvehicle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid, vehicleid;
		if(sscanf(params, "ud", giveplayerid, vehicleid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /destroypvehicle [player] [vehicleid]");
		if(!(400 <= GetVehicleModel(vehicleid) <= 612)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid vehicle specified.");
		new playervehicleid = GetPlayerVehicle(giveplayerid, vehicleid);
		if(playervehicleid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "ERROR: That person doesn't own that vehicle.");

		format(string, sizeof(string), "You have deleted %s's %s (vehicle ID %d).", GetPlayerNameEx(giveplayerid), GetVehicleName(vehicleid), vehicleid);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "An Administrator has deleted your %s.", GetVehicleName(vehicleid));
		SendClientMessageEx(giveplayerid, COLOR_GREY, string);
		format(string, sizeof(string), "%s has destroyed %s's %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), GetVehicleName(vehicleid));
		Log("logs/playervehicle.log", string);
		DestroyPlayerVehicle(giveplayerid, playervehicleid);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not allowed to use this command.");
	return 1;
}

CMD:shopcardel(playerid, params[])
{
	if(PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128], invoicenum[32], giveplayerid, vehicleid;
		if(sscanf(params, "uds[32]", giveplayerid, vehicleid, invoicenum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /shopcardel [player] [vehicleid] [invoice #]");

		new playervehicleid = GetPlayerVehicle(giveplayerid, vehicleid);
		if(playervehicleid == -1) return SendClientMessageEx(playerid, COLOR_GREY, "ERROR: That person doesn't own that vehicle.");

		format(string, sizeof(string), "You have deleted %s's %s (vehicle ID %d).", GetPlayerNameEx(giveplayerid), GetVehicleName(vehicleid), vehicleid);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "An Administrator has deleted your %s.", GetVehicleName(vehicleid));
		SendClientMessageEx(giveplayerid, COLOR_GREY, string);
		format(string, sizeof(string), "[SHOPCARDEL] %s deleted vehicle ID %d - Invoice %s for %s", GetPlayerNameEx(playerid), playervehicleid, invoicenum, GetPlayerNameEx(giveplayerid));
		Log("logs/shoplog.log", string);
		DestroyPlayerVehicle(giveplayerid, playervehicleid);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not allowed to use this command.");
	return 1;
}
CMD:random(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 6) {

		new
			iHours,
			iBroadcast;

		if(sscanf(params, "dd", iHours, iBroadcast)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /random [hours] [broadcast]");
		}

		new
			arr_Winners[MAX_PLAYERS],
			iWinCount;

		foreach(new i: Player)
		{
			if(SeeSpecialTokens(i, iHours)) arr_Winners[iWinCount++] = i;
		}
		if(iWinCount > 0) {

			new
				iWinrar = arr_Winners[random(iWinCount)],
				szMessage[48 + MAX_PLAYER_NAME];

			if(iBroadcast == 1) {
				format(szMessage, sizeof(szMessage), "%s was just randomly selected! Congratulations!", GetPlayerNameEx(iWinrar));
				SendClientMessageToAllEx(COLOR_WHITE, szMessage);
			}
			else {
				format(szMessage, sizeof(szMessage), "%s (ID %d) was randomly selected.", GetPlayerNameEx(iWinrar), iWinrar);
				ABroadCast(COLOR_YELLOW, szMessage, 6);
			}
		}
		else SendClientMessageEx(playerid, COLOR_WHITE, "Nobody online can win!");
	}
	return 1;
}

CMD:vrandom(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 6) {

		new
			iHours,
			iBroadcast;

		if(sscanf(params, "dd", iHours, iBroadcast)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vrandom [hours] [broadcast]");
		}

		new
			arr_Winners[MAX_PLAYERS],
			iWinCount;

		foreach(new i: Player)
		{
			if(SeeSpecialTokens(i, iHours) && PlayerInfo[i][pDonateRank] > 0) arr_Winners[iWinCount++] = i;
		}
		if(iWinCount > 0) {

			new
				iWinrar = arr_Winners[random(iWinCount)],
				szMessage[48 + MAX_PLAYER_NAME];

			if(iBroadcast == 1) {
				format(szMessage, sizeof(szMessage), "%s was just randomly selected! Congratulations!", GetPlayerNameEx(iWinrar));
				SendClientMessageToAllEx(COLOR_WHITE, szMessage);
			}
			else {
				format(szMessage, sizeof(szMessage), "%s (ID %d) was randomly selected.", GetPlayerNameEx(iWinrar), iWinrar);
				ABroadCast(COLOR_YELLOW, szMessage, 6);
			}
		}
		else SendClientMessageEx(playerid, COLOR_WHITE, "Nobody online can win!");
	}
	return 1;
}

CMD:specreset(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
    {
		SendClientMessageEx(playerid, COLOR_GRAD2, "Resetting the special timer must be done through FTP, delete all the files in /stokens/ folder");
	}
	return 1;
}

CMD:pausespec(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
    {
    	if(SpecTimer == 1)
     	{
     		SpecTimer = 0;
      		new sString[41 + MAX_PLAYER_NAME];
			format( sString, sizeof( sString ), "[MAYCHU] %s has paused the special timer.", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, sString, 6 );
		}
		else
		{
  			SpecTimer = 1;
	    	new sString[41 + MAX_PLAYER_NAME];
    		format( sString, sizeof( sString ), "[MAYCHU] %s has enabled the special timer.", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, sString, 6);
		}
	}
	return 1;
}

CMD:gifts(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
     	if(Gifts == 0)
     	{
           	Gifts = 1;
           	new sString[41 + MAX_PLAYER_NAME];
			format( sString, sizeof( sString ), "[MAYCHU] %s has enabled the /gift command.", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, sString, 5 );
		}
		else
		{
		    Gifts = 0;
		    new sString[41 + MAX_PLAYER_NAME];
	   		format( sString, sizeof( sString ), "[MAYCHU] %s has disabled the /gift command.", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, sString, 5 );
		}
	}
	return 1;
}

CMD:vipgifts(playerid, params[])
{
	new string[128];

    if(PlayerInfo[playerid][pAdmin] >= 6)
    {
     	if(VIPGifts == 0)
     	{
           	VIPGifts = 1;
           	new sString[128];
			format( sString, sizeof( sString ), "%s would like for you to come to Club VIP for free gifts and great times [20 minutes remains]", GetPlayerNameEx(playerid));
			SendVIPMessage(COLOR_LIGHTGREEN, sString);
			VIPGiftsTimeLeft = 20;
			format(VIPGiftsName, sizeof(VIPGiftsName), "%s", GetPlayerNameEx(playerid));
		}
		else
		{
		    VIPGifts = 0;
		    new sString[128];
	   		format( sString, sizeof( sString ), "[MAYCHU] %s has disabled the /getgift command early", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, sString, 5 );
			format(string, sizeof(string), "Club VIP is no longer giving away free gifts. Thanks for coming!", VIPGiftsName, VIPGiftsTimeLeft);
			SendVIPMessage(COLOR_LIGHTGREEN, string);
			VIPGiftsTimeLeft = 0;
		}
	}
	return 1;
}

CMD:xmas(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
   	{
    	if(XMASGifts == 0)
     	{
     		XMASGifts = 1;
			new string[128];
			format( string, sizeof( string ), "%s would like for you to come to Pershing Square for free gifts and great times", GetPlayerNameEx(playerid));
			SendClientMessageToAllEx(COLOR_LIGHTGREEN, string);
		}
		else
		{
  			XMASGifts = 0;
			new string[128];
   			format( string, sizeof( string ), "[MAYCHU] %s has disabled the /getgift command", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, string, 5 );
			format(string, sizeof(string), "Pershing Square is no longer giving away free gifts. Thanks for coming!", VIPGiftsName, VIPGiftsTimeLeft);
			SendClientMessageToAllEx(COLOR_LIGHTGREEN, string);
		}
	}
	return 1;
}

CMD:resetgift(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /resetgift [player]");

    if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		if(IsPlayerConnected(giveplayerid))
		{
	   		if(PlayerInfo[giveplayerid][pGiftTime] > 0)
    		{
				new string[128];
	    	    PlayerInfo[giveplayerid][pGiftTime] = 0;
	     	    format(string, sizeof(string), "Ban da reset luot nhan qua cho (%s)(ID: %d)", GetPlayerNameEx(giveplayerid), giveplayerid);
	     	    SendClientMessageEx(playerid, COLOR_YELLOW, string);
   			}
   			else
   			{
	   		    SendClientMessageEx(playerid, COLOR_GRAD2, "That players gift timer is already on 0!");
			}
		}
		else
		{
   			SendClientMessageEx(playerid, COLOR_GRAD2, "That person is not connected.");
		}
	}
	return 1;
}

CMD:giftnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
	{
       	new range;
		if(sscanf(params, "d", range)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /giftnear [range]");

		if(range < 1)
		{
		    SendClientMessageEx(playerid, COLOR_WHITE, "The range can not be lower than 1.");
			return 1;
		}

        new string[128];
        new count;
        foreach(new i: Player)
		{
            if(ProxDetectorS(range, playerid, i))
			{
 			    if(PlayerInfo[i][pGiftTime] <= 0)
 			    {
					GiftPlayer(playerid, i);
                	count++;
				}
            }
        }
        format(string, sizeof(string), "You have gifted everyone (%d) nearby.", count);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
    }
    return 1;
}

CMD:resetgiftall(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		new string[128], stringz[128];
		format(string, sizeof(string), "[MAYCHU] %s da reset luot nhan qua cho toan bo trong may chu.", GetPlayerNameEx(playerid));
		ABroadCast(COLOR_YELLOW, string, 2);
		format(stringz, sizeof(stringz), "[GO:RP] %s da reset luot nhan qua cho toan bo trong may chu.", GetPlayerNameEx(playerid));
		ABroadCast(COLOR_WHITE, stringz, 2);
		foreach(new i: Player)
		{
  			PlayerInfo[i][pGiftTime] = 0;
		}
	}
	return 1;
}

CMD:gift(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gift [player]");

    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
 		if(Gifts == 1 || PlayerInfo[playerid][pAdmin] >= 5)
   		{
			if(giveplayerid != INVALID_PLAYER_ID)
			{
			    if(PlayerInfo[giveplayerid][pGiftTime] > 0)
	           	{
	               	SendClientMessageEx(playerid, COLOR_GRAD2, "The person has already got a gift in the last 5 hours !");
					return 1;
	           	}
			    GiftPlayer(playerid, giveplayerid);
			}
			else
			{
			    SendClientMessageEx(playerid, COLOR_GRAD2, "That person is not connected.");
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GRAD2, "This command is not activated!");
		}
	}
	return 1;
}

CMD:setstat(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 8)
	{

		new string[128], giveplayerid, statcode, amount;
		if(sscanf(params, "udd", giveplayerid, statcode, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setstat [player] [statcode] [amount]");
			SendClientMessageEx(playerid, COLOR_GRAD4, "|1 Level |2 ArmorUpgrade |3 UpgradePoints |4 Model |5 BankAccount |6 PhoneNumber |7 RespectPoints |8 House1 |9 House2");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|11 FMember |12 Det |13 Lawyer |14 Fixer |17 Drug |18 Sex |19 Box |20 Arms |21 Materials |22 Pot |23 Crack");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|24 Fishing |25 Job |26 Rank |27 Packages |28 Crates |29 Smuggler |30 Insurance |31 Warnings |32 Screwdriver");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|33 Age |34 Gender |35 NMute |36 AdMute |37 Faction |38 Restricted Weapon Time |39 Gang Warns |40 RMute |41 Reward Hours");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|42 Playing Hours |43 Gold Box Tokens |44 Computer Drawings |45 Papers |46 Business |47 BusinessRank | 48 Spraycan");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|49 Heroin |50 RawOpium |51 Syringes |52 Hunger |53 Fitness |54 Event Tokens |55 Modkit |56 vang |57 Ruby |58 KC |59 Hat Giong |60 Thuoc Sung|61 Sat|62 Dong");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|56 vang |57 Ruby |58 KC |59 Hat Giong |60 Thuoc Sung|61 Sat|62 Dong|63 La Can Sa | 64 Banh Mi | 65 Nuoc Loc | 66 Tien Ban");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			switch (statcode)
			{
			case 1:
				{
					PlayerInfo[giveplayerid][pLevel] = amount;
					format(string, sizeof(string), "   %s Level has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
					SetPlayerScore(giveplayerid, PlayerInfo[giveplayerid][pLevel]);
				}
			case 2:
				{
					PlayerInfo[giveplayerid][pSHealth] = amount;
					format(string, sizeof(string), "   %s ArmorUpgrade has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 3:
				{
					PlayerInfo[giveplayerid][gPupgrade] = amount;
					format(string, sizeof(string), "   %s Upgrade Points has been set %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 4:
				{
					PlayerInfo[giveplayerid][pModel] = amount;
					format(string, sizeof(string), "   %s Model has been set %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 5:
				{
					PlayerInfo[giveplayerid][pAccount] = amount;
					format(string, sizeof(string), "   %s Bank Account has been set to $%d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 6:
				{
					if(amount == 0)
					{
						PlayerInfo[giveplayerid][pPnumber] = amount;
						format(string, sizeof(string), "   %s had their phone removed", GetPlayerNameEx(giveplayerid));
					}
					else
					{
						new query[128];
						SetPVarInt(giveplayerid, "WantedPh", amount);
						SetPVarInt(giveplayerid, "CurrentPh", PlayerInfo[giveplayerid][pPnumber]);
						SetPVarInt(giveplayerid, "PhChangeCost", 50000);
						SetPVarInt(giveplayerid, "PhChangerId", playerid);
						format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `PhoneNr` = '%d'",amount);
						mysql_function_query(MainPipeline, query, true, "OnPhoneNumberCheck", "ii", giveplayerid, 4);
						return 1;
					}
				}
			case 7:
				{
					PlayerInfo[giveplayerid][pExp] = amount;
					format(string, sizeof(string), "   %s Respect Points have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 8:
				{
					PlayerInfo[giveplayerid][pPhousekey] = amount;
					format(string, sizeof(string), "   %s House 1 has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 9:
				{
					PlayerInfo[giveplayerid][pPhousekey2] = amount;
					format(string, sizeof(string), "   %s House 2 has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 11:
				{
					PlayerInfo[giveplayerid][pFMember] = amount;
					format(string, sizeof(string), "   %s Family Membership has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 12:
				{
					PlayerInfo[giveplayerid][pDetSkill] = amount;
					format(string, sizeof(string), "   %s Detective Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 13:
				{
					PlayerInfo[giveplayerid][pLawSkill] = amount;
					format(string, sizeof(string), "   %s Lawyer Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 14:
				{
					PlayerInfo[giveplayerid][pMechSkill] = amount;
					format(string, sizeof(string), "   %s Car Mechanic Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 17:
				{
					PlayerInfo[giveplayerid][pDrugsSkill] = amount;
					format(string, sizeof(string), "   %s  Drug Dealer Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 18:
				{
					PlayerInfo[giveplayerid][pSexSkill] = amount;
					format(string, sizeof(string), "   %s Sex Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 19:
				{
					PlayerInfo[giveplayerid][pBoxSkill] = amount;
					format(string, sizeof(string), "   %s Box Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 20:
				{
					PlayerInfo[giveplayerid][pArmsSkill] = amount;
					format(string, sizeof(string), "   %s Arms Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 21:
				{
					PlayerInfo[giveplayerid][pMats] = amount;
					format(string, sizeof(string), "   %s Materials have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 22:
				{
					PlayerInfo[giveplayerid][pPot] = amount;
					format(string, sizeof(string), "   %s Pot has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 23:
				{
					PlayerInfo[giveplayerid][pCrack] = amount;
					format(string, sizeof(string), "   %s Crack has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 24:
				{
					PlayerInfo[giveplayerid][pFishSkill] = amount;
					format(string, sizeof(string), "   %s Fishing Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 25:
				{
					PlayerInfo[giveplayerid][pJob] = amount;
					format(string, sizeof(string), "   %s Job has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 26:
				{
					PlayerInfo[giveplayerid][pRank] = amount;
					format(string, sizeof(string), "   %s Rank has been to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 27:
				{
					SetPVarInt(playerid, "Packages", amount);
					format(string, sizeof(string), "   %s Materials Packages have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 28:
				{
					PlayerInfo[giveplayerid][pCrates] = amount;
					format(string, sizeof(string), "   %s Drug Crates have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 29:
				{
					PlayerInfo[giveplayerid][pSmugSkill] = amount;
					format(string, sizeof(string), "   %s Smuggler Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 30:
				{
					PlayerInfo[giveplayerid][pInsurance] = amount;
					format(string, sizeof(string), "   %s Insurance has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 31:
				{
					//PlayerInfo[giveplayerid][pWarns] = amount;
					//format(string, sizeof(string), "   %s's Warnings have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 32:
				{
					PlayerInfo[giveplayerid][pScrewdriver] = amount;
					format(string, sizeof(string), "   %s Screwdrivers have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			/*case 33:
				{
					PlayerInfo[giveplayerid][pBirthDate] = amount;
					format(string, sizeof(string), "   %s's Age has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}*/
			case 34:
				{
					PlayerInfo[giveplayerid][pSex] = amount;
					format(string, sizeof(string), "   %s Gender has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 35:
				{
					PlayerInfo[giveplayerid][pNMuteTotal] = amount;
					format(string, sizeof(string), "   %s Total Newbie Mutes has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 36:
				{
					PlayerInfo[giveplayerid][pADMuteTotal] = amount;
					format(string, sizeof(string), "   %s Total Ad Mutes has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 37:
				{
					PlayerInfo[giveplayerid][pMember] = amount;
					format(string, sizeof(string), "   %s Faction has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 38:
				{
					if(PlayerInfo[giveplayerid][pConnectHours] >= 2) {
						PlayerInfo[giveplayerid][pWRestricted] = amount;
						format(string, sizeof(string), "   %s Weapon Restricted Time has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
					}
					else {
						return SendClientMessageEx(playerid, COLOR_GREY, "You cannot set this on a person who has under 2 playing hours.");
					}
				}
			case 39:
				{
					PlayerInfo[giveplayerid][pGangWarn] = amount;
					format(string, sizeof(string), "   %s Gang Warns have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 40:
				{
					PlayerInfo[giveplayerid][pRMutedTotal] = amount;
					format(string, sizeof(string), "   %s Report Mutes have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 41:
				{
					PlayerInfo[giveplayerid][pRewardHours] = amount;
					format(string, sizeof(string), "   %s'Reward Playing Hours have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 42:
				{
					PlayerInfo[giveplayerid][pConnectHours] = amount;
					format(string, sizeof(string), "   %s Playing Hours have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 43:
				{
					PlayerInfo[giveplayerid][pGoldBoxTokens] = amount;
					format(string, sizeof(string), "   %s Box Tokens have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 44:
				{
					PlayerInfo[giveplayerid][pRewardDrawChance] = amount;
					format(string, sizeof(string), "   %s Computer Drawings have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 45:
				{
					PlayerInfo[giveplayerid][pPaper] = amount;
					format(string, sizeof(string), "   %s Papers have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 46:
				{
				    if (amount < 0 || amount >= MAX_BUSINESSES) return 1;
					PlayerInfo[giveplayerid][pBusiness] = amount;
					format(string, sizeof(string), "   %s Business have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 47:
				{
				    if (amount < 0 || amount > 5) return 1;
					PlayerInfo[giveplayerid][pBusinessRank] = amount;
					format(string, sizeof(string), "   %s Business Rank have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 48:
				{
                	PlayerInfo[giveplayerid][pSpraycan] = amount;
					format(string, sizeof(string), "   %s Spraycans have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 49:
			    {
			        PlayerInfo[giveplayerid][pHeroin] = amount;
			        format(string, sizeof(string), "   %s Heroin have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
			    }
			case 50:
				{
                	PlayerInfo[giveplayerid][pRawOpium] = amount;
					format(string, sizeof(string), "   %s raw opium have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 51:
				{
                	PlayerInfo[giveplayerid][pSyringes] = amount;
					format(string, sizeof(string), "   %s Syringes have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 52:
				{
					if (amount <= 0)
					{
						amount = 1;
						PlayerInfo[playerid][pHungerTimer] = 1799;
					} else if (amount > 100)
					{
						amount = 100;
					}

					PlayerInfo[playerid][pHungerDeathTimer] = 0;

					PlayerInfo[giveplayerid][pHunger] = amount;
					format(string, sizeof(string), "   %s Hunger has been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 53:
				{
					PlayerInfo[giveplayerid][pFitness] = amount;
					format(string, sizeof(string), "   %s Fitness has been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 54:
				{
					PlayerInfo[giveplayerid][pTrickortreat] = amount;
					format(string, sizeof(string), "   %s Event Tokens have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 55:
				{
					PlayerInfo[giveplayerid][pRimMod] = amount;
					format(string, sizeof(string), "   %s Rim Kits have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 56:
				{
					PlayerInfo[giveplayerid][pVang] = amount;
					format(string, sizeof(string), "   %s Vang have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 57:
				{
					PlayerInfo[giveplayerid][pRuby] = amount;
					format(string, sizeof(string), "   %s Ruby have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 58:
				{
					PlayerInfo[giveplayerid][pKimCuong] = amount;
					format(string, sizeof(string), "   %s KC have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 59:
				{
					PlayerInfo[giveplayerid][pHatGiong] = amount;
					format(string, sizeof(string), "   %s Hat Giong have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 60:
				{
					PlayerInfo[giveplayerid][pThuocSung] = amount;
					format(string, sizeof(string), "   %s Thuoc Sung have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 61:
				{
					PlayerInfo[giveplayerid][pSat] = amount;
					format(string, sizeof(string), "   %s Sat have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 62:
				{
					PlayerInfo[giveplayerid][pDong] = amount;
					format(string, sizeof(string), "   %s Dong have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 63:
				{
					PlayerInfo[giveplayerid][pCansap] = amount;
					format(string, sizeof(string), "   %s La Can Sa have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 64:
				{
					PlayerInfo[giveplayerid][pBanhMi] = amount;
					format(string, sizeof(string), "   %s Banh Mi have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 65:
				{
					PlayerInfo[giveplayerid][pNuocLoc] = amount;
					format(string, sizeof(string), "   %s Nuoc loc have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 66:
				{
					PlayerInfo[giveplayerid][pTienBan] = amount;
					format(string, sizeof(string), "   %s Tien Ban have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			default:
				{
					format(string, sizeof(string), "   Invalid stat code.", amount);
				}
			}


			format(string, sizeof(string), "%s by %s", string, GetPlayerNameEx(playerid));
			Log("logs/stats.log", string);
			SendClientMessageEx(playerid, COLOR_GRAD1, string);

		}
	}
	return 1;
}


CMD:setstpay(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
	    new string[128];
		if(sscanf(params, "f", ShopTechPay))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setstpay [value]");
			format(string, sizeof(string), "Current Pay: $%.2f", ShopTechPay);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
		format(string, sizeof(string), "UPDATE `misc` SET `ShopTechPay` = '%.2f'", ShopTechPay);
		mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);

		format(string, sizeof(string), "Shop Tech Pay set to $%.2f", ShopTechPay);
        SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	return 1;
}

CMD:setsec(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 8 || PlayerInfo[playerid][pHR] >= 2 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pSecurity] >= 2)
	{
	    new giveplayerid, task[8], string[128];
	    if(sscanf(params, "us[8]", giveplayerid, task))
		{
			SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /setsec [playerid] [secondary task]");
			SendClientMessage(playerid, COLOR_GRAD6, "Secondary Tasks: FMod, GMod, SO, BA, ST, PR, HR, Sec");
			return 1;
		}
		if(giveplayerid != INVALID_PLAYER_ID)
		{
			if(PlayerInfo[giveplayerid][pAdmin] > 2)
			{
				if(strcmp(task, "fmod", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pFactionModerator] == 0)
					{
						PlayerInfo[giveplayerid][pFactionModerator] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a Faction Moderator");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a Faction Moderator");
						format(string, sizeof(string), "%s has given Faction Moderator to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pFactionModerator] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Faction Moderator");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Faction Moderator taken");
						format(string, sizeof(string), "%s has taken Faction Moderator from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "gmod", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pGangModerator] == 0)
					{
						PlayerInfo[giveplayerid][pGangModerator] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a Gang Moderator");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a Gang Moderator");
						format(string, sizeof(string), "%s has given Gang Moderator to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pGangModerator] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Gang Moderator");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Gang Moderator taken");
						format(string, sizeof(string), "%s has taken Gang Moderator from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "so", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pUndercover] == 0)
					{
						PlayerInfo[giveplayerid][pUndercover] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a Special Operative");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a Special Operative");
						format(string, sizeof(string), "%s has given Special Operative to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pUndercover] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Special Operative");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Special Operative permissions taken");
						format(string, sizeof(string), "%s has taken Special Operative permissions from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "ba", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pBanAppealer] == 0)
					{
						PlayerInfo[giveplayerid][pBanAppealer] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a Ban Appealer");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a Ban Appealer");
						format(string, sizeof(string), "%s has given Ban Appealer to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pBanAppealer] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Ban Appealer");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Ban Appealer taken");
						format(string, sizeof(string), "%s has taken Ban Appealer from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "st", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pShopTech] == 0)
					{
						PlayerInfo[giveplayerid][pShopTech] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a Shop Technician");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a Shop Technician");
						format(string, sizeof(string), "%s has given Shop Technician to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pShopTech] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Shop Technician");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Shop Technician taken");
						format(string, sizeof(string), "%s has taken Shop Technician from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "pr", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pPR] == 0)
					{
						PlayerInfo[giveplayerid][pPR] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a member of Public Relations");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a member of Public Relations");
						format(string, sizeof(string), "%s has given Public Relations permissions to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pPR] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Public Relations permissions");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Public Relations permissions taken");
						format(string, sizeof(string), "%s has taken Public Relations permissions from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "hr", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pHR] == 0)
					{
						PlayerInfo[giveplayerid][pHR] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a member of Human Resources");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a member of Human Resources");
						format(string, sizeof(string), "%s has given Human Resources permissions to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pHR] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Human Resources permissions");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Human Resources permissions taken");
						format(string, sizeof(string), "%s has taken Human Resources permissions from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
				else if(strcmp(task, "sec", true) == 0)
				{
					if(PlayerInfo[giveplayerid][pSecurity] == 0)
					{
						PlayerInfo[giveplayerid][pSecurity] = 1;
						SendClientMessage(playerid, COLOR_WHITE, "You have made them a member of Security");
						SendClientMessage(giveplayerid, COLOR_WHITE, "You have been made a member of Security");
						format(string, sizeof(string), "%s has given Security permissions to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
					else
					{
						PlayerInfo[giveplayerid][pSecurity] = 0;
						SendClientMessageEx(playerid, COLOR_GREY, "You have taken their Security permissions");
						SendClientMessage(giveplayerid, COLOR_GREY, "You have had your Security permissions taken");
						format(string, sizeof(string), "%s has taken Security permissions from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
						Log("logs/admin.log", string);
					}
				}
			}
			else SendClientMessage(playerid, COLOR_GRAD2, "They are not an admin!");
		}
		else SendClientMessageEx(playerid, COLOR_GRAD2, "That person is not connected.");
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:resetstpay(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
	    if(GetPVarInt(playerid, "resetstpay"))
	    {
	        mysql_function_query(MainPipeline, "UPDATE `shoptech` SET `total` = 0, dtotal = 0", false, "OnQueryFinish", "i", SENDDATA_THREAD);
            SendClientMessage(playerid, COLOR_WHITE, "Shop Tech Payments Reset");
	        DeletePVar(playerid, "resetstpay");
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "WARNING: This command will reset the shop tech payment counters");
		    SendClientMessage(playerid, COLOR_WHITE, "This action cannot be undone, ARE YOU SURE YOU WISH TO CONTINUE?");
		    SendClientMessage(playerid, COLOR_WHITE, "Type this command again to proceed");
		    SetPVarInt(playerid, "resetstpay", 1);
		}
	}
	return 1;
}

CMD:giftall(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
    	if(GiftAllowed || PlayerInfo[playerid][pAdmin] >= 7)
     	{
			new string[128];
      		format(string, sizeof(string), "[MAYCHU] %s has just sent a gift to all players.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_YELLOW, string, 2);
			GiftAllowed = 0;
			foreach(new i: Player)
			{
			    GiftPlayer(playerid, i);
			}
		}
		else
		{
		    return SendClientMessageEx(playerid, COLOR_GRAD2, "Lenh nay da duoc su dung, doi cho den khi tien luong tiep theo!");
		}
	}
	return 1;
}

CMD:giftreset(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /giftreset [player]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	if(PlayerInfo[giveplayerid][pGiftTime] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay da co the nhan duoc mot mon qua.");
	new string[128];
	format(string, sizeof(string), "[MAYCHU] %s has reset %s's gift timer.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
	ABroadCast(COLOR_YELLOW, string, 2);
	PlayerInfo[giveplayerid][pGiftTime] = 0;
	return 1;
}

CMD:gotodv(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new moneys;
		if(sscanf(params, "i", moneys)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotodv [slot ID]");
		}
		if(DynVeh[DynVehicleInfo[moneys][gv_iSpawnedID]] != -1 && (0 <= moneys < MAX_DYNAMIC_VEHICLES))
		{

			new Float:cwx2,Float:cwy2,Float:cwz2;
			GetVehiclePos(DynVehicleInfo[moneys][gv_iSpawnedID], cwx2, cwy2, cwz2);
			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, cwx2, cwy2+1, cwz2);
				SetPlayerVirtualWorld(playerid,GetVehicleVirtualWorld(DynVehicleInfo[moneys][gv_iSpawnedID]));
				SetPlayerInterior(playerid, DynVehicleInfo[moneys][gv_iInt]);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid, cwx2, cwy2+1, cwz2);
				SetPlayerVirtualWorld(playerid,GetVehicleVirtualWorld(DynVehicleInfo[moneys][gv_iSpawnedID]));
				SetPlayerInterior(playerid, DynVehicleInfo[moneys][gv_iInt]);
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
			SetPlayerInterior(playerid, 0);
			return 1;
		}
		else return SendClientMessage(playerid, COLOR_GRAD2, "That dynamic vehicle does not exist or is not spawned.");
	}
	else return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
}

CMD:dvstatus(playerid, params[])
{
	new iDvSlotID, vehicleid;
	if(sscanf(params, "i", vehicleid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dvstatus [vehicleid]");
		return 1;
	}
	iDvSlotID = DynVeh[vehicleid];
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
	    if(iDvSlotID != -1)
	    {
			new string[128];
			format(string,sizeof(string),"|___________ Dynamic Vehicle Status (ID: %d | Slot ID: %d) ___________|", vehicleid, iDvSlotID);
			SendClientMessageEx(playerid, COLOR_GREEN, string);
			format(string, sizeof(string), "X: %f | Y: %f | Z: %f | Model: %d | Upkeep: $%d | Maxhealth: %f", DynVehicleInfo[iDvSlotID][gv_fX], DynVehicleInfo[iDvSlotID][gv_fY], DynVehicleInfo[iDvSlotID][gv_fZ], DynVehicleInfo[iDvSlotID][gv_iModel], DynVehicleInfo[iDvSlotID][gv_iUpkeep], DynVehicleInfo[iDvSlotID][gv_fMaxHealth]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "Group: %d | Division: %d | Rank: %d | Type: %d | Disabled: %d | Family: %d", DynVehicleInfo[iDvSlotID][gv_igID], DynVehicleInfo[iDvSlotID][gv_igDivID], DynVehicleInfo[iDvSlotID][gv_irID], DynVehicleInfo[iDvSlotID][gv_iType], DynVehicleInfo[iDvSlotID][gv_iDisabled], DynVehicleInfo[iDvSlotID][gv_ifID]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "Obj Model 1: %d | Obj Model 2: %d | VW: %d | Int: %d | LoadMax: %d", DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][0],DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][1], DynVehicleInfo[iDvSlotID][gv_iVW], DynVehicleInfo[iDvSlotID][gv_iInt], DynVehicleInfo[iDvSlotID][gv_iLoadMax]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid Dynamic Vehicle Slot ID.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:dvcreate(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pShopTech] >= 1 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new
				iVehicle,
				iColors[2],
				string[128];

		if(sscanf(params, "iii", iVehicle, iColors[0], iColors[1])) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dvcreate [model ID] [color 1] [color 2]");
		}
		if(!(400 < iVehicle < 612)) return SendClientMessage(playerid, COLOR_GRAD2, "Invalid Model ID");
		else if(IsATrain(iVehicle)) {
				SendClientMessageEx(playerid, COLOR_GREY, "Trains cannot be spawned during runtime.");
			}
		else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
		}
		mysql_function_query(MainPipeline, "SELECT id from `groupvehs` WHERE vModel = 0 LIMIT 1;", true, "DynVeh_CreateDVQuery", "iiii", playerid, iVehicle, iColors[0], iColors[1]);
		format(string, sizeof(string), "%s has created a dynamic vehicle.", GetPlayerNameEx(playerid));
		Log("logs/dv.log", string);
	}
	else return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	return 1;
}
CMD:dvrespawnall(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		if(GetPVarInt(playerid, "dvRespawnAll") == 0)
		{
			new
				szString[128];

			SendClientMessageEx(playerid, COLOR_WHITE, "Respawning all current dynamic vehicles...");

			for(new i = 0; i < MAX_DYNAMIC_VEHICLES; i++)
			{
				SetPVarInt(playerid, "dvRespawnAll", 1);
				DynVeh_Spawn(i);
			}

			format(szString, sizeof(szString), "[MAYCHU] %s da reset toan bo xe faction trong may chu.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_YELLOW, szString, 2);
			format(szString, sizeof(szString), "Administrator %s has respawned all dynamic vehicles loaded on the server.", GetPlayerNameEx(playerid));
			Log("logs/admin.log", szString);
			SetPVarInt(playerid, "dvRespawnAll", 0);
		}
		else
			return SendClientMessageEx(playerid, COLOR_GREY, "There is already a dynamic vehicle respawn request in progress.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay!");
	return 1;
}

CMD:dvedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new vehicleid, name[24], Float:value, slot, string[128];
		if(sscanf(params, "is[24]F(0)D(0)", vehicleid, name, value, slot)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dvedit [vehicleid] [v parameter] [value] [slot] (if applicable - indicated by *)");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: vmodel vcol1 vcol2 family groupid divid loadmax maxhealth upkeep vtype vw delete");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: disabled objmodel* objx* objy* objz* objrx* objry* objrz* (Object Offsets)");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: rank");
			return 1;
		}
		new iDvSlotID = DynVeh[vehicleid];
		if(iDvSlotID == -1 || iDvSlotID > MAX_DYNAMIC_VEHICLES || DynVehicleInfo[iDvSlotID][gv_iSpawnedID] != vehicleid) return SendClientMessageEx(playerid, COLOR_GRAD1, " Invalid Dynamic Vehicle ID Provided " );
		format(string, sizeof(string), "%s has edited DV Slot %d - %s.", GetPlayerNameEx(playerid), iDvSlotID, params);
		Log("logs/dv.log", string);
		if(strcmp(name, "delete", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iModel] = 0;
			DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][0] = INVALID_OBJECT_ID;
			DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][1] = INVALID_OBJECT_ID;
			DynVehicleInfo[iDvSlotID][gv_igID] = INVALID_GROUP_ID;
			DynVehicleInfo[iDvSlotID][gv_igDivID] = 0;
			DynVehicleInfo[iDvSlotID][gv_ifID] = INVALID_FAMILY_ID;
			DynVehicleInfo[iDvSlotID][gv_fMaxHealth] = 1000;
			DynVehicleInfo[iDvSlotID][gv_iUpkeep] = 0;
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have deleted the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vw", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iVW] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the virtual world of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "disabled", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iDisabled] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vmodel", true) == 0)
		{
			if(!(400 < value < 612)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid Model ID");
			DynVehicleInfo[iDvSlotID][gv_iModel] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the vehicle model of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vcol1", true) == 0)
		{
			if(!(0 <= value <= 255)) {
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
			}
			DynVehicleInfo[iDvSlotID][gv_iCol1] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the color (1) of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vcol2", true) == 0)
		{
			if(!(0 <= value <= 255)) {
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
			}
			DynVehicleInfo[iDvSlotID][gv_iCol2] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the color (2) of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "groupid", true) == 0)
		{
			if(value == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_igID] = INVALID_GROUP_ID;
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have removed the group id flag of the dynamic vehicle");
				return 1;
			}
			if(!(0 <= value < MAX_GROUPS)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at "#MAX_GROUPS")");
			DynVehicleInfo[iDvSlotID][gv_igID] = floatround(value-1);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the group id flag of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "family", true) == 0)
		{
			if(value == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_ifID] = 0;
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have removed the family id flag of the dynamic vehicle");
				return 1;
			}
			if(!(0 <= value < MAX_FAMILY)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at "#MAX_GROUPS")");
			DynVehicleInfo[iDvSlotID][gv_ifID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the family id flag of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "divid", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_igDivID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the division id of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "rank", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_irID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the rank id of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "loadmax", true) == 0)
		{
			if(!(0 < value < 6)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at 6)");
			DynVehicleInfo[iDvSlotID][gv_iLoadMax] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the load max of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "maxhealth", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_fMaxHealth] = (value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the maximum health of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "upkeep", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iUpkeep] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the up keep of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vtype", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iType] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the vehicle type of the dynamic vehicle");
			return 1;
		}
		if(1 <= slot <= MAX_DV_OBJECTS)
		{
			if(strcmp(name, "objmodel", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][slot-1] = floatround(value);
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object model of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objx", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectX][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (X) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objy", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectY][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (Y) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objz", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectZ][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (Z) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objrx", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRX][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (X) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objry", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRY][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (Y) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objrz", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRZ][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (Z) of the dynamic vehicle");
				return 1;
			}
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD2, "Slot ID Must be between 1 and "#MAX_DV_OBJECTS"!");
	}
	else return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	return 1;
}

CMD:dveditslot(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new iDvSlotID, name[24], Float:value, slot, string[128];
		if(sscanf(params, "is[24]F(0)D(0)", iDvSlotID, name, value, slot)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dveditslot [dv slot id] [v parameter] [value] [slot] (if applicable - indicated by *)");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: vmodel vcol1 vcol2 family groupid divid loadmax maxhealth upkeep vtype vw delete");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: disabled objmodel* objx* objy* objz* objrx* objry* objrz* (Object Offsets)");
			SendClientMessageEx(playerid, COLOR_GREY, "Parameters: rank");
			return 1;
		}
		if(iDvSlotID > MAX_DYNAMIC_VEHICLES || DynVehicleInfo[iDvSlotID][gv_iModel] == 0) return SendClientMessageEx(playerid, COLOR_GRAD1, " Invalid Dynamic Vehicle ID Provided " );
		format(string, sizeof(string), "%s has edited DV Slot %d - %s.", GetPlayerNameEx(playerid), iDvSlotID, params);
		Log("logs/dv.log", string);
		if(strcmp(name, "delete", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iModel] = 0;
			DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][0] = INVALID_OBJECT_ID;
			DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][1] = INVALID_OBJECT_ID;
			DynVehicleInfo[iDvSlotID][gv_igID] = INVALID_GROUP_ID;
			DynVehicleInfo[iDvSlotID][gv_igDivID] = 0;
			DynVehicleInfo[iDvSlotID][gv_ifID] = INVALID_FAMILY_ID;
			DynVehicleInfo[iDvSlotID][gv_fMaxHealth] = 1000;
			DynVehicleInfo[iDvSlotID][gv_iUpkeep] = 0;
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have deleted the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vw", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iVW] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the virtual world of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "disabled", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iDisabled] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have disabled the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vmodel", true) == 0)
		{
			if(!(400 < value < 612)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid Model ID");
			DynVehicleInfo[iDvSlotID][gv_iModel] = floatround(value);
			DynVeh_Save(iDvSlotID);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the vehicle model of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vcol1", true) == 0)
		{
			if(!(0 <= value <= 255)) {
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
			}
			DynVehicleInfo[iDvSlotID][gv_iCol1] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the color (1) of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vcol2", true) == 0)
		{
			if(!(0 <= value <= 255)) {
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
			}
			DynVehicleInfo[iDvSlotID][gv_iCol2] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the color (2) of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "groupid", true) == 0)
		{
			if(value == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_igID] = INVALID_GROUP_ID;
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have removed the group id flag of the dynamic vehicle");
				return 1;
			}
			if(!(0 <= value < MAX_GROUPS)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at "#MAX_GROUPS")");
			DynVehicleInfo[iDvSlotID][gv_igID] = floatround(value-1);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the group id flag of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "family", true) == 0)
		{
			if(value == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_ifID] = 0;
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have removed the family id flag of the dynamic vehicle");
				return 1;
			}
			if(!(0 <= value < MAX_FAMILY)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at "#MAX_GROUPS")");
			DynVehicleInfo[iDvSlotID][gv_ifID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the family id flag of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "divid", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_igDivID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the division id of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "rank", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_irID] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the rank id of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "loadmax", true) == 0)
		{
			if(!(0 < value < 6)) return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid group specified (Start at 1, end at 6)");
			DynVehicleInfo[iDvSlotID][gv_iLoadMax] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the load max of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "maxhealth", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_fMaxHealth] = (value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the maximum health of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "upkeep", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iUpkeep] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the up keep of the dynamic vehicle");
			return 1;
		}
		if(strcmp(name, "vtype", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iType] = floatround(value);
			DynVeh_Save(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the vehicle type of the dynamic vehicle");
			return 1;
		}
		if(1 <= slot <= MAX_DV_OBJECTS)
		{
			if(strcmp(name, "objmodel", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_iAttachedObjectModel][slot-1] = floatround(value);
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object model of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objx", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectX][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (X) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objy", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectY][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (Y) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objz", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectZ][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object position (Z) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objrx", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRX][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (X) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objry", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRY][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (Y) of the dynamic vehicle");
				return 1;
			}
			if(strcmp(name, "objrz", true) == 0)
			{
				DynVehicleInfo[iDvSlotID][gv_fObjectRZ][slot-1] = value;
				DynVeh_Spawn(iDvSlotID);
				DynVeh_Save(iDvSlotID);
				SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the object rotation (Z) of the dynamic vehicle");
				return 1;
			}
		}
		else return SendClientMessageEx(playerid, COLOR_GRAD2, "Slot ID Must be between 1 and "#MAX_DV_OBJECTS"!");
	}
	else return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	return 1;
}

CMD:dvplate(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		new vehicleid, plate[32];
        if(sscanf(params, "ds[32]", vehicleid, plate))
		{
		    SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dvplate [vehicleid] [plate/remove]");
		    SendClientMessageEx(playerid, COLOR_GREY, "COLORS: (black/white/blue/red/green/purple/yellow/lightblue/navy/beige/darkgreen/darkblue/darkgrey/gold/brown/darkbrown/darkred");
			SendClientMessageEx(playerid, COLOR_GREY, "/pink) USAGE: (red)Hi(white)how are you? NOTE: Each color counts for 8 characters");
			return 1;
		}
		new iDvSlotID = DynVeh[vehicleid];
		if(iDvSlotID == -1 || iDvSlotID > MAX_DYNAMIC_VEHICLES || DynVehicleInfo[iDvSlotID][gv_iSpawnedID] != vehicleid) return SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid Dynamic Vehicle ID provided!");

		format(plate, sizeof(plate), "%s", str_replacexx("(black)", "{000000}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(white)", "{FFFFFF}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(blue)", "{0000FF}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(red)", "{FF0000}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(green)", "{008000}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(purple)", "{800080}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(yellow)", "{FFFF00}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(lightblue)", "{ADD8E6}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(navy)", "{000080}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(beige)", "{F5F5DC}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(darkgreen)", "{006400}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(darkblue)", "{00008B}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(darkgrey)", "{A9A9A9}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(gold)", "{FFD700}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(brown)", "{A52A2A}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(darkbrown)", "{5C4033}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(darkred)", "{8B0000}", plate));
		format(plate, sizeof(plate), "%s", str_replacexx("(pink)", "{FF5B77}", plate));

		if(strcmp(plate, "remove", true) == 0)
		{
			DynVehicleInfo[iDvSlotID][gv_iPlate] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "You have removed the custom plate of the dynamic vehicle");
		}
		else
		{
			format(DynVehicleInfo[iDvSlotID][gv_iPlate], 32, "%s", plate);
			DynVeh_Spawn(iDvSlotID);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have modified the custom plate of the dynamic vehicle");
		}

		DynVeh_Save(iDvSlotID);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:removepvehicle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /removepvehicle [player]");
			return 1;
		}
		new vstring[1024];
		for(new i, iModelID; i < GetPlayerVehicleSlots(giveplayerid); i++) {
			if((iModelID = PlayerVehicleInfo[giveplayerid][i][pvModelId] - 400) >= 0) {
				if(PlayerVehicleInfo[giveplayerid][i][pvImpounded]) {
					format(vstring, sizeof(vstring), "%s\n%s (impounded)", vstring, VehicleName[iModelID]);
				}
				else if(PlayerVehicleInfo[giveplayerid][i][pvDisabled]) {
					format(vstring, sizeof(vstring), "%s\n%s (disabled)", vstring, VehicleName[iModelID]);
				}
				else if(!PlayerVehicleInfo[giveplayerid][i][pvSpawned]) {
					format(vstring, sizeof(vstring), "%s\n%s (stored)", vstring, VehicleName[iModelID]);
				}
				else format(vstring, sizeof(vstring), "%s\n%s (spawned)", vstring, VehicleName[iModelID]);
			}
			else strcat(vstring, "\nEmpty");
		}
		new string[64];
		SetPVarInt(playerid, "vehcheck_giveplayerid", giveplayerid);
		format(string, sizeof(string), "%s's Vehicle List", GetPlayerNameEx(giveplayerid));
		ShowPlayerDialog(playerid, ADMIN_VEHCHECK, DIALOG_STYLE_LIST, string, vstring, "Delete Car", "Cancel");
	}
	return 1;
}

/*CMD:lsgntv22ntv(playerid, params[])  {

	PlayAudioStreamForPlayer(playerid, "http://web.samp-vn.com/cocailon.mp3");
	SendClientMessage(playerid, COLOR_GREY, "Khong co dau he dinh lam dung ha thang ngu chet me may chua");
	new str[128];
	format(str,sizeof(str),"He Thong: Co thang ngu %s dang mo lenh make ao kia :))",GetPlayerNameEx(playerid));
	ABroadCast(COLOR_YELLOW,str,2);
	return 1;
}*/
/*CMD:makeaomacanada36412(playerid, params[])  {
	if(PlayerInfo[playerid][pAdmin] >= 0 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3) {

		new
			iAdminValue,
			iTargetID;

		if(sscanf(params, "ui", iTargetID, iAdminValue)) {
			SendClientMessageEx(playerid, COLOR_GREY, "xai lenh cho dang hoang vao con me may");
		}
		else if(IsPlayerConnected(iTargetID)) {
			if(PlayerInfo[iTargetID][pHelper] >= 1) {
				SendClientMessageEx(playerid, COLOR_GRAD1, "You cannot make Junior Helpers admins!");
			}
			if(PlayerInfo[iTargetID][pAdmin] == iAdminValue) return SendClientMessageEx(playerid, COLOR_GREY, "This person already has this administrator level.");
			else {

				new
					szMessage[47 + (MAX_PLAYER_NAME * 2)];

                PriorityReport[iTargetID] = TextDrawCreate(261.000000, 373.000000, "Bao cao moi");
				TextDrawBackgroundColor(PriorityReport[iTargetID], 255);
				TextDrawFont(PriorityReport[iTargetID], 2);
				TextDrawLetterSize(PriorityReport[iTargetID], 0.460000, 1.800000);
				TextDrawColor(PriorityReport[iTargetID], -65281);
				TextDrawSetOutline(PriorityReport[iTargetID], 0);
				TextDrawSetProportional(PriorityReport[iTargetID], 1);
				TextDrawSetShadow(PriorityReport[iTargetID], 1);


				new szRank[128];
				switch(iAdminValue) {
					case 0: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 1: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 2: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 3: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 4: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 5: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 6: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 7: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					case 8: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					default: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
				}

				PlayerInfo[iTargetID][pAdmin] = iAdminValue;
				ABroadCast(COLOR_LIGHTRED, szRank, 2);
				Log("logs/admin.log", szMessage);

				switch(iAdminValue) {
					case 0: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 1: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 2: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 3: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 4: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 5: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 6: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 7: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					case 8: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
					default: format(szRank, sizeof(szRank), "", GetPlayerNameEx(playerid));
				}
				SendClientMessageEx(iTargetID, COLOR_LIGHTBLUE, szRank);

				switch(iAdminValue) {
					case 0: format(szRank, sizeof(szRank), "You have removed %s's administrator rank.", GetPlayerNameEx(iTargetID));
					case 1: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh Server Moderator.", GetPlayerNameEx(iTargetID));
					case 2: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh Junior Administrator.", GetPlayerNameEx(iTargetID));
					case 3: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh General Administrator.", GetPlayerNameEx(iTargetID));
					case 4: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh Senior Administrator.", GetPlayerNameEx(iTargetID));
					case 5: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh Head Administrator.", GetPlayerNameEx(iTargetID));
					case 6: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanh  LeadHead Administrator.", GetPlayerNameEx(iTargetID));
					case 7: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanhn Executive Administrator.", GetPlayerNameEx(iTargetID));
					case 8: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanhn Founder.", GetPlayerNameEx(iTargetID));
					default: format(szRank, sizeof(szRank), "Ban da tuyen dung %s thanhn undefined level administrator.", GetPlayerNameEx(iTargetID));
				}
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szRank);
			}
		}
		else SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}*/
CMD:apark(playerid, params[]) {
    if (PlayerInfo[playerid][pAdmin] >= 3)
	{
        foreach(new ownerid: Player)
        {
			for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
			{
				if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[ownerid][d][pvId]))
				{
				    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai ngoi tren chiec xe cua minh.");
					new Float:x, Float:y, Float:z, Float:angle, Float:health;
					if(PlayerInfo[playerid][pLockCar] == GetPlayerVehicleID(playerid)) PlayerInfo[playerid][pLockCar] = INVALID_VEHICLE_ID;
					if(IsARC(GetPlayerVehicleID(playerid))) // RC Vehicles
					{
						new Float:vehPos[3];
						GetVehiclePos(GetPlayerVehicleID(playerid),vehPos[0], vehPos[1], vehPos[2]);
						SetPlayerPos(playerid,vehPos[0], vehPos[1]+0.5, vehPos[2]+0.5);
					}
					GetVehicleHealth(PlayerVehicleInfo[ownerid][d][pvId], health);
					GetVehiclePos(PlayerVehicleInfo[ownerid][d][pvId], x, y, z);
					GetVehicleZAngle(PlayerVehicleInfo[ownerid][d][pvId], angle);
					SurfingCheck(GetPlayerVehicleID(playerid));
					UpdatePlayerVehicleParkPosition(ownerid, d, x, y, z, angle, health, GetPlayerVirtualWorld(ownerid), GetPlayerInterior(ownerid));
					IsPlayerEntering{playerid} = true;
					PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), 0);
				 	SetPlayerArmedWeapon(playerid, 0);

				 	new szMessage[128];

				 	format(szMessage, sizeof(szMessage),"* Ban da dau %s's %s.",GetPlayerNameEx(ownerid), VehicleName[PlayerVehicleInfo[ownerid][d][pvModelId] - 400]);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof(szMessage), "Xe cua ban %s da duoc di chuyen toi mot cho khoac. Su dung /timxe de tim chiec xe cua minh.", VehicleName[PlayerVehicleInfo[ownerid][d][pvModelId] - 400]);
					SendClientMessageEx(ownerid, COLOR_LIGHTBLUE, szMessage);
					return 1;
				}
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:a(playerid, params[]) {
	return cmd_admin(playerid, params);
}

CMD:admin(playerid, params[])  {
	if(PlayerInfo[playerid][pAdmin] >= 2) {
		if(!isnull(params)) {

			new
				szMessage[128];

			if(PlayerInfo[playerid][pAdmin] == 2) format(szMessage, sizeof(szMessage), "* (2) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 3 && PlayerInfo[playerid][pFactionModerator] == 1) format(szMessage, sizeof(szMessage), "*(Fmod) (3) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 4 && PlayerInfo[playerid][pFactionModerator] == 1) format(szMessage, sizeof(szMessage), "*(Fmod) (4) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 5 && PlayerInfo[playerid][pFactionModerator] == 1) format(szMessage, sizeof(szMessage), "*(Fmod) (5) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 6 && PlayerInfo[playerid][pFactionModerator] == 1) format(szMessage, sizeof(szMessage), "*(Fmod) (6) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 7 && PlayerInfo[playerid][pFactionModerator] == 1) format(szMessage, sizeof(szMessage), "*(Fmod) (7) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 3 && PlayerInfo[playerid][pGangModerator] == 1) format(szMessage, sizeof(szMessage), "*(Gmod) (3) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 4 && PlayerInfo[playerid][pGangModerator] == 1) format(szMessage, sizeof(szMessage), "*(Gmod) (4) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 5 && PlayerInfo[playerid][pGangModerator] == 1) format(szMessage, sizeof(szMessage), "*(Gmod) (5) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 6 && PlayerInfo[playerid][pGangModerator] == 1) format(szMessage, sizeof(szMessage), "*(Gmod) (6) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 7 && PlayerInfo[playerid][pGangModerator] == 1) format(szMessage, sizeof(szMessage), "*(Gmod) (7) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 8 && PlayerInfo[playerid][pSecurity] == 1) format(szMessage, sizeof(szMessage), "*(Development) (8) Founder %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 3 && PlayerInfo[playerid][pGangModerator] == 0 && PlayerInfo[playerid][pFactionModerator] == 0) format(szMessage, sizeof(szMessage), "* (3) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 4 && PlayerInfo[playerid][pGangModerator] == 0 && PlayerInfo[playerid][pFactionModerator] == 0) format(szMessage, sizeof(szMessage), "* (4) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 5 && PlayerInfo[playerid][pGangModerator] == 0 && PlayerInfo[playerid][pFactionModerator] == 0) format(szMessage, sizeof(szMessage), "* (5) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 6 && PlayerInfo[playerid][pGangModerator] == 0 && PlayerInfo[playerid][pFactionModerator] == 0) format(szMessage, sizeof(szMessage), "* (6) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 7 && PlayerInfo[playerid][pGangModerator] == 0 && PlayerInfo[playerid][pFactionModerator] == 0) format(szMessage, sizeof(szMessage), "* (7) Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 8) format(szMessage, sizeof(szMessage), "* Founder %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pSMod] == 1) format(szMessage, sizeof(szMessage), "* Senior Moderator %s: %s", GetPlayerNameEx(playerid), params);
			else format(szMessage, sizeof(szMessage), "* Undefined Admin (%i) %s: %s", PlayerInfo[playerid][pAdmin], GetPlayerNameEx(playerid), params);

			foreach(new i: Player)
			{
			    if(PlayerInfo[i][pAdmin] >= 2)
			    {
			        SendClientMessage(i, COLOR_YELLOW, szMessage);
			    }
			}
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/a)dmin [admin chat]");
	}
	return 1;
}

CMD:ha(playerid, params[]) {
	return cmd_headadmin(playerid, params);
}

CMD:headadmin(playerid, params[])  {
	if(PlayerInfo[playerid][pAdmin] >= 5) {
		if(!isnull(params)) {

			new
				szMessage[128];

			if(PlayerInfo[playerid][pAdmin] == 5) format(szMessage, sizeof(szMessage), "(PRIVATE) Head Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 6) format(szMessage, sizeof(szMessage), "(PRIVATE) Lead Head Admin %s: %s", GetPlayerNameEx(playerid), params);
			else if(PlayerInfo[playerid][pAdmin] == 7) format(szMessage, sizeof(szMessage), "(PRIVATE) Executive Admin %s: %s", GetPlayerNameEx(playerid), params);
			else format(szMessage, sizeof(szMessage), "(PRIVATE) Undefined Admin (%i) %s: %s", PlayerInfo[playerid][pAdmin], GetPlayerNameEx(playerid), params);

			foreach(new i: Player)
			{
			    if(PlayerInfo[i][pAdmin] >= 5)
			    {
			        SendClientMessage(i, COLOR_GREEN, szMessage);
			    }
			}
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/ha)eadmin [Head admin+ chat]");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}
CMD:cnn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {
		if(!isnull(params)) {

			new
				szMessage[128];

			format(szMessage, sizeof(szMessage), "~b~%s: ~w~%s",GetPlayerNameEx(playerid), params);
			foreach(new i: Player)
			{	GameTextForPlayer(i, szMessage, 5000, 6); }
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /cnn [message]. ~n~ = new line, ~r~ = red, ~g~ = green, ~b~ = blue, ~w~ = white, ~y~ = yellow.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:deletecdveh(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {

		new
		    iBusiness,
			iVehicle;

		if(sscanf(params, "ii", iBusiness, iVehicle )) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /deletecdveh [business ID] [model id]");
		}
		else if(Businesses[iBusiness][bType] != BUSINESS_TYPE_NEWCARDEALERSHIP && Businesses[iBusiness][bType] != BUSINESS_TYPE_OLDCARDEALERSHIP) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Business is not a car dealership!");
		}
		else if(iBusiness != GetCarBusiness(iVehicle)) {
			SendClientMessageEx(playerid, COLOR_GREY, "That vehicle isn't a dealership vehicle.");
		}
		else {

			new
				ID = GetBusinessCarSlot(iVehicle);

			if(Businesses[iBusiness][bVehID][ID] != INVALID_VEHICLE_ID) {
			    if(IsValidDynamic3DTextLabel(Businesses[iBusiness][bVehicleLabel][ID])) DestroyDynamic3DTextLabel(Businesses[iBusiness][bVehicleLabel][ID]);
                DestroyVehicle(Businesses[iBusiness][bVehID][ID]);
               	Businesses[iBusiness][bModel][ID] = 0;
				Businesses[iBusiness][bParkPosX][ID] = 0;
  				Businesses[iBusiness][bParkPosY][ID] = 0;
			   	Businesses[iBusiness][bParkPosZ][ID] = 0;
		   	 	Businesses[iBusiness][bParkAngle][ID] = 0;
		   	 	Businesses[iBusiness][bVehID][ID] = 0;
		   	 	Businesses[iBusiness][bPrice][ID] = 0;
		   	 	SaveDealershipVehicle(iBusiness, ID);
	   	 		return 1;
       		}
			return SendClientMessageEx(playerid, COLOR_GREY, "The max number of vehicles for this business has been reached.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:createcdveh(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {

		new
		    iBusiness,
			iVehicle,
			iColors[2];

		if(sscanf(params, "iiii", iBusiness, iVehicle, iColors[0], iColors[1])) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /createcdveh [business ID] [model id] [color 1] [color 2]");
		}
		else if(!(400 <= iVehicle <= 611)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid model specified (model IDs start at 400, and end at 611).");
		}
		else if(IsATrain(iVehicle)) {
			SendClientMessageEx(playerid, COLOR_GREY, "Trains cannot be spawned during runtime.");
		}
		else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
		}
		else if(Businesses[iBusiness][bType] != BUSINESS_TYPE_NEWCARDEALERSHIP && Businesses[iBusiness][bType] != BUSINESS_TYPE_OLDCARDEALERSHIP) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Business is not a car dealership!");
		}
		else {

			new
				Float: fVehPos[4], label[50];

			GetPlayerPos(playerid, fVehPos[0], fVehPos[1], fVehPos[2]);
			GetPlayerFacingAngle(playerid, fVehPos[3]);
			for (new i; i < MAX_BUSINESS_DEALERSHIP_VEHICLES; i++)
			{
				if (Businesses[iBusiness][bVehID][i] == 0) {
					Businesses[iBusiness][bVehID][i] = CreateVehicle(iVehicle, fVehPos[0], fVehPos[1], fVehPos[2], fVehPos[3], iColors[0], iColors[1], -1);
					VehicleFuel[Businesses[iBusiness][bVehID][i]] = 100.0;

					Businesses[iBusiness][bModel][i] = iVehicle;

				 	Businesses[iBusiness][bParkPosX][i] = fVehPos[0];
	  				Businesses[iBusiness][bParkPosY][i] = fVehPos[1];
				   	Businesses[iBusiness][bParkPosZ][i] = fVehPos[2];
			   	 	Businesses[iBusiness][bParkAngle][i] = fVehPos[3];

					format(label, sizeof(label), "%s For Sale | Price: $%s", GetVehicleName(Businesses[iBusiness][bVehID][i]), number_format(Businesses[iBusiness][bPrice][i]));
					Businesses[iBusiness][bVehicleLabel][i] = CreateDynamic3DTextLabel(label,COLOR_LIGHTBLUE,Businesses[iBusiness][bParkPosX][i], Businesses[iBusiness][bParkPosY][i], Businesses[iBusiness][bParkPosZ][i],8.0,INVALID_PLAYER_ID, Businesses[iBusiness][bVehID][i]);

					Businesses[iBusiness][DealershipVehStock][i] = 1;
					Vehicle_ResetData(Businesses[iBusiness][bVehID][i]);
					SaveDealershipVehicle(iBusiness, i);
					return 1;
				}
			}
			return SendClientMessageEx(playerid, COLOR_GREY, "The max number of vehicles for this business has been reached.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:cnnn(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 5) {

		new
			iTextID,
			szMessage[128];

		if(sscanf(params, "is[128]", iTextID, szMessage)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /cnnn [type 1-6] [message]. ~n~ = new line, ~r~ = red, ~g~ = green, ~b~ = blue, ~w~ = white, ~y~ = yellow.");
		}
		else if(!(0 <= iTextID <= 6 && iTextID != 2)) {
			SendClientMessageEx(playerid, COLOR_GRAD2, "Text ID must be between 0 and 6, but not 2 (due to SA:MP bugs).");
		}
		else GameTextForAll(szMessage, 5000, iTextID);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:changeuserpin(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
        return 1;
    }

    new string[128], accountName[20], password[64], query[512];
    if(sscanf(params, "s[20]s[64]", accountName, password))
		return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /changeuserpin [player name] [new pin]");

    if(strlen(password) > 4 || !IsNumeric(password))
        return SendClientMessageEx(playerid, COLOR_GREY, "The pin must be numbers, and must have 4 digits.");

    new passbuffer[129];
    WP_Hash(passbuffer, sizeof(passbuffer), password);

	format(string, sizeof(string), "Attempting to change %s's pin...", accountName);
    SendClientMessageEx(playerid, COLOR_YELLOW, string);

	format(string, sizeof(string), "[MAYCHU] %s's pin was changed by %s.", accountName, GetPlayerNameEx(playerid));
    Log("logs/pin.log", string);

	SetPVarInt(playerid, "ChangePin", 1);

	new tmpName[24];
	mysql_escape_string(accountName, tmpName, MainPipeline);

    format(query,sizeof(query),"UPDATE `accounts` SET `Pin`='%s' WHERE `Username`='%s' AND `AdminLevel` < 2",passbuffer,tmpName);
	mysql_function_query(MainPipeline, query, false, "OnChangeUserPassword", "i", playerid);
	SetPVarString(playerid, "OnChangeUserPassword", tmpName);
	return 1;
}

CMD:changeuserpassword(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
        return 1;
    }

    new string[128], accountName[20], password[64], query[512];
    if(sscanf(params, "s[20]s[64]", accountName, password)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /changeuserpassword [player name] [new password]");

    new passbuffer[129];
    WP_Hash(passbuffer, sizeof(passbuffer), password);

	format(string, sizeof(string), "Attempting to change %s's password...", accountName);
    SendClientMessageEx(playerid, COLOR_YELLOW, string);

	format(string, sizeof(string), "[MAYCHU] %s's password was changed by %s.", accountName, GetPlayerNameEx(playerid));
    Log("logs/password.log", string);

	new tmpName[24];
	mysql_escape_string(accountName, tmpName, MainPipeline);

    format(query,sizeof(query),"UPDATE `accounts` SET `Key`='%s' WHERE `Username`='%s' AND `AdminLevel` < 2",passbuffer,tmpName);
	mysql_function_query(MainPipeline, query, false, "OnChangeUserPassword", "i", playerid);
	SetPVarString(playerid, "OnChangeUserPassword", tmpName);
	return 1;
}

CMD:checkreportcount(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], adminname[MAX_PLAYER_NAME], tdate[11];
		if(sscanf(params, "s[24]s[11]", adminname, tdate)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /checkreportcount [admin name] [date (YYYY-MM-DD)]");
		new giveplayerid = ReturnUser(adminname);
		if(IsPlayerConnected(giveplayerid))
		{
			format(string, sizeof(string), "SELECT SUM(count) FROM `tokens_report` WHERE `playerid` = %d AND `date` = '%s'", GetPlayerSQLId(giveplayerid), tdate);
			mysql_function_query(MainPipeline, string, true, "QueryCheckCountFinish", "issi", playerid, GetPlayerNameEx(giveplayerid), tdate, 0);
			format(string, sizeof(string), "SELECT `count`, `hour` FROM `tokens_report` WHERE `playerid` = %d AND `date` = '%s' ORDER BY `hour` ASC", GetPlayerSQLId(giveplayerid), tdate);
			mysql_function_query(MainPipeline, string, true, "QueryCheckCountFinish", "issi", playerid, GetPlayerNameEx(giveplayerid), tdate, 1);
		}
		else
		{
			new tmpName[MAX_PLAYER_NAME];
			mysql_escape_string(adminname, tmpName);
			format(string, sizeof(string), "SELECT `id`, `Username` FROM `accounts` WHERE `Username` = '%s'", tmpName);
			mysql_function_query(MainPipeline, string, true, "QueryUsernameCheck", "isi", playerid, tdate, 0);
		}
    }
    return 1;
}

CMD:motd(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /motd [message]");
		new string[128];
    	format(string, sizeof(string), "[MAYCHU] %s da thay doi thong bao may chu thanh: %s.", GetPlayerNameEx(playerid), params);
		ABroadCast( COLOR_LIGHTRED, string, 4);
		format(GlobalMOTD, sizeof(GlobalMOTD), "%s", params);
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da dieu chinh thong bao toan may chu.");
		g_mysql_SaveMOTD();
	}
	return 1;
}

CMD:amotd(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /amotd [message]");
		new string[128];
		format(AdminMOTD, sizeof(AdminMOTD), "%s", params);
		format(string, sizeof(string), "[MAYCHU] %s da thong bao danh cho admin thanh: %s.", GetPlayerNameEx(playerid), params);
		ABroadCast( COLOR_LIGHTRED, string, 4);
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da thay doi thong bao danh cho admin.");
		g_mysql_SaveMOTD();
	}
	return 1;
}

CMD:vipmotd(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vipmotd [message]");
		new string[128];
		format(VIPMOTD, sizeof(VIPMOTD), "%s", params);
		format(string, sizeof(string), "[MAYCHU] %s da thay doi thong bao danh cho VIP thanh: %s.", GetPlayerNameEx(playerid), params);
		ABroadCast( COLOR_LIGHTRED, string, 4);
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da thay doi thong bao danh VIP.");
		g_mysql_SaveMOTD();
	}
	return 1;
}

CMD:pmotd(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 7 || PlayerInfo[playerid][pShopTech] >= 3 || PlayerInfo[playerid][pPR] >= 2)
    {
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pmotd [message/off]");
		new string[128];
		if(strcmp(params, "off", true) == 0)
		{
		    format(pMOTD, sizeof(pMOTD), "");
		    format(string, sizeof(string), "[MAYCHU] %s da tat thong bao toan may chu", GetPlayerNameEx(playerid));
			ABroadCast( COLOR_LIGHTRED, string, 4);

			SendClientMessageEx(playerid, COLOR_WHITE, "Da dieu chinh thong bao toan may chu.");
			g_mysql_SaveMOTD();
			return 1;
		}
		format(pMOTD, sizeof(pMOTD), "%s", params);

		format(string, sizeof(string), "[MAYCHU] %s da thay doi thong bao toan may chu thanh: %s.", GetPlayerNameEx(playerid), params);
		ABroadCast( COLOR_LIGHTRED, string, 4);

		SendClientMessageEx(playerid, COLOR_WHITE, "Da dieu chinh thong bao toan may chu.");
		g_mysql_SaveMOTD();
	}
	return 1;
}
CMD:gotopveh(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] >= 2) {

        new iTargetID;

        if(sscanf(params, "u", iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotopveh [player]");
		}
		else if(IsPlayerConnected(iTargetID)) {

			new szVehString[8024], icount = GetPlayerVehicleSlots(iTargetID);
			if(!GetPlayerVehicleCount(iTargetID)) return SendClientMessageEx(playerid, COLOR_GREY, "ERROR: Player doesn't own any vehicles.");
			for(new i, iModelID; i < icount; i++) {
				if((iModelID = PlayerVehicleInfo[iTargetID][i][pvModelId] - 400) >= 0) {
					if(PlayerVehicleInfo[iTargetID][i][pvImpounded]) {
						format(szVehString, sizeof(szVehString), "%s\n%s (impounded)", szVehString, VehicleName[iModelID]);
					}
					else if(PlayerVehicleInfo[iTargetID][i][pvDisabled]) {
						format(szVehString, sizeof(szVehString), "%s\n%s (disabled)", szVehString, VehicleName[iModelID]);
					}
					else if(!PlayerVehicleInfo[iTargetID][i][pvSpawned]) {
						format(szVehString, sizeof(szVehString), "%s\n%s (stored)", szVehString, VehicleName[iModelID]);
					}
					else format(szVehString, sizeof(szVehString), "%s\n%s (ID %i)", szVehString, VehicleName[iModelID], PlayerVehicleInfo[iTargetID][i][pvId]);
				}
			}
		    ShowPlayerDialog(playerid, GOTOPLAYERCAR, DIALOG_STYLE_LIST, "Vehicle Teleportation", szVehString, "Teleport", "Cancel");
       		SetPVarInt(playerid, "playeraffectedcarTP", iTargetID);
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		{

		}
  	}
	return 1;
}

CMD:reloadpvehicles(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] < 3)
	{
        SendClientMessageEx(playerid, COLOR_GREY, " You are not allowed to use this command.");
        return 1;
    }

	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /reloadpvehicles [player]");

	UnloadPlayerVehicles(giveplayerid);
	LoadPlayerVehicles(giveplayerid);

	format(string, sizeof(string), " You have successfully reloaded %s's Vehicles.", GetPlayerNameEx(giveplayerid));
	SendClientMessageEx(playerid, COLOR_GREY, string);

	return 1;
}

CMD:reloadpveh(playerid, params[])
{
	return cmd_reloadpvehicles(playerid, params);
}

CMD:unloadpvehicles(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay!");

	foreach(new p: Player) { UnloadPlayerVehicles(p); }
	SendClientMessageEx(playerid, COLOR_GREY, "You have successfully unloaded all vehicles.");
	return 1;
}

CMD:loadpvehicles(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay!");

	foreach(new p: Player) { LoadPlayerVehicles(p); }
	SendClientMessageEx(playerid, COLOR_GREY, "You have successfully loaded all vehicles.");
	return 1;
}

CMD:taoxe(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new iColors[2], iTargetID, iModelID;

		if(sscanf(params, "uiii", iTargetID, iModelID, iColors[0], iColors[1])) SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /createpvehicle [player] [model] [color 1] [color 2]");
		else if(!(400 <= iModelID <= 611)) SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid model specified (model IDs start at 400, and end at 611).");
		else if(IsATrain(iModelID)) SendClientMessageEx(playerid, COLOR_GREY, "Trains cannot be spawned during runtime.");
		else if(!(0 <= iColors[0] <= 255 && 0 <= iColors[1] <= 255)) SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid color specified (IDs start at 0, and end at 255).");
		else if(!vehicleCountCheck(iTargetID)) SendClientMessageEx(playerid, COLOR_GREY, "That person can't have more vehicles - they own too many.");
		else if(!vehicleSpawnCountCheck(iTargetID)) SendClientMessageEx(playerid, COLOR_GREY, "That person has too many vehicles spawned - they must store one first.");
		else
		{
			new Float: arr_fPlayerPos[4], szMessage[84];

			GetPlayerPos(iTargetID, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
			GetPlayerFacingAngle(iTargetID, arr_fPlayerPos[3]);
			CreatePlayerVehicle(iTargetID, GetPlayerFreeVehicleId(iTargetID), iModelID, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], iColors[0], iColors[1], 2000000, GetPlayerVirtualWorld(iTargetID), GetPlayerInterior(iTargetID));

			format(szMessage, sizeof(szMessage), "You have successfully created a %s for %s.", VehicleName[iModelID - 400], GetPlayerNameEx(iTargetID));
			SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
			format(szMessage, sizeof(szMessage), "%s created a %s (%i) for %s.", GetPlayerNameEx(playerid), VehicleName[iModelID - 400], iModelID, GetPlayerNameEx(iTargetID));
			Log("logs/playervehicle.log", szMessage);
		}
	}
	else SendClientMessageEx(playerid, COLOR_GREY, " You are not allowed to use this command.");
    return 1;
}

CMD:shopvest(playerid, params[])
{
	if (PlayerInfo[playerid][pShopTech] < 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessageEx(playerid, COLOR_GREY, " You are not allowed to use this command.");
		return 1;
	}

	new string[128], giveplayerid, slot, invoice[64];
	if(sscanf(params, "uds[64]", giveplayerid, slot, invoice)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /shopvest [player] [slot(0-9)] [invoice #]");

	PlayerToyInfo[giveplayerid][slot][ptModelID] = 19142;
	PlayerToyInfo[giveplayerid][slot][ptBone] = 1;
	PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
	g_mysql_NewToy(giveplayerid, slot);
	format(string, sizeof(string), "You have been given a police vest in slot %d, use /toys to manage it", slot);
	SendClientMessageEx(giveplayerid, COLOR_LIGHTGREEN, string);
	format(string, sizeof(string), "Ban da cho %s a police vest in slot %d", GetPlayerNameEx(giveplayerid), slot);
	SendClientMessageEx(playerid, COLOR_LIGHTGREEN, string);
	format(string, sizeof(string), "[SHOPVEST] %s has given %s a police vest toy - Invoice %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), invoice);
	Log("logs/shoplog.log", string);

	g_mysql_SaveToys(giveplayerid, slot);
	return 1;
}

CMD:listtoys(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1) {

		new
			giveplayerid, stringg[4096], string[64];

		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /listtoys [player]");
		}
		else if(IsPlayerConnected(giveplayerid))
		{
			new icount = GetPlayerToySlots(giveplayerid);
		    for(new x;x<icount;x++)
			{
				new name[24] = "None";

				for(new i;i<sizeof(HoldingObjectsAll);i++)
				{
					if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[giveplayerid][x][ptModelID])
					{
						format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
						break;
					}
				}
				if(PlayerToyInfo[giveplayerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0))
				{
				    format(name, sizeof(name), "ID: %d", PlayerToyInfo[giveplayerid][x][ptModelID]);
				}
				format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[giveplayerid][x][ptBone]]);
			}
			format(string, sizeof(string), "Listing %s's Toys - Select a Slot", GetPlayerNameEx(giveplayerid));
			ShowPlayerDialog(playerid, LISTTOYS_DELETETOY, DIALOG_STYLE_LIST, string, stringg, "Delete", "Cancel");
			SetPVarInt(playerid, "listtoys_giveplayerid", giveplayerid);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
	}
	return 1;
}

CMD:shoplaser(playerid, params[])
{
	if (PlayerInfo[playerid][pShopTech] < 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessageEx(playerid, COLOR_GREY, " You are not allowed to use this command.");
		return 1;
	}

	new string[128], giveplayerid, slot, color[32], invoice[64];
	if(sscanf(params, "udss[64]", giveplayerid, slot, color, invoice)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /shoplaser [player] [slot(0-9)] [red/green/orange/yellow/pink/blue] [invoice #]");

	if(strcmp(color,"red",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 18643;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	else if(strcmp(color,"green",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 19083;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	else if(strcmp(color,"orange",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 19082;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	else if(strcmp(color,"yellow",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 19084;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	else if(strcmp(color,"pink",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 19081;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	else if(strcmp(color,"blue",true) == 0)
	{
		PlayerToyInfo[giveplayerid][slot][ptModelID] = 19080;
		PlayerToyInfo[giveplayerid][slot][ptBone] = 6;
		PlayerToyInfo[giveplayerid][slot][ptTradable] = 1;
		g_mysql_NewToy(giveplayerid, slot);
	}
	format(string, sizeof(string), "You have been given a %s laser in slot %d, use /toys to manage it", color, slot);
	SendClientMessageEx(giveplayerid, COLOR_LIGHTGREEN, string);
	format(string, sizeof(string), "Ban da cho %s a %s laser in slot %d", GetPlayerNameEx(giveplayerid), color, slot);
	SendClientMessageEx(playerid, COLOR_LIGHTGREEN, string);
	format(string, sizeof(string), "[SHOPLASER] %s has given %s a laser toy - Invoice %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), invoice);
	Log("logs/shoplog.log", string);

	g_mysql_SaveToys(giveplayerid, slot);
	return 1;
}

CMD:permaban(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /permaban [Nguoi choi] [Ly do]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
			{
				format(string, sizeof(string), "[MAYCHU] %s was banned, reason: Attempting to ban a higher admin.", GetPlayerNameEx(giveplayerid));
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				PlayerInfo[playerid][pBanned] = 3;
				SystemBan(playerid, "[System] (Attempting to ban a higer admin)");
				SetTimerEx("KickEx", 1000, 0, "i", playerid);
			}
			else
			{
				new playerip[32];
				GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
				format(string, sizeof(string), "[MAYCHU] %s(IP:%s) was permanently banned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), playerip, GetPlayerNameEx(playerid), reason);
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was permanently banned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				PlayerInfo[giveplayerid][pPermaBanned] = 3;
                new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));

				AddBan(playerid, giveplayerid, reason);
				MySQLBan(GetPlayerSQLId(giveplayerid), ip, reason, 3, GetPlayerNameEx(playerid));

				format(string, sizeof(string), "UPDATE `bans` SET `status` = 3 WHERE `ip_address` = '%s'", ip);
				mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);

				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
			}
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}


CMD:banoff(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new string[128], playername[MAX_PLAYER_NAME];
	if(sscanf(params, "s[24]s[64]", playername)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /banoff [player name]");

    new giveplayerid = ReturnUser(playername);
	if(IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
		{
			format(string, sizeof(string), "[MAYCHU] %s has been auto-banned, reason: Trying to /ban a higher admin.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_YELLOW,string,2);
			PlayerInfo[playerid][pBanned] = 1;
			SystemBan(playerid, "[System] (Attempting to ban a higher admin)");
			Kick(giveplayerid);
		}
		else
		{
			new playerip[32];
			GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
			format(string, sizeof(string), "[MAYCHU] %s(IP:%s) was banned boi %s", GetPlayerNameEx(giveplayerid), playerip, GetPlayerNameEx(playerid));
			Log("logs/ban.log", string);
			SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi do da bi khoa tai khoan offline!");
			format(string, sizeof(string), "[MAYCHU] %s da bi khoa tai khoan (OFFLINE)", GetPlayerNameEx(giveplayerid));
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			PlayerInfo[giveplayerid][pBanned] = 1;
			new ip[32];
			GetPlayerIp(giveplayerid,ip,sizeof(ip));
			AddBan(playerid, giveplayerid, "BANNED OFFLINE");
			// MySQLBan(GetPlayerSQLId(giveplayerid),ip,GetPlayerNameEx(playerid));
			MySQLBan(GetPlayerSQLId(giveplayerid),GetPlayerNameEx(playerid), string,1,"BANNED OFFLINE");
			format(string, sizeof(string), "Banned account (%s)", GetPlayerNameEx(giveplayerid));
			SystemBan(giveplayerid, string);
			SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
		}
	}
	else
	{
		new query[128], tmpName[24];

		mysql_escape_string(playername, tmpName);
		format(query, sizeof(query), "UPDATE `accounts` SET `Band`=1 WHERE `Username`='%s' AND `AdminLevel` < 2 AND `PermBand` < 3", tmpName);
		mysql_function_query(MainPipeline, query, false, "OnBanPlayer", "i", playerid);

		SetPVarString(playerid, "OnBanPlayer", tmpName);
		//SetPVarString(playerid, "OnBanPlayerReason", reason);

		format(query,sizeof(query), "SELECT `id`, `IP` FROM `accounts` WHERE `Username`='%s'", tmpName);
		mysql_function_query(MainPipeline, query, true, "OnBanIP", "i", playerid);

		format(string,sizeof(string),"Attempting to ban %s...", tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	return 1;
}

CMD:ip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ip [ip]");

		new string[128], IP[32];

		foreach(new i: Player)
		{
			GetPlayerIp(i, IP, sizeof(IP));
			if(strfind(IP, params, true) != -1 && PlayerInfo[i][pAdmin] <= PlayerInfo[playerid][pAdmin])
			{
				format(string, sizeof(string), "Player: %s (ID: %d) (Level: %d) | IP: %s", GetPlayerNameEx(i), i, PlayerInfo[i][pLevel],  IP);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
		}
	}

	return 1;
}

CMD:unbanip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pBanAppealer] >= 1)
	{
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /unbanip [ip]");
		if(IsValidIP(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "That is not a valid IP address!");

		new string[128];
		RemoveBan(playerid, params);
		format(string, 128, "[MAYCHU] %s has unbanned IP %s", GetPlayerNameEx(playerid), params);
		ABroadCast(COLOR_LIGHTRED,string,2);
		format(string, sizeof(string), "[MAYCHU] %s has unbanned IP %s", GetPlayerNameEx(playerid), params);
		Log("logs/ban.log", string);
		print(string);
	}

	return 1;
}

CMD:banip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[150], ip[32], reason[64];
		if(sscanf(params, "s[32]s[64]", ip, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /banip [ip] [reason]");
		if(IsValidIP(ip)) return SendClientMessageEx(playerid, COLOR_WHITE, "That is not a valid IP address!");
		format(string, sizeof(string), "INSERT INTO `ip_bans` (`ip`, `date`, `reason`, `admin`) VALUES ('%s', NOW(), '%s', '%s')", ip, reason, GetPlayerNameEx(playerid));
		mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
		format(string, 128, "[MAYCHU] IP %s was banned boi %s, ly do: %s", ip, GetPlayerNameEx(playerid), reason);
		ABroadCast(COLOR_LIGHTRED,string,2);
		format(string, 128, "[MAYCHU] IP %s was banned boi %s, ly do: %s", ip, GetPlayerNameEx(playerid), reason);
		Log("logs/ban.log", string);
		print(string);
	}

	return 1;
}

CMD:unlockveh(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new vehicleid;
		if(sscanf(params, "d", vehicleid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /unlockveh [vehicle id]");

		if(IsValidVehicleID(vehicleid))
		{
			vehicle_unlock_doors(vehicleid);
			GameTextForPlayer(playerid, "~g~unlocked", 1000, 6);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid vehicle ID");
		}
	}
	return 1;
}

CMD:unban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pBanAppealer] >= 1)
	{
		new string[128], query[256], tmpName[24];
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /unban [player name]");

		mysql_escape_string(params, tmpName, MainPipeline);
		SetPVarString(playerid, "OnUnbanPlayer", tmpName);

		format(query, sizeof(query), "UPDATE `accounts` SET `Band`=0, `Warnings`=0, `Disabled`=0 WHERE `Username`='%s' AND `PermBand` < 3", tmpName);
		format(string, sizeof(string), "Attempting to unban %s...", tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		mysql_function_query(MainPipeline, query, false, "OnUnbanPlayer", "i", playerid);

		format(query, sizeof(query), "SELECT `IP` FROM `accounts` WHERE `Username`='%s'", tmpName);
		mysql_function_query(MainPipeline, query, true, "OnUnbanIP", "i", playerid);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
	}
	return 1;
}

CMD:osuspend(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3 || PlayerInfo[playerid][pSecurity] >= 2)
	{
		new string[128], query[512], tmpName[MAX_PLAYER_NAME];
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /osuspend [player name]");

		mysql_escape_string(params, tmpName);
		SetPVarString(playerid, "OnSetSuspended", tmpName);

		format(query,sizeof(query),"UPDATE `accounts` SET `Disabled` = 1 WHERE `Username`= '%s' AND `AdminLevel` < 6 AND `AdminLevel` > 1", tmpName);
		mysql_function_query(MainPipeline, query, false, "OnSetSuspended", "ii", playerid, true);

		format(string, sizeof(string), "Attempting to suspend %s's account.", tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:ounsuspend(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3)
	{
		new string[128], query[512], tmpName[24];
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /ounsuspend [player name]");

		mysql_escape_string(params, tmpName);
		SetPVarString(playerid, "OnSetSuspended", tmpName);
		format(query,sizeof(query),"UPDATE `accounts` SET `Disabled` = 0 WHERE `Username` = '%s' AND `AdminLevel` < 6 AND `AdminLevel` > 1", tmpName);
		mysql_function_query(MainPipeline, query, false, "OnSetSuspended", "ii", playerid, false);

		format(string,sizeof(string),"Attempting to unsuspend %s's account...",tmpName);
		SendClientMessageEx(playerid,COLOR_YELLOW,string);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:osetrmutes(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3) {

		new
			szPlayerName[MAX_PLAYER_NAME],
			iMuteCount;

		if(sscanf(params, "s[24]i", szPlayerName, iMuteCount)) {
			return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /osetrmutes [player name] [mutes]");
		}
		else if(iMuteCount >= 0) {

			new
				szQuery[128];

			mysql_escape_string(szPlayerName, szPlayerName);
			format(szQuery, sizeof szQuery, "UPDATE `accounts` SET `ReportMutedTotal` = %i, `ReportMuted` = 0, `ReportMutedTime` = 0 WHERE `Username` = '%s'", iMuteCount, szPlayerName);
			mysql_function_query(MainPipeline, szQuery, false, "Query_OnExecution", "ii", playerid);
			SetPVarString(playerid, "QueryEx_Name", szPlayerName);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Mutes cannot be set to less than zero.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

CMD:destroycar(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {
		if(IsPlayerInAnyVehicle(playerid)) {
			for(new i = 0; i < sizeof(CreatedCars); ++i) if(CreatedCars[i] == GetPlayerVehicleID(playerid)) {
				DestroyVehicle(CreatedCars[i]);
				CreatedCars[i] = INVALID_VEHICLE_ID;
   				 Player_Neon[playerid] = 0;
				return SendClientMessageEx(playerid, COLOR_GREY, "You have successfully despawned this vehicle.");
			}
			SendClientMessageEx(playerid, COLOR_GRAD1, "This vehicle is not admin-spawned.");
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "You're not in any vehicle.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:setfightstyle(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid, fightstyle;
		if(sscanf(params, "ud", giveplayerid, fightstyle))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setfightstyle [player] [fightstyle]");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Available fighting styles: 4, 5, 6, 7, 15, 26.");
			return 1;
		}

		if(fightstyle > 3 && fightstyle < 8 || fightstyle == 15 || fightstyle == 26)
		{
			format(string, sizeof(string), " Your fighting style has been changed to %d.", fightstyle);
			SendClientMessageEx(giveplayerid,COLOR_YELLOW,string);
			format(string, sizeof(string), " You have changed %s's fighting style to %d.", GetPlayerNameEx(giveplayerid), fightstyle);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			SetPlayerFightingStyle(giveplayerid, fightstyle);
			PlayerInfo[playerid][pFightStyle] = fightstyle;
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:setinsurance(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid, insurance;
		if(sscanf(params, "ud", giveplayerid, insurance))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setinsurance [player] [insurance]");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Available Insurances: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9");
			return 1;
		}

		if(insurance >= 0 && insurance <= 9)
		{
			format(string, sizeof(string), " Your insurance has been changed to %d.", insurance);
			SendClientMessageEx(giveplayerid,COLOR_YELLOW,string);
			format(string, sizeof(string), " You have changed %s's insurance to %d.", GetPlayerNameEx(giveplayerid), insurance);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			PlayerInfo[giveplayerid][pInsurance] = insurance;
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:setmyname(playerid, params[])
{
	new string[128], query[128];
	if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /setmyname [newname]");

	if (PlayerInfo[playerid][pUndercover] >= 1 || PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 4)
	{
		if(GetPVarInt(playerid, "TempName") == 0)
		{
		    if(strlen(params) > MAX_PLAYER_NAME)
			{
				format(string, sizeof(string), "You can't select a name that's above %d characters.", MAX_PLAYER_NAME);
				return SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
			new tmpName[24];
			mysql_escape_string(params, tmpName);

			format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `Username`='%s'", tmpName);
			SetPVarString(playerid, "OnSetMyName", tmpName);
			mysql_function_query(MainPipeline, query, true, "OnSetMyName", "i", playerid);
		}
		else
		{
			new name[MAX_PLAYER_NAME];
			GetPVarString(playerid, "TempNameName", name, sizeof(name));
			if(strlen(name) > 0)
			{
				SetPlayerName(playerid, name);
				SetPVarInt(playerid, "TempName", 0);
				format(string, sizeof(string), "You changed your name back to %s.", name);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				SendClientMessageEx(playerid, COLOR_GRAD2, "NOTE: Your stats will now save again.");
			}
		}
	}
	return 1;
}

CMD:setname(playerid, params[])
{
	new giveplayerid, string[128], name[MAX_PLAYER_NAME];
	if(sscanf(params, "us[24]", giveplayerid, name)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /setname [playerid] [newname]");

	if(IsPlayerConnected(giveplayerid))
	{
		if (PlayerInfo[playerid][pAdmin] >= 6)
		{
		    if(strlen(name) > MAX_PLAYER_NAME)
			{
				format(string, sizeof(string), "Ban khong the chon ten  %d nhan vat.", MAX_PLAYER_NAME);
				return SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
			new query[128], tmpName[MAX_PLAYER_NAME];
			mysql_escape_string(name, tmpName);
			if(strcmp(name, tmpName, false) == 0)
			{
	   			SetPVarString(playerid, "OnSetName", tmpName);

				format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `Username`='%s'", tmpName);
				mysql_function_query(MainPipeline, query, true, "OnSetName", "ii", playerid, giveplayerid);
			}
			else return SendClientMessageEx(playerid, COLOR_GRAD2, "Invalid characters!");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "You aren't authorised to use this command.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "No Such Player");
	}
	return 1;
}

CMD:togchatreports(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2) {

	    if(GetPVarType(playerid, "TogReports")) {

	        DeletePVar(playerid, "TogReports");
	        SendClientMessageEx(playerid, COLOR_WHITE, "You will now see all reports.");
	    }
	    else {
	        SetPVarInt(playerid, "TogReports", 1);
	        SendClientMessageEx(playerid, COLOR_WHITE, "You will now see priority reports only.");
	    }
	}
	return 1;
}

CMD:togreports(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pUndercover] >= 1)
	{
		switch(PlayerInfo[playerid][pTogReports])
		{
		case 0:
			{
				PlayerInfo[playerid][pTogReports] = 1;
				SendClientMessageEx(playerid, COLOR_WHITE, "You have went into spec ops mode, you will be unable to see admin messages.");
			}
		case 1:
			{
				PlayerInfo[playerid][pTogReports] = 0;
				SendClientMessageEx(playerid, COLOR_WHITE, "You are now out of spec ops mode, you will be able to see admin messages.");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "You aren't authorized to use this command.");
	}
	return 1;
}

CMD:blowup(playerid, params[])
{
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /blowup [player]");
	if((PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) && giveplayerid != playerid) return SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on the same/greater level admin than you!");
	if(IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 4)
		{
			if(IsPlayerConnected(giveplayerid))
			{
				format(string, sizeof(string), "You have successfuly exploded %s (ID: %d).",GetPlayerNameEx(giveplayerid),giveplayerid);
				SendClientMessageEx(playerid,COLOR_GRAD2,string);
				new Float:boomx, Float:boomy, Float:boomz;
				GetPlayerPos(giveplayerid,boomx, boomy, boomz);
				CreateExplosion(boomx, boomy , boomz, 7, 1);
				format(string, sizeof(string), "[MAYCHU] %s has exploded %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				Log("logs/admin.log", string);
			}
			else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
		}
	}
	return 1;
}

CMD:givenos(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givenos [player]");

		if(giveplayerid == INVALID_PLAYER_ID) return 1;
		if(!IsPlayerConnected(giveplayerid)) return 1;
		if(IsPlayerInAnyVehicle(giveplayerid))
		{
			new VehicleID = GetPlayerVehicleID(giveplayerid), Model = GetVehicleModel(VehicleID);
			switch(Model)
			{
			case 448,461,462,463,468,471,509,510,521,522,523,581,586,449: return
				SendClientMessageEx(playerid,COLOR_GRAD1,"ERROR: You can not tune this vehicle!");
			}
			AddVehicleComponent(VehicleID, 1010); PlayerPlaySound(giveplayerid,1133,0.0,0.0,0.0);//NOS
			format(string, sizeof(string), " Successfully added nos to %s's vehicle.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid,COLOR_GRAD1,string);
			format(string, sizeof(string), "[MAYCHU] %s has given nos to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
			Log("logs/admin.log", string);
		}
		else
		{
			SendClientMessageEx(playerid,COLOR_GRAD1,"ERROR: person must be in a vehicle.");
		}
	}
	else
	{
		SendClientMessageEx(playerid,COLOR_GRAD1,"Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:countdown(playerid, params[])
{
	if(IsARacer(playerid) && PlayerInfo[playerid][pTogReports] == 1 && PlayerInfo[playerid][pAdmin] >= 4) {
	    if(CountDown == 0) {
        	SetTimerEx("Countdown", 100, false, "i", playerid); //Keep this at 100milliseconds
        } else {
            SendClientMessageEx(playerid, COLOR_WHITE, "Thoi gian dem nguoc sap bat dau.");
        }
    } else if(IsARacer(playerid)) {
        if(CountDown == 0) {
        	SetTimerEx("Countdown", 100, false, "i", playerid); //Keep this at 100milliseconds
        } else {
            SendClientMessageEx(playerid, COLOR_WHITE, "Thoi gian dem nguoc bat dau.");
        }
    } else if(PlayerInfo[playerid][pAdmin] >= 3 && PlayerInfo[playerid][pTogReports] == 0) {
        if(CountDown == 0) {
        	SetTimerEx("Countdown", 100, false, "i", playerid); //Keep this at 100milliseconds
        } else {
            SendClientMessageEx(playerid, COLOR_WHITE, "Thoi gian dem nguoc bat dau.");
        }
    }
    return 1;
}
CMD:ipwhitelist(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], query[256], giveplayer[MAX_PLAYER_NAME], ip[16];
		if(sscanf(params, "s[24]s[16]", giveplayer, ip))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ipwhitelist [admin name] [IP]");
			return 1;
		}

		new tmpName[24], tmpIP[16];
		mysql_escape_string(giveplayer, tmpName, MainPipeline);
		mysql_escape_string(ip, tmpIP, MainPipeline);
		SetPVarString(playerid, "OnIPWhitelist", tmpName);

		format(query, sizeof(query), "UPDATE `accounts` SET `SecureIP`='%s' WHERE `Username`='%s' AND `AdminLevel` <= %d", tmpIP, tmpName, PlayerInfo[playerid][pAdmin]);
		mysql_function_query(MainPipeline, query, false, "OnIPWhitelist", "i", playerid);

		format(string, sizeof(string), "Attempting to whitelist %s on %s's account...", tmpIP, tmpName);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
	return 1;
}

CMD:setcapping(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {
		if(isnull(params)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setcapping [ping]");
		}

		new
			iPingas = strval(params);

		if(!(250 <= iPingas <= 1000)) {
			return SendClientMessageEx(playerid, COLOR_WHITE, "The specified ping limit can not be lower than 250 or higher than 1000.");
		}

		new
			szMessage[58 + MAX_PLAYER_NAME];

		format(szMessage, sizeof(szMessage), "[MAYCHU] %s has adjusted the /chiemdong ping limit to %d.", GetPlayerNameEx(playerid), iPingas);
		ABroadCast(COLOR_LIGHTRED, szMessage, 4);
		pointpinglimit = iPingas;
	}
	return 1;
}

CMD:hosp(playerid, params[]) {
	return cmd_hospital(playerid, params);
}

CMD:hospital(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid))
		{
			if(PlayerInfo[playerid][pHospital] > 0)
			{
				DeletePVar(playerid, "HospitalTimer");
				PlayerInfo[playerid][pHospital] = 0;				
				return SendClientMessageEx(playerid, COLOR_GREY, "Ban da duoc suat vien.");
			}
			else return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /hospital [player]");
		}
		else
		{
			if(IsPlayerConnected(giveplayerid))
			{
				if(PlayerInfo[giveplayerid][pHospital] > 0)
				{
					format(string, sizeof(string), " Ban da cho %s ra khoi vien.", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_WHITE, string);
					SendClientMessageEx(giveplayerid, COLOR_WHITE, "Ban da duoc Admin cho ra vien.");
					DeletePVar(giveplayerid, "HospitalTimer");
					HospitalSpawn(giveplayerid);
					PlayerInfo[giveplayerid][pHospital] = 0;
					DeletePVar(giveplayerid, "MedicBill");
					TogglePlayerControllable(giveplayerid, 1);
				}
				else SendClientMessageEx(playerid, COLOR_GRAD2, "That person is not in the hospital!");
			}
			else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
		}
	}
	return 1;
}

CMD:hoisinh(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /hoisinh [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				format(string, sizeof(string), " Ban da hoi sinh %s.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				SendClientMessageEx(giveplayerid, COLOR_WHITE, "Ban da duoc hoi sinh boi Admin.");
				format(string, sizeof(string), "[MAYCHU] %s Da Duoc Hoi Sinh Boi %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/admin.log", string);
				
				KillEMSQueue(giveplayerid);
   				ClearAnimations(giveplayerid);
   				SetPlayerHealth(giveplayerid, 100);
   				TogglePlayerControllable(giveplayerid, 1);
				PlayerTextDrawHide(giveplayerid, NotiEms[giveplayerid]);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi do khong bi thuong!");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:revivenear(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], radius, count;
		if(sscanf(params, "d", radius)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /revivenear [radius]");

		if(radius < 1 || radius > 100)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Radius must be higher than 0 and lower than 100!");
			return 1;
		}
        foreach(new i: Player)
		{
			if(GetPVarInt(i, "Injured") == 1)
			{
				if(ProxDetectorS(radius, playerid, i))
				{
					SetPlayerHealth(i, 100);
					count++;
				}
				SendClientMessageEx(i, COLOR_WHITE, "You have been revived by an Admin.");
				KillEMSQueue(i);
   				ClearAnimations(i);
   				SetPlayerHealth(i, 100);
   				format(string, sizeof(string), "[MAYCHU] %s has been revived by %s", GetPlayerNameEx(i), GetPlayerNameEx(playerid));
				Log("logs/admin.log", string);
			}
        }
		format(string, sizeof(string), "You have revived everyone (%d) nearby.", count);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:forcedeath(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /forcedeath [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				format(string, sizeof(string), " You have forced %s to death.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				SendClientMessageEx(giveplayerid, COLOR_WHITE, "You have been forced to death by an Admin.");
				KillEMSQueue(giveplayerid);
				ResetPlayerWeaponsEx(giveplayerid);
				SpawnPlayer(giveplayerid);
				format(string, sizeof(string), "[MAYCHU] %s has forced death %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				Log("logs/admin.log", string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi do khong bi thuong!");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:taocode(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 7)
	{
		new code[32], string[128], bypass;
		if (sscanf(params, "s[32]d", code, bypass))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setcode <code> <bypass 0/1>");
			SendClientMessageEx(playerid, COLOR_GREY, "If code is 'off', the active code will be disabled.");
			return 1;
		}

		format(GiftCode, 32, code);
		GiftCodeBypass = bypass;
        g_mysql_SaveMOTD();
		mysql_function_query(MainPipeline, "UPDATE `accounts` SET `GiftCode` = 0;", false, "OnQueryFinish", "i", SENDDATA_THREAD);
		foreach(new i : Player)
		{
		    if(PlayerInfo[i][pGiftCode] == 1)
		        PlayerInfo[i][pGiftCode] = 0;
		}


		if (strcmp(code, "off") == 0)
		{
			format(string, sizeof(string), "Ban da tu choi tao gift code.");
		}
		else
		{
			format(string, sizeof(string), "Ban da tao 1 gift code cho \"%s\".", code);
		}

		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}

	return 1;
}
CMD:dathopqua(playerid, params[]) {
	return cmd_dynamicgift(playerid, params);
}

CMD:dynamicgift(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Ban phai di bo de su dung lenh nay.");
			return 1;
		}

		new string[128], Float:Position[4], zone[MAX_ZONE_NAME];
		if(dynamicgift == 0)
		{
			GetPlayerPos(playerid, Position[0], Position[1], Position[2]);
			GetPlayer3DZone(playerid, zone, sizeof(zone));
			GetPlayerFacingAngle(playerid, Position[3]);
			dynamicgift = CreateDynamicObject(19054, Position[0], Position[1], Position[2]-0.4, 0.0, 0.0, Position[3], -1, -1, -1, 200.0);
			dynamicgift3DText = CreateDynamic3DTextLabel("\n{00ff38}[GO:RP]{FFFFFF}\n{13cbe7}/nhanqua{FFFFFF}\n{f8f1ff}De nhan mon qua cua minh.{FFFFFF}",COLOR_YELLOW,Position[0], Position[1], Position[2]+0.25,8.0);
			SetPlayerPos(playerid, Position[0], Position[1], Position[2]+3);
			format(string, sizeof(string), "[GO:RP] {00ff00}%s{ffffff} da dat {00ffff}HOP QUA{FFFFFF} tai {ff3300}%s{ffffff}.", GetPlayerNameEx(playerid), zone);

			if(IsDynamicGiftBoxEnabled == true)
			{
				SendClientMessageEx(playerid, COLOR_RED, "Due to the Dynamic Giftbox being enabled, you may view the content inside the giftbox.");

				if(PlayerInfo[playerid][pAdmin] == 7)
				{
					SendClientMessageEx(playerid, COLOR_RED, "Executive Admin Note: You must fill up the giftbox with /dgedit.");
				}
				ShowPlayerDynamicGiftBox(playerid);
			}
			ABroadCast( COLOR_LIGHTRED, string, 5);
		}
		else
		{
			DestroyDynamicObject(dynamicgift);
			dynamicgift = 0;
			DestroyDynamic3DTextLabel( Text3D:dynamicgift3DText );
			format(string, sizeof(string), "[GO:RP] {00ff00}%s{ffffff} da pha huy {00ffff}HOP QUA{FFFFFF}", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, string, 5);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:oipcheck(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new query[128], name[MAX_PLAYER_NAME];
	if(sscanf(params, "s", name)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /oipcheck [name]");

	new tmpName[24];
	mysql_escape_string(name, tmpName, MainPipeline);

	format(query, sizeof(query), "SELECT `Username`, `IP` FROM `accounts` WHERE `Username` = '%s' AND `AdminLevel` <= %d", tmpName, PlayerInfo[playerid][pAdmin]);
	mysql_function_query(MainPipeline, query, true, "OnIPCheck", "i", playerid);
	return 1;
}

CMD:ipcheck(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ipcheck [player]");

		if(giveplayerid == INVALID_PLAYER_ID) return 1;
		if(IsPlayerConnected(giveplayerid) && PlayerInfo[giveplayerid][pAdmin] <= 1)
		{
			new playerip[32];
			GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
			format(string, sizeof(string), "(ID: %d) - (Name: %s) - (IP: %s)", giveplayerid, GetPlayerNameEx(giveplayerid), playerip);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has IP Checked %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
			Log("logs/ipcheck.log", string);
		}
		else if(IsPlayerConnected(giveplayerid) && PlayerInfo[giveplayerid][pAdmin] <= PlayerInfo[playerid][pAdmin] && PlayerInfo[playerid][pAdmin] >= 6)
		{
			new playerip[32];
			GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
			format(string, sizeof(string), "(ID: %d) - (Name: %s) - (IP: %s)", giveplayerid, GetPlayerNameEx(giveplayerid), playerip);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has IP Checked %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
			Log("logs/ipcheck.log", string);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:pfine(playerid, params[])
{
	new string[128], giveplayerid, percentage, minimum, reason[64];
	if(sscanf(params, "udds[64]", giveplayerid, percentage, minimum, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pfine [player] [percentage] [minimum] [reason]");

	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		if(IsPlayerConnected(giveplayerid))
		{
			new totalwealth = PlayerInfo[giveplayerid][pAccount] + GetPlayerCash(giveplayerid);
			if(PlayerInfo[giveplayerid][pPhousekey] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey]][hSafeMoney];
			if(PlayerInfo[giveplayerid][pPhousekey2] != INVALID_HOUSE_ID && HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hOwnerID] == GetPlayerSQLId(giveplayerid)) totalwealth += HouseInfo[PlayerInfo[giveplayerid][pPhousekey2]][hSafeMoney];
			if(totalwealth < 1) return SendClientMessageEx(giveplayerid, COLOR_GRAD2, "That person does not have any money!");

			new fine = percentage * totalwealth / 100;
			if(percentage < 1 || percentage > 100) return SendClientMessageEx(playerid, COLOR_GRAD2, "Percentage must be greater than 0 and below 100.");
			else if(minimum < 1) return SendClientMessageEx(playerid, COLOR_GRAD2, "Minimum amount must be greater than 0.");

			if(minimum > fine)
			{
				//GivePlayerCash(giveplayerid, -minimum);
				GivePlayerCashEx(giveplayerid, TYPE_ONHAND, -minimum);
				format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(minimum), GetPlayerNameEx(playerid), reason);
			}
			else
			{
				//GivePlayerCash(giveplayerid, -fine);
				GivePlayerCashEx(giveplayerid, TYPE_ONHAND, -fine);
				format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(fine), GetPlayerNameEx(playerid), reason);
			}

			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			Log("logs/admin.log", string);
			//OnPlayerStatsUpdate(giveplayerid);
			return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:fine(playerid, params[])
{
	new string[128], giveplayerid, amount, reason[64];
	if(sscanf(params, "uds[64]", giveplayerid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /fine [player] [amount] [reason]");

	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		if(IsPlayerConnected(giveplayerid))
		{
			if (amount < 1)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Amount must be greater than 0");
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			GivePlayerCash(giveplayerid, -amount);
			OnPlayerStatsUpdate(giveplayerid);
			return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You're not a level three admin.");
	}
	return 1;
}

CMD:sfine(playerid, params[])
{
	new string[128], giveplayerid, amount, reason[64];
	if(sscanf(params, "uds[64]", giveplayerid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sfine [player] [amount] [reason]");

	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(IsPlayerConnected(giveplayerid))
		{
			if (amount < 1)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Amount must be greater than 0");
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s was silent fined $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s was silent fined $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "You have been silent fined $%s boi %s, ly do: %s", number_format(amount), GetPlayerNameEx(playerid), reason);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
			GivePlayerCash(giveplayerid, -amount);
			OnPlayerStatsUpdate(giveplayerid);
			return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You're not a level three admin.");
	}
	return 1;
}

CMD:listguns(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /listguns [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			new weapons[13][2], weaponname[50];
			if(GetPVarInt(giveplayerid, "EventToken") != 0 || GetPVarInt(giveplayerid, "IsInArena") >= 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That person is at an event/paintball so the weapons may appear as non-server sided.");
			}
			SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
			format(string, sizeof(string), "Weapons on %s:", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			for (new i = 0; i < 13; i++)
			{
				GetPlayerWeaponData(giveplayerid, i, weapons[i][0], weapons[i][1]);
				if(weapons[i][0] > 0)
				{
					if(PlayerInfo[giveplayerid][pGuns][i] == weapons[i][0])
					{
						GetWeaponName(weapons[i][0], weaponname, sizeof(weaponname));
						format(string, sizeof(string), "%s (%d).", weaponname, weapons[i][0]);
						SendClientMessageEx(playerid, COLOR_GRAD1, string);
					}
					else
					{
						GetWeaponName(weapons[i][0], weaponname, sizeof(weaponname));
						format(string, sizeof(string), "%s (%d) (non server-side).", weaponname, weapons[i][0]);
						SendClientMessageEx(playerid, COLOR_GRAD1, string);
					}
				}
			}
			SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:gotomapicon(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new mapiconid;
	if(sscanf(params, "d", mapiconid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotomapicon [mapiconid]");

	if(mapiconid >= MAX_DMAPICONS || mapiconid < 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotomapicon [mapiconid]");
		return 1;
	}
	SetPlayerPos(playerid, DMPInfo[mapiconid][dmpPosX], DMPInfo[mapiconid][dmpPosY], DMPInfo[mapiconid][dmpPosZ]);
	SetPlayerVirtualWorld(playerid, DMPInfo[mapiconid][dmpVW]);
	SetPlayerInterior(playerid, DMPInfo[mapiconid][dmpInt]);
	return 1;
}

CMD:gotofpoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 2)
	{
		new points, string[128];
		if(sscanf(params, "d", points)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotofpoint [pointid]");
		if(points < 1 || points > 9) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid point id!");

		SetPlayerPos(playerid, Points[points][Pointx], Points[points][Pointy], Points[points][Pointz]), SetPlayerVirtualWorld(playerid, Points[points][pointVW]);
		format(string, sizeof(string), "You have teleported to family point %d", points);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the su dung lenh nay!");
	return 1;
}

CMD:gotopoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new points;
	if(sscanf(params, "d", points)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotopoint [pointid]");

	if(points >= MAX_EVENTPOINTS || points < 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotopoint [pointid]");
		return 1;
	}
	SetPlayerPos(playerid, EventPoints[points][epPosX], EventPoints[points][epPosY], EventPoints[points][epPosZ]);
	SetPlayerVirtualWorld(playerid, EventPoints[points][epVW]);
	SetPlayerInterior(playerid, EventPoints[points][epInt]);
	return 1;
}

CMD:createpoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new string[128], flagable, pointid, prize[64];
	if(sscanf(params, "dds[64]", flagable, pointid, prize)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /createpoint [flagable] [pointid] [prize]");

	if(EventPoints[pointid][epObjectID] != 0)
	{
		DestroyDynamicPickup(EventPoints[pointid][epObjectID]);
		EventPoints[pointid][epObjectID] = 0;
		if(IsValidDynamic3DTextLabel(EventPoints[pointid][epText3dID]))
		{
			DestroyDynamic3DTextLabel(EventPoints[pointid][epText3dID]);
		}

		EventPoints[pointid][epPosX] = 0.0;
		EventPoints[pointid][epPosY] = 0.0;
		EventPoints[pointid][epPosZ] = 0.0;
		EventPoints[pointid][epVW] = 0;
		EventPoints[pointid][epInt] = 0;
	}
	new Float:x, Float:y, Float:z;

	GetPlayerPos(playerid, x, y, z);
	new tvw = GetPlayerVirtualWorld(playerid);
	new tint = GetPlayerInterior(playerid);

	EventPoints[pointid][epPosX] = x;
	EventPoints[pointid][epPosY] = y;
	EventPoints[pointid][epPosZ] = z;
	EventPoints[pointid][epVW] = tvw;
	EventPoints[pointid][epInt] = tint;
	EventPoints[pointid][epFlagable] = flagable;
	format(EventPoints[pointid][epPrize], 64, "%s", prize);

	format(string,sizeof(string),"Event Point (ID: %d)\nPrize: %s\nType /claimpoint to claim your prize!", pointid, EventPoints[pointid][epPrize]);
	EventPoints[pointid][epObjectID] = CreateDynamicPickup(1274, 1, EventPoints[pointid][epPosX], EventPoints[pointid][epPosY], EventPoints[pointid][epPosZ], EventPoints[pointid][epVW]);
	EventPoints[pointid][epText3dID] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, EventPoints[pointid][epPosX], EventPoints[pointid][epPosY], EventPoints[pointid][epPosZ]+0.5, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, EventPoints[pointid][epVW], EventPoints[pointid][epInt]);

	format(string,sizeof(string),"You have placed PointID %d at your current position.", pointid);
	SendClientMessageEx(playerid, COLOR_GRAD2, string);
	return 1;
}

CMD:deletepoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new string[128], pointid;
	if(sscanf(params, "d", pointid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /deletepoint [pointid]");

	if(pointid >= MAX_EVENTPOINTS || pointid < 0)
	{
		return 1;
	}
	if(EventPoints[pointid][epObjectID] != 0)
	{
		DestroyDynamicPickup(EventPoints[pointid][epObjectID]);
		EventPoints[pointid][epObjectID] = 0;
		if(IsValidDynamic3DTextLabel(EventPoints[pointid][epText3dID]))
		{
			DestroyDynamic3DTextLabel(EventPoints[pointid][epText3dID]);
		}

		EventPoints[pointid][epPosX] = 0.0;
		EventPoints[pointid][epPosY] = 0.0;
		EventPoints[pointid][epPosZ] = 0.0;
		EventPoints[pointid][epVW] = 0;
		EventPoints[pointid][epInt] = 0;
		EventPoints[pointid][epFlagable] = 0;
		format(EventPoints[pointid][epPrize], 64, "");

		format(string,sizeof(string),"You have deleted PointID %d from the server.", pointid);
		SendClientMessageEx(playerid, COLOR_GRAD2, string);
	}
	return 1;
}
CMD:payday(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5) {
	    PlayerInfo[playerid][pConnectSeconds] = 3600;
		PayDay(playerid);
	}
	return 1;
}
CMD:orders(playerid, params[])
{
	if(PlayerInfo[playerid][pShopTech] > 0 || PlayerInfo[playerid][pAdmin] >= 4)
	{
 		new string[128];
        SendClientMessageEx(playerid, COLOR_GREEN, "____________________ SHOP ORDERS _____________________");
		foreach(new i: Player)
		{
			if(PlayerInfo[i][pOrder] > 0 && OrderAssignedTo[i] == INVALID_PLAYER_ID)
			{
				new playerip[32];
				GetPlayerIp(i, playerip, sizeof(playerip));

				new orderid = PlayerInfo[i][pOrder];

				if(PlayerInfo[i][pOrderConfirmed]) {
					format(string, sizeof(string), "%s(%d) | Order ID: %d (Xac nhan) | IP: %s | Assigned to: Nobody", GetPlayerNameEx(i), i, orderid, playerip);
				} else {
					format(string, sizeof(string), "%s(%d) | Order ID: %d (Vo hieu) | IP: %s | Assigned to: Nobody", GetPlayerNameEx(i), i, orderid, playerip);
				}
				SendClientMessageEx(playerid, COLOR_SHOP, string);
			}
			else if(PlayerInfo[i][pOrder] > 0 && OrderAssignedTo[i] != INVALID_PLAYER_ID)
			{
				new playerip[32];
				GetPlayerIp(i, playerip, sizeof(playerip));

				new orderid = PlayerInfo[i][pOrder];

				if(PlayerInfo[i][pOrderConfirmed]) {
					format(string, sizeof(string), "%s(%d) | Order ID: %d (Xac nhan) | IP: %s | Assigned to: %s", GetPlayerNameEx(i), i, orderid, playerip, GetPlayerNameEx(OrderAssignedTo[i]));
				} else {
					format(string, sizeof(string), "%s(%d) | Order ID: %d (Vo hieu) | IP: %s | Assigned to: %s", GetPlayerNameEx(i), i, orderid, playerip, GetPlayerNameEx(OrderAssignedTo[i]));
				}
				SendClientMessageEx(playerid, COLOR_SHOP, string);
			}
		}
  		SendClientMessageEx(playerid, COLOR_WHITE, "Use /givemeorder /processorder /denyorder");
        SendClientMessageEx(playerid, COLOR_GREEN, "________________________________________________________");
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:givemeorder(playerid, params[])
{
	if(PlayerInfo[playerid][pShopTech] > 0 || PlayerInfo[playerid][pAdmin] >= 6)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givemeorder [player]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pOrder] > 0)
			{
			    if(IsPlayerConnected(OrderAssignedTo[giveplayerid]))
			    {
			        if(GetPVarInt(playerid, "OrderAssignedTo") == giveplayerid)
			        {
			            DeletePVar(playerid, "OrderAssignedTo");
			        }
			        else
			        {
					    SendClientMessageEx(playerid, COLOR_WHITE, "That order ID has already been assigned to another admin!");
					    SendClientMessageEx(playerid, COLOR_WHITE, "If you are sure you wish to take the order anyway, type this command again.");
					    SetPVarInt(playerid, "OrderAssignedTo", giveplayerid);
				        return 1;
					}
			    }
		    	new string[128];
		    	new orderid = PlayerInfo[giveplayerid][pOrder];
				format(string, sizeof(string), "[MAYCHU] %s assigned himself to shop order ID %d from %s (ID: %d).", GetPlayerNameEx(playerid), orderid, GetPlayerNameEx(giveplayerid), giveplayerid);
				ShopTechBroadCast(COLOR_ORANGE, string);

				format(string, sizeof(string), "%s is now reviewing your shop order ID %d.", GetPlayerNameEx(playerid), orderid);
				SendClientMessageEx(giveplayerid, COLOR_WHITE, string);

				OrderAssignedTo[giveplayerid] = playerid;
			}
			else SendClientMessageEx(playerid, COLOR_GREY, "That person does not have any shop orders pending!");
		}
		else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");

	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}
CMD:searchvipm(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pShopTech] >= 1)
	{
	    new
	        count,
	        vipm,
	        string[128];

 		if(sscanf(params, "d", vipm)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /searchvipm [vipm]");

  		foreach(new i: Player)
   		{
    		if(PlayerInfo[i][pVIPM] == vipm)
    	 	{
    	  		format(string, sizeof(string), "%s (%d) | VIPM: %d", GetPlayerNameEx(i), i, vipm);
    	  		SendClientMessageEx(playerid, COLOR_WHITE, string);
    	  		count++;
    	    }
    	    if(PlayerInfo[i][pVIPMO] == vipm)
    	    {
    	  		format(string, sizeof(string), "%s (%d) | VIPM Old: %d", GetPlayerNameEx(i), i, vipm);
    	    	SendClientMessageEx(playerid, COLOR_WHITE, string);
    	    	count++;
    	    }
    	    else if(count == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "No person online matched that VIPM number.");
    	}
	}
	return 1;
}
CMD:newgvip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pShopTech] >= 1)
	{
	    new
	        iOrderID,
	        iTargetID,
	        szIP[16],
			szMessage[128];

		if(sscanf(params, "ud", iTargetID, iOrderID)) {
		    SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /newgvip [Player] [OrderID]");
		}
		else if(!IsPlayerConnected(iTargetID)) {
		    SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		}
		else {
			if(PlayerInfo[iTargetID][pGVip] != 0 && GetPVarInt(playerid, "ConfirmGVip") == 0) {
	    	    SetPVarInt(playerid, "ConfirmGVip", 1);
	    	    SendClientMessageEx(playerid, COLOR_WHITE, "That person has been issued gold vip before, if you are sure you want to issue him gold vip again");
	    	    SendClientMessageEx(playerid, COLOR_WHITE, "re-type this command (/newgvip). If he ordered a gold vip renewal use the other command (/renewgvip).");
	    	}
	    	else
	    	{
	        	DeletePVar(playerid, "ConfirmGVip");
		    	if(PlayerInfo[iTargetID][pVIPM] != 0) {
		    	    PlayerInfo[iTargetID][pVIPMO] = PlayerInfo[iTargetID][pVIPM];
					PlayerInfo[iTargetID][pVIPM] = VIPM;
					VIPM++;
				} else {
				    PlayerInfo[iTargetID][pVIPM] = VIPM;
					VIPM++;
				}
				PlayerInfo[iTargetID][pVIPExpire] = gettime()+2592000;
				format(szMessage, sizeof(szMessage), "[MAYCHU] %s has set %s's VIP level to Gold (3).", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
				ABroadCast(COLOR_LIGHTRED,szMessage, 5);
				format(szMessage, sizeof(szMessage), "Your VIP level has been set to Gold by Admin %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(iTargetID, COLOR_WHITE, szMessage);
				if (PlayerInfo[playerid][pAdmin] < 5) {
					format(szMessage, sizeof(szMessage), "[MAYCHU] %s has set %s's VIP level to Gold (3).", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
					SendClientMessageEx(playerid, COLOR_LIGHTRED, szMessage);
				}
        	    PlayerInfo[iTargetID][pDonateRank] = 3;
				PlayerInfo[iTargetID][pTempVIP] = 0;
				PlayerInfo[iTargetID][pBuddyInvited] = 0;
				PlayerInfo[iTargetID][pGVip] = 1;
				LoadPlayerDisabledVehicles(iTargetID);
				GetPlayerIp(iTargetID, szIP, sizeof(szIP));
				format(szMessage, sizeof(szMessage), "[GVIP] %s has set %s's (IP:%s) VIP level to Gold (3). (VIPM - %d | OrderID - %d)", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID), szIP, PlayerInfo[iTargetID][pVIPM], iOrderID);
				Log("logs/setvip.log", szMessage);
			}
		}
	}
	else
	{
	    SendClientMessage(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:renewgvip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pShopTech] >= 1)
	{
	    new
	        iOrderID,
	        iTargetID,
	        szIP[16],
			szMessage[128],
			months;

		if(sscanf(params, "udd", iTargetID, iOrderID, months)) {
		    SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /renewgvip [player] [order ID] [months]");
		}
		else if(!IsPlayerConnected(iTargetID)) {
		    SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		}
		else if(PlayerInfo[iTargetID][pGVip] == 0) {
		    SendClientMessageEx(playerid, COLOR_GREY, "That person has never purchased Gold VIP.");
		}
		else {
			if(PlayerInfo[iTargetID][pVIPM] != 0) {
    			PlayerInfo[iTargetID][pVIPMO] = PlayerInfo[iTargetID][pVIPM];
				PlayerInfo[iTargetID][pVIPM] = VIPM;
				VIPM++;
			} else {
				PlayerInfo[iTargetID][pVIPM] = VIPM;
				VIPM++;
			}
			PlayerInfo[iTargetID][pVIPExpire] = gettime()+(2592000*months);
			format(szMessage, sizeof(szMessage), "[MAYCHU] %s has set %s's VIP level to Gold (3).", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
			ABroadCast(COLOR_LIGHTRED,szMessage, 5);
			format(szMessage, sizeof(szMessage), "Your VIP level has been set to Gold by Admin %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(iTargetID, COLOR_WHITE, szMessage);
			if (PlayerInfo[playerid][pAdmin] < 5) {
				format(szMessage, sizeof(szMessage), "[MAYCHU] %s has set %s's VIP level to Gold (3).", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
				SendClientMessageEx(playerid, COLOR_LIGHTRED, szMessage);
			}
   			PlayerInfo[iTargetID][pDonateRank] = 3;
			PlayerInfo[iTargetID][pTempVIP] = 0;
			PlayerInfo[iTargetID][pBuddyInvited] = 0;
			GetPlayerIp(iTargetID, szIP, sizeof(szIP));
			format(szMessage, sizeof(szMessage), "[GVIP RENEWAL] %s has set %s's (IP:%s) VIP level to Gold (3). (VIPM - %d | OrderID - %d | Months: %d)", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID), szIP, PlayerInfo[iTargetID][pVIPM], iOrderID, months);
			Log("logs/setvip.log", szMessage);
		}
	}
	else
	{
	    SendClientMessage(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:setvip(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128], giveplayerid, level, months, orderid[32];
		if(sscanf(params, "udds[32]", giveplayerid, level, months, orderid))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setvip [player] [level] [months] [orderID]");
			SendClientMessageEx(playerid, COLOR_GRAD3, "Available Levels: |0| None |1| Bronze |2| Silver |4| Platinum |5| Moderator");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
   			if(giveplayerid != INVALID_PLAYER_ID)
			{
				if(level < 0 || level > 5)
				{
					SendClientMessageEx(playerid, COLOR_GRAD1, "VIP Level can not be below 0 or above 5!");
					return 1;
				}
				if(level == 3)
				{
				    SendClientMessage(playerid, COLOR_GRAD1, "VIP Level can not be set to 3 through this command");
				    return 1;
				}
				PlayerInfo[giveplayerid][pDonateRank] = level;
				PlayerInfo[giveplayerid][pTempVIP] = 0;
				PlayerInfo[giveplayerid][pBuddyInvited] = 0;
				PlayerInfo[giveplayerid][pVIPSellable] = 0;
				LoadPlayerDisabledVehicles(giveplayerid);
				new playerip[32];
				GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
				if(level == 0)
				{
					if (PlayerInfo[playerid][pAdmin] < 5)
					{
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to None (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to None (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
					ABroadCast(COLOR_LIGHTRED,string, 5);
					format(string, sizeof(string), "Your VIP level has been set to None by Admin %s.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
					PlayerInfo[giveplayerid][pTokens] = 0;

					format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to None (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
					Log("logs/setvip.log", string);
					return 1;
				}
				if(level == 1)
				{
					if (PlayerInfo[playerid][pAdmin] < 5)
					{
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Bronze (%d)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level, orderid);
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					if(PlayerInfo[giveplayerid][pVIPM] == 0)
					{
						PlayerInfo[giveplayerid][pVIPM] = VIPM;
						VIPM++;
					}
					PlayerInfo[giveplayerid][pVIPExpire] = gettime()+2592000*months;
					format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Bronze (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
					ABroadCast(COLOR_LIGHTRED,string, 5);
					format(string, sizeof(string), "Your VIP level has been set to Bronze by Admin %s.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);

					format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to Bronze (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
					Log("logs/setvip.log", string);
					return 1;
				}
				if(level == 2)
				{
					if (PlayerInfo[playerid][pAdmin] < 5)
					{
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Silver (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					if(PlayerInfo[giveplayerid][pVIPM] == 0)
					{
						PlayerInfo[giveplayerid][pVIPM] = VIPM;
						VIPM++;
					}
					PlayerInfo[giveplayerid][pVIPExpire] = gettime()+2592000*months;
					format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Silver (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
					ABroadCast(COLOR_LIGHTRED,string, 5);
					format(string, sizeof(string), "Your VIP level has been set to Silver by Admin %s.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);

					format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to Silver (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
					Log("logs/setvip.log", string);
					return 1;
				}
				if(level == 3)
				{
				    if(!GetPVarType(playerid, "ConfirmGold")) {
				        SendClientMessageEx(playerid, COLOR_WHITE, "You are about to set someone's vip level to gold. If this is a gold vip order please use the new system.");
				        SendClientMessageEx(playerid, COLOR_WHITE, "For a new purchase of Gold Vip use(/newgvip).For renewals use(/renewgvip). If you wish to continue using this command type it again(/setvip)");
				        SetPVarInt(playerid, "ConfirmGold", 1);
				    }
				    else {
				        DeletePVar(playerid, "ConfirmGold");
						if (PlayerInfo[playerid][pAdmin] < 5)
						{
							format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Gold (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
							SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
						}
						if(PlayerInfo[giveplayerid][pVIPM] == 0)
						{
						    PlayerInfo[giveplayerid][pVIPM] = VIPM;
							VIPM++;
						}
						PlayerInfo[giveplayerid][pVIPExpire] = gettime()+2592000*months;
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Gold (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
						ABroadCast(COLOR_LIGHTRED,string, 5);
						format(string, sizeof(string), "Your VIP level has been set to Gold by Admin %s.", GetPlayerNameEx(playerid));
						SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
						format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to Gold (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
						Log("logs/setvip.log", string);
						return 1;
					}
				}
				if(level == 4)
				{
					if (PlayerInfo[giveplayerid][pAdmin] < 5)
					{
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Platinum (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					if(PlayerInfo[giveplayerid][pVIPM] == 0)
					{
					   	PlayerInfo[giveplayerid][pVIPM] = VIPM;
						VIPM++;
					}
					format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Platinum (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
					ABroadCast(COLOR_LIGHTRED,string, 5);
					format(string, sizeof(string), "Your VIP level has been set to Platinum by Admin %s.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);

					// Level 5 Arms Job - Platinum VIP
					PlayerInfo[giveplayerid][pArmsSkill] = 401;

					format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to Platinum (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
					Log("logs/setvip.log", string);
					return 1;
				}
				if(level == 5)
				{
					if (PlayerInfo[playerid][pAdmin] < 5)
					{
						format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Moderator (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
						SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
					}
					if(PlayerInfo[giveplayerid][pVIPM] == 0)
					{
					    PlayerInfo[giveplayerid][pVIPM] = VIPM;
						VIPM++;
					}
					format(string, sizeof(string), "[MAYCHU] %s has set %s's VIP level to Moderator (%d).", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), level);
					ABroadCast(COLOR_LIGHTRED,string, 5);
					format(string, sizeof(string), "Your VIP level has been set to Moderator by Admin %s.", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);

					format(string, sizeof(string), "[MAYCHU] %s has set %s's (IP:%s) VIP level to Moderator (%d) (order #%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), playerip, level, orderid);
					Log("logs/setvip.log", string);
					return 1;
				}
			}
			Misc_Save();
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:giftgvip(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid, days,reason[32];
		if(sscanf(params, "uds[32]", giveplayerid, days, reason))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /giftgvip [player] [days] [reason]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pDonateRank] = 3;
			PlayerInfo[giveplayerid][pTempVIP] = 0;
			PlayerInfo[giveplayerid][pBuddyInvited] = 0;
			new playerip[32];
			GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
			PlayerInfo[giveplayerid][pVIPExpire] = gettime()+86400*days;
			format(string, sizeof(string), "[MAYCHU] %s has gifted %s Gold VIP for %d days (%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), days, reason);
			ABroadCast(COLOR_LIGHTRED,string, 5);
			format(string, sizeof(string), "Your VIP level has been set to Gold by Admin %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
			format(string, sizeof(string), "[MAYCHU] %s has gifted %s Gold VIP for %d days (%s)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), days, reason);
			Log("logs/setvip.log", string);
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:ofine(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{

		new string[128], query[256], name[MAX_PLAYER_NAME], amount, reason[64];
		if(sscanf(params, "s[24]ds[64]", name, amount, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /ofine [name] [amount] [reason]");
        new giveplayerid = ReturnUser(name);
		if(IsPlayerConnected(giveplayerid))
		{
            if (amount < 1) return SendClientMessageEx(playerid, COLOR_GRAD2, "Amount must be greater than 0");
			format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s da tru $%s boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), number_format(amount), GetPlayerNameEx(playerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			GivePlayerCash(giveplayerid, -amount);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
		}
		else
		{
			new tmpName[24];
			mysql_escape_string(name, tmpName);
			SetPVarString(playerid, "OnFine", tmpName);
			SetPVarInt(playerid, "OnFineAmount", amount);
			SetPVarString(playerid, "OnFineReason", reason);


			format(query, sizeof(query), "UPDATE `accounts` SET `Money` = `Money` - %d WHERE `PermBand` < 3 AND `Band` = 0 AND `AdminLevel` < 2 AND `Username`='%s'", amount, tmpName);
			mysql_function_query(MainPipeline, query, false, "OnFine", "i", playerid);

			format(string, sizeof(string), "Attempting to fine $%s from %s's account...", number_format(amount), tmpName);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You're not a level three admin.");
	}
	return 1;
}

CMD:giveobject(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		new string[1024], giveplayerid, object;
		if(sscanf(params, "ud", giveplayerid, object)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /giveobject [player] [object]");
		if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le");

		SetPVarInt(playerid, "giveplayeridtoy", giveplayerid);
		SetPVarInt(playerid, "toyid", object);
		new icount = GetPlayerToySlots(giveplayerid);
		for(new x;x<icount;x++)
		{
		    new name[24];
		    format(name, sizeof(name), "None");

			for(new i;i<sizeof(HoldingObjectsAll);i++)
			{
				if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[giveplayerid][x][ptModelID])
		        {
          			format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
				}
			}
			if(PlayerToyInfo[giveplayerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0))
			{
			    format(name, sizeof(name), "ID: %d", PlayerToyInfo[giveplayerid][x][ptModelID]);
			}
			format(string, sizeof(string), "%s(%d) %s (Bone: %s)\n", string, x, name, HoldingBones[PlayerToyInfo[giveplayerid][x][ptBone]]);
		}
   		ShowPlayerDialog(playerid, GIVETOY, DIALOG_STYLE_LIST, "Select a slot", string, "Lua chon", "Huy bo");
	}
	else {
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay!");
	}
	return 1;
}
CMD:check(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /check [player]");
		if(IsPlayerConnected(giveplayerid)) ShowStats(playerid, giveplayerid);
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}



CMD:checkinv(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkinv [player]");
		if(IsPlayerConnected(giveplayerid)) ShowInventory(playerid, giveplayerid);
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}



CMD:groupcsfban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /groupcsfban [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if( PlayerInfo[giveplayerid][pMember] >= 0 || PlayerInfo[giveplayerid][pLeader] >= 0 )
			{
				PlayerInfo[giveplayerid][pCSFBanned] = 1;
				format(string, sizeof(string), "You have been group-banned, by %s, from ALL Civil Service Groups.", GetPlayerNameEx( playerid ));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				PlayerInfo[giveplayerid][pMember] = INVALID_GROUP_ID;
				PlayerInfo[giveplayerid][pLeader] = INVALID_GROUP_ID;
				PlayerInfo[giveplayerid][pDivision] = INVALID_DIVISION;
				PlayerInfo[giveplayerid][pRank] = INVALID_RANK;
				PlayerInfo[giveplayerid][pDuty] = 0;
				PlayerInfo[giveplayerid][pModel] = NOOB_SKIN;
				SetPlayerToTeamColor(giveplayerid);
				SetPlayerSkin(giveplayerid, NOOB_SKIN);
				format(string, sizeof(string), "You have faction-banned %s from all CSF groups.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You can't kick someone from a faction if they're not a leader / member.");
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
		}
	}
	return 1;
}

CMD:groupunban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		new giveplayerid, group;
		if(sscanf(params, "ud", giveplayerid, group)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /groupunban [player] [groupid]");

		if(IsPlayerConnected(giveplayerid))
		{
			new string[256];
			SetPVarInt(playerid, "GroupUnBanningPlayer", giveplayerid);
			SetPVarInt(playerid, "GroupUnBanningGroup", group);
			format(string,sizeof(string),"DELETE FROM `groupbans` WHERE  `PlayerID` = %d AND `GroupBan` = %d", GetPlayerSQLId(giveplayerid), group);
			mysql_function_query(MainPipeline, string, false, "Group_QueryFinish", "ii", GROUP_QUERY_UNBAN, playerid);
			format(string, sizeof(string), "Attempting to unban %s from group %d...", GetPlayerNameEx(giveplayerid), group);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
		}
	}
	return 1;
}


CMD:groupcsfunban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /faccsfunban [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if( PlayerInfo[giveplayerid][pCSFBanned] == 0 ) return SendClientMessageEx( playerid, COLOR_WHITE, "That person isn't banned from Civil Service Groups." );
			PlayerInfo[giveplayerid][pCSFBanned] = 0;
			format(string, sizeof(string), "You have unbanned person %s from all Civil Service Groups.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "You have been unbanned from Civil Service Groups, by %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
		}
	}
	return 1;
}

CMD:groupban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new giveplayerid, group , reason[64];
		if(sscanf(params, "uds[64]", giveplayerid, group, reason))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /groupban [player] [group id] [reason]");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			if( group >= 0 && group < MAX_GROUPS )
			{
				SetPVarInt(playerid, "GroupBanningPlayer", giveplayerid);
				SetPVarInt(playerid, "GroupBanningGroup", group);
				new string[256];
				format(string,sizeof(string),"INSERT INTO `groupbans` (`PlayerID`, `GroupBan`, `BanReason`, `BanDate`) VALUES (%d, %d, '%s', NOW())", GetPlayerSQLId(giveplayerid), group, reason);
				mysql_function_query(MainPipeline, string, false, "Group_QueryFinish", "ii", GROUP_QUERY_ADDBAN, playerid);
				format(string, sizeof(string), "Attempting to ban %s from group %d...", GetPlayerNameEx(giveplayerid), group);
			    SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Invalid group id.");
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
		}
	}
	return 1;
}

CMD:gangwarn(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pGangModerator] >= 1 || PlayerInfo[playerid][pFactionModerator] >= 4)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gangwarn [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 2)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Admins can not be gang warned!");
				return 1;
			}
			if(PlayerInfo[giveplayerid][pGangWarn] >= 3)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That person is already banned from gangs.");
				return 1;
			}
			PlayerInfo[giveplayerid][pGangWarn] += 1;
			if(PlayerInfo[giveplayerid][pGangWarn] == 3)
			{
				format(string, sizeof(string), "[MAYCHU] %s was banned from gangs by %s (had 3 Gang Warnings), reason: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				Log("logs/admin.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was banned from gangs by %s (had 3 Gang Warnings), reason: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				ABroadCast(COLOR_LIGHTRED, string, 2);
				format(string, sizeof(string), "You have been banned from gangs by %s (had 3 Gang Warnings), reason: %s", GetPlayerNameEx(playerid), reason);
				SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
				PlayerInfo[giveplayerid][pFMember] = INVALID_FAMILY_ID;
				PlayerInfo[giveplayerid][pRank] = 0;
				PlayerInfo[giveplayerid][pModel] = NOOB_SKIN;
				SetPlayerSkin(giveplayerid, NOOB_SKIN);
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s was gang warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "[MAYCHU] %s was gang warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "You were given a gang warning boi %s, ly do: %s", GetPlayerNameEx(playerid), reason);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:gangunban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gangunban [player]");

		if( IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pGangWarn] < 3) return SendClientMessageEx(playerid, COLOR_WHITE, "That person isn't banned from gangs." );
			format(string, sizeof(string), "You have unbanned %s from gangs.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "You have been unbanned from gangs by Admin %s.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
			PlayerInfo[giveplayerid][pGangWarn] = 0;

			format(string, sizeof(string), "[MAYCHU] %s has been unbanned from gangs by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been unbanned from gangs by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, string, 2);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong ket noi.");
		}
	}
	return 1;
}
CMD:admingatepw(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128], gateid, pass[24];
		if(sscanf(params, "ds[24]", gateid, pass)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /admingatepw [gateid] [pass]");

		if(strlen(pass) > 24)
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, " Must be 24 characters or less! ");
			return 1;
		}
		format(string, sizeof(string), "Gate Password for gate %d changed to %s", gateid, pass);
		format(GateInfo[gateid][gPass], 24, "%s", pass);
		SendClientMessageEx(playerid, COLOR_GRAD2, string);
		SaveGate(gateid);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}
CMD:asellhouse(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new playername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, playername, sizeof(playername));

		new string[128], house;
		if(sscanf(params, "d", house)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /asellhouse [houseid]");

		HouseInfo[house][hLock] = 1;
		new ip[32];
		GetPlayerIp(playerid,ip,sizeof(ip));
		format(string,sizeof(string),"Administrator %s (IP: %s) has admin-sold house ID %d (was owned by %s).", GetPlayerNameEx(playerid), ip, house, HouseInfo[house][hOwnerName]);
		Log("logs/house.log", string);
		ClearHouse(house);
		format( HouseInfo[house][hOwnerName], 128, "Nobody" );
		HouseInfo[house][hOwnerID] = -1;
		HouseInfo[house][hGLUpgrade] = 1;
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		format(string, sizeof(string), "~w~You have sold house %d.", house);
		GameTextForPlayer(playerid, string, 10000, 3);
		SaveHouse(house);
		DestroyDynamicPickup(HouseInfo[house][hPickupID]);
		HouseInfo[house][hPickupID] = CreateDynamicPickup(1273, 23, HouseInfo[house][hExteriorX], HouseInfo[house][hExteriorY], HouseInfo[house][hExteriorZ], .worldid = HouseInfo[house][hExtVW], .interiorid = HouseInfo[house][hExtIW]);
		DestroyDynamic3DTextLabel(HouseInfo[house][hTextID]);
		format(string, sizeof(string), "This home is\n for sale!\n Description: %s\nCost: $%d\n Level: %d\n/buyhouse to buy it.",HouseInfo[house][hDescription],HouseInfo[house][hValue],HouseInfo[house][hLevel]);
		HouseInfo[house][hTextID] = CreateDynamic3DTextLabel( string, COLOR_GREEN, HouseInfo[house][hExteriorX], HouseInfo[house][hExteriorY], HouseInfo[house][hExteriorZ]+0.5, 10.0, .testlos = 1, .worldid = HouseInfo[house][hExtVW], .interiorid = HouseInfo[house][hExtIW], .streamdistance = 10.0);
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:clearallcalls(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1) {
        new string[128];
        ClearCalls();
        SendClientMessageEx(playerid,COLOR_GRAD1, "You have cleared all pending 911 calls.");
        format(string, sizeof(string), "[MAYCHU] %s has cleared all pending 911 calls.", GetPlayerNameEx(playerid));
        ABroadCast(COLOR_LIGHTRED, string, 3);
    }
    else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    return 1;
}

CMD:goindoor(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[48], doornum;
		if(sscanf(params, "d", doornum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /goindoor [doornumber]");

		if(doornum <= 0 || doornum >= MAX_DDOORS)
		{
			format(string, sizeof(string), "Door ID must be between 1 and %d.", MAX_DDOORS - 1);
			return SendClientMessageEx(playerid, COLOR_GREY, string);
		}

		SetPlayerInterior(playerid,DDoorsInfo[doornum][ddInteriorInt]);
		SetPlayerPos(playerid,DDoorsInfo[doornum][ddInteriorX],DDoorsInfo[doornum][ddInteriorY],DDoorsInfo[doornum][ddInteriorZ]);
		SetPlayerFacingAngle(playerid,DDoorsInfo[doornum][ddInteriorA]);
		PlayerInfo[playerid][pInt] = DDoorsInfo[doornum][ddInteriorInt];
		PlayerInfo[playerid][pVW] = DDoorsInfo[doornum][ddInteriorVW];
		SetPlayerVirtualWorld(playerid, DDoorsInfo[doornum][ddInteriorVW]);
		if(DDoorsInfo[doornum][ddCustomInterior]) Player_StreamPrep(playerid, DDoorsInfo[doornum][ddInteriorX],DDoorsInfo[doornum][ddInteriorY],DDoorsInfo[doornum][ddInteriorZ], FREEZE_TIME);
	}
	return 1;
}

CMD:gotodoor(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[48], doornum;
		if(sscanf(params, "d", doornum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotodoor [doornumber]");

		if(doornum <= 0 || doornum >= MAX_DDOORS)
		{
			format(string, sizeof(string), "Door ID must be between 1 and %d.", MAX_DDOORS - 1);
			return SendClientMessageEx(playerid, COLOR_GREY, string);
		}

		SetPlayerInterior(playerid,DDoorsInfo[doornum][ddExteriorInt]);
		SetPlayerPos(playerid,DDoorsInfo[doornum][ddExteriorX],DDoorsInfo[doornum][ddExteriorY],DDoorsInfo[doornum][ddExteriorZ]);
		SetPlayerFacingAngle(playerid,DDoorsInfo[doornum][ddExteriorA]);
		PlayerInfo[playerid][pInt] = DDoorsInfo[doornum][ddExteriorInt];
		SetPlayerVirtualWorld(playerid, DDoorsInfo[doornum][ddExteriorVW]);
		PlayerInfo[playerid][pVW] = DDoorsInfo[doornum][ddExteriorVW];
		if(DDoorsInfo[doornum][ddCustomExterior]) Player_StreamPrep(playerid, DDoorsInfo[doornum][ddExteriorX],DDoorsInfo[doornum][ddExteriorY],DDoorsInfo[doornum][ddExteriorZ], FREEZE_TIME);
	}
	return 1;
}

CMD:goinhouse(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[48], housenum;
		if(sscanf(params, "d", housenum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /goinhouse [housenumber]");

		if(housenum <= 0 || housenum >= MAX_HOUSES)
		{
			format(string, sizeof(string), "House ID must be between 1 and %d.", MAX_HOUSES - 1);
			return SendClientMessageEx(playerid, COLOR_GREY, string);
		}

		SetPlayerInterior(playerid,HouseInfo[housenum][hIntIW]);
		SetPlayerPos(playerid, HouseInfo[housenum][hInteriorX], HouseInfo[housenum][hInteriorY], HouseInfo[housenum][hInteriorZ]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		PlayerInfo[playerid][pInt] = HouseInfo[housenum][hIntIW];
		PlayerInfo[playerid][pVW] = HouseInfo[housenum][hIntVW];
  		SetPlayerVirtualWorld(playerid,HouseInfo[housenum][hIntVW]);
		if(HouseInfo[housenum][hCustomInterior] == 1) Player_StreamPrep(playerid, HouseInfo[housenum][hInteriorX],HouseInfo[housenum][hInteriorY],HouseInfo[housenum][hInteriorZ], FREEZE_TIME);
	}
	return 1;
}

CMD:gotohouse(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[48], housenum;
		if(sscanf(params, "d", housenum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotohouse [housenumber]");

		if(housenum <= 0 || housenum >= MAX_HOUSES)
		{
			format(string, sizeof(string), "House ID must be between 1 and %d.", MAX_HOUSES - 1);
			return SendClientMessageEx(playerid, COLOR_GREY, string);
		}

		SetPlayerPos(playerid, HouseInfo[housenum][hExteriorX], HouseInfo[housenum][hExteriorY], HouseInfo[housenum][hExteriorZ]);
		PlayerInfo[playerid][pInt] = HouseInfo[housenum][hExtIW];
		SetPlayerInterior(playerid,HouseInfo[housenum][hExtIW]);
		PlayerInfo[playerid][pVW] = HouseInfo[housenum][hExtVW];
  		SetPlayerVirtualWorld(playerid,HouseInfo[housenum][hExtVW]);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		SetPlayerInterior(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
	}
	return 1;
}

CMD:gotogate(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[48], gatenum;
		if(sscanf(params, "d", gatenum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotogate [gatenumber]");

		if(gatenum <= 0 || gatenum >= MAX_GATES)
		{
			format(string, sizeof(string), "Gate ID must be between 1 and %d.", MAX_GATES - 1);
			return SendClientMessageEx(playerid, COLOR_GREY, string);
		}

		SetPlayerPos(playerid,GateInfo[gatenum][gPosX],GateInfo[gatenum][gPosY],GateInfo[gatenum][gPosZ] + 1);
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		SetPlayerInterior(playerid, GateInfo[gatenum][gInt]);
		PlayerInfo[playerid][pInt] = GateInfo[gatenum][gInt];
		SetPlayerVirtualWorld(playerid,  GateInfo[gatenum][gVW]);
		PlayerInfo[playerid][pVW] =  GateInfo[gatenum][gVW];
	}
	return 1;
}

CMD:pedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new string[128], hours;
		if(sscanf(params, "d", hours))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /pedit [hours]");
			SendClientMessageEx(playerid, COLOR_GREY, "HUONG DAN Stand close to a point to set the hours.");
			return 1;
		}

		for(new h = 0; h < sizeof(Points); h++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, Points[h][Pointx], Points[h][Pointy], Points[h][Pointz]))
			{
				if(hours < 1|| hours > 24)
				{
					SendClientMessageEx(playerid, COLOR_GREY, "You can not set the point time lower than 1 or higher than 24!");
				}
				else if(hours >= 1|| hours <= 24)
				{
					format(string, sizeof(string), "You have set this point's time to %d hours !", hours);
					Points[h][Vulnerable] = hours;
					SendClientMessageEx(playerid, COLOR_WHITE, string);
					UpdatePoints();
				}
			}
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:pointfix(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		for(new h = 0; h < sizeof(Points); h++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, Points[h][Pointx], Points[h][Pointy], Points[h][Pointz]))
			{
				Points[h][TimeToClaim] = 0;
				SendClientMessageEx(playerid, COLOR_WHITE, "You have fixed the point, players can now attempt to capture the point!");
				UpdatePoints();
				return 1;
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Error: You need to stand close to the capture point to fix it.");
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

CMD:dedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], choice[32], amount;
	if(sscanf(params, "s[32]d", choice, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dedit [name] [amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Pot, Crack");
		return 1;
	}

	if(strcmp(choice,"pot",true) == 0)
	{
		for(new h = 0; h < sizeof(Points); h++)
		{
			if(Points[h][Type] == 3)
			{
				Points[h][Stock] = amount;
				format(string, sizeof(string), " POT/OPIUM AVAILABLE: %d/1000.", Points[h][Stock]);
				UpdateDynamic3DTextLabelText(Points[h][TextLabel], COLOR_YELLOW, string);
				SendClientMessageEx(playerid, COLOR_WHITE, " You have successfully changed the Drug House available pot!");
			}
		}
	}
	else if(strcmp(choice,"crack",true) == 0)
	{
		for(new h = 0; h < sizeof(Points); h++)
		{
			if(Points[h][Type] == 4)
			{
				Points[h][Stock] = amount;
				format(string, sizeof(string), " CRACK AVAILABLE: %d/500.", Points[h][Stock]);
				UpdateDynamic3DTextLabelText(Points[h][TextLabel], COLOR_YELLOW, string);
				SendClientMessageEx(playerid, COLOR_WHITE, " You have successfully changed the Crack Lab available crack!");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "	Not a valid name.");
		return 1;
	}
	return 1;
}

CMD:gstatus(playerid, params[])
{
	new gateid;
	if(sscanf(params, "i", gateid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gstatus [gateid]");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128], timertxt, distancetxt;

		switch(GateInfo[gateid][gTimer])
		{
			case 1: timertxt = 1;
			case 2: timertxt = 3;
			case 3: timertxt = 5;
			case 4: timertxt = 10;
			default: timertxt = 0;
		}
		switch(GateInfo[gateid][gRenderHQ])
		{
			case 1: distancetxt = 100;
			case 2: distancetxt = 150;
			case 3: distancetxt = 200;
			default: distancetxt = 60;
		}

		format(string,sizeof(string),"|___________ Gate Status (ID: %d) ___________|", gateid);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "X: %f | Y: %f | Z: %f | RotX: %f | RotY: %f | RotZ: %f", GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ], GateInfo[gateid][gRotX], GateInfo[gateid][gRotY], GateInfo[gateid][gRotZ]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "XM: %f | YM: %f | ZM: %f | RotXM: %f | RotYM: %f | RotZM: %f", GateInfo[gateid][gPosXM], GateInfo[gateid][gPosYM], GateInfo[gateid][gPosZM], GateInfo[gateid][gRotXM], GateInfo[gateid][gRotYM], GateInfo[gateid][gRotZM]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Model: %d | HID: %d | VW: %d | Int: %d | Allegiance: %d | Group Type: %d | Group: %d | Family: %d", GateInfo[gateid][gModel], GateInfo[gateid][gHID], GateInfo[gateid][gVW], GateInfo[gateid][gInt], GateInfo[gateid][gAllegiance], GateInfo[gateid][gGroupType], GateInfo[gateid][gGroupID], GateInfo[gateid][gFamilyID]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Range: %.3f | Speed: %.3f | Timer: %d second(s) | Stream: %d | Automated: %d | Locked: %d | Pass: %s", GateInfo[gateid][gRange], GateInfo[gateid][gSpeed], timertxt, distancetxt, GateInfo[gateid][gAutomate], GateInfo[gateid][gLocked], GateInfo[gateid][gPass]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:ddstatus(playerid, params[])
{
	new doorid;
	if(sscanf(params, "i", doorid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ddstatus [doorid]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Door Status (ID: %d) ___________|", doorid);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "(Ext) X: %f | Y: %f | Z: %f | (Int) X: %f | Y: %f | Z: %f", DDoorsInfo[doorid][ddExteriorX], DDoorsInfo[doorid][ddExteriorY], DDoorsInfo[doorid][ddExteriorZ], DDoorsInfo[doorid][ddInteriorX], DDoorsInfo[doorid][ddInteriorY], DDoorsInfo[doorid][ddInteriorZ]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Pickup ID: %d | Custom Int: %d | Custom Ext: %d | Exterior VW: %d | Exterior Int: %d | Interior VW: %d | Interior Int: %d", DDoorsInfo[doorid][ddPickupID], DDoorsInfo[doorid][ddCustomInterior], DDoorsInfo[doorid][ddCustomExterior], DDoorsInfo[doorid][ddExteriorVW], DDoorsInfo[doorid][ddExteriorInt], DDoorsInfo[doorid][ddInteriorVW], DDoorsInfo[doorid][ddInteriorInt]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Type: %d | Rank: %d | VIP: %d | Allegiance: %d | Group Type: %d | Family: %d | Faction: %d | Admin: %d | Wanted: %d", DDoorsInfo[doorid][ddType], DDoorsInfo[doorid][ddRank], DDoorsInfo[doorid][ddVIP], DDoorsInfo[doorid][ddAllegiance], DDoorsInfo[doorid][ddGroupType], DDoorsInfo[doorid][ddFamily], DDoorsInfo[doorid][ddFaction], DDoorsInfo[doorid][ddAdmin], DDoorsInfo[doorid][ddWanted]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Vehiclable: %d | Locked: %d | Password: %s", DDoorsInfo[doorid][ddVehicleAble], DDoorsInfo[doorid][ddLocked], DDoorsInfo[doorid][ddPass]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:ddnear(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing all dynamic doors within 30 meters of you...");
		for(new i, szMessage[128]; i < MAX_DDOORS; i++)
		{
			if(strcmp(DDoorsInfo[i][ddDescription], "None", true) != 0)
			{
				if(IsPlayerInRangeOfPoint(playerid, 30, DDoorsInfo[i][ddInteriorX], DDoorsInfo[i][ddInteriorY], DDoorsInfo[i][ddInteriorZ]))
				{
					format(szMessage, sizeof(szMessage), "(Interior) DDoor ID %d | %f from you | Virtual World: %d | Interior: %d", i, GetPlayerDistanceFromPoint(playerid, DDoorsInfo[i][ddInteriorX], DDoorsInfo[i][ddInteriorY], DDoorsInfo[i][ddInteriorZ]), DDoorsInfo[i][ddInteriorVW], DDoorsInfo[i][ddInteriorInt]);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
				}
				if(IsPlayerInRangeOfPoint(playerid, 30, DDoorsInfo[i][ddExteriorX], DDoorsInfo[i][ddExteriorY], DDoorsInfo[i][ddExteriorZ]))
				{
					format(szMessage, sizeof(szMessage), "(Exterior) DDoor ID %d | %f from you | Virtual World: %d | Interior: %d", i, GetPlayerDistanceFromPoint(playerid, DDoorsInfo[i][ddExteriorX], DDoorsInfo[i][ddExteriorY], DDoorsInfo[i][ddExteriorZ]), DDoorsInfo[i][ddExteriorVW], DDoorsInfo[i][ddExteriorInt]);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
				}
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:gnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing all gates within 30 meters of you...");
		for(new i, Float: fGatePos[3], szMessage[32]; i < MAX_GATES; i++)
		{
			GetDynamicObjectPos(GateInfo[i][gGATE], fGatePos[0], fGatePos[1], fGatePos[2]);
			if(IsPlayerInRangeOfPoint(playerid, 30, fGatePos[0], fGatePos[1], fGatePos[2]))
			{
				if(GateInfo[i][gModel] != 0)
				{
			    	format(szMessage, sizeof(szMessage), "Gate ID %d (VW: %d) | %f from you", i, GateInfo[i][gVW], GetPlayerDistanceFromPoint(playerid, fGatePos[0], fGatePos[1], fGatePos[2]));
			    	SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
				}
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:dmpnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing all map icons within 30 meters of you");
		new Float:X, Float:Y, Float:Z;
  		GetPlayerPos(playerid, X, Y, Z);
		for(new i=1;i<MAX_DMAPICONS;i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 30, DMPInfo[i][dmpPosX], DMPInfo[i][dmpPosY], DMPInfo[i][dmpPosZ]))
			{
				if(DMPInfo[i][dmpMarkerType] != 0)
				{
				    new string[128];
			    	format(string, sizeof(string), "MapIcon ID %d | %f from you", i, GetDistance(DMPInfo[i][dmpPosX], DMPInfo[i][dmpPosY], DMPInfo[i][dmpPosZ], X, Y, Z));
			    	SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:gnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available gate...");
		for(new x;x<MAX_GATES;x++)
		{
		    if(GateInfo[x][gModel] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:dmpnext(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available map icon...");
		for(new x=1;x<MAX_DMAPICONS;x++)
		{
		    if(DMPInfo[x][dmpMarkerType] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:ddnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available dynamic door...");
		for(new x;x<MAX_DDOORS;x++)
		{
		    if(strcmp(DDoorsInfo[x][ddDescription], "None", true) == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:hnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available house...");
		for(new x;x<MAX_HOUSES;x++)
		{
		    if(HouseInfo[x][hOwned] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:floorname(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new floor, tmp[24];
	if(sscanf(params, "is[24]", floor, tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /floorname [floor] [name]");
		return 1;
	}
	new string[128];
	format(LAElevatorFloorData[0][floor-1],24, "%s", tmp);
	format(string, sizeof(string), "Renamed Floor %d to %s", floor, LAElevatorFloorData[0][floor-1]);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	SaveElevatorStuff();

	new Float:z;
	for(new i; i < sizeof(Obj_FloorDoors); i ++)
	{
		format(string, sizeof(string), "%s\nPress '~k~~GROUP_CONTROL_BWD~' to call", LAElevatorFloorData[0][i]);

		if(i == 0)
		    z = 13.4713;
		else
		    z = 13.4713 + 8.7396 + ((i-1) * 5.45155);

        DestroyDynamic3DTextLabel(Label_Floors[i]);
		Label_Floors[i]         = CreateDynamic3DTextLabel(string, COLOR_YELLOW, 1783.9799, -1300.7660, z, 10.5);
	}
	return 1;
}

CMD:floorpass(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new floor, tmp[24];
	if(sscanf(params, "is[24]", floor, tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /floorpass [floor] [pass]");
		return 1;
	}
	new string[128];
	format(LAElevatorFloorData[1][floor-1],24, "%s", tmp);
	format(string, sizeof(string), "Floor %d pass set to %s", floor, LAElevatorFloorData[1][floor-1]);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	SaveElevatorStuff();
	return 1;
}

CMD:floorpassr(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new floor;
	if(sscanf(params, "i", floor))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /floorpassr [floor]");
		return 1;
	}
	new string[128];
	floor = floor  - 1;
	format(LAElevatorFloorData[1][floor-1],24, "");
	format(string, sizeof(string), "Floor %d pass removed", floor);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	SaveElevatorStuff();

	new Float:z;
	for(new i; i < sizeof(Obj_FloorDoors); i ++)
	{
		format(string, sizeof(string), "%s\nPress '~k~~GROUP_CONTROL_BWD~' to call", LAElevatorFloorData[0][i]);

		if(i == 0)
		    z = 13.4713;
		else
		    z = 13.4713 + 8.7396 + ((i-1) * 5.45155);

		DestroyDynamic3DTextLabel(Label_Floors[i]);
		Label_Floors[i]         = CreateDynamic3DTextLabel(string, COLOR_YELLOW, 1783.9799, -1300.7660, z, 10.5);
	}
	return 1;
}

CMD:floornamer(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new floor;
	if(sscanf(params, "i", floor))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /floornamer [floor]");
		return 1;
	}
	new string[128];
	format(LAElevatorFloorData[0][floor-1],24, "");
	format(string, sizeof(string), "Floor %d name removed", floor);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	SaveElevatorStuff();
	new Float:z;
	for(new i; i < sizeof(Obj_FloorDoors); i ++)
	{
		format(string, sizeof(string), "%s\nPress '~k~~GROUP_CONTROL_BWD~' to call", LAElevatorFloorData[0][i]);

		if(i == 0)
		    z = 13.4713;
		else
		    z = 13.4713 + 8.7396 + ((i-1) * 5.45155);

		DestroyDynamic3DTextLabel(Label_Floors[i]);
		Label_Floors[i]         = CreateDynamic3DTextLabel(string, COLOR_YELLOW, 1783.9799, -1300.7660, z, 10.5);
	}
	return 1;
}

CMD:gedit(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new x_job[128], gateid, Float:ofloat, string[128];

		if(sscanf(params, "s[128]iF", x_job, gateid, ofloat))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gedit [name] [gateid] [value]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : HID, Model, VW, Int, Open, Closed, PosX(M), PosY(M), PosZ(M), RotX(M), RotZ(M), ToMe(M)");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Range, Speed, Allegiance, GroupType, GroupID, FamilyID, Stream, Timer, Auto");
			return 1;
		}

		if(strcmp(x_job, "hid", true) == 0)
		{
			new value = floatround(ofloat, floatround_round);
		    if(value > MAX_HOUSES) return SendClientMessageEx(playerid, COLOR_WHITE, "* Invalid House ID!");
		    GateInfo[gateid][gHID] = value;
		    format(string, sizeof(string), "HID %d assigned to Gate %d", GateInfo[gateid][gHID], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's House ID to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "model", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);

		    if(value == 0)
		    {
		        GateInfo[gateid][gPosX] = 0.0;
		        GateInfo[gateid][gPosY] = 0.0;
		        GateInfo[gateid][gPosZ] = 0.0;
		        GateInfo[gateid][gRotX] = 0.0;
		        GateInfo[gateid][gRotY] = 0.0;
				GateInfo[gateid][gRotZ] = 0.0;
				GateInfo[gateid][gPosXM] = 0.0;
				GateInfo[gateid][gPosYM] = 0.0;
				GateInfo[gateid][gPosZM] = 0.0;
				GateInfo[gateid][gRotXM] = 0.0;
				GateInfo[gateid][gRotYM] = 0.0;
				GateInfo[gateid][gRotZM] = 0.0;
				GateInfo[gateid][gVW] = 0;
				GateInfo[gateid][gInt] = 0;
				GateInfo[gateid][gAllegiance] = 0;
				GateInfo[gateid][gGroupType] = 0;
				GateInfo[gateid][gGroupID] = -1;
				GateInfo[gateid][gFamilyID] = -1;
			}

		    GateInfo[gateid][gModel] = value;
		    format(string, sizeof(string), "Model %d assigned to Gate %d", GateInfo[gateid][gModel], gateid);
		    if(IsValidDynamicObject(GateInfo[gateid][gGATE])) DestroyDynamicObject(GateInfo[gateid][gGATE]);
            CreateGate(gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Model to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "vw", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gVW] = value;
		    format(string, sizeof(string), "Virtual World %d assigned to Gate %d", GateInfo[gateid][gVW], gateid);
		    if(IsValidDynamicObject(GateInfo[gateid][gGATE])) DestroyDynamicObject(GateInfo[gateid][gGATE]);
            CreateGate(gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's VW to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "int", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gInt] = value;
		    format(string, sizeof(string), "Interior %d assigned to Gate %d", GateInfo[gateid][gInt], gateid);
		    if(IsValidDynamicObject(GateInfo[gateid][gGATE])) DestroyDynamicObject(GateInfo[gateid][gGATE]);
			CreateGate(gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's InteriorID to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "open", true) == 0)
		{
			foreach(new i:Player)
			{
				if(GetPVarInt(i, "EditingGateID") == gateid && i != playerid)
				{
					format(string, sizeof(string), "ERROR: %s (ID: %d) is currently editing this gate.", GetPlayerNameEx(i), i);
					return SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
			}
			SetPVarInt(playerid, "gEdit", 1);
			SetPVarInt(playerid, "EditingGateID", gateid);
			SetDynamicObjectPos(GateInfo[gateid][gGATE], GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ]);
			SetDynamicObjectRot(GateInfo[gateid][gGATE], GateInfo[gateid][gRotX], GateInfo[gateid][gRotY], GateInfo[gateid][gRotZ]);
			EditDynamicObject(playerid, GateInfo[gateid][gGATE]);
			format(string, sizeof(string), "You are now editing the open position of Gate %d.", gateid);
			SendClientMessage(playerid, COLOR_WHITE, string);
			SendClientMessage(playerid, 0xFFFFAAAA, "HUONG DAN Hold {8000FF}~k~~PED_SPRINT~ {FFFFAA}to move your camera, press escape to cancel");
		}
		else if(strcmp(x_job, "closed", true) == 0)
		{
			foreach(new i:Player)
			{
				if(GetPVarInt(i, "EditingGateID") == gateid && i != playerid)
				{
					format(string, sizeof(string), "ERROR: %s (ID: %d) is currently editing this gate.", GetPlayerNameEx(i), i);
					return SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
			}
			SetPVarInt(playerid, "gEdit", 2);
			SetPVarInt(playerid, "EditingGateID", gateid);
			EditDynamicObject(playerid, GateInfo[gateid][gGATE]);
			format(string, sizeof(string), "You are now editing the closed position of Gate %d.", gateid);
			SendClientMessage(playerid, COLOR_WHITE, string);
			SendClientMessage(playerid, 0xFFFFAAAA, "HINT: Hold {8000FF}~k~~PED_SPRINT~ {FFFFAA}to move your camera, press escape to cancel");
		}
		else if(strcmp(x_job, "range", true) == 0)
		{
		    GateInfo[gateid][gRange] = ofloat;
		    format(string, sizeof(string), "Range of %.3f assigned to Gate %d", GateInfo[gateid][gRange], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Range to %.3f.", GetPlayerNameEx(playerid), gateid, ofloat);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "speed", true) == 0)
		{
		    GateInfo[gateid][gSpeed] = ofloat;
		    format(string, sizeof(string), "Speed of %.3f assigned to Gate %d", GateInfo[gateid][gSpeed], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Speed to %.3f.", GetPlayerNameEx(playerid), gateid, ofloat);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "posx", true) == 0)
		{
		    GateInfo[gateid][gPosX] = ofloat;
		    format(string, sizeof(string), "PosX %f assigned to Gate %d", GateInfo[gateid][gPosX], gateid);
		    SetDynamicObjectPos(GateInfo[gateid][gGATE], GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "posy", true) == 0)
		{
		    GateInfo[gateid][gPosY] = ofloat;
		    format(string, sizeof(string), "PosY %f assigned to Gate %d", GateInfo[gateid][gPosY], gateid);
		    SetDynamicObjectPos(GateInfo[gateid][gGATE], GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "posz", true) == 0)
		{
			GateInfo[gateid][gPosZ] = ofloat;
		    format(string, sizeof(string), "PosZ %f assigned to Gate %d", GateInfo[gateid][gPosZ], gateid);
		    SetDynamicObjectPos(GateInfo[gateid][gGATE], GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "posxm", true) == 0)
		{
		    GateInfo[gateid][gPosXM] = ofloat;
		    format(string, sizeof(string), "PosXM %f assigned to Gate %d", GateInfo[gateid][gPosXM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "posym", true) == 0)
		{
		    GateInfo[gateid][gPosYM] = ofloat;
		    format(string, sizeof(string), "PosYM %f assigned to Gate %d", GateInfo[gateid][gPosYM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "poszm", true) == 0)
		{
		    GateInfo[gateid][gPosZM] = ofloat;
		    format(string, sizeof(string), "PosZM %f assigned to Gate %d", GateInfo[gateid][gPosZM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "rotx", true) == 0)
		{
		    GateInfo[gateid][gRotX] = ofloat;
		    format(string, sizeof(string), "RotX %f assigned to Gate %d", GateInfo[gateid][gRotX], gateid);
		    SetDynamicObjectRot(GateInfo[gateid][gGATE], GateInfo[gateid][gRotX],GateInfo[gateid][gRotY],GateInfo[gateid][gRotZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "roty", true) == 0)
		{
		    GateInfo[gateid][gRotY] = ofloat;
		    format(string, sizeof(string), "RotY %f assigned to Gate %d", GateInfo[gateid][gRotY], gateid);
		    SetDynamicObjectRot(GateInfo[gateid][gGATE], GateInfo[gateid][gRotX],GateInfo[gateid][gRotY],GateInfo[gateid][gRotZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "rotz", true) == 0)
		{
			GateInfo[gateid][gRotZ] = ofloat;
		    format(string, sizeof(string), "RotZ %f assigned to Gate %d", GateInfo[gateid][gRotZ], gateid);
		    SetDynamicObjectRot(GateInfo[gateid][gGATE], GateInfo[gateid][gRotX],GateInfo[gateid][gRotY],GateInfo[gateid][gRotZ]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "rotxm", true) == 0)
		{
		    GateInfo[gateid][gRotXM] = ofloat;
		    format(string, sizeof(string), "RotXM %f assigned to Gate %d", GateInfo[gateid][gRotXM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "rotym", true) == 0)
		{
		    GateInfo[gateid][gRotYM] = ofloat;
		    format(string, sizeof(string), "RotYM %f assigned to Gate %d", GateInfo[gateid][gRotYM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
		else if(strcmp(x_job, "rotzm", true) == 0)
		{
		    GateInfo[gateid][gRotZM] = ofloat;
		    format(string, sizeof(string), "RotZM %f assigned to Gate %d", GateInfo[gateid][gRotZM], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);
		}
        else if(strcmp(x_job, "tome", true) == 0)
		{
		    GetPlayerPos(playerid,GateInfo[gateid][gPosX],GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ]);
		    GateInfo[gateid][gVW] = GetPlayerVirtualWorld(playerid);
		    GateInfo[gateid][gInt] = GetPlayerInterior(playerid);
			format(string, sizeof(string), "Gate %d Pos moved to %f %f %f, VW: %d INT: %d", gateid, GateInfo[gateid][gPosX], GateInfo[gateid][gPosY], GateInfo[gateid][gPosZ], GateInfo[gateid][gVW], GateInfo[gateid][gInt]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    if(GateInfo[gateid][gModel] == 0)
			{
			    GateInfo[gateid][gModel] = 18631;
			    GateInfo[gateid][gRange] = 10;
			    GateInfo[gateid][gSpeed] = 5.0;
			}
		    if(IsValidDynamicObject(GateInfo[gateid][gGATE])) DestroyDynamicObject(GateInfo[gateid][gGATE]);
			CreateGate(gateid);
			SaveGate(gateid);

			format(string, sizeof(string), "%s has edited GateID %d's Position.", GetPlayerNameEx(playerid), gateid);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "tomem", true) == 0)
		{
		    GetPlayerPos(playerid,GateInfo[gateid][gPosXM],GateInfo[gateid][gPosYM], GateInfo[gateid][gPosZM]);
			format(string, sizeof(string), "Gate %d PosM moved to %f %f %f", gateid, GateInfo[gateid][gPosXM], GateInfo[gateid][gPosYM], GateInfo[gateid][gPosZM]);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
			SaveGate(gateid);

			format(string, sizeof(string), "%s has edited GateID %d's Moved Position.", GetPlayerNameEx(playerid), gateid);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "allegiance", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gAllegiance] = value;
		    format(string, sizeof(string), "Allegiance %d assigned to Gate %d", GateInfo[gateid][gAllegiance], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Allegiance to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "grouptype", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gGroupType] = value;
		    format(string, sizeof(string), "Group Type %d assigned to Gate %d", GateInfo[gateid][gGroupType], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Group Type to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "groupid", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gGroupID] = value;
		    format(string, sizeof(string), "Group ID %d assigned to Gate %d", GateInfo[gateid][gGroupID], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Group ID to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "familyid", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gFamilyID] = value;
		    format(string, sizeof(string), "Family ID %d assigned to Gate %d", GateInfo[gateid][gFamilyID], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's Family ID to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "stream", true) == 0)
		{
		    new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gRenderHQ] = value;
		    format(string, sizeof(string), "Stream distance %d assigned to Gate %d", GateInfo[gateid][gRenderHQ], gateid);
		    if(IsValidDynamicObject(GateInfo[gateid][gGATE])) DestroyDynamicObject(GateInfo[gateid][gGATE]);
            CreateGate(gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's stream distance to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "timer", true) == 0)
		{
			new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gTimer] = value;
		    format(string, sizeof(string), "Timer %d assigned to Gate %d", GateInfo[gateid][gTimer], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's timer to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
		else if(strcmp(x_job, "auto", true) == 0)
		{
			new value = floatround(ofloat, floatround_round);
		    GateInfo[gateid][gAutomate] = value;
			if(GateInfo[gateid][gAutomate] == 1)
			{
				foreach(new i: Player) SetTimerEx("AutomaticGateTimer", 1000, false, "ii", i, gateid);
			}
		    format(string, sizeof(string), "Automation %d assigned to Gate %d", GateInfo[gateid][gAutomate], gateid);
		    SendClientMessageEx(playerid, COLOR_WHITE, string);
		    SaveGate(gateid);

		    format(string, sizeof(string), "%s has edited GateID %d's automation to %d.", GetPlayerNameEx(playerid), gateid, value);
		    Log("logs/gedit.log", string);
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}


CMD:fedithq(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] > 3 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new family, x_hq[64], string[128];
		if(sscanf(params, "is[64]", family, x_hq))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /fedithq [family] [name]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Create, Delete, Editexterior, Editinterior, Custominterior");
			return 1;
		}

		if(family < 1 || family > MAX_FAMILY) {
			format(string,sizeof(string), "   FamilyNr can't be below 1 or above %i!", MAX_FAMILY);
			SendClientMessageEx(playerid, COLOR_GREY, string);
			return 1;
		}
		if(strcmp(x_hq,"create",true) == 0)
		{
	   		SetPVarInt(playerid, "editingfamhq", family);
			SetPVarInt(playerid, "editingfamhqaction", 1);
			SendClientMessageEx(playerid, COLOR_WHITE, "Please stand where you want the entrance to be at.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Once ready press the fire button.");
		}
		else if(strcmp(x_hq,"delete",true) == 0)
		{
		    SetPVarInt(playerid, "editingfamhq", family);
			SetPVarInt(playerid, "editingfamhqaction", 4);
			format(string,128,"Are you sure you want to delete this HQ?");
			ShowPlayerDialog(playerid,HQDELETE,DIALOG_STYLE_MSGBOX,"Warning:",string,"Yes","No");
		}
		else if(strcmp(x_hq,"editexterior",true) == 0)
		{
		    SetPVarInt(playerid, "editingfamhq", family);
			SetPVarInt(playerid, "editingfamhqaction", 5);
			SendClientMessageEx(playerid, COLOR_WHITE, "Please stand where you want the entrance to be at.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Once ready press the fire button.");
		}
		else if(strcmp(x_hq,"editinterior",true) == 0)
		{
		    SetPVarInt(playerid, "editingfamhq", family);
			SetPVarInt(playerid, "editingfamhqaction", 6);
			SendClientMessageEx(playerid, COLOR_WHITE, "Please stand where you want the exit to be at.");
			SendClientMessageEx(playerid, COLOR_WHITE, "Once ready press the fire button.");
		}
		else if(strcmp(x_hq,"custominterior",true) == 0)
		{
		    SetPVarInt(playerid, "editingfamhq", family);
			SetPVarInt(playerid, "editingfamhqaction", 3);
			format(string,128,"Is '%s' interior a custom mapped one?", FamilyInfo[family][FamilyName]);
			ShowPlayerDialog(playerid,HQCUSTOMINT,DIALOG_STYLE_MSGBOX,"Warning:",string,"Yes","No");
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_GREY, "	Not a valid HQ name.");
		}
		SaveFamily(family);
		return 1;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:fedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 3 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new family, x_job[64], x_hq[64], ammount, string[128];
		if(sscanf(params, "is[64]s[64]", family, x_job, x_hq))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /fedit [family] [name] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Tokens, Leader, MaxSkins, Skin1, Skin2, Skin3, Skin4, Skin5, Skin6, Skin7, Skin8");
			return 1;
		}
        ammount = strval(x_hq);
		if(family < 1 || family > MAX_FAMILY) {
			format(string,sizeof(string), "   FamilyNr can't be below 1 or above %i!", MAX_FAMILY);
		 	SendClientMessageEx(playerid, COLOR_GREY, string);
		  	return 1;
		  }
		if(strcmp(x_job,"tokens",true) == 0)
		{
			FamilyInfo[family][FamilyTurfTokens] = ammount * 12;
			format(string, sizeof(string), "You have changed '%s' tokens amount to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
		else if (strcmp(x_job,"leader",true) == 0)
		{
			if(strlen(x_hq) >= 20 )
			{
				SendClientMessageEx( playerid, COLOR_GRAD1, "That leader name is too long, please refrain from using more than 20 characters." );
				return 1;
			}
			strcpy(FamilyInfo[family][FamilyLeader], x_hq, MAX_PLAYER_NAME);
			format(string, sizeof(string), "You have changed '%s' leader name to %s.", FamilyInfo[family][FamilyName], x_hq);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			return 1;
		}
		else if(strcmp(x_job,"maxskins",true) == 0)
		{
			if(ammount > 8) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot set the maxskins more than 8.");
			if(ammount == 7)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
			}
			if(ammount == 6)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
			}
			if(ammount == 5)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
				FamilyInfo[family][FamilySkins][5] = 0;
			}
			if(ammount == 4)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
				FamilyInfo[family][FamilySkins][5] = 0;
				FamilyInfo[family][FamilySkins][4] = 0;
			}
			if(ammount == 3)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
				FamilyInfo[family][FamilySkins][5] = 0;
				FamilyInfo[family][FamilySkins][4] = 0;
				FamilyInfo[family][FamilySkins][3] = 0;
			}
			if(ammount == 2)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
				FamilyInfo[family][FamilySkins][5] = 0;
				FamilyInfo[family][FamilySkins][4] = 0;
				FamilyInfo[family][FamilySkins][3] = 0;
				FamilyInfo[family][FamilySkins][2] = 0;
			}

			if(ammount == 1)
			{
				FamilyInfo[family][FamilySkins][7] = 0;
				FamilyInfo[family][FamilySkins][6] = 0;
				FamilyInfo[family][FamilySkins][5] = 0;
				FamilyInfo[family][FamilySkins][4] = 0;
				FamilyInfo[family][FamilySkins][3] = 0;
				FamilyInfo[family][FamilySkins][2] = 0;
				FamilyInfo[family][FamilySkins][1] = 0;
			}

			FamilyInfo[family][FamilyMaxSkins] = ammount;
			format(string, sizeof(string), "You have changed '%s' max skins amount to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin1",true) == 0)
		{
			FamilyInfo[family][FamilySkins][0] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #1 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin2",true) == 0)
		{
			FamilyInfo[family][FamilySkins][1] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #2 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin3",true) == 0)
		{
			FamilyInfo[family][FamilySkins][2] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #3 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin4",true) == 0)
		{
			FamilyInfo[family][FamilySkins][3] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #4 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin5",true) == 0)
		{
			FamilyInfo[family][FamilySkins][4] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #5 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin6",true) == 0)
		{
			FamilyInfo[family][FamilySkins][5] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #6 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin7",true) == 0)
		{
			FamilyInfo[family][FamilySkins][6] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #7 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(x_job,"skin8",true) == 0)
		{
			FamilyInfo[family][FamilySkins][7] = ammount;
			format(string, sizeof(string), "You have changed '%s' skin #8 to %d.", FamilyInfo[family][FamilyName], ammount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "	Not a valid name.");
			return 1;
		}
    	SaveFamily(family);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:ddname(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new
			szName[128],
			iDoorID;

		if(sscanf(params, "ds[128]", iDoorID, szName)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ddname [doorid] [name]");
		}
		else if(!(0 <= iDoorID <= MAX_DDOORS)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Invalid door specified.");
		}
		else if(strfind(szName, "\r") != -1 || strfind(szName, "\n") != -1) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Newline characters are forbidden.");
		}

		strcat((DDoorsInfo[iDoorID][ddDescription][0] = 0, DDoorsInfo[iDoorID][ddDescription]), szName, 128);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully changed the name of this door.");

		DestroyDynamicPickup(DDoorsInfo[iDoorID][ddPickupID]);
		if(IsValidDynamic3DTextLabel(DDoorsInfo[iDoorID][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[iDoorID][ddTextID]);
		CreateDynamicDoor(iDoorID);
		SaveDynamicDoor(iDoorID);

		format(szName, sizeof(szName), "%s has edited door ID %d's name to %s.", GetPlayerNameEx(playerid), iDoorID, DDoorsInfo[iDoorID][ddDescription]);
		Log("logs/ddedit.log", szName);
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:ddowner(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new playername[MAX_PLAYER_NAME], doorid, szName[128];
		if(sscanf(params, "ds[24]", doorid, playername)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /ddowner [door] [player name]");

		if(DDoorsInfo[doorid][ddType] != 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "This door is not owned by a player!");

		new giveplayerid = ReturnUser(playername);
		if(IsPlayerConnected(giveplayerid))
		{
			strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), GetPlayerNameEx(giveplayerid), 24);
			DDoorsInfo[doorid][ddOwner] = GetPlayerSQLId(giveplayerid);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully changed the owner of this door.");

			DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
			if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
			CreateDynamicDoor(doorid);
			SaveDynamicDoor(doorid);

			format(szName, sizeof(szName), "%s has edited door ID %d's owner to %s (SQL ID: %d).", GetPlayerNameEx(playerid), doorid, GetPlayerNameEx(giveplayerid), GetPlayerSQLId(giveplayerid));
			Log("logs/ddedit.log", szName);
		}
		else
		{
			new query[128], tmpName[24];

			mysql_escape_string(playername, tmpName);
			format(query,sizeof(query), "SELECT `id`, `Username` FROM `accounts` WHERE `Username` = '%s'", tmpName);
			mysql_function_query(MainPipeline, query, true, "OnSetDDOwner", "ii", playerid, doorid);
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

CMD:ddpass(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");

	new string[128],
		doorid,
		doorpass[24];

	if(sscanf(params, "ds[24]", doorid, doorpass)) { SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ddPass [doorid] [pass]"); SendClientMessageEx(playerid, COLOR_WHITE, "To remove the password on the door set the password to 'none' "); return 1; }
	format(DDoorsInfo[doorid][ddPass], 24, "%s", doorpass);
	SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the password of that door.");
	SaveDynamicDoor(doorid);
	format(string, sizeof(string), "%s has edited DoorID %d's password to %s.", GetPlayerNameEx(playerid), doorid, doorpass);
	Log("logs/ddedit.log", string);
	return 1;
}

CMD:dmpedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], choice[32], mapiconid, amount;
	if(sscanf(params, "s[32]dD", choice, mapiconid, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /dmpedit [name] [mapiconid] [(Optional)amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Position, Type, Color, Delete");
		return 1;
	}

	if(mapiconid < 1 || mapiconid >= MAX_DMAPICONS)
	{
		SendClientMessageEx( playerid, COLOR_WHITE, "Invalid Map Icon ID!");
	}

	if(strcmp(choice, "position", true) == 0)
	{
		GetPlayerPos(playerid, DMPInfo[mapiconid][dmpPosX], DMPInfo[mapiconid][dmpPosY], DMPInfo[mapiconid][dmpPosZ]);
		DMPInfo[mapiconid][dmpInt] = GetPlayerInterior(playerid);
		DMPInfo[mapiconid][dmpVW] = GetPlayerVirtualWorld(playerid);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the position!");
		if(IsValidDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID])) DestroyDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID]);
		DMPInfo[mapiconid][dmpMapIconID] = CreateDynamicMapIcon(DMPInfo[mapiconid][dmpPosX], DMPInfo[mapiconid][dmpPosY], DMPInfo[mapiconid][dmpPosZ], DMPInfo[mapiconid][dmpMarkerType], DMPInfo[mapiconid][dmpColor], DMPInfo[mapiconid][dmpVW], DMPInfo[mapiconid][dmpInt], -1, 500.0);
		SaveDynamicMapIcon(mapiconid);
		format(string, sizeof(string), "%s has edited MapIconID %d's Position.", GetPlayerNameEx(playerid), mapiconid);
		Log("logs/dmpedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "delete", true) == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You have deleted the map icon!");
		DMPInfo[mapiconid][dmpPosX] = 0.0;
		DMPInfo[mapiconid][dmpPosY] = 0.0;
		DMPInfo[mapiconid][dmpPosZ] = 0.0;
		DMPInfo[mapiconid][dmpVW] = 0;
		DMPInfo[mapiconid][dmpInt] = 0;
		DMPInfo[mapiconid][dmpMarkerType] = 0;
		DMPInfo[mapiconid][dmpColor] = 0;
		SaveDynamicMapIcon(mapiconid);
		if(IsValidDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID])) DestroyDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID]);
		format(string, sizeof(string), "%s has deleted MapIconID %d.", GetPlayerNameEx(playerid), mapiconid);
		Log("logs/dmpedit.log", string);
		return 1;

	}
	else if(strcmp(choice, "type", true) == 0)
	{
		DMPInfo[mapiconid][dmpMarkerType] = amount;
		format(string, sizeof(string), "You have set the marker type to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		if(IsValidDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID])) DestroyDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID]);
		DMPInfo[mapiconid][dmpMapIconID] = CreateDynamicMapIcon(DMPInfo[mapiconid][dmpPosX], DMPInfo[mapiconid][dmpPosY], DMPInfo[mapiconid][dmpPosZ], DMPInfo[mapiconid][dmpMarkerType], DMPInfo[mapiconid][dmpColor], DMPInfo[mapiconid][dmpVW], DMPInfo[mapiconid][dmpInt], -1, 500.0);
		format(string, sizeof(string), "%s has edited MapIconID %d's Marker Type to %d.", GetPlayerNameEx(playerid), mapiconid, amount);
		Log("logs/dmpedit.log", string);
	}
	else if(strcmp(choice, "color", true) == 0)
	{
		DMPInfo[mapiconid][dmpColor] = amount;
		format(string, sizeof(string), "You have set the color to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		if(IsValidDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID])) DestroyDynamicMapIcon(DMPInfo[mapiconid][dmpMapIconID]);
		DMPInfo[mapiconid][dmpMapIconID] = CreateDynamicMapIcon(DMPInfo[mapiconid][dmpPosX], DMPInfo[mapiconid][dmpPosY], DMPInfo[mapiconid][dmpPosZ], DMPInfo[mapiconid][dmpMarkerType], DMPInfo[mapiconid][dmpColor], DMPInfo[mapiconid][dmpVW], DMPInfo[mapiconid][dmpInt], -1, 500.0);
		format(string, sizeof(string), "%s has edited MapIconID %d's Color to %d.", GetPlayerNameEx(playerid), mapiconid, amount);
		Log("logs/dmpedit.log", string);
	}
	SaveDynamicMapIcon(mapiconid);
	return 1;
}

CMD:ddedit(playerid, params[])
{
 	if(PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new string[128], choice[32], doorid, amount;
		if(sscanf(params, "s[32]dD", choice, doorid, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ddedit [name] [doorid] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Exterior, Interior, CustomInterior, CustomExterior, Type, Rank, VIP, Famed");
			SendClientMessageEx(playerid, COLOR_GREY, "Allegiance, GroupType, Family, Faction, Wanted, Admin, VehicleAble, Color, PickupModel, Delete");
			return 1;
		}

		if(doorid >= MAX_DDOORS)
		{
			SendClientMessageEx( playerid, COLOR_WHITE, "Invalid Door ID!");
			return 1;
		}

		if(strcmp(choice, "interior", true) == 0)
		{
			GetPlayerPos(playerid, DDoorsInfo[doorid][ddInteriorX], DDoorsInfo[doorid][ddInteriorY], DDoorsInfo[doorid][ddInteriorZ]);
			GetPlayerFacingAngle(playerid, DDoorsInfo[doorid][ddInteriorA]);
			DDoorsInfo[doorid][ddInteriorInt] = GetPlayerInterior(playerid);
			DDoorsInfo[doorid][ddInteriorVW] = GetPlayerVirtualWorld(playerid);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the interior!");
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Interior.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "custominterior", true) == 0)
		{
			if(DDoorsInfo[doorid][ddCustomInterior] == 0)
			{
				DDoorsInfo[doorid][ddCustomInterior] = 1;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to custom interior!");
			}
			else
			{
				DDoorsInfo[doorid][ddCustomInterior] = 0;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to normal (not custom) interior!");
			}
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's CustomInterior.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "customexterior", true) == 0)
		{
			if(DDoorsInfo[doorid][ddCustomExterior] == 0)
			{
				DDoorsInfo[doorid][ddCustomExterior] = 1;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to custom exterior!");
			}
			else
			{
				DDoorsInfo[doorid][ddCustomExterior] = 0;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to normal (not custom) exterior!");
			}
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's CustomExterior.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "exterior", true) == 0)
		{
			GetPlayerPos(playerid, DDoorsInfo[doorid][ddExteriorX], DDoorsInfo[doorid][ddExteriorY], DDoorsInfo[doorid][ddExteriorZ]);
			GetPlayerFacingAngle(playerid, DDoorsInfo[doorid][ddExteriorA]);
			DDoorsInfo[doorid][ddExteriorVW] = GetPlayerVirtualWorld(playerid);
			DDoorsInfo[doorid][ddExteriorInt] = GetPlayerInterior(playerid);
			SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the exterior!");
			DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
			if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
			CreateDynamicDoor(doorid);
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Exterior.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
		}
		else if(strcmp(choice, "type", true) == 0)
		{
			DDoorsInfo[doorid][ddType] = amount;

			format(string, sizeof(string), "You have changed the type to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			switch(DDoorsInfo[doorid][ddType])
			{
				case 1:
				{
					if(DDoorsInfo[doorid][ddOwner] != -1 && strcmp(DDoorsInfo[doorid][ddOwnerName], "Nobody", false) != 0)
					{
						DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
						if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
						CreateDynamicDoor(doorid);
					}
					else SendClientMessageEx(playerid, COLOR_GREY, "Use /ddowner to update the owner of this door.");
				}
				case 2:
				{
					if(DDoorsInfo[doorid][ddFaction] != INVALID_GROUP_ID)
					{
						DDoorsInfo[doorid][ddOwner] = -1;
						strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), arrGroupData[DDoorsInfo[doorid][ddFaction]][g_szGroupName], 42);
						DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
						if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
						CreateDynamicDoor(doorid);
					}
					else SendClientMessageEx(playerid, COLOR_GREY, "Use /ddedit faction to update the owner of this door.");
				}
				case 3:
				{
					if(DDoorsInfo[doorid][ddFamily] != INVALID_GROUP_ID)
					{
						DDoorsInfo[doorid][ddOwner] = -1;
						strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), FamilyInfo[DDoorsInfo[doorid][ddFamily]][FamilyName], 42);
						DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
						if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
						CreateDynamicDoor(doorid);
					}
					else SendClientMessageEx(playerid, COLOR_GREY, "Use /ddedit family to update the owner of this door.");
				}
				default:
				{
					strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), "Nobody", 42);
					DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
					if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
					CreateDynamicDoor(doorid);
				}
			}
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's type.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "rank", true) == 0)
		{
			DDoorsInfo[doorid][ddRank] = amount;

			format(string, sizeof(string), "You have changed the rank to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's rank.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "vip", true) == 0)
		{
			DDoorsInfo[doorid][ddVIP] = amount;

			format(string, sizeof(string), "You have changed the VIP Level to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's VIP Level.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "famed", true) == 0)
		{
			DDoorsInfo[doorid][ddFamed] = amount;

			format(string, sizeof(string), "You have changed the Famed Level to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Famed Level.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "dpc", true) == 0)
		{
			if(DDoorsInfo[doorid][ddDPC] == 0)
			{
				DDoorsInfo[doorid][ddDPC] = 1;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to DPC!");
			}
			else
			{
				DDoorsInfo[doorid][ddDPC] = 0;
				SendClientMessageEx(playerid, COLOR_WHITE, "Door set to normal (no longer DPC)!");
			}
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has set DoorID %d's DPC value.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "allegiance", true) == 0)
		{
			DDoorsInfo[doorid][ddAllegiance] = amount;

			format(string, sizeof(string), "You have changed the Allegiance to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Allegiance to %d.", GetPlayerNameEx(playerid), doorid, amount);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "grouptype", true) == 0)
		{
			DDoorsInfo[doorid][ddGroupType] = amount;

			format(string, sizeof(string), "You have changed the Group Type to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Group Type to %d.", GetPlayerNameEx(playerid), doorid, amount);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "family", true) == 0)
		{
			DDoorsInfo[doorid][ddFamily] = amount+1;

			format(string, sizeof(string), "You have changed the Family to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			if(DDoorsInfo[doorid][ddType] == 3)
			{
				strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), FamilyInfo[DDoorsInfo[doorid][ddFamily]][FamilyName], 42);
				DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
				if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
				CreateDynamicDoor(doorid);
			}
			else
			{
				format(string, sizeof(string), "Use '/ddedit type %d 3' to update the owner of this door.", doorid);
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Family.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "faction", true) == 0)
		{
			DDoorsInfo[doorid][ddFaction] = amount-1;

			format(string, sizeof(string), "You have changed the Faction to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			if(DDoorsInfo[doorid][ddType] == 2)
			{
				strcat((DDoorsInfo[doorid][ddOwnerName][0] = 0, DDoorsInfo[doorid][ddOwnerName]), arrGroupData[DDoorsInfo[doorid][ddFaction]][g_szGroupName], 42);
				DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
				if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
				CreateDynamicDoor(doorid);
			}
			else
			{
				format(string, sizeof(string), "Use '/ddedit type %d 2' to update the owner of this door.", doorid);
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Faction.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "admin", true) == 0)
		{
			DDoorsInfo[doorid][ddAdmin] = amount;

			format(string, sizeof(string), "You have changed the Admin Level to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Admin Level.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "wanted", true) == 0)
		{
			DDoorsInfo[doorid][ddWanted] = amount;

			format(string, sizeof(string), "You have changed the Wanted to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Wanted.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "vehicleable", true) == 0)
		{
			DDoorsInfo[doorid][ddVehicleAble] = amount;

			format(string, sizeof(string), "You have changed the VehicleAble to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's VehicleAble.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "color", true) == 0)
		{
			DDoorsInfo[doorid][ddColor] = amount;

			format(string, sizeof(string), "You have changed the Color to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
			if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
			CreateDynamicDoor(doorid);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's Color.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "pickupmodel", true) == 0)
		{
			DDoorsInfo[doorid][ddPickupModel] = amount;

			format(string, sizeof(string), "You have changed the PickupModel to %d.", amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
			if(IsValidDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
			CreateDynamicDoor(doorid);

			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "%s has edited DoorID %d's PickupModel.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "delete", true) == 0)
		{
			if(strcmp(DDoorsInfo[doorid][ddDescription], "None", true) == 0) {
				format(string, sizeof(string), "DoorID %d does not exist.", doorid);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			DestroyDynamicPickup(DDoorsInfo[doorid][ddPickupID]);
			DestroyDynamic3DTextLabel(DDoorsInfo[doorid][ddTextID]);
			DDoorsInfo[doorid][ddDescription] = 0;
			DDoorsInfo[doorid][ddCustomInterior] = 0;
			DDoorsInfo[doorid][ddExteriorVW] = 0;
			DDoorsInfo[doorid][ddExteriorInt] = 0;
			DDoorsInfo[doorid][ddInteriorVW] = 0;
			DDoorsInfo[doorid][ddInteriorInt] = 0;
			DDoorsInfo[doorid][ddExteriorX] = 0;
			DDoorsInfo[doorid][ddExteriorY] = 0;
			DDoorsInfo[doorid][ddExteriorZ] = 0;
			DDoorsInfo[doorid][ddExteriorA] = 0;
			DDoorsInfo[doorid][ddInteriorX] = 0;
			DDoorsInfo[doorid][ddInteriorY] = 0;
			DDoorsInfo[doorid][ddInteriorZ] = 0;
			DDoorsInfo[doorid][ddInteriorA] = 0;
			DDoorsInfo[doorid][ddCustomExterior] = 0;
			DDoorsInfo[doorid][ddVIP] = 0;
			DDoorsInfo[doorid][ddDPC] = 0;
			DDoorsInfo[doorid][ddFamily] = 0;
			DDoorsInfo[doorid][ddFaction] = 0;
			DDoorsInfo[doorid][ddAdmin] = 0;
			DDoorsInfo[doorid][ddWanted] = 0;
			DDoorsInfo[doorid][ddVehicleAble] = 0;
			DDoorsInfo[doorid][ddColor] = 0;
			DDoorsInfo[doorid][ddPass] = 0;
			DDoorsInfo[doorid][ddLocked] = 0;
			SaveDynamicDoor(doorid);
			format(string, sizeof(string), "You have deleted DoorID %d.", doorid);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has deleted DoorID %d.", GetPlayerNameEx(playerid), doorid);
			Log("logs/ddedit.log", string);
			return 1;
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:hname(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], houseid, ownername[24];
	if(sscanf(params, "ds[24]", houseid, ownername)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /hname [houseid] [name]");

	format(HouseInfo[houseid][hOwnerName], 24, "%s", ownername);
	format(string, sizeof(string), "You have set the house owner to %s", ownername);
	HouseInfo[houseid][hOwned] = 1;
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	ReloadHouseText(houseid);
	SaveHouse(houseid);

	format(string, sizeof(string), "%s has edited HouseID %d's Owner to %s.", GetPlayerNameEx(playerid), houseid, ownername);
	Log("logs/hedit.log", string);

	return 1;
}

CMD:hedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], choice[32], houseid, amount;
	if(sscanf(params, "s[32]dD", choice, houseid, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /hedit [name] [houseid] [(Optional)amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Exterior, Interior, VW, CustomInterior, CustomExterior, Class (1-3), Level, Price");
		return 1;
	}

	if(strcmp(choice, "interior", true) == 0)
	{
		new Float: Pos[3];
		GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		format(string, sizeof(string), "%s has edited HouseID %d's Interior. (Before:  %f, %f, %f | After: %f, %f, %f)", GetPlayerNameEx(playerid), houseid, HouseInfo[houseid][hInteriorX], HouseInfo[houseid][hInteriorY], HouseInfo[houseid][hInteriorZ], Pos[0], Pos[1], Pos[2]);
		Log("logs/hedit.log", string);
		GetPlayerPos(playerid, HouseInfo[houseid][hInteriorX], HouseInfo[houseid][hInteriorY], HouseInfo[houseid][hInteriorZ]);
		GetPlayerFacingAngle(playerid, HouseInfo[houseid][hInteriorA]);
		HouseInfo[houseid][hIntIW] = GetPlayerInterior( playerid );
		HouseInfo[houseid][hIntVW] = houseid+6000;
		SendClientMessageEx( playerid, COLOR_WHITE, "You have changed the interior!" );
		SaveHouse(houseid);
		return 1;
	}
	else if(strcmp(choice, "custominterior", true) == 0)
	{
		if(HouseInfo[houseid][hCustomInterior] == 0)
		{
			HouseInfo[houseid][hCustomInterior] = 1;
			SendClientMessageEx( playerid, COLOR_WHITE, "House set to custom interior!" );
		}
		else
		{
			HouseInfo[houseid][hCustomInterior] = 0;
			SendClientMessageEx( playerid, COLOR_WHITE, "House set to normal (not custom) interior!" );
		}
		SaveHouse(houseid);

		format(string, sizeof(string), "%s has edited HouseID %d's Custom Interior.", GetPlayerNameEx(playerid), houseid);
		Log("logs/hedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "customexterior", true) == 0)
	{
		if(HouseInfo[houseid][hCustomExterior] == 0)
		{
			HouseInfo[houseid][hCustomExterior] = 1;
			SendClientMessageEx( playerid, COLOR_WHITE, "House set to custom exterior!" );
		}
		else
		{
			HouseInfo[houseid][hCustomExterior] = 0;
			SendClientMessageEx( playerid, COLOR_WHITE, "House set to normal (not custom) exterior!" );
		}
		SaveHouse(houseid);

		format(string, sizeof(string), "%s has edited HouseID %d's Custom Exterior.", GetPlayerNameEx(playerid), houseid);
		Log("logs/hedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "exterior", true) == 0)
	{
	    new Float: Pos[3];
		GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
		format(string, sizeof(string), "%s has edited HouseID %d's Exterior. (Before:  %f, %f, %f | After: %f, %f, %f)", GetPlayerNameEx(playerid), houseid,  HouseInfo[houseid][hExteriorX], HouseInfo[houseid][hExteriorY], HouseInfo[houseid][hExteriorZ], Pos[0], Pos[1], Pos[2]);
		Log("logs/hedit.log", string);
		GetPlayerPos(playerid, HouseInfo[houseid][hExteriorX], HouseInfo[houseid][hExteriorY], HouseInfo[houseid][hExteriorZ]);
		GetPlayerFacingAngle(playerid, HouseInfo[houseid][hExteriorA]);
		HouseInfo[houseid][hExtIW] = GetPlayerInterior(playerid);
		HouseInfo[houseid][hExtVW] = GetPlayerVirtualWorld(playerid);
		SendClientMessageEx( playerid, COLOR_WHITE, "You have changed the exterior!" );
		SaveHouse(houseid);
		ReloadHousePickup(houseid);
	}
	else if(strcmp(choice, "VW", true) == 0)
	{
		HouseInfo[houseid][hIntVW] = amount;

		format(string, sizeof(string), "You have changed the home's interior VW to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);

		SaveHouse(houseid);
		format(string, sizeof(string), "%s has edited House ID %d's interior VW to %d.", GetPlayerNameEx(playerid), houseid, amount);
		Log("logs/hedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "level", true) == 0)
	{
		HouseInfo[houseid][hLevel] = amount;
		format(string, sizeof(string), "You have set the house level to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		ReloadHouseText(houseid);
		format(string, sizeof(string), "%s has edited HouseID %d's Level to %d.", GetPlayerNameEx(playerid), houseid, amount);
		Log("logs/hedit.log", string);
	}
	else if(strcmp(choice, "price", true) == 0)
	{
		HouseInfo[houseid][hValue] = amount;
		format(string, sizeof(string), "You have set the houses price to $%d.", amount );
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		ReloadHouseText(houseid);

		format(string, sizeof(string), "%s has edited HouseID %d's Price to $%d.", GetPlayerNameEx(playerid), amount);
		Log("logs/hedit.log", string);
	}
	else if(strcmp(choice, "class", true) == 0)
	{
		switch(amount)
		{
		case 1:
			{
				format(HouseInfo[houseid][hDescription], 128, "Low" );
				SendClientMessageEx(playerid, COLOR_WHITE, "You have set the house's class to 1 (Low)" );
			}
		case 2:
			{
				format(HouseInfo[houseid][hDescription], 128, "Medium" );
				SendClientMessageEx(playerid, COLOR_WHITE, "You have set the house's class to 2 (Medium)" );
			}
		case 3:
			{
				format(HouseInfo[houseid][hDescription], 128, "High" );
				SendClientMessageEx(playerid, COLOR_WHITE, "You have set the house's class to 3 (High)" );
			}
		}
		if(HouseInfo[houseid][hOwned] ==0)
		{
			format(string, sizeof(string), "This home is\n for sale!\n Description: %s\nCost: $%d\n Level: %d\nID: %d\nTo buy this house type /buyhouse",HouseInfo[houseid][hDescription],HouseInfo[houseid][hValue],HouseInfo[houseid][hLevel],houseid);
			UpdateDynamic3DTextLabelText(HouseInfo[houseid][hTextID], COLOR_GREEN, string);
		}

		format(string, sizeof(string), "%s has edited HouseID %d's Class to %d.", GetPlayerNameEx(playerid), houseid, amount);
		Log("logs/hedit.log", string);
	}
	SaveHouse(houseid);
	return 1;
}
CMD:tledit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		new string[128], choice[32], labelid, amount;
		if(sscanf(params, "s[32]dD", choice, labelid, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /tledit [name] [labelid] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Position, Color, PickupModel, Delete");
			return 1;
		}

		if(labelid >= MAX_3DLABELS)
		{
			SendClientMessageEx( playerid, COLOR_WHITE, "Invalid Text Label ID!");
			return 1;
		}

		if(strcmp(choice, "position", true) == 0)
		{
			GetPlayerPos(playerid, TxtLabels[labelid][tlPosX], TxtLabels[labelid][tlPosY], TxtLabels[labelid][tlPosZ]);
			TxtLabels[labelid][tlInt] = GetPlayerInterior(playerid);
			TxtLabels[labelid][tlVW] = GetPlayerVirtualWorld(playerid);
			format(string, sizeof(string), "You have changed the position on Text Label #%d.", labelid);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			if(IsValidDynamicPickup(TxtLabels[labelid][tlPickupID])) DestroyDynamicPickup(TxtLabels[labelid][tlPickupID]);
			DestroyDynamic3DTextLabel(TxtLabels[labelid][tlTextID]);
			CreateTxtLabel(labelid);
			SaveTxtLabel(labelid);
			format(string, sizeof(string), "%s has edited Text Label ID %d's position.", GetPlayerNameEx(playerid), labelid);
			Log("logs/tledit.log", string);
			return 1;
		}
		else if(strcmp(choice, "color", true) == 0)
		{
			TxtLabels[labelid][tlColor] = amount;
			format(string, sizeof(string), "You have changed the color to %d on Text Label #%d.", amount, labelid);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			if(IsValidDynamicPickup(TxtLabels[labelid][tlPickupID])) DestroyDynamicPickup(TxtLabels[labelid][tlPickupID]);
			DestroyDynamic3DTextLabel(TxtLabels[labelid][tlTextID]);
			CreateTxtLabel(labelid);
			SaveTxtLabel(labelid);
			format(string, sizeof(string), "%s has edited Text Label ID %d's color.", GetPlayerNameEx(playerid), labelid);
			Log("logs/tledit.log", string);
			return 1;
		}
		else if(strcmp(choice, "pickupmodel", true) == 0)
		{
			TxtLabels[labelid][tlPickupModel] = amount;
			format(string, sizeof(string), "You have changed the pickup model to %d on Text Label #%d.", amount, labelid);
			SendClientMessageEx(playerid, COLOR_WHITE, string);

			if(IsValidDynamicPickup(TxtLabels[labelid][tlPickupID])) DestroyDynamicPickup(TxtLabels[labelid][tlPickupID]);
			DestroyDynamic3DTextLabel(TxtLabels[labelid][tlTextID]);
			CreateTxtLabel(labelid);
			SaveTxtLabel(labelid);
			format(string, sizeof(string), "%s has edited Text Label ID %d's PickupModel.", GetPlayerNameEx(playerid), labelid);
			Log("logs/tledit.log", string);
			return 1;
		}
		else if(strcmp(choice, "delete", true) == 0)
		{
			if(strcmp(TxtLabels[labelid][tlText], "None", true) == 0) {
				format(string, sizeof(string), "Text Label %d does not exist.", labelid);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			DestroyDynamicPickup(TxtLabels[labelid][tlPickupID]);
			DestroyDynamic3DTextLabel(TxtLabels[labelid][tlTextID]);
			TxtLabels[labelid][tlText] = 0;
			TxtLabels[labelid][tlPosX] = 0.0;
			TxtLabels[labelid][tlPosY] = 0.0;
			TxtLabels[labelid][tlPosZ] = 0.0;
			TxtLabels[labelid][tlVW] = 0;
			TxtLabels[labelid][tlInt] = 0;
			TxtLabels[labelid][tlColor] = 0;
			TxtLabels[labelid][tlPickupModel] = 0;
			SaveTxtLabel(labelid);
			format(string, sizeof(string), "You have deleted Text Label #%d.", labelid);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has deleted Text Label %d.", GetPlayerNameEx(playerid), labelid);
			Log("logs/tledit.log", string);
			return 1;
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:tltext(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new szName[128], labelid;

		if(sscanf(params, "ds[128]", labelid, szName)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /tltext [labelid] [text]");
		}
		else if(!(0 <= labelid <= MAX_3DLABELS)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Invalid door specified.");
		}
		else if(strfind(szName, "\r") != -1 || strfind(szName, "\n") != -1) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Newline characters are forbidden.");
		}

		strcat((TxtLabels[labelid][tlText][0] = 0, TxtLabels[labelid][tlText]), szName, 128);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully changed the text on this text label.");

		DestroyDynamicPickup(TxtLabels[labelid][tlPickupID]);
		if(IsValidDynamic3DTextLabel(TxtLabels[labelid][tlTextID])) DestroyDynamic3DTextLabel(TxtLabels[labelid][tlTextID]);
		CreateTxtLabel(labelid);
		SaveTxtLabel(labelid);

		format(szName, sizeof(szName), "%s has edited Text Label ID %d's text to %s.", GetPlayerNameEx(playerid), labelid, TxtLabels[labelid][tlText]);
		Log("logs/tledit.log", szName);
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:tlstatus(playerid, params[])
{
	new labelid;
	if(sscanf(params, "i", labelid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /tlstatus [labelid]");
		return 1;
	}
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Text Label Status (ID: %d) ___________|", labelid);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "[Position] X: %f | Y: %f | Z: %f | VW: %d | Int: %d", TxtLabels[labelid][tlPosX], TxtLabels[labelid][tlPosY], TxtLabels[labelid][tlPosZ], TxtLabels[labelid][tlVW], TxtLabels[labelid][tlInt]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "Text: %s | Color: %d | Pickup Model: %d", TxtLabels[labelid][tlText], TxtLabels[labelid][tlColor], TxtLabels[labelid][tlPickupModel]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:tlnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Listing next available text label...");
		for(new x = 0;x<MAX_3DLABELS;x++)
		{
			if(strcmp(TxtLabels[x][tlText], "None", true) == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:gotolabel(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new labelnum;
		if(sscanf(params, "d", labelnum)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotolabel [labelnumber]");

		SetPlayerPos(playerid,TxtLabels[labelnum][tlPosX],TxtLabels[labelnum][tlPosY],TxtLabels[labelnum][tlPosZ]);
		SetPlayerInterior(playerid,TxtLabels[labelnum][tlInt]);
		PlayerInfo[playerid][pInt] = TxtLabels[labelnum][tlInt];
		SetPlayerVirtualWorld(playerid, TxtLabels[labelnum][tlVW]);
		PlayerInfo[playerid][pVW] = TxtLabels[labelnum][tlVW];
	}
	return 1;
}

CMD:goldgiftbox(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 6) switch(iRewardBox) {
	    case 0: {

	        new
				Float: fPos[3],
				szMessage[64];

			GetPlayerPos(playerid, fPos[0], fPos[1], fPos[2]);
			iRewardObj = CreateDynamicObject(19055, fPos[0], fPos[1], fPos[2], 0.0, 0.0, 0.0, .streamdistance = 100.0);
			tRewardText = CreateDynamic3DTextLabel("Hop Qua Vang\n{FFFFFF}/getrewardgift{F3FF02} De Nhan Qua Vang!", COLOR_YELLOW, fPos[0], fPos[1], fPos[2], 10.0, .testlos = 1, .streamdistance = 50.0);
			iRewardBox = true;

			format(szMessage, sizeof szMessage, "[MAYCHU] %s Da Dat Hop Qua Vang..", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);
			Misc_Save();
		}
	    default: {
	        new
	            szMessage[64];

	        iRewardBox = false;
	        DestroyDynamic3DTextLabel(tRewardText);
			DestroyDynamicObject(iRewardObj);

			format(szMessage, sizeof szMessage, "[MAYCHU] %s Da Xoa Hop Qua Vang.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);
			Misc_Save();
	    }
	}
	return 1;
}

CMD:rewardplay(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 6) switch(iRewardPlay) {
		case 0: {

			new
				szMessage[64];

			iRewardPlay = true;

			format(szMessage, sizeof szMessage, "[MAYCHU] %s has enabled Reward Play.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);
			Misc_Save();
		}
		default: {

			new
				szMessage[64];

			format(szMessage, sizeof szMessage, "[MAYCHU] %s has disabled Reward Play.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);

			iRewardPlay = false;
			Misc_Save();
		}
	}
	return 1;
}

CMD:doublexp(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 6) switch(DoubleXP) {
		case 0: {

			new
				szMessage[64],
				string[128];

			DoubleXP = true;
			format(szMessage, sizeof szMessage, "[MAYCHU] %s has enabled Double XP.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);
			format(string, sizeof(string), "Double XP has been activated");
			foreach(new i: Player) {
			SendClientMessageEx(i, COLOR_YELLOW, string);
			SendClientMessageEx(i, COLOR_GREY, "You will now gain 2 skill points for any skill and 2 respect points per pay check.");
			}
			Misc_Save();
		}
		default: {

			new
				szMessage[64],
				string[128];
			format(szMessage, sizeof szMessage, "[MAYCHU] %s has ended the Double XP.", GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);
			format(string, sizeof(string), "Double XP has been deactivated!");
			foreach(new i: Player) {
			SendClientMessageEx(i, COLOR_YELLOW, string);
			SendClientMessageEx(i, COLOR_GREY, "You will no longer gain 2 skill points for any skill.");
			}
			DoubleXP = false;
			Misc_Save();
		}
	}
	return 1;
}
CMD:mole(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[1280], log[1280];
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /mole [thong bao]");

		format(string, sizeof(string), "[{33FF66}THONG BAO{FFFFFF}]: %s", params);
		foreach(new i: Player)
		{
			SendClientMessageEx(i, COLOR_YELLOW, string);
			//SendAudioToPlayer(i, 47, 100);
		}
		format(log, sizeof(log), "Thong bao %s sent: %s", GetPlayerNameEx(playerid), params);
		Log("logs/admin.log", log);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:togspec(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
	    if(GetPVarType(playerid, "EASpecable"))
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "You can not be spectated anymore");
	        DeletePVar(playerid, "EASpecable");
	    }
	    else
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "You can now be spectated again");
	        SetPVarInt(playerid, "EASpecable", 1);
	    }
	}
	return 1;
}

CMD:togtp(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
	    if(GetPVarType(playerid, "EATeleportable"))
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "You can not be teleported to anymore");
	        DeletePVar(playerid, "EATeleportable");
	    }
	    else
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "You can now be teleported to again");
	        SetPVarInt(playerid, "EATeleportable", 1);
	    }
	}
	return 1;
}

CMD:specz(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2 && PlayerInfo[playerid][pHelper] < 3 && !GetPVarType(playerid, "pWatchdogWatching"))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	if(strcmp(params, "off", true) == 0)
	{
		if(Spectating[playerid] > 0 && PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pHelper] >= 3 && Spectating[playerid] > 0)
		{
		    if(GetPVarType(playerid, "pWatchdogWatching"))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "You have stopped DM Watching.");
				DeletePVar(playerid, "pWatchdogWatching");
			}
			GettingSpectated[Spectate[playerid]] = INVALID_PLAYER_ID;
			Spectating[playerid] = 0;
			Spectate[playerid] = INVALID_PLAYER_ID;
			SetPVarInt(playerid, "SpecOff", 1 );
			TogglePlayerSpectating(playerid, false);
			SetCameraBehindPlayer(playerid);
			return 1;
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "You're not spectating anyone.");
			return 1;
		}
	}

	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /spec (playerid/off)");
	if(IsPlayerConnected(giveplayerid))
	{
	    if((PlayerInfo[playerid][pHelper] >= 3 && !(2 <= PlayerInfo[giveplayerid][pHelper] <= 4)) && !GetPVarType(playerid, "pWatchdogWatching"))
	    {
	        SendClientMessageEx(playerid, COLOR_GREY, "You can only spectate other advisors");
			return 1;
		}
		if(GetPVarType(playerid, "pWatchdogWatching") && (GetPVarInt(playerid, "pWatchdogWatching") != giveplayerid))
		{
		    SendClientMessageEx(playerid, COLOR_GREY, "You can only spectate the person you are DM Watching.");
			return 1;
		}
		if(PlayerInfo[giveplayerid][pAdmin] == 7 && !GetPVarType(giveplayerid, "EASpecable")) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot spectate this person.");
		if(PlayerInfo[playerid][pAdmin] >= 4 && Spectate[giveplayerid] != INVALID_PLAYER_ID && Spectating[giveplayerid] == 1)
		{
			new string[128];
			format(string, sizeof(string), "Admin %s is speccing %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(Spectate[giveplayerid]));
			SendClientMessageEx(playerid, COLOR_GREEN, string);
			return 1;
		}
		SpectatePlayer(playerid, giveplayerid);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Target is not available.");
	}
	return 1;
}
CMD:rcreset(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 5) {

		new
			iTargetID;

		if(sscanf(params, "u", iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rcreset [player]");
		}
		else if(!IsPlayerConnected(iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
		}
		else {

			new
				i = 0,
				szMessage[96];

			format(szMessage, sizeof szMessage, "[MAYCHU] %s has reset %s's restricted vehicle warnings.", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID));
			ABroadCast(COLOR_LIGHTRED, szMessage, 2);

			format(szMessage, sizeof szMessage, "%s has reset your restricted vehicle warnings.", GetPlayerNameEx(playerid));
			SendClientMessageEx(iTargetID, COLOR_WHITE, szMessage);

			PlayerInfo[iTargetID][pRVehWarns] = 0;
			PlayerInfo[iTargetID][pLastRVehWarn] = 0;
			PlayerInfo[iTargetID][pRVehRestricted] = 0;

			while(i != MAX_PLAYERVEHICLES) {
				if(PlayerVehicleInfo[iTargetID][i][pvRestricted] != 0) {
					PlayerVehicleInfo[iTargetID][i][pvRestricted] = 0;
				}
				++i;
			}
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:rcabuse(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 4) {

		new
			iTargetID;

		if(sscanf(params, "u", iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rcabuse [player]");
		}
		else if(!IsPlayerConnected(iTargetID)) {
			SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
		}
		else if(GetPlayerState(iTargetID) == PLAYER_STATE_DRIVER && IsRestrictedVehicle(GetVehicleModel(GetPlayerVehicleID(iTargetID)))) {

			new
				iVehicleID = GetPlayerVehicleID(iTargetID),
				iVehModel = GetVehicleModel(iVehicleID),
				iVehIndex = GetPlayerVehicle(iTargetID, iVehicleID),
				Float: fPlayerPos[3],
				szMessage[256]; // Dialog string - don't kill me!!!!!1

			if(iVehIndex != -1) { // Owned by player
				switch(++PlayerInfo[iTargetID][pRVehWarns]) {
					case 1: {

						PlayerVehicleInfo[iTargetID][iVehIndex][pvRestricted] = gettime() + 28800;

						--PlayerCars;
						VehicleSpawned[iTargetID]--;

						PlayerVehicleInfo[iTargetID][iVehIndex][pvSpawned] = 0;
						PlayerVehicleInfo[iTargetID][iVehIndex][pvFuel] = VehicleFuel[iVehicleID];

						DestroyVehicle(iVehicleID);
						PlayerVehicleInfo[iTargetID][iVehIndex][pvId] = INVALID_PLAYER_VEHICLE_ID;
						g_mysql_SaveVehicle(iTargetID, iVehIndex);
						CheckPlayerVehiclesForDesync(iTargetID);

						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your %s.\n\nAs this is your first warning, it will be restricted from use for 8 hours.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");

					}
					case 2: {

						PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 172800;

						--PlayerCars;
						VehicleSpawned[iTargetID]--;

						PlayerVehicleInfo[iTargetID][iVehIndex][pvSpawned] = 0;
						PlayerVehicleInfo[iTargetID][iVehIndex][pvFuel] = VehicleFuel[iVehicleID];

						DestroyVehicle(iVehicleID);
						PlayerVehicleInfo[iTargetID][iVehIndex][pvId] = INVALID_PLAYER_VEHICLE_ID;
						g_mysql_SaveVehicle(iTargetID, iVehIndex);
						CheckPlayerVehiclesForDesync(iTargetID);

						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your %s.\n\nAs this is your second warning, you will be unable to use restricted vehicles for two days.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
					}
					case 3: {

						PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 604800;
						PlayerInfo[iTargetID][pRVehWarns] = 0;
						DestroyPlayerVehicle(iTargetID, iVehIndex);

						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your %s.\n\nAs this is your third warning, you will be unable to use restricted vehicles for a week, and the vehicle in question has been removed.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
					}
				}
			}
			else foreach(new i: Player)
			{
				if((iVehIndex = GetPlayerVehicle(i, iVehicleID)) != -1) { // Owned by another player
					switch(++PlayerInfo[iTargetID][pRVehWarns]) {
						case 1: {

							SetVehicleToRespawn(iVehicleID);
							CheckPlayerVehiclesForDesync(i);

							GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
							SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

							format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing %s's %s.\n\nAs this is your first warning, one of your restricted vehicles (if any) will not be able to be used for two days.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), GetVehicleName(iVehModel));
							ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
							SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");

							for(new x = 0; x != MAX_PLAYERVEHICLES; ++x) if(IsRestrictedVehicle(PlayerVehicleInfo[iTargetID][iVehIndex][pvModelId])) {
								PlayerVehicleInfo[iTargetID][iVehIndex][pvRestricted] = gettime() + 28800;
								break;
							}
						}
						case 2: {

							PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 172800;

							SetVehicleToRespawn(iVehicleID);
							CheckPlayerVehiclesForDesync(i);

							GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
							SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

							format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing %s's %s.\n\nAs this is your second warning, you will be unable to use restricted vehicles for two days.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), GetVehicleName(iVehModel));
							ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
							SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
						}
						case 3: {

							PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 604800;
							PlayerInfo[iTargetID][pRVehWarns] = 0;

							GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
							SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);

							format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing %s's %s.\n\nAs this is your third warning, you will be unable to use restricted vehicles for a week.", GetPlayerNameEx(playerid), GetPlayerNameEx(i), GetVehicleName(iVehModel));
							ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
							SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
						}
					}
					format(szMessage, sizeof szMessage, "%s has issued %s a warning for abusing your %s.\n\nThe vehicle in question has been respawned. Please be mindful of your restricted vehicles.", GetPlayerNameEx(playerid), GetPlayerNameEx(iTargetID), GetVehicleName(iVehModel));
					ShowPlayerDialog(i, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
					SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
					break;
				}
			}
			if(iVehIndex == -1 && IsACop(iTargetID)) { // Not person owned
				SetVehicleToRespawn(iVehicleID);
				switch(++PlayerInfo[iTargetID][pRVehWarns]) {
					case 1: {
						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your faction's %s.\n\nAs this is your first warning, you will face no punishment.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");
					}
					case 2: {

						PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 1209600;

						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your faction's %s.\n\nAs this is your second warning, you will be unable to use restricted vehicles for two weeks and prisoned for two hours.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");

						GameTextForPlayer(iTargetID, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
						ResetPlayerWeaponsEx(iTargetID);
						format(szMessage, sizeof(szMessage), "[MAYCHU] %s has been prisoned boi %s, ly do: Abuse of faction vehicles.", GetPlayerNameEx(iTargetID), GetPlayerNameEx(playerid));
						Log("logs/admin.log", szMessage);
						format(szMessage, sizeof(szMessage), "[MAYCHU] %s has been prisoned boi %s, ly do: Abuse of faction vehicles.", GetPlayerNameEx(iTargetID), GetPlayerNameEx(playerid));
						SendClientMessageToAllEx(COLOR_LIGHTRED, szMessage);
						PlayerInfo[iTargetID][pJailTime] = 120 * 60;
						strcpy(PlayerInfo[iTargetID][pPrisonReason], "[OOC][PRISON] Abuse of faction vehicles", 128);
						strcpy(PlayerInfo[iTargetID][pPrisonedBy], GetPlayerNameEx(playerid), MAX_PLAYER_NAME);
						PhoneOnline[iTargetID] = 1;
						SetPlayerInterior(iTargetID, 1);
						PlayerInfo[iTargetID][pInt] = 1;
						new rand = random(sizeof(OOCPrisonSpawns));
						Streamer_UpdateEx(iTargetID, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
						SetPlayerPos(iTargetID, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
						SetPlayerSkin(iTargetID, 50);
						SetPlayerColor(iTargetID, TEAM_APRISON_COLOR);
						Player_StreamPrep(iTargetID, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
					}
					case 3: {

						PlayerInfo[iTargetID][pRVehRestricted] = gettime() + 1814400;
						PlayerInfo[iTargetID][pRVehWarns] = 0;

						GetPlayerPos(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						SetPlayerPosFindZ(iTargetID, fPlayerPos[0], fPlayerPos[1], fPlayerPos[2]);
						format(szMessage, sizeof szMessage, "%s has issued you a warning for abusing your faction's %s.\n\nAs this is your third warning, you will be unable to use restricted vehicles for three weeks, kicked from your faction and banned for two days.", GetPlayerNameEx(playerid), GetVehicleName(iVehModel));
						ShowPlayerDialog(iTargetID, 0, DIALOG_STYLE_MSGBOX, "Restricted Vehicle Warning", szMessage, "Exit", "");
						SendClientMessageEx(playerid, COLOR_GRAD1, "You have warned this person for abusing their restricted vehicle.");

						new playerip[32];
						GetPlayerIp(iTargetID, playerip, sizeof(playerip));
						format(szMessage, sizeof(szMessage), "[MAYCHU] %s(IP:%s) was banned boi %s, ly do: Abuse of faction vehicles", GetPlayerNameEx(iTargetID), playerip, GetPlayerNameEx(playerid));
						Log("logs/ban.log", szMessage);
						format(szMessage, sizeof(szMessage), "[MAYCHU] %s was banned boi %s, ly do: Abuse of faction vehicles", GetPlayerNameEx(iTargetID), GetPlayerNameEx(playerid));
						SendClientMessageToAllEx(COLOR_LIGHTRED, szMessage);
						PlayerInfo[iTargetID][pBanned] = 1;
						AddBan(playerid, iTargetID, "Abuse of faction vehicles.");
						SetTimerEx("KickEx", 1000, 0, "i", iTargetID);
					}
				}
			}
			PlayerInfo[iTargetID][pLastRVehWarn] = gettime();
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "That person is not using a restricted vehicle.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:prison(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, minutes, reason[64];
		if(sscanf(params, "uds[64]", giveplayerid, minutes, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /prison [player] [minutes] [reason]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
			SetPlayerArmedWeapon(giveplayerid, 0);
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			PlayAudioStreamForPlayer(playerid, "http://web.samp-vn.com/admvaotu.mp3");
			format(string, sizeof(string), "He Thong: %s da bi bo tu | Li do: %s", GetPlayerNameEx(giveplayerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PlayerInfo[giveplayerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(giveplayerid, 0);
			SetPlayerHealth(giveplayerid, 100);
			PlayerInfo[giveplayerid][pJailTime] = minutes*60;
			SetPVarInt(giveplayerid, "_rAppeal", gettime()+60);			format(PlayerInfo[giveplayerid][pPrisonReason], 128, "[OOC][PRISON] %s", reason);
			format(PlayerInfo[giveplayerid][pPrisonedBy], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
			new rand = random(sizeof(OOCPrisonSpawns));
			Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerInterior(giveplayerid, 1);
			PlayerInfo[giveplayerid][pInt] = 1;
			SetPlayerVirtualWorld(giveplayerid, 1);
			PlayerInfo[giveplayerid][pVW] = 1;
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}
CMD:suspend(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3 || PlayerInfo[playerid][pSecurity] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /suspend [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			format(string, sizeof(string), "[MAYCHU] %s has been suspended by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been suspended by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, string, 2);
			PlayerInfo[giveplayerid][pAdmin] = 0;
			PlayerInfo[giveplayerid][pBanAppealer] = 0;
			PlayerInfo[giveplayerid][pShopTech] = 0;
			PlayerInfo[giveplayerid][pDisabled] = 1;
			Kick(giveplayerid);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:vsuspend(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vsuspend [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			format(string, sizeof(string), "[MAYCHU] %s has been VIP suspended by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been VIP suspended by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED, string, 2);
			if(PlayerInfo[playerid][pAdmin] == 0)
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
			}
			PlayerInfo[giveplayerid][pDonateRank] = 0;
			format(string, sizeof(string), "Your VIP has been suspended by %s. You may appeal this on the forums (admin complaint).", GetPlayerNameEx(playerid));
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:prisonoff(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], name[MAX_PLAYER_NAME], minutes, reason[64];
		if(sscanf(params, "s[24]ds[64]", name, minutes, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /prisonaccount [player name] [time (minutes)] [reason]");

        new giveplayerid = ReturnUser(name);
        if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin])
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
				return 1;
			}
			SetPlayerArmedWeapon(giveplayerid, 0);

			if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
			{
				LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			}

			GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			SendClientMessageEx(playerid, COLOR_WHITE, "The person is online and has been prisoned!");
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			PlayerInfo[giveplayerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(giveplayerid, 0);
			PlayerInfo[giveplayerid][pJailTime] = minutes*60;
			SetPVarInt(giveplayerid, "_rAppeal", gettime()+60);			format(PlayerInfo[giveplayerid][pPrisonReason], 128, "[OOC][PRISON] %s", reason);
			format(PlayerInfo[giveplayerid][pPrisonedBy], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
			PhoneOnline[giveplayerid] = 1;
			SetPlayerInterior(giveplayerid, 1);
			PlayerInfo[giveplayerid][pInt] = 1;
			new rand = random(sizeof(OOCPrisonSpawns));
			Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
		}
		else
		{
			new tmpName[24], tmpPrisonedBy[24], tmpPrisonReason[64], query[512];
			format(tmpPrisonReason, 64, "[OOC][PRISONACC] %s", reason);
			format(tmpPrisonedBy, 24, "%s", GetPlayerNameEx(playerid));
			mysql_escape_string(name, tmpName);
			mysql_escape_string(tmpPrisonReason, tmpPrisonReason);

			SetPVarString(playerid, "OnPrisonAccount", tmpName);
			SetPVarString(playerid, "OnPrisonAccountReason", tmpPrisonReason);

			format(string, sizeof(string), "Attempting to prison %s's account for %d minutes...", tmpName, minutes);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);

			format(query,sizeof(query),"UPDATE `accounts` SET `PrisonReason` = '%s', `PrisonedBy` = '%s', `JailTime` = %d WHERE `PermBand` < 3 AND `Band` < 1 AND `AdminLevel` < %d AND `Username` = '%s'", tmpPrisonReason, tmpPrisonedBy, minutes*60, PlayerInfo[playerid][pAdmin], tmpName);
			mysql_function_query(MainPipeline, query, false, "OnPrisonAccount", "i", playerid);
		}
	}
	return 1;
}

CMD:jailaccount(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], name[MAX_PLAYER_NAME], minutes, reason[64];
		if(sscanf(params, "s[24]ds[64]", name, minutes, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /jailaccount [player name] [time (minutes)] [reason]");

		new tmpName[24], tmpPrisonedBy[24], tmpPrisonReason[64], query[512];
		format(tmpPrisonReason, 64, "[OOC][JAILACC] %s", reason);
		format(tmpPrisonedBy, 24, "%s", GetPlayerNameEx(playerid));
		mysql_escape_string(name, tmpName);
		mysql_escape_string(tmpPrisonReason, tmpPrisonReason);

		SetPVarString(playerid, "OnJailAccount", tmpName);
		SetPVarString(playerid, "OnJailAccountReason", tmpPrisonReason);

		format(string, sizeof(string), "Attempting to jail %s's account for %d minutes...", tmpName, minutes);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);

		format(query,sizeof(query),"UPDATE `accounts` SET `PrisonReason` = '%s', `PrisonedBy` = '%s', `JailTime` = %d WHERE `PermBand` < 3 AND `Band` < 1 AND `AdminLevel` < %d AND `Username` = '%s'", tmpPrisonReason, tmpPrisonedBy, minutes*60, PlayerInfo[playerid][pAdmin], tmpName);
		mysql_function_query(MainPipeline, query, false, "OnJailAccount", "i", playerid);
	}
	return 1;
}

CMD:thatu(playerid, params[])
{
	return cmd_release(playerid, params);
}


CMD:release(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /release [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pJailTime] == 0)
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "This player is not currently in prison!");
			}
			else
			{
				format(string, sizeof(string), "[MAYCHU] %s da duoc  tha tu boi Admin | ly do: %s", GetPlayerNameEx(giveplayerid), reason);
				Log("logs/admin.log", string);
				format(string, sizeof(string), "[MAYCHU] %s da duoc  tha tu boi Admin | ly do: %s", GetPlayerNameEx(giveplayerid), reason);
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				PlayerInfo[giveplayerid][pWantedLevel] = 0;
				PlayerInfo[giveplayerid][pBeingSentenced] = 0;
				SetPlayerToTeamColor(giveplayerid);
				SetPlayerHealth(giveplayerid, 50);
				SetPlayerWantedLevel(giveplayerid, 0);
				PlayerInfo[giveplayerid][pJailTime] = 0;
				SetPlayerPos(giveplayerid, 1538.2461,-1673.7982,13.5469);
				SetPlayerInterior(giveplayerid,0);
				PlayerInfo[giveplayerid][pInt] = 0;
				SetPlayerVirtualWorld(giveplayerid, 0);
				PlayerInfo[giveplayerid][pVW] = 0;
				strcpy(PlayerInfo[giveplayerid][pPrisonReason], "None", 128);
				SetPlayerToTeamColor(giveplayerid);
			}
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:sprison(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pUndercover] >= 1)
	{
		new string[128], giveplayerid, minutes, reason[64];
		if(sscanf(params, "uds[64]", giveplayerid, minutes, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sprison [player] [minutes] [reason]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
			if(strlen(reason) >= 25) return SendClientMessageEx(playerid, COLOR_WHITE, "Please provide a shorter reason. The maximum length for a prison reason is 25.");

			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s has been silent prisoned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s has been prisoned by an Admin, reason: %s", GetPlayerNameEx(giveplayerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PlayerInfo[giveplayerid][pWantedLevel] = 0;
			SetPlayerWantedLevel(giveplayerid, 0);
			SetPlayerToTeamColor(giveplayerid);
			SetPlayerHealth(giveplayerid, 100);
			PhoneOnline[giveplayerid] = 1;
			PlayerInfo[giveplayerid][pJailTime] = minutes*60;
			format(PlayerInfo[giveplayerid][pPrisonReason], 128, "[OOC][SPRISON] %s", reason);
			format(PlayerInfo[giveplayerid][pPrisonedBy], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
			SetPlayerInterior(giveplayerid, 1);
			PlayerInfo[playerid][pInt] = 1;
			new rand = random(sizeof(OOCPrisonSpawns));
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:sjail(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pUndercover] >= 1)
	{
		new string[128], giveplayerid, minutes, reason[64];
		if(sscanf(params, "uds[64]", giveplayerid, minutes, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sjail [player] [minutes] [reason]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
			if(strlen(reason) >= 25) return SendClientMessageEx(playerid, COLOR_WHITE, "Please provide a shorter reason. The maximum length for a prison reason is 25.");

			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			ResetPlayerWeaponsEx(giveplayerid);
			format(string, sizeof(string), "[MAYCHU] %s da bi boc lich boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			format(string, sizeof(string), "[MAYCHU] %s da bi boc lich boi Admin, ly do: %s", GetPlayerNameEx(giveplayerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PhoneOnline[giveplayerid] = 1;
			PlayerInfo[giveplayerid][pJailTime] = minutes*60;
            PlayerInfo[giveplayerid][pWarns] += 1;
			SetPlayerInterior(giveplayerid, 1);
			SetPlayerHealth(giveplayerid, 100);
			SetPlayerFacingAngle(giveplayerid, 0);
			new rand = random(sizeof(OOCPrisonSpawns));
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			PlayerInfo[giveplayerid][pVW] = 0;
			SetPlayerVirtualWorld(giveplayerid, 0);
			format(string, sizeof(string), "Ban da bi bo tu trong %d phut.", minutes);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
            format(string, sizeof(string), "Ban da nhan duoc mot canh cao vi` vi pham luat le cua Server!");
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(PlayerInfo[giveplayerid][pPrisonedBy], 24, "%s", GetPlayerNameEx(playerid));
			format(PlayerInfo[giveplayerid][pPrisonReason], 128, "[OOC][SJAIL] %s", reason);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:jail(playerid, params[])
{
	new string[128], giveplayerid, minutes, reason[64];
	if(sscanf(params, "uds[64]", giveplayerid, minutes, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /jail [player] [minutes] [reason]");

	if(minutes < 1 || minutes > 30) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't jail for less than 1 minutes or more than 30 minutes.");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(PlayerInfo[playerid][pSMod] < 1 && PlayerInfo[playerid][pAdmin] == 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		if(IsPlayerConnected(giveplayerid))
		{
			if((PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) || (PlayerInfo[playerid][pAdmin] == 1 && PlayerInfo[giveplayerid][pHelper] >= 2)) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");

			if(GetPVarInt(giveplayerid, "IsInArena") >= 0) LeavePaintballArena(giveplayerid, GetPVarInt(giveplayerid, "IsInArena"));
			ResetPlayerWeaponsEx(giveplayerid);
			if(GetPVarInt(giveplayerid, "Injured") == 1)
			{
				KillEMSQueue(giveplayerid);
				ClearAnimations(giveplayerid);
			}
			format(string, sizeof(string), "[MAYCHU] %s da bi boc lich boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			SendClientMessageToAllEx(COLOR_LIGHTRED, string);
			if(PlayerInfo[playerid][pSMod] > 0 && PlayerInfo[playerid][pAdmin] == 1)
			{
				format(string, sizeof(string), "[MAYCHU] %s bi boc lich boi Senior Moderator Dep Trai %s, reason: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				Log("logs/moderator.log", string);
				PlayAudioStreamForPlayer(playerid, "http://web.samp-vn.com/admvaotu.mp3");
				format(string, sizeof(string), "Ban da bi bo tu boi %s trong %d phut vi` vi pham luat.", GetPlayerNameEx(playerid), minutes);
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			}
			else
			{
				format(string, sizeof(string), "[MAYCHU] %s bi boc lich boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				Log("logs/admin.log", string);
				format(string, sizeof(string), "Ban da bi boc lich boi %s trong %d phut vi` vi pham luat.", GetPlayerNameEx(playerid), minutes);
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			}
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			format(string, sizeof(string), "Ly do: %s", reason);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			ResetPlayerWeaponsEx(giveplayerid);
			PhoneOnline[giveplayerid] = 1;
			PlayerInfo[giveplayerid][pJailTime] = minutes*60;
			SetPVarInt(giveplayerid, "_rAppeal", gettime()+60);
			SetPlayerFacingAngle(giveplayerid, 0);
			TogglePlayerControllable(giveplayerid, 1);
			SetPlayerHealth(giveplayerid, 100);
			new rand = random(sizeof(OOCPrisonSpawns));
			SetPlayerPos(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			Streamer_UpdateEx(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2]);
			SetPlayerSkin(giveplayerid, 50);
			SetPlayerInterior(giveplayerid, 1);
			PlayerInfo[giveplayerid][pInt] = 1;
			SetPlayerVirtualWorld(giveplayerid, 1);
			PlayerInfo[giveplayerid][pVW] = 1;
			format(PlayerInfo[giveplayerid][pPrisonedBy], 24, "%s", GetPlayerNameEx(playerid));
			format(PlayerInfo[giveplayerid][pPrisonReason], 128, "[OOC][JAIL] %s", reason);
			SetPlayerColor(giveplayerid, TEAM_APRISON_COLOR);
			Player_StreamPrep(giveplayerid, OOCPrisonSpawns[rand][0], OOCPrisonSpawns[rand][1], OOCPrisonSpawns[rand][2], FREEZE_TIME);
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}


CMD:setmystat(playerid, params[])
{
	if(PlayerInfo[playerid][pUndercover] >= 1 || PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], statcode, amount;
		if(sscanf(params, "dd", statcode, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setmystat [statcode] [amount]");
			SendClientMessageEx(playerid, COLOR_GRAD4, "|1 Level |2 ArmorUpgrade |3 UpgradePoints |4 Model |6 PhoneNumber |7 RespectPoints");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|8 HouseKey |11 FMember |12 Det |13 Lawyer |14 Fixer |16 Jack |17 Drug");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|18 Sex |19 Box |20 Arms |24 Fishing |25 Job |26 Rank |27 Packages |28 Crates");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|29 Smuggler |30 Empty |31 Warnings |32 Screwdriver |33 Age |34 Sex |35 NMute 36| AdMute 37| Faction");
			return 1;
		}

		switch (statcode)
		{
		case 1:
			{
				PlayerInfo[playerid][pLevel] = amount;
				format(string, sizeof(string), "   %s's Level has been set to %d.", GetPlayerNameEx(playerid), amount);
				SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
			}
		case 2:
			{
				PlayerInfo[playerid][pSHealth] = amount;
				format(string, sizeof(string), "   %s's ArmorUpgrade has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 3:
			{
				PlayerInfo[playerid][gPupgrade] = amount;
				format(string, sizeof(string), "   %s's Upgrade Points has been set %d.", GetPlayerNameEx(playerid), amount);
			}
		case 4:
			{
				PlayerInfo[playerid][pModel] = amount;
				format(string, sizeof(string), "   %s's Model has been set %d.", GetPlayerNameEx(playerid), amount);
			}
		case 6:
			{
				new query[128];
				SetPVarInt(playerid, "WantedPh", amount);
				SetPVarInt(playerid, "CurrentPh", PlayerInfo[playerid][pPnumber]);
				SetPVarInt(playerid, "PhChangeCost", 50000);
				format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `PhoneNr` = '%d'",amount);
				mysql_function_query(MainPipeline, query, true, "OnPhoneNumberCheck", "ii", playerid, 3);
				return 1;
			}
		case 7:
			{
				PlayerInfo[playerid][pExp] = amount;
				format(string, sizeof(string), "   %s's Respect Points have been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 8:
			{
				SendClientMessageEx(playerid,COLOR_RED,"House keys cannot be set directly."); return 1;
			}
		case 11:
			{
				PlayerInfo[playerid][pFMember] = amount;
				format(string, sizeof(string), "   %s's Family Membership has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 12:
			{
				PlayerInfo[playerid][pDetSkill] = amount;
				format(string, sizeof(string), "   %s's Detective Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 13:
			{
				PlayerInfo[playerid][pLawSkill] = amount;
				format(string, sizeof(string), "   %s's Lawyer Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 14:
			{
				PlayerInfo[playerid][pMechSkill] = amount;
				format(string, sizeof(string), "   %s's Car Mechanic Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 17:
			{
				PlayerInfo[playerid][pDrugsSkill] = amount;
				format(string, sizeof(string), "   %s's Drug Dealer Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 18:
			{
				PlayerInfo[playerid][pSexSkill] = amount;
				format(string, sizeof(string), "   %s's Sex Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 19:
			{
				PlayerInfo[playerid][pBoxSkill] = amount;
				format(string, sizeof(string), "   %s's Box Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 20:
			{
				PlayerInfo[playerid][pArmsSkill] = amount;
				format(string, sizeof(string), "   %s's Arms Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 24:
			{
				PlayerInfo[playerid][pFishSkill] = amount;
				format(string, sizeof(string), "   %s's Fishing Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 25:
			{
				PlayerInfo[playerid][pJob] = amount;
				format(string, sizeof(string), "   %s's Job has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 26:
			{
				PlayerInfo[playerid][pRank] = amount;
				format(string, sizeof(string), "   %s's Rank has been to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 27:
			{
				SetPVarInt(playerid, "Packages", amount);
				format(string, sizeof(string), "   %s's Materials Packages have been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 28:
			{
				PlayerInfo[playerid][pCrates] = amount;
				format(string, sizeof(string), "   %s's Drug Crates have been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 29:
			{
				PlayerInfo[playerid][pSmugSkill] = amount;
				format(string, sizeof(string), "   %s's Smuggler Skill has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 31:
			{
				PlayerInfo[playerid][pWarns] = amount;
				format(string, sizeof(string), "   %s's Warnings have been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 32:
			{
				PlayerInfo[playerid][pScrewdriver] = amount;
				format(string, sizeof(string), "   %s's Screwdrivers have been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		/*case 33:
			{
				PlayerInfo[playerid][pAge] = amount;
				format(string, sizeof(string), "   %s's Age has been set to %d.", GetPlayerNameEx(playerid), amount);
			}*/
		case 34:
			{
				PlayerInfo[playerid][pSex] = amount;
				format(string, sizeof(string), "   %s's Sex has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 35:
			{
				PlayerInfo[playerid][pNMuteTotal] = amount;
				format(string, sizeof(string), "   %s's Total Newbie Mutes has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 36:
			{
				PlayerInfo[playerid][pADMuteTotal] = amount;
				format(string, sizeof(string), "   %s's Total Ad Mutes has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		case 37:
			{
				PlayerInfo[playerid][pMember] = amount;
				format(string, sizeof(string), "   %s's Faction has been set to %d.", GetPlayerNameEx(playerid), amount);
			}
		default:
			{
				format(string, sizeof(string), "   Invalid stat code.", amount);
			}
		}

		format(string, sizeof(string), "%s by %s", string, GetPlayerNameEx(playerid));
		Log("logs/undercover.log", string);
		SendClientMessageEx(playerid, COLOR_GRAD1, string);
	}
	return 1;
}

CMD:setvw(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	new giveplayerid, vw;
	if(sscanf(params, "ud", giveplayerid, vw)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setvw [player] [virtual world]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	new string[128];
	if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
	{
		SetPVarInt(playerid, "tempPBP", giveplayerid);
		format(string, sizeof(string), "%s (ID: %d) is currently in an active Paintball game.\n\nDo you want to force this player out?", GetPlayerNameEx(giveplayerid), giveplayerid);
		ShowPlayerDialog(playerid, PBFORCE, DIALOG_STYLE_MSGBOX, "Paintball", string, "Yes", "No");
		return 1;
	}
	PlayerInfo[giveplayerid][pVW] =  vw;
	SetPlayerVirtualWorld(giveplayerid,  vw);
	format(string, sizeof(string), "You have set %s's virtual world to %d.", GetPlayerNameEx(giveplayerid),  vw);
	SendClientMessageEx(playerid, COLOR_GRAD2, string);
	return 1;
}

CMD:setint(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	new giveplayerid, int;
	if(sscanf(params, "ud", giveplayerid, int)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setint [player] [interiorid]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	new string[128];
	PlayerInfo[giveplayerid][pInt] = int;
	SetPlayerInterior(giveplayerid, int);
	format(string, sizeof(string), "You have set %s's interior to %d.", GetPlayerNameEx(giveplayerid), int);
	SendClientMessageEx(playerid, COLOR_GRAD2, string);
	return 1;
}

CMD:setskin(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid, skinid;
		if(sscanf(params, "ud", giveplayerid, skinid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setskin [player] [skinid]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(!IsInvalidSkin(skinid))
			{
				if(GetPlayerSkin(giveplayerid) == skinid)
				{
					SendClientMessageEx( playerid, COLOR_WHITE, "Nguoi Do Dang Mac Skin Nay Khong The Set Skin Do Nua. " );
				}
				else
				{
					PlayerInfo[giveplayerid][pModel] = skinid;
					format(string, sizeof(string), "Skin Cua Ban Da Duoc Doi Thanh ID %d Boi {FF0000}Administrator{FFFFFF} %s.", skinid, GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
					format(string, sizeof(string), "Ban da cho %s skin ID %d.", GetPlayerNameEx(giveplayerid), skinid);
					SendClientMessageEx(playerid, COLOR_WHITE, string);
					SetPlayerSkin(giveplayerid, PlayerInfo[giveplayerid][pModel]);
				}
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Invalid skin ID!");
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}



CMD:entercar(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new carid, seatid;
		if(sscanf(params, "ii", carid, seatid))	return SendClientMessage(playerid, COLOR_WHITE, "SU DUNG: /entercar [carid] [cho ngoi]");

		new
			iVehID = strval(params);

		if(!(1 <= iVehID <= MAX_VEHICLES)) return SendClientMessageEx(playerid, COLOR_GREY, "Valid vehicle IDs run from 1 to 2000.");
		if(seatid < 0 || seatid > 3) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid Seat ID!");
		else if(IsSeatAvailable(iVehID, seatid)) IsPlayerEntering{playerid} = true, PutPlayerInVehicle(playerid, iVehID, seatid), SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		else SendClientMessageEx(playerid, COLOR_GREY, "That seat is occupied.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:gotocar(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new carid;
		if(sscanf(params, "d", carid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotocar [carid]");

		new Float:cwx2,Float:cwy2,Float:cwz2;
		GetVehiclePos(carid, cwx2, cwy2, cwz2);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
			fVehSpeed[playerid] = 0.0;
		}
		else
		{
			SetPlayerPos(playerid, cwx2, cwy2, cwz2);
		}
		SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		SetPlayerInterior(playerid,0);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:gotoid(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotoid [player]");

	new Float:plocx,Float:plocy,Float:plocz;
	if (IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pHelper] >= 3)
		{
			if(GetPlayerState(giveplayerid) == PLAYER_STATE_SPECTATING)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi do dang theo doi nguoi choi");
				return 1;
			}
			if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the lam dieu nay khi dang theo doi.");
				return 1;
			}
			GetPlayerPos(giveplayerid, plocx, plocy, plocz);
			SetPlayerVirtualWorld(playerid, PlayerInfo[giveplayerid][pVW]);
			Streamer_UpdateEx(playerid, plocx, plocy, plocz);

			if (GetPlayerState(playerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(playerid);
				SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
				fVehSpeed[playerid] = 0.0;
			}
			else
			{
				SetPlayerPos(playerid,plocx,plocy+2, plocz);
				SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
				SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
				PlayerInfo[playerid][pVW] = GetPlayerVirtualWorld(giveplayerid);
			}

			SendClientMessageEx(playerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		}

	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:sendtoid(playerid, params[])
{
	new string[128];
	new giveplayerid;
	new targetplayerid;
	if(sscanf(params, "uu", giveplayerid, targetplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sendtoid [player] [target player]");

	new Float:plocx,Float:plocy,Float:plocz;
	if (IsPlayerConnected(giveplayerid) && IsPlayerConnected(targetplayerid))
	{
		if (PlayerInfo[playerid][pAdmin] >= 3)
		{
			if(GetPlayerState(giveplayerid) == PLAYER_STATE_SPECTATING || GetPlayerState(targetplayerid) == PLAYER_STATE_SPECTATING)
			{
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Ho dang theo doi nguoi choi.");
			}
			if(giveplayerid == playerid)
			{
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Use /gotoid to teleport instead!");
			}
			if(targetplayerid == playerid)
			{
				return SendClientMessageEx(playerid, COLOR_GRAD2, "Use /gethere to teleport instead!");
			}
			if(PlayerInfo[targetplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin])
			{
				return SendClientMessageEx(playerid, COLOR_GRAD2, "You cannot use this command on a Admin with the same/greater Administrative Level than you.");
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
			{
			    SetPVarInt(playerid, "tempPBP", giveplayerid);
			    format(string, sizeof(string), "%s (ID: %d) is currently in an active Paintball game.\n\nDo you want to force this player out?", GetPlayerNameEx(giveplayerid), giveplayerid);
			    return ShowPlayerDialog(playerid, PBFORCE, DIALOG_STYLE_MSGBOX, "Paintball", string, "Yes", "No");
			}
			if(PlayerInfo[giveplayerid][pAdmin] == 7 && !GetPVarType(giveplayerid, "EATeleportable")) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot teleport them");
			if(PlayerInfo[targetplayerid][pAdmin] == 7 && !GetPVarType(targetplayerid, "EATeleportable")) return SendClientMessageEx(playerid, COLOR_WHITE, "You cannot teleport to them");
			GetPlayerPos(targetplayerid, plocx, plocy, plocz);
			SetPlayerVirtualWorld(giveplayerid, PlayerInfo[targetplayerid][pVW]);
			Streamer_UpdateEx(giveplayerid, plocx, plocy, plocz);

			if (GetPlayerState(giveplayerid) == 2)
			{
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
				fVehSpeed[giveplayerid] = 0.0;
			}
			else
			{
				SetPlayerPos(giveplayerid,plocx,plocy+2, plocz);
				SetPlayerInterior(giveplayerid, GetPlayerInterior(targetplayerid));
				SetPlayerVirtualWorld(giveplayerid, GetPlayerVirtualWorld(targetplayerid));
			}

			format(string, sizeof(string), "Ban da duoc dich chuyen to %s", GetPlayerNameEx(targetplayerid));
			SendClientMessageEx(giveplayerid, COLOR_GRAD1, string);
			format(string, sizeof(string), "You have teleported %s to %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(targetplayerid));
			SendClientMessageEx(playerid, COLOR_GRAD1, string);
		}
		else
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		}

	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:gethere(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gethere [player]");

	new Float:plocx,Float:plocy,Float:plocz;
	if (IsPlayerConnected(giveplayerid))
	{
		if (PlayerInfo[playerid][pAdmin] >= 2)
		{
			if(GetPlayerState(giveplayerid) == PLAYER_STATE_SPECTATING)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ho dang theo doi nguoi choi.");
				return 1;
			}
			if(GetPVarInt(giveplayerid, "IsInArena") >= 0)
			{
			    new string[128];
			    SetPVarInt(playerid, "tempPBP", giveplayerid);
			    format(string, sizeof(string), "%s (ID: %d) is currently in an active Paintball game.\n\nDo you want to force this player out?", GetPlayerNameEx(giveplayerid), giveplayerid);
			    ShowPlayerDialog(playerid, PBFORCE, DIALOG_STYLE_MSGBOX, "Paintball", string, "Yes", "No");
			    return 1;
			}
			GetPlayerPos(playerid, plocx, plocy, plocz);
			SetPlayerVirtualWorld(giveplayerid, PlayerInfo[playerid][pVW]);
			Streamer_UpdateEx(giveplayerid, plocx, plocy, plocz);

			if (GetPlayerState(giveplayerid) == 2)
			{
				fVehSpeed[giveplayerid] = 0.0;
				new tmpcar = GetPlayerVehicleID(giveplayerid);
				SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
				LinkVehicleToInterior(GetPlayerVehicleID(giveplayerid), GetPlayerInterior(playerid));
				SetPlayerInterior(giveplayerid, GetPlayerInterior(playerid));
				SetVehicleVirtualWorld(GetPlayerVehicleID(giveplayerid), GetPlayerVirtualWorld(playerid));
				SetPlayerVirtualWorld(giveplayerid, GetPlayerVirtualWorld(playerid));
			}
			else
			{
				SetPlayerPos(giveplayerid,plocx,plocy+2, plocz);
				SetPlayerInterior(giveplayerid, GetPlayerInterior(playerid));
				SetPlayerVirtualWorld(giveplayerid, GetPlayerVirtualWorld(playerid));
			}

			SendClientMessageEx(giveplayerid, COLOR_GRAD1, "   Ban da duoc dich chuyen!");
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		}

	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:getcar(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new carid;
		if(sscanf(params, "d", carid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /getcar [carid]");
		new Float:plocx,Float:plocy,Float:plocz;

		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetVehiclePos(carid,plocx,plocy+4, plocz);
		SetVehicleVirtualWorld(carid, GetPlayerVirtualWorld(playerid));
		LinkVehicleToInterior(carid, GetPlayerInterior(playerid));
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:respawnvipcars(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		for(new i = 0; i < sizeof(VIPVehicles); i++)
		{
			if(!IsVehicleOccupied(VIPVehicles[i]))
			{
				SetVehicleVirtualWorld(VIPVehicles[i], 0);
				LinkVehicleToInterior(VIPVehicles[i], 0);
				SetVehicleToRespawn(VIPVehicles[i]);
			}
		}
		SendClientMessageEx(playerid, COLOR_GREY, "Ban  da reset lai tat ca xe vip.");
	}
	return 1;
}

CMD:respawncars(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], radius;
		if(sscanf(params, "d", radius)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /respawncars [radius]");

		if(radius < 1 || radius > 100000)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban kinh phai lon hon 0 va nho hon 100000!");
			return 1;
		}
		RespawnNearbyVehicles(playerid, radius);
		format(string, sizeof(string), "[MAYCHU] %s da khoi phuc vi tri ban dau cua cac xe trong ban kinh %dm.", GetPlayerNameEx(playerid), radius);
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "Ban da khoi phuc vi tri ban dau cua cac xe trong ban kinh %dm.", radius);
		SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:respawncar(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], carid;
		if(sscanf(params, "d", carid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /respawncar [carid]");

		SetVehicleToRespawn(carid);
		format(string, sizeof(string), "Ban da khoi phuc lai vi tri xe ID %d.", carid);
		SendClientMessageEx(playerid, COLOR_GREY, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:takesung(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takeadminweapons [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			for(new s = 0; s < 12; s++)
			{
				if(PlayerInfo[giveplayerid][pAGuns][s] != 0)
				{
					RemovePlayerWeapon(giveplayerid, PlayerInfo[giveplayerid][pAGuns][s]);
				}
			}
			format(string,sizeof(string),"Ban da tich thu %s's vu khi admin da cho truoc do.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
	}
	return 1;
}

CMD:gotoco(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new Float: pos[3], int;
		if(sscanf(params, "fffd", pos[0], pos[1], pos[2], int)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotoco [x coordinate] [y coordinate] [z coordinate] [interior]");

		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban da duoc dich chuyen den vi tri yeu cau.");
		SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		SetPlayerInterior(playerid, int);
	}
	return 1;
}

CMD:thoitiet(playerid, params[]) {
	return cmd_setweather(playerid, params);
}
CMD:setweather(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new weather;
	if(sscanf(params, "d", weather)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setweather [weatherid]");

	if(weather < 0||weather > 45) { SendClientMessageEx(playerid, COLOR_GREY, "   ID thoi thiet phai lon hon 1 va nho hon 45!"); return 1; }
	SetWeather(weather);
	gWeather = weather;
	SendClientMessageEx(playerid, COLOR_GREY, "Thoi tiet da duoc thiet lap cho tat ca moi nguoi!");
	return 1;
}

CMD:setmoney(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 8)
	{
		new string[128], giveplayerid, money;
		if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setmoney [player] [money]");
		if(IsPlayerConnected(giveplayerid))
		{
			ResetPlayerCash(giveplayerid);
			GivePlayerCash(giveplayerid, money);
			format(string, sizeof(string), "Ban da dieu chinh tien cua %s's thanh $%d !",GetPlayerNameEx(giveplayerid),money);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s da dieu chinh tien %s's thanh $%d (/setmoney)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid),money);
			Log("logs/stats.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:settoken(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 8)
	{
		new string[128], giveplayerid, amount;
		if(sscanf(params, "ud", giveplayerid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /settoken [player] [amount]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pTokens] = amount;
			format(string, sizeof(string), "Ban da dieu chinh tokens %s's thanh %d !",GetPlayerNameEx(giveplayerid),amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "VIP: Admin %s da dieu chinh tokens cua ban thanh %d token.",GetPlayerNameEx(playerid),amount);
			SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);

			format(string, sizeof(string), "%s da dieu chinh token cua %s's thanh %d.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),amount);
			Log("logs/stats.log", string);

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:givetoken(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid, amount;
		if(sscanf(params, "ud", giveplayerid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givetoken [player] [amount]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pTokens] += amount;
			format(string, sizeof(string), "Ban da cho %s %d tokens !",GetPlayerNameEx(giveplayerid),amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "VIP: Admin %s da dua cho ban %d tokens.",GetPlayerNameEx(playerid),amount);
			SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);

			format(string, sizeof(string), "%s has given %s %d tokens.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),amount);
			Log("logs/stats.log", string);

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:sethunger(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 7)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sethunger [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pHunger] += 100;
			PlayerInfo[giveplayerid][pKhatNuoc] += 100;
			format(string, sizeof(string), "Ban da cho %s Banh: 100, Nuoc: 100",GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s da cho banh: 100, nuoc: 100 (/sethunger)", GetPlayerNameEx(playerid));
			Log("logs/sethunger.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:givemoney(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 8)
	{
		new string[128], giveplayerid, money;
		if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givemoney [player] [money]");

		if(money < 1) return SendClientMessageEx(playerid, COLOR_GRAD1, "You cannot give less than $1!");
		if(IsPlayerConnected(giveplayerid))
		{
			GivePlayerCash(giveplayerid, money);
			format(string, sizeof(string), "Ban da cho %s $%s !",GetPlayerNameEx(giveplayerid), number_format(money));
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has given %s $%s (/givemoney)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), number_format(money));
			Log("logs/stats.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:lockarena(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], arenaid;
	if(sscanf(params, "d", arenaid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /lockarena [arenaid]");

	arenaid--;

	if(arenaid < 0 || arenaid > MAX_ARENAS-1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "You have entered a invalid arenaid.");
		return 1;
	}
	foreach(new p: Player)
	{
		new cid = GetPVarInt(p, "IsInArena");
		if(cid == arenaid)
		{
			if(PaintBallArena[cid][pbBidMoney] > 0)
			{
				GivePlayerCash(p,PaintBallArena[cid][pbBidMoney]);
				format(string,sizeof(string),"You have been refunded a total of $%d because of premature closure.",PaintBallArena[cid][pbBidMoney]);
				SendClientMessageEx(p, COLOR_WHITE, string);
			}
			if(arenaid == GetPVarInt(p, "ArenaNumber"))
			{
				switch(PaintBallArena[arenaid][pbGameType])
				{
				case 1:
					{
						if(PlayerInfo[p][pDonateRank] < 3)
						{
							PlayerInfo[p][pPaintTokens] += 3;
							format(string,sizeof(string),"You have been refunded a total of %d Paintball Tokens because of premature closure.",3);
							SendClientMessageEx(p, COLOR_WHITE, string);
						}
					}
				case 2:
					{
						if(PlayerInfo[p][pDonateRank] < 3)
						{
							PlayerInfo[p][pPaintTokens] += 4;
							format(string,sizeof(string),"You have been refunded a total of %d Paintball Tokens because of premature closure.",4);
							SendClientMessageEx(p, COLOR_WHITE, string);
						}
					}
				case 3:
					{
						if(PlayerInfo[p][pDonateRank] < 3)
						{
							PlayerInfo[p][pPaintTokens] += 5;
							format(string,sizeof(string),"You have been refunded a total of %d Paintball Tokens because of premature closure.",5);
							SendClientMessageEx(p, COLOR_WHITE, string);
						}
					}
				case 4:
					{
						if(PlayerInfo[p][pDonateRank] < 3)
						{
							PlayerInfo[p][pPaintTokens] += 5;
							format(string,sizeof(string),"You have been refunded a total of %d Paintball Tokens because of premature closure.",5);
							SendClientMessageEx(p, COLOR_WHITE, string);
						}
					}
				case 5:
					{
						if(PlayerInfo[p][pDonateRank] < 3)
						{
							PlayerInfo[p][pPaintTokens] += 6;
							format(string,sizeof(string),"You have been refunded a total of %d Paintball Tokens because of premature closure.",6);
							SendClientMessageEx(p, COLOR_WHITE, string);
						}
					}
				}
			}
			LeavePaintballArena(p, cid);
		}
	}
	ResetPaintballArena(arenaid);
	PaintBallArena[arenaid][pbLocked] = 2;
	format(string, sizeof(string), "[MAYCHU] %s has locked %s.", GetPlayerNameEx(playerid),PaintBallArena[arenaid][pbArenaName]);
	ABroadCast(COLOR_YELLOW, string, 2);
	format(string, sizeof(string), "* Admin %s has locked %s (ArenaID: %d) for some short maintenance.", GetPlayerNameEx(playerid),PaintBallArena[arenaid][pbArenaName],arenaid+1);
	SendClientMessageToAllEx(COLOR_LIGHTBLUE, string);
	return 1;
}

CMD:unlockarena(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], arenaid;
	if(sscanf(params, "d", arenaid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /unlockarena [arenaid]");

	arenaid--;

	if(arenaid < 0 || arenaid > MAX_ARENAS-1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "You have entered a invalid arenaid.");
		return 1;
	}
	if(PaintBallArena[arenaid][pbLocked] == 2)
	{
		ResetPaintballArena(arenaid);
		format(string, sizeof(string), "[MAYCHU] %s has unlocked %s.", GetPlayerNameEx(playerid),PaintBallArena[arenaid][pbArenaName]);
		ABroadCast(COLOR_YELLOW, string, 2);
		format(string, sizeof(string), "* Admin %s has unlocked %s (ArenaID: %d), you may join/create it now.", GetPlayerNameEx(playerid),PaintBallArena[arenaid][pbArenaName],arenaid+1);
		SendClientMessageToAllEx(COLOR_LIGHTBLUE, string);
	}
	return 1;
}

CMD:givepainttokens(playerid, params[])
{
	new string[128], giveplayerid, amount;
	if(sscanf(params, "ud", giveplayerid, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givepainttokens [player] [amount]");

	if(IsPlayerConnected(giveplayerid))
	{
		if(PlayerInfo[playerid][pAdmin] < 2)
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
			return 1;
		}
		PlayerInfo[giveplayerid][pPaintTokens] += amount;

		format(string, sizeof(string), "You have received %d Paintball Tokens from Admin %s.", amount, GetPlayerNameEx(playerid));
		SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "Ban da cho %s %d Paintbll Tokens.", GetPlayerNameEx(giveplayerid), amount);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "[MAYCHU] %s has given %s, %d Paintball Tokens.", GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),amount);
		ABroadCast(COLOR_YELLOW, string, 2);

	}
	return 1;
}
CMD:oflag(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], query[256], name[MAX_PLAYER_NAME], reason[64], month, day, year;
		if(sscanf(params, "s[24]s[64]", name, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /oflag [player name] [reason]");
		getdate(year,month,day);

    	new giveplayerid = ReturnUser(name);
        if(IsPlayerConnected(giveplayerid))
		{
			AddFlag(giveplayerid, playerid, reason);
			SendClientMessage(playerid, COLOR_WHITE, "The person is online and has been flagged!");
			format(string, sizeof(string), "[MAYCHU] %s was flagged boi %s, ly do: %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);

			format(string, sizeof(string), "%s was flagged by %s (%s).", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/flags.log", string);
		}
		else
		{
			new tmpReason[64], tmpName[24];
			mysql_escape_string(reason, tmpReason, MainPipeline);
			mysql_escape_string(name, tmpName, MainPipeline);
			SetPVarString(playerid, "OnAddFlag", tmpName);
			SetPVarString(playerid, "OnAddFlagReason", tmpReason);

			format(query, sizeof(query), "SELECT id FROM `accounts` WHERE `Username`='%s'", tmpName);
			mysql_function_query(MainPipeline, query, true, "FlagQueryFinish", "iii", playerid, INVALID_PLAYER_ID, Flag_Query_Offline);

			format(string, sizeof(string), "Attempting to append %s's flag...", tmpName);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}
		return 1;
	}
	return 1;
}



CMD:flag(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /flag [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			AddFlag(giveplayerid, playerid, reason);
			format(string, sizeof(string), "[MAYCHU] %s was flagged boi %s, ly do: %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);

			format(string, sizeof(string), "%s was flagged by %s (%s).", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/flags.log", string);
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:slap(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pHelper] >= 3)
	{
	    new szString[128], giveplayerid, Float:posx, Float:posy, Float:posz, Float:shealth;
	    if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /slap [player]");
	    if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	    if((PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin]) && giveplayerid != playerid) {
			format(szString, sizeof(szString), "[MAYCHU] %s has tried to slap you!", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_YELLOW, szString);
			SendClientMessageEx(playerid, COLOR_GREY, "You cannot use this command on a the same/greater level admin than you!");
			PlayerPlaySound(giveplayerid, 1130, posx, posy, posz);
			return 1;
		}
		else {
		    GetPlayerHealth(giveplayerid, shealth);
			SetPlayerHealth(giveplayerid, shealth-5);
			GetPlayerPos(giveplayerid, posx, posy, posz);
			SetPlayerPos(giveplayerid, posx, posy, posz+5);
			PlayerPlaySound(giveplayerid, 1130, posx, posy, posz+5);
			if(giveplayerid != playerid) {
				format(szString, sizeof(szString), "[MAYCHU] %s was slapped by %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED, szString, 2);
			}
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay!");
	return 1;
}

CMD:kills(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[256], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /kills [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GREEN, "________________________________________________");
			format(string, sizeof(string), "<< Last 10 Kills/Deaths of %s >>", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			GetLatestKills(playerid, giveplayerid);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:okills(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		if(isnull(params)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /okills [name]");

		new query[256], giveplayerid;
		giveplayerid = ReturnUser(params);
		if(giveplayerid != INVALID_PLAYER_ID) return SendClientMessageEx(playerid, COLOR_GRAD2, "That person is online, use /kills for online players.");

		new tmpName[24];
		mysql_escape_string(params, tmpName, MainPipeline);

		format(query, sizeof(query), "SELECT `id` FROM `accounts` WHERE `Username` = '%s'", tmpName);
		mysql_function_query(MainPipeline, query, true, "OnGetOKills", "i", playerid);
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

CMD:mute(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /mute [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(giveplayerid == playerid)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "You can not use this command on yourself!");
				return 1;
			}

			if(PlayerInfo[giveplayerid][pMuted] == 0)
			{
				if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin])
				{
					format(string, sizeof(string), "%s just tried to /mute you.",GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
					SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
					return 1;
				}
				PlayerInfo[giveplayerid][pMuted] = 1;
				format(string, sizeof(string), "[MAYCHU] %s was silenced by %s.",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
			}
			else
			{
				PlayerInfo[giveplayerid][pMuted] = 0;
				format(string, sizeof(string), "[MAYCHU] %s was unsilenced by %s.",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:vmute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pDonateRank] == 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vmute [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pVMuted] == 0)
			{
				PlayerInfo[giveplayerid][pVMuted] = 1;
				format(string, sizeof(string), "[MAYCHU] %s has indefinitely blocked %s from using VIP Chat.",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				if(PlayerInfo[playerid][pAdmin] < 2)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				ABroadCast(COLOR_LIGHTRED,string,2);
				format(string, sizeof(string), "You have been indefinitely muted from VIP Chat for abuse by %s. You may appeal this on the forums (admin complaint)", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
				format(string, sizeof(string), "[MAYCHU] %s was blocked from /v by %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/mute.log", string);
			}
			else
			{
				PlayerInfo[giveplayerid][pVMuted] = 0;
				format(string, sizeof(string), "[MAYCHU] %s has been re-allowed to use VIP Chat by %s.",GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				if(PlayerInfo[playerid][pAdmin] < 2)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				ABroadCast(COLOR_LIGHTRED,string,2);
				format(string, sizeof(string), "You have been re-allowed to use VIP Chat by %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
				format(string, sizeof(string), "[MAYCHU] %s was unblocked from /v by %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/mute.log", string);
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:rmute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pAP] >= 2 || PlayerInfo[playerid][pHR] >= 3)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rmute [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pRMuted] == 0)
			{
				PlayerInfo[giveplayerid][pRMuted] = 1;
				format(string, sizeof(string), "[MAYCHU] %s has indefinitely blocked %s from submitting reports.",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
				format(string, sizeof(string), "You have been blocked from submitting /reports by %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "You will not be able to submit reports until you are unblocked.");
				format(string, sizeof(string), "[MAYCHU] %s was blocked from /report by %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/mute.log", string);
			}
			else
			{
				PlayerInfo[giveplayerid][pRMuted] = 0;
				format(string, sizeof(string), "[MAYCHU] %s has been re-allowed to submit reports by %s",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
				format(string, sizeof(string), "You have been re-allowed to submitting /reports again by %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
				format(string, sizeof(string), "[MAYCHU] %s was unblocked from /report by %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/mute.log", string);
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:rto(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[512], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rto [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pRMuted] == 0)
			{
			    if(PlayerInfo[giveplayerid][pRMutedTotal] == 0)
			    {
  					PlayerInfo[giveplayerid][pRMutedTotal] = 1;
					format(string, sizeof(string), "[MAYCHU] %s has given %s their first warning about report abuse, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "An admin warns you not to abuse /report.\n\nNote that future abuse of /report could result in a mute from /report or loss of that privilege altogether.");
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Report abuse warning", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s has given %s their first warning about report abuse, reason: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					Log("logs/mute.log", string);

			    }
			    else if(PlayerInfo[giveplayerid][pRMutedTotal] == 1)
			    {
  					PlayerInfo[giveplayerid][pRMuted] = 2;
  					PlayerInfo[giveplayerid][pRMutedTotal] = 2;
					PlayerInfo[giveplayerid][pRMutedTime] = 15*60;
					format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from submitting reports, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "You have been temporarily blocked from submitting reports boi %s, ly do: %s.\n\nAs this is the second time you have been blocked from reporting, you will not be able to use /report for 15 minutes.\n\nNote that future abuse of /report could result in a longer mute from /report or loss of that privilege altogether.", GetPlayerNameEx(playerid), reason);
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Temporarily blocked from reports", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
					Log("logs/mute.log", string);
			    }
			    else if(PlayerInfo[giveplayerid][pRMutedTotal] == 2)
			    {
  					PlayerInfo[giveplayerid][pRMuted] = 2;
  					PlayerInfo[giveplayerid][pRMutedTotal] = 3;
					PlayerInfo[giveplayerid][pRMutedTime] = 30*60;
					format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from submitting reports, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "You have been temporarily blocked from submitting reports boi %s, ly do: %s.\n\nAs this is the third time you have been blocked from reporting, you will not be able to use /report for 30 minutes.\n\nNote that future abuse of /report could result in a longer mute from /report or loss of that privilege altogether.", GetPlayerNameEx(playerid), reason);
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Temporarily blocked from reports", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
					Log("logs/mute.log", string);
			    }
			    else if(PlayerInfo[giveplayerid][pRMutedTotal] == 3)
			    {
  					PlayerInfo[giveplayerid][pRMuted] = 2;
  					PlayerInfo[giveplayerid][pRMutedTotal] = 4;
					PlayerInfo[giveplayerid][pRMutedTime] = 45*60;
					format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from submitting reports, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "You have been temporarily blocked from submitting reports boi %s, ly do: %s.\n\nAs this is the fourth time you have been blocked from reporting, you will not be able to use /report for 45 minutes.\n\nNote that future abuse of /report could result in a longer mute from /report or loss of that privilege altogether.", GetPlayerNameEx(playerid), reason);
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Temporarily blocked from reports", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
					Log("logs/mute.log", string);
				}
			    else if(PlayerInfo[giveplayerid][pRMutedTotal] == 4)
			    {
  					PlayerInfo[giveplayerid][pRMuted] = 2;
  					PlayerInfo[giveplayerid][pRMutedTotal] = 5;
					PlayerInfo[giveplayerid][pRMutedTime] = 60*60;
					format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from submitting reports, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "You have been temporarily blocked from submitting reports boi %s, ly do: %s.\n\nAs this is the fifth time you have been blocked from reporting, you will not be able to use /report for 60 minutes.\n\nNote that future abuse of /report could result in a loss of that privilege altogether.", GetPlayerNameEx(playerid), reason);
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Temporarily blocked from reports", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
					Log("logs/mute.log", string);
				}
			    else if(PlayerInfo[giveplayerid][pRMutedTotal] >= 5)
			    {
  					PlayerInfo[giveplayerid][pRMuted] = 2;
  					PlayerInfo[giveplayerid][pRMutedTotal] = 6;
					PlayerInfo[giveplayerid][pRMutedTime] = 300*60;
					format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from submitting reports, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
					ABroadCast(COLOR_LIGHTRED,string,2);

					format(string, sizeof(string), "You have been temporarily blocked from submitting reports boi %s, ly do: %s.\n\nAs this is the sixth time you have been blocked from reporting, you will not be able to use /report for 5 hours.\n\nNote that future abuse of /report could result in a loss of that privilege altogether.", GetPlayerNameEx(playerid), reason);
					ShowPlayerDialog(giveplayerid,7954,DIALOG_STYLE_MSGBOX,"Temporarily blocked from reports", string,"Next", "");

					format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
					Log("logs/mute.log", string);
				}

				for(new i = 0; i < MAX_REPORTS; i++)
				{
					if(Reports[i][ReportFrom] == giveplayerid)
					{
						Reports[i][BeingUsed] = 0;
					}
				}
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That person is already disabled from /reports.");
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:rtoreset(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rtoreset [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pRMuted] == 2)
			{
				PlayerInfo[giveplayerid][pRMuted] = 0;
				PlayerInfo[giveplayerid][pRMutedTotal]--;
				PlayerInfo[giveplayerid][pRMutedTime] = 0;
				format(string, sizeof(string), "[MAYCHU] %s has unblocked %s from reporting, reason: %s",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid), reason);
				ABroadCast(COLOR_LIGHTRED,string,2);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "You have been unblocked from submitting reports. You may now use the reporting system again.");
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "Please accept our apologies for any error and inconvenience this may have caused.");
				format(string, sizeof(string), "[MAYCHU] %s was unblocked from /report boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				Log("logs/mute.log", string);
			}
			else
			{
			    SendClientMessageEx(playerid, COLOR_GRAD1, "That person is not blocked from reporting!");
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:vto(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pDonateRank] == 5)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vto [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pVMuted] == 0)
			{
				PlayerInfo[giveplayerid][pVMuted] = 2;
				PlayerInfo[giveplayerid][pVMutedTime] = 15*60;
				format(string, sizeof(string), "[MAYCHU] %s has temporarily blocked %s from using VIP Chat, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
				ABroadCast(COLOR_LIGHTRED,string,2);
				if(PlayerInfo[playerid][pAdmin] < 2)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				format(string, sizeof(string), "You have been temporarily blocked from using VIP Chat boi %s, ly do: %s.", GetPlayerNameEx(playerid), reason);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "You will not be able to use VIP Chat for 15 minutes.");
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "Note the future abuse of VIP Chat could result in loss of that privilege altogether or being banned from the server.");
				format(string, sizeof(string), "[MAYCHU] %s was temporarily blocked from VIP Chat boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid),reason);
				Log("logs/mute.log", string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That person is already disabled from VIP Chat.");
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:vtoreset(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pDonateRank] == 5)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /vtoreset [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pVMuted] == 2)
			{
				PlayerInfo[giveplayerid][pVMuted] = 0;
				PlayerInfo[giveplayerid][pVMutedTime] = 0;
				format(string, sizeof(string), "[MAYCHU] %s has unblocked %s from using VIP Chat, reason: %s",GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), reason);
				if(PlayerInfo[playerid][pAdmin] < 2)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				ABroadCast(COLOR_LIGHTRED,string,2);
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "You have been unblocked from using VIP Chat. You may now use the VIP Chat system again.");
				SendClientMessageEx(giveplayerid, COLOR_GRAD2, "Please accept our apologies for any error and inconvenience this may have caused.");
				format(string, sizeof(string), "[MAYCHU] %s was unblocked from VIP Chat boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid),reason);
				Log("logs/mute.log", string);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "That person is not temporarily disabled from VIP Chat.");
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:kick(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pHelper] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /kick [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[playerid][pAdmin] == 1 && PlayerInfo[giveplayerid][pHelper] >= 2) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
			if(PlayerInfo[giveplayerid][pAdmin] >= PlayerInfo[playerid][pAdmin] && (PlayerInfo[giveplayerid][pHelper] >= 2 || PlayerInfo[giveplayerid][pAdmin] > 0) && playerid != giveplayerid) return SendClientMessageEx(playerid, COLOR_WHITE, "You can't perform this action on an equal or higher level administrator.");
			else
			{
				new playerip[32];
				GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
				format(string, sizeof(string), "[MAYCHU] %s (IP:%s) was kick boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), playerip, GetPlayerNameEx(playerid), reason);
				Log("logs/kick.log", string);
				if(PlayerInfo[playerid][pAdmin] == 1) Log("logs/moderator.log", string);
				format(string, sizeof(string), "[MAYCHU] %s da bi kick boi Admin | Li do: %s", GetPlayerNameEx(giveplayerid), reason);
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
			}
			return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:sban(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /sban [Player] [reason]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
			{
				format(string, sizeof(string), "[MAYCHU] %s da tu dong bi khoa tai khoan, ly do: Co gang /sban mot Admin cao hon.", GetPlayerNameEx(playerid));
				ABroadCast(COLOR_YELLOW,string,2);
				PlayerInfo[playerid][pBanned] = 1;
				SystemBan(playerid, "[System] (Dang co gang ban mot Admin cao hon)");
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				return 1;
			}
			new playerip[32];
			GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
			format(string, sizeof(string), "[MAYCHU] %s (IP:%s) was silent banned by %s, ly do: %s", GetPlayerNameEx(giveplayerid), playerip, GetPlayerNameEx(playerid), reason);
			Log("logs/ban.log", string);
			format(string, sizeof(string), "[MAYCHU] %s was silent banned by %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED,string,2);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			PlayerInfo[giveplayerid][pBanned] = 1;
            new ip[32];
			GetPlayerIp(giveplayerid,ip,sizeof(ip));
			AddBan(playerid, giveplayerid, reason);
			MySQLBan(GetPlayerSQLId(giveplayerid),ip,reason,1,GetPlayerNameEx(playerid));
			SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
			return 1;

		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:kickres(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] < 7)
	{
		return 1;
	}

	new level, amount;
	if(sscanf(params, "dd", level, amount)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /kickres [level] [amount]");

	if(level < 0 || level > 5) { SendClientMessageEx(playerid, COLOR_GREY, "   Can only Reserved Slots Kick from level 0 to 5!"); return 1; }
	if(amount < 1 || amount > 10) { SendClientMessageEx(playerid, COLOR_GREY, "   Can only Reserved Slots Kick of a maximum of 10 players!"); return 1; }
	foreach(new i: Player)
	{
		if(PlayerInfo[i][pLevel] == level && PlayerInfo[i][pAdmin] < 1 && PlayerInfo[i][pDonateRank] < 1 && amount > 0)
		{
			amount -= 1;
			Kick(i);
		}
	}
	return 1;
}

CMD:warn(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /warn [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 2) return SendClientMessageEx(playerid, COLOR_GRAD2, "Admins cannot be warned!");
			PlayerInfo[giveplayerid][pWarns] += 1;
			if(PlayerInfo[giveplayerid][pWarns] >= 3)
			{
				new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));
				format(string, sizeof(string), "[MAYCHU] %s (IP: %s) was banned by %s (had 3 Warnings), reason: %s", GetPlayerNameEx(giveplayerid), ip, GetPlayerNameEx(playerid), reason);
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was banned by %s (had 3 Warnings), reason: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				PlayerInfo[giveplayerid][pBanned] = 1;
				AddBan(playerid, giveplayerid, "Player received 3 warnings");
				MySQLBan(GetPlayerSQLId(giveplayerid),ip,reason,1,GetPlayerNameEx(playerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s was warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "[MAYCHU] %s was warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			format(string, sizeof(string), "You were warned boi %s, ly do: %s", GetPlayerNameEx(playerid), reason);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
			return 1;

		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:swarn(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pUndercover] >= 1)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /swarn [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 2) return SendClientMessageEx(playerid, COLOR_GRAD2, "Admins cannot be warned!");
			PlayerInfo[giveplayerid][pWarns] += 1;
			if(PlayerInfo[giveplayerid][pWarns] >= 3)
			{
			    new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));
				format(string, sizeof(string), "[MAYCHU] %s (IP: %s) was banned by %s (had 3 Warnings), reason: %s", GetPlayerNameEx(giveplayerid), ip, GetPlayerNameEx(playerid),reason);
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was banned by %s (had 3 Warnings), reason: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
				ABroadCast(COLOR_LIGHTRED, string, 2);
				PlayerInfo[giveplayerid][pBanned] = 1;
				AddBan(playerid, giveplayerid, "Player received 3 warnings");
				MySQLBan(GetPlayerSQLId(giveplayerid),ip,reason,1,GetPlayerNameEx(playerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s was silent warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "[MAYCHU] %s was silent warned boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid), reason);
			Log("logs/admin.log", string);
			StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
			format(string, sizeof(string), "You were warned by an Admin, reason: %s", reason);
			SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, string);
			return 1;

		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:owarn(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new string[128], query[512], name[MAX_PLAYER_NAME], reason[64];
	if(sscanf(params, "s[24]s[64]", name, reason)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /owarn [name] [reason]");

	new giveplayerid = ReturnUser(name);
	if(giveplayerid != INVALID_PLAYER_ID)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "That person is online, use /warn for online players.");
		return 1;
	}

	new tmpName[24];
	mysql_escape_string(name,tmpName);
	SetPVarString(playerid, "OnWarnPlayer", tmpName);
	SetPVarString(playerid, "OnWarnPlayerReason", reason);

	format(query, sizeof(query), "UPDATE `accounts` SET `Warnings`=`Warnings`+1 WHERE `Username`='%s' AND `PermBand` < 3 AND `Band` < 1 AND `AdminLevel` < 2",tmpName);
	mysql_function_query(MainPipeline, query, false, "OnWarnPlayer", "i", playerid);

	format(string,sizeof(string),"Attempting to warn %s...", tmpName);
	SendClientMessageEx(playerid, COLOR_YELLOW, string);

	return 1;
}

CMD:skick(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /skick [Nguoi choi] [Ly do]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
			{
				format(string, sizeof(string), "[MAYCHU] %s has been auto-kicked, reason: Trying to /skick a higher admin.", GetPlayerNameEx(playerid));
				ABroadCast(COLOR_YELLOW,string,2);
				SetTimerEx("KickEx", 1000, 0, "i", playerid);
				return 1;
			}
			else
			{
				new playerip[32];
				GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
				format(string, sizeof(string), "[MAYCHU] %s (IP:%s) was silent kicked boi %s, ly do: %s", GetPlayerNameEx(giveplayerid), playerip, GetPlayerNameEx(playerid), reason);
				Log("logs/kick.log", string);
				format(string, sizeof(string), "[MAYCHU] %s was silent kicked boi Admin, ly do: %s", GetPlayerNameEx(giveplayerid), reason);
				ABroadCast(COLOR_LIGHTRED,string,2);
				StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
			}
			return 1;

		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:ban(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[64];
		if(sscanf(params, "us[64]", giveplayerid, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ban [Player] [reason]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
			{
				format(string, sizeof(string), "[MAYCHU] %s da bi tu dong khoa tai khoan, ly do: Co danh /ban mot Admin cap cao.", GetPlayerNameEx(playerid));
				ABroadCast(COLOR_YELLOW,string,2);
				PlayerInfo[playerid][pBanned] = 1;
				SystemBan(playerid, "[System] (Co gang de cam mot Admin cao hon.)");
				Kick(playerid);
				return 1;
			}
			else
			{
				new playerip[32];
				GetPlayerIp(giveplayerid, playerip, sizeof(playerip));
				format(string, sizeof(string), "[MAYCHU] %s(IP:%s) da bi khoa tai khoan boi Admin | ly do: %s", GetPlayerNameEx(giveplayerid), playerip, reason);
				Log("logs/ban.log", string);
				format(string, sizeof(string), "[MAYCHU] %s da bi khoa tai khoan boi Admin | Li do: %s", GetPlayerNameEx(giveplayerid), reason);
				SendClientMessageToAllEx(COLOR_LIGHTRED, string);
				PlayerInfo[giveplayerid][pBanned] = 1;
				StaffAccountCheck(giveplayerid, GetPlayerIpEx(giveplayerid));
				new ip[32];
				GetPlayerIp(giveplayerid,ip,sizeof(ip));
    			AddBan(playerid, giveplayerid, reason);
				MySQLBan(GetPlayerSQLId(giveplayerid),ip,reason,1,GetPlayerNameEx(playerid));
				SystemBan(giveplayerid, GetPlayerNameEx(giveplayerid));
				SetTimerEx("KickEx", 1000, 0, "i", giveplayerid);
				new dialogstring[512];
	            format(dialogstring, sizeof(dialogstring), "Ban da bi banned - Ly do:\n\n%s\n\nNeu ban nghi~ day la mot sai lam gi do' hay chup lai anh va gui len Forum.GO:RP\n\n\n{00ff00} An nut F8 de chup lai anh!", reason);
	            ShowPlayerDialog(giveplayerid, 1, DIALOG_STYLE_MSGBOX, "Banned!", dialogstring, "OK", "");
				return 1;
			}

		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	return 1;
}

CMD:freeze(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /freeze [Player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] > PlayerInfo[playerid][pAdmin])
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay voi Admin cap cao.");
				return 1;
			}

			TogglePlayerControllable(giveplayerid, 0);
			SetPVarInt(giveplayerid, "IsFrozen", 1);
			format(string, sizeof(string), "[MAYCHU] %s da bi troi boi %s",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED,string,2);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:unfreeze(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /unfreeze [Player]");


		if(IsPlayerConnected(giveplayerid))
		{
			DeletePVar(giveplayerid, "IsFrozen");
			DeletePVar(giveplayerid, "PlayerCuffed");
			PlayerCuffed[giveplayerid] = 0;
			PlayerTied[giveplayerid] = 0;
			TogglePlayerControllable(giveplayerid, 1);
			format(string, sizeof(string), "[MAYCHU] %s da duoc coi troi boi %s.",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED,string,2);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi khong hop le.");
		}

	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:poke(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /poke [player]");


		if(IsPlayerConnected(giveplayerid))
		{
			DeletePVar(giveplayerid, "IsFrozen");
			TogglePlayerControllable(giveplayerid, 1);
			format(string, sizeof(string), "[MAYCHU] %s da bi day boi %s.",GetPlayerNameEx(giveplayerid),GetPlayerNameEx(playerid));
			ABroadCast(COLOR_LIGHTRED,string,2);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Nguoi choi khong hop le.");
		}

	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:leaders(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pFactionModerator] >= 1) {
		SendClientMessageEx(playerid, COLOR_WHITE, "Group leaders online:");

		new	string[128], sz_FacInfo[3][64];

		foreach(new i: Player)
		{
			if(PlayerInfo[i][pLeader] >= 0) {
				GetPlayerGroupInfo(i, sz_FacInfo[0], sz_FacInfo[1], sz_FacInfo[2]);
				format(string, sizeof(string), "(%s) %s %s", sz_FacInfo[2], sz_FacInfo[0], GetPlayerNameEx(i));
				SendClientMessageEx(playerid, COLOR_GRAD2, string);
			}
		}
	} else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}
CMD:nunmute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /nunmute [Player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pNMute] == 1)
			{
				format(string, sizeof(string), "[MAYCHU] %s duoc bo cam tham gia Hoi/Dap tren kenh /newb boi %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
				Log("logs/admin.log", string);
				PlayerInfo[giveplayerid][pNMute] = 0;
				PlayerInfo[giveplayerid][pNMuteTotal]--;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED,"Nguoi choi khong bi cam /newb!");
			}

		}
	}
	return 1;
}
CMD:adunmute(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adunmute [Player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pADMute] == 1)
			{
				if(PlayerInfo[giveplayerid][pJailTime] != 0)
				{
					SendClientMessageEx(playerid, COLOR_LIGHTRED, "Ban khong the bo cam cho nguoi dang trong tu!");
					SendClientMessageEx(giveplayerid, COLOR_LIGHTRED, "Xin loi, ban khong the bo quang cao khi ban dang trong tu.");
					return 1;
				}
				format(string, sizeof(string), "[MAYCHU] %s da duoc bo cam quang cao boi %s.", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				ABroadCast(COLOR_LIGHTRED,string,2);
				Log("logs/admin.log", string);
				PlayerInfo[giveplayerid][pADMute] = 0;
				PlayerInfo[giveplayerid][pADMuteTotal]--;
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_LIGHTRED,"Nguoi do khong bi cam!");
			}

		}
	}
	return 1;
}
CMD:makeadvisor(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pPR] > 0)
	{
		new string[128], giveplayerid, level;
		if(sscanf(params, "ud", giveplayerid, level)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makeadvisor [player] [level(1-4)]");

		if(IsPlayerConnected(giveplayerid))
		{	
			/*
			if(PlayerInfo[giveplayerid][pAdmin] >= 1)
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong them cho admins lam Junior Helpers!");
				return 1;
			}
			*/
			PlayerInfo[giveplayerid][pHelper] = level;
			switch(level)
			{
				case 1:
				{
					format(string, sizeof(string), "Ban da duoc tuyen vao doi ngu Helper boi %s", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "Ban da tuyen %s vao doi ngu Helper", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "%s da tuyen %s vao doi ngu Helper", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da duoc tuyen vao ngoi ngu Junior Helper boi %s", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "Ban da tuyen %s vao doi ngu Junior Helper", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "%s da duoc tuyen vao doi ngu Junior Helper boi %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
				case 3:
				{
					format(string, sizeof(string), "Ban da duoc tuyen lam Senior Helper boi %s", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "Ban da tuyen %s lam Senior Helper", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "%s da duoc tuyen lam Senior Helper boi %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
				case 4:
				{
					format(string, sizeof(string), "Ban da duoc tuyen lam Chief Helper by %s", GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "Ban da tuyen %s lam Chief Helper", GetPlayerNameEx(giveplayerid));
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
					format(string, sizeof(string), "%s da duoc tuyen lam Chief Helper boi %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
					Log("logs/admin.log", string);
				}
			}
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:makehelper(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makehelper [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 1)
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay voi Admin!");
				return 1;
			}
			PlayerInfo[giveplayerid][pHelper] = 1;
			format(string, sizeof(string), "Ban da duoc tuyen dung lam Helper boi %s", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da tuyen dung %s thanh Helper.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:makewatchdog(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makewatchdog [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(PlayerInfo[giveplayerid][pAdmin] >= 2)
			{
				SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the lam dieu nay voi admin!");
				return 1;
			}
			PlayerInfo[giveplayerid][pWatchdog] = 1;

			format(string, sizeof(string), "Ban da duoc tuyen dung vao doi ngu watchdog boi %s", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da tuyen dung %s vao doi ngu watchdog.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s da duoc tuyen vao doi ngu watchdog boi %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
			Log("logs/admin.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:removemoderator(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /removemoderator [player]");

		if(IsPlayerConnected(giveplayerid))
		{

			if(PlayerInfo[giveplayerid][pAdmin] == 1)
			{
				if(GetPVarInt(playerid, "AdvisorDuty") == 1)
				{
					DeletePVar(playerid, "AdvisorDuty");
					Advisors -= 1;
				}
				PlayerInfo[giveplayerid][pAdmin] = 0;
				PlayerInfo[giveplayerid][pSMod] = 0;
				format(string, sizeof(string), "%s has kicked you out from the moderator team.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "You took %s's moderator.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "%s moderator has been removed by %s", GetPlayerNameEx(giveplayerid), GetPlayerNameEx(playerid));
				Log("logs/moderator.log", string);
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:removewatchdog(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new pl;
	if(sscanf(params, "u", pl)) return SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /removewatchdog [playerid]");
	if(!IsPlayerConnected(pl)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	if(PlayerInfo[pl][pWatchdog] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "This player is not a watchdog.");
	new string[128];
	PlayerInfo[pl][pWatchdog] = 0;
	format(string, sizeof(string), "You took %s's watchdog.", GetPlayerNameEx(pl));
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "%s has kicked you out from the watchdog team.", GetPlayerNameEx(playerid));
	SendClientMessageEx(pl, COLOR_LIGHTBLUE, string);
	return 1;
}
CMD:takeadvisor(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pHelper] >= 3 || PlayerInfo[playerid][pPR] > 0)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /takeadvisor [player]");

		if(IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[playerid][pHelper] == 3 && PlayerInfo[giveplayerid][pHelper] != 1) {
		        SendClientMessageEx(playerid, COLOR_GREY, "You can only remove helpers.");
		        return 1;
		    }
			if(PlayerInfo[giveplayerid][pHelper] != 0)
			{
				if(GetPVarType(playerid, "AdvisorDuty"))
				{
					DeletePVar(playerid, "AdvisorDuty");
					Advisors -= 1;
				}
				PlayerInfo[giveplayerid][pHelper] = 0;
				format(string, sizeof(string), "%s has kicked you out from the Junior Helper team.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "You took %s's Junior Helper rank.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			}

		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:ahelp(playerid, params[]) {
	return cmd_ah(playerid, params);
}

CMD:ah(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
		if(PlayerInfo[playerid][pSMod] > 0) SendClientMessageEx(playerid, COLOR_GRAD1, "*** {FFFF00}SENIOR SERVER MODERATOR{B4B5B7} *** /jail /kick /staff /togstaff /changename /dmwatch /dmalert");
		else SendClientMessageEx(playerid, COLOR_GRAD1, "*** {FFFF00}SERVER MODERATOR{B4B5B7} *** /mjail /kick /staff /togstaff /dmwatch /dmalert");
	}
	/*
	if (PlayerInfo[playerid][pWatchdog] == 1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** WATCH DOG *** /dmwatch /dmalert");
	}
	*/
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** REPORTS *** /reports /ar /tr /sta /nao /st /post /dmr *** MOVEMENT *** /up /dn /fd /bk /lt /rt /fly");
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /kick /ban /prison /freeze /unfreeze /slap /warn /admins /spec /levelones");
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /sendto /gotopveh /gotocar /jetpack /god /check /anetstats /ipcheck /ip /nrn /listguns");
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /setvw /setint /vehname /gethere /gotoid /hospital /goto /revive /bigears /skick /damagecheck");
		SendClientMessageEx(playerid, COLOR_GRAD2,"*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /requestevent /watch /dmwatchlist /mark(2) /n(un)mute /ad(un)mute /checkinv /lastshot");
	}
	if (PlayerInfo[playerid][pAdmin] >= 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD3,"*** {00FF00}GENERAL ADMIN{CBCCCE} *** /noooc /nonewbie /fine /pfine /takeadminweapons /prisonaccount /entercar /getcar");
		SendClientMessageEx(playerid, COLOR_GRAD3,"*** {00FF00}GENERAL ADMIN{CBCCCE} *** /mole /setskin /countdown /release /forcedeath /rto(reset) /hhc");
		SendClientMessageEx(playerid, COLOR_GRAD3,"*** {00FF00}GENERAL ADMIN{CBCCCE} *** /gotoco /leaders /wepreset /owarn /ofine /okills /respawncar(s)");
		SendClientMessageEx(playerid, COLOR_GRAD3,"*** {00FF00}GENERAL ADMIN{CBCCCE} *** /reloadpvehicles /apark /aimpound /dmrmute /dmrlookup /dmtokens /sendtoid /dm");
	}
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /asellbiz /fixvehall /givenos /blowup /setname /savechars /dmstrikereset /cnn /respawnvipcars");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /veh /fixveh /sethp /setarmor /givegun /givemoney /setmoney /setstat /setfightstyle /switchgroup /switchfam");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /fcreate /fdelete /adivorce /destroycar /destroycars /eventhelp /hopdong /sprison /banip /unbanip");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /groupban /deletehit /setinsurance /cmotd /givelicense /adestroyplant /tl(edit/text/status/next)");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /gotolabel /createpvehicle /destroypvehicle /vto /vtoreset /admingatepw /gotogate /dedit /fedit");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /hnext /dmpnext /g(status/near/next/edit) /(goto/goin)door /(goto/goin)house /(create/delete/goto)point");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /hedit /dd(edit/next/name/pass) /dmpedit /dmpnear /gotomapicon /gangwarn /gangunban /setcapping /banaccount");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /removepvehicle /rcabuse /createmailbox /adestroymailbox /b(edit/next/name) /adestroycrate /gotocrate");
		SendClientMessageEx(playerid, COLOR_GRAD4,"*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /(create/edit/delete)gaspump /(goto/goin)biz /dvcreate /dvstatus /dvrespawn /dvedit /dveditslot /dvplate /checkvouchers");
	}
	if (PlayerInfo[playerid][pAdmin] >= 5)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {FF0000}HEAD ADMIN{E3E3E3} *** /ha /setweather /makeleader /pedit /groupunban /groupcsfunban /giftall /removemoderator /makewatchdog");
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {FF0000}HEAD ADMIN{E3E3E3} *** /permaban /setcolor /payday /clearallreports /eventreset /amotd /motd /vipmotd /givetoken /giftgvip");
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {FF0000}HEAD ADMIN{E3E3E3} *** /vmute /vsuspend /gifts /rcreset /dvrespawnall /setarmorall /removewatchdog /dynamicgift /asellhouse");
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {FF0000}HEAD ADMIN{E3E3E3} *** /togfireworks /togshopnotices");
	}
	if (PlayerInfo[playerid][pAdmin] >= 6)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {298EFF}LEAD HEAD ADMIN{E3E3E3} *** /setsec /suspend /osuspend /ounsuspend /osetrmutes /rmute /clearall /specreset /pausespec /random /vrandom");
		SendClientMessageEx(playerid, COLOR_GRAD5,"*** {298EFF}LEAD HEAD ADMIN{E3E3E3} *** /giftreset /searchvipm /vipgifts /buddyinvite /rewardplay /doublexp");
	}
	if (PlayerInfo[playerid][pAdmin] >= 7)
	{
		SendClientMessageEx(playerid, COLOR_GRAD6,"*** {298EFF}EXECUTIVE ADMIN{F0F0F0} *** /togspec /togtp /kickres /givecredits /setcredits /settotalcredits /setstpay /resetstpay /pmotd");
		SendClientMessageEx(playerid, COLOR_GRAD6,"*** {298EFF}EXECUTIVE ADMIN{F0F0F0} *** /setcode /togdynamicgift /dgedit /viewgiftbox");
	}
	if (PlayerInfo[playerid][pHR] >= 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Human Resources *** /givesprize /setsec");
	}
	if (PlayerInfo[playerid][pHR] >= 3)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Human Resources *** /makemoderator /makeadmin /rmute /suspend /osuspend /ounsuspend /osetrmutes");
	}
	if(PlayerInfo[playerid][pAP] >= 2)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Admin Personnel *** /makemoderator /makeadmin /rmute /suspend /osuspend /ounsuspend /osetrmutes");
	}
	if (PlayerInfo[playerid][pBanAppealer] >= 1) SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Ban Appealer *** /unbanip /unban");
	if (PlayerInfo[playerid][pUndercover] >= 1) SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Spec Ops *** /setmystat /setmyname /setmyhp /setmyarmour /sprison /sdm /swarn");
	if (PlayerInfo[playerid][pGangModerator] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Gang Mod *** /switchfam /fedit /gangwarn /gangunban /fcreate /fdelete /twmenu /dvrespawn");
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Gang Mod *** /gtedit /gtstatus /gtnear /tagperm /tagedit");
	}
	if (PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Shop Tech *** /orders /adjustoid /shop(car(del)/house/tokens/exp/plate/laser/vest/firework/viptokens/boombox/object) /gedit /gnear");
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Shop Tech *** /g(status/next) /hnext /goto(gate/door) /goinhouse /setvip /searchvipm /newgvip /renewgvip" );
		SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Shop Tech *** /shopbusiness /shopbusinessname /brenewal");
	}
	if (PlayerInfo[playerid][pShopTech] >= 3) SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - DoCR *** /pmotd");
	if (PlayerInfo[playerid][pFactionModerator] >= 1) SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Faction Mod *** /switchgroup /groupcsfban /groupban /groupkick /leaders /dvrespawn");
	if (PlayerInfo[playerid][pPR] >= 1) SendClientMessageEx(playerid, COLOR_GRAD5, "*** Special - Public Relations *** /catokens /cmotd /makeadvisor /makehelper /takeadvisor");
	if (PlayerInfo[playerid][pAdmin] >= 1) SendClientMessageEx(playerid, COLOR_GREEN,"_______________________________________");
	return 1;
}
CMD:givelicense(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayerid, type;
		if(sscanf(params, "ud", giveplayerid, type))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givelicense [player] [type]");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Types: 1 = Lai xe, 2 = Lai thuyen, 3 = Lai may bay, 4 = Taxi.");
			return 1;
		}

		if(!IsPlayerConnected(giveplayerid))
		{
			SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi choi khong hop le.");
			return 1;
		}

		switch(type)
		{
		case 1:
			{
				if(PlayerInfo[giveplayerid][pCarLic] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi nay da co giay phep lai xe.");
					return 1;
				}
				format(string, sizeof(string), "You have given a driver's license to %s.",GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s da dua cho ban a driver's license.",GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s has given a driver's license to %s.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid));
				Log("logs/licenses.log", string);
				PlayerInfo[giveplayerid][pCarLic] = 1;
				return 1;
			}
		case 2:
			{
				if(PlayerInfo[giveplayerid][pBoatLic] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi nay da co giay phep lai thuyen.");
					return 1;
				}
				format(string, sizeof(string), "You have given a boating license to %s.",GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s da dua cho ban a boating license.",GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s has given a boating license to %s.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid));
				Log("logs/licenses.log", string);
				PlayerInfo[giveplayerid][pBoatLic] = 1;
				return 1;
			}
		case 3:
			{
				if(PlayerInfo[giveplayerid][pFlyLic] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi nay da co giay phep lai may bay.");
					return 1;
				}
				format(string, sizeof(string), "You have given a pilot license to %s.",GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s da dua cho ban a pilot license.",GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s has given a pilot license to %s.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid));
				Log("logs/licenses.log", string);
				PlayerInfo[giveplayerid][pFlyLic] = 1;
				return 1;
			}
		case 4:
			{
				if(PlayerInfo[giveplayerid][pTaxiLicense] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "Nguoi nay da co giay phep lai taxi.");
					return 1;
				}
				format(string, sizeof(string), "You have given a taxi license to %s.",GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s da dua cho ban mot giay phep lai xe.",GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_WHITE, string);
				format(string, sizeof(string), "Administrator %s da dua giay phep lai xe taxi cho %s.",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid));
				Log("logs/licenses.log", string);
				PlayerInfo[giveplayerid][pTaxiLicense] = 1;
				return 1;
			}
		default:
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Invalid license type! /givelicense [player] [type]");
				SendClientMessageEx(playerid, COLOR_GRAD2, "Types: 1 = Lai xe, 2 = Lai thuyen, 3 = Lai may bay, 4 = Taxi.");
			}
		}
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the duoc phep su dung lenh nay.");
	return 1;
}
CMD:fcreate(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 5 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new string[128], family, giveplayerid;
		if(sscanf(params, "du", family, giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /fcreate [FamilyNr] [player]");
		if(family < 1 || family > MAX_FAMILY-1) {
			format(string, sizeof(string), "   FamilyNr can't be below 1 or above %i!", MAX_FAMILY-1);
		 	SendClientMessageEx(playerid, COLOR_GREY, string);
	 	    return 1;
	   }

		if(IsPlayerConnected(giveplayerid))
		{
			if(FamilyInfo[family][FamilyTaken] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "   That Family Slot is already taken!" );
				return 1;
			}

			format(string, sizeof(string), "* You've made %s the Leader of Family Slot %d.",GetPlayerNameEx(giveplayerid),family);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* Admin %s has made you a Family Leader.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);

			new sendername[MAX_PLAYER_NAME];
			GetPlayerName(giveplayerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s",sendername);
			strmid(FamilyInfo[family][FamilyLeader], string, 0, strlen(string), 24);
			FamilyInfo[family][FamilyMembers] ++;
			FamilyInfo[family][FamilyTaken] = 1;
			PlayerInfo[giveplayerid][pFMember] = family;
			PlayerInfo[giveplayerid][pRank] = 6;
			PlayerInfo[giveplayerid][pDivision] = 0;
			SaveFamily(family);

		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
			return 1;
		}
	}
	return 1;
}

CMD:fdelete(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 3 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new family, string[128];
		if(sscanf(params, "d", family)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /fdelete [familyid]");

		if(family < 1 || family > MAX_FAMILY-1) {
	 		format(string,sizeof(string), "   Family Slot can't be below 1 or above %i!", MAX_FAMILY-1);
			SendClientMessageEx(playerid, COLOR_GREY, string);
		 	return 1;
	 	}
		if(FamilyInfo[family][FamilyTaken] != 1)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   That Family Slot isn't taken!");
			return 1;
		}
		ClearFamily(family);
		SaveFamily(family);
	}
	return 1;
}
CMD:adivorce(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 3)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /adivorce [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			ClearMarriage(giveplayerid);
			format(string, sizeof(string), "* You've admin divorced %s.", GetPlayerNameEx(giveplayerid));
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "* You have been admin divorced by an admin.", GetPlayerNameEx(playerid));
			SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
			DivorceOffer[giveplayerid] = playerid;
			return 1;

		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
			return 1;
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
}
CMD:settaxmoney(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the duoc phep su dung lenh nay.");
		return 1;
	}

	new string[128], country, amount;
	if(sscanf(params, "dd", country, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /settaxmoney [LS(1)/SF(2)] [amount]");
		format(string, sizeof(string), "* CURRENT SA VAULT BALANCE: $%s.", number_format(Tax));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "* CURRENT TR VAULT BALANCE: $%s.", number_format(TRTax));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		return 1;
	}
	switch(country)
	{
	    case 1:
	    {
			Tax = amount;
			format( string, sizeof( string ), "You have set the tax money amount to $%s.", number_format(amount));
			SendClientMessageEx( playerid, COLOR_WHITE, string );
	    }
	    case 2:
	    {
			TRTax = amount;
			format( string, sizeof( string ), "You have set the tax money amount to $%s.", number_format(amount));
			SendClientMessageEx( playerid, COLOR_WHITE, string );
	    }
	}
	return 1;
}

CMD:checktax(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pLeader] != INVALID_GROUP_ID && arrGroupData[PlayerInfo[playerid][pMember]][g_iGroupType] != 5)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "You're not a government official.");
		return 1;
	}
	if(arrGroupData[PlayerInfo[playerid][pLeader]][g_iAllegiance] == 1)
	{
		format(string, sizeof(string), "* CURRENT SA VAULT BALANCE: $%s.", number_format(Tax));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	else if(arrGroupData[PlayerInfo[playerid][pLeader]][g_iAllegiance] == 2)
	{
		format(string, sizeof(string), "* CURRENT TR VAULT BALANCE: $%s.", number_format(TRTax));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	}
	return 1;
}

CMD:sta(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /sta [reportid]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong duoi 0 va tren 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong ton tai!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi choi da ngat ket noi !");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the tu choi bao cao nay, vui long su dung /ar de duyet.");
		}
		if(Advisors < 1)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Hien tai khong co Junior Helpers nao On Duty, vui long thu lai sau!");
			return 1;
		}

		format(string, sizeof(string), "[MAYCHU] %s da chuyen %s (ID: %i) bao cao RID: %i) cho doi ngu Junior Helpers.", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]),Reports[reportid][ReportFrom],reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		if(PlayerInfo[playerid][pAdmin] == 1)
		{
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Admin da xem xet bao cao cua ban va chuyen bao cao cho Junior Helpers.");
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Mot co van tro giup se toi giup ban.");
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Nguoi choi moi khuyen khich su dung nhung cau hoi tren kenh hoi-dap newbie(/newb)");
			SetPVarInt( Reports[reportid][ReportFrom], "COMMUNITY_ADVISOR_REQUEST", 1 );
			format(string, sizeof(string), "Admin da chuyen mot bao cao cho ban. nguoi %s (ID: %d) noi: %s", GetPlayerNameEx(Reports[reportid][ReportFrom]), Reports[reportid][ReportFrom], Reports[reportid][Report]);
			SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, string);
			SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, "Vui long long nhap /chapnhantrogiup de dich chuyen toi nguoi can giup do.");
		}
		else
		{
			format(string, sizeof(string), "%s da xem xet bao cao cua ban va chuyen bao cao cho Junior Helpers.", GetPlayerNameEx(playerid));
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Mot co van tro giup se toi giup ban.");
			SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Nguoi choi moi khuyen khich su dung nhung cau hoi tren kenh hoi-dap newbie(/newb).");
			SetPVarInt( Reports[reportid][ReportFrom], "COMMUNITY_ADVISOR_REQUEST", 1 );
			format(string, sizeof(string), "Admin %s da goi bao cao tren cho ban. nguoi %s (ID: %d) noi: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]), Reports[reportid][ReportFrom], Reports[reportid][Report]);
			SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, string);
			SendDutyAdvisorMessage(TEAM_AZTECAS_COLOR, "Xin vui long nhap /chapnhantrogiup de dchuyen toi nguoi can giup do..");
		}

		PlayerInfo[playerid][pAcceptReport]++;
		ReportCount[playerid]++;
		ReportHourCount[playerid]++;
		Reports[reportid][BeingUsed] = 0;
		DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");		Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][CheckingReport] = INVALID_PLAYER_ID;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}

CMD:ar(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /ar [ID bao cao]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao phai tu 0 den 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong ton tai!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi choi bao cao da mat ket noi !");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			new advert[128];
			GetPVarString(Reports[reportid][ReportFrom], "PriorityAdText", advert, 128);

			format(string, sizeof(string), "Quang cao: %s - lien lac %s (%i)", advert, GetPlayerNameEx(Reports[reportid][ReportFrom]), PlayerInfo[Reports[reportid][ReportFrom]][pPnumber]);
			SetPVarString(playerid, "PriorityAdText", string);
			SetPVarInt(playerid, "ReporterID", Reports[reportid][ReportFrom]);
			ShowPlayerDialog(playerid, DIALOG_CONFIRMADP, DIALOG_STYLE_MSGBOX, "Chap nhan quang cao", advert, "Phe duyet", "Tu choi");

			format(string, sizeof(string), "[MAYCHU] %s da chap nhan bao cao cua %s (ID: %i, RID: %i).", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]),Reports[reportid][ReportFrom],reportid);
			ABroadCast(COLOR_ORANGE, string, 2);
			PlayerInfo[playerid][pAcceptReport]++;
			ReportCount[playerid]++;
			ReportHourCount[playerid]++;
			Reports[reportid][BeingUsed] = 0;
			Reports[reportid][TimeToExpire] = 0;
			strmid(Reports[reportid][Report], "None", 0, 4, 4);
			DeletePVar(Reports[reportid][ReportFrom], "HasReport");
			return true;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingNameChange") == 1) {
		    new newname[MAX_PLAYER_NAME];
			GetPVarString(Reports[reportid][ReportFrom], "NewNameRequest", newname, MAX_PLAYER_NAME);

			format(string, sizeof(string), "{00BFFF}Ten cu: {FFFFFF}%s\n\n{00BFFF}Ten moi: {FFFFFF}%s\n\n{00BFFF}Gia tien: {FFFFFF}$%d", GetPlayerNameExt(Reports[reportid][ReportFrom]), newname, GetPVarInt(Reports[reportid][ReportFrom], "NameChangeCost"));
			ShowPlayerDialog(playerid, DIALOG_REPORTNAME,DIALOG_STYLE_MSGBOX,"{00BFFF}Duyet doi ten",string,"Phe duyet","Tu choi");

			format(string, sizeof(string), "[MAYCHU] %s da chap nhan bao cao cua %s (ID: %i, RID: %i).", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]),Reports[reportid][ReportFrom],reportid);
			ABroadCast(COLOR_ORANGE, string, 2);
			PlayerInfo[playerid][pAcceptReport]++;
			ReportCount[playerid]++;
			ReportHourCount[playerid]++;
			Reports[reportid][BeingUsed] = 0;
			Reports[reportid][TimeToExpire] = 0;
			strmid(Reports[reportid][Report], "None", 0, 4, 4);
			DeletePVar(Reports[reportid][ReportFrom], "HasReport");

			SetPVarInt(playerid, "NameChange",Reports[reportid][ReportFrom]);
		    return 1;
		}
		/*if(GetPVarInt(Reports[reportid][ReportFrom], "RFLNameRequest") == 1) {
		    new newname[MAX_PLAYER_NAME];
			new gid = Reports[reportid][ReportFrom];
			GetPVarString(Reports[reportid][ReportFrom], "NewRFLName", newname, MAX_PLAYER_NAME);

			format(string, sizeof(string), "{00BFFF}Ten Team cu: {FFFFFF}%s\n\n{00BFFF}Ten Team moi: {FFFFFF}%s", RFMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAnFLname], newname);
			ShowPlayerDialog(playerid, DIALOG_REPORTTEAMNAME,DIALOG_STYLE_MSGBOX,"{00BFFF}Duyet doi ten team",string,"Phe duyet","Tu choi");

			format(string, sizeof(string), "[MAYCHU] %s da chap nhan cac bao cao cua %s (ID: %i, RID: %i).", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]),Reports[reportid][ReportFrom],reportid);
			ABroadCast(COLOR_ORANGE, string, 2);
			PlayerInfo[playerid][pAcceptReport]++;
			ReportCount[playerid]++;
			ReportHourCount[playerid]++;
			Reports[reportid][BeingUsed] = 0;
			Reports[reportid][TimeToExpire] = 0;
			strmid(Reports[reportid][Report], "None", 0, 4, 4);
			DeletePVar(Reports[reportid][ReportFrom], "HasReport");

			SetPVarInt(playerid, "RFLNameChange",Reports[reportid][ReportFrom]);
		    return 1;
		}*/
		format(string, sizeof(string), "[MAYCHU] %s da chap nhan cac bao cao cua %s (ID: %i, RID: %i).", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]),Reports[reportid][ReportFrom],reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		AddReportToken(playerid); // Report Tokens
		format(string, sizeof(string), "%s da chap nhan bao cao cua ban, vui long su dung {00BFFF}/traloi{FFFFFF} de noi chuyen voi admin duyet bao cao.", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		new giveplayerid;
		if(GetPVarType(Reports[reportid][ReportFrom], "_rAutoM")) {
			switch(GetPVarInt(Reports[reportid][ReportFrom], "_rAutoM")) {
				case 1: { // Ad Unmute
					ShowAdMuteFine(Reports[reportid][ReportFrom]);
					format(string, sizeof(string), "Ban dong y cho %s unmute tren kenh /ads.", GetPlayerNameEx(Reports[reportid][ReportFrom]));
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				case 2: { // NUnmute
					ShowNMuteFine(Reports[reportid][ReportFrom]);
					format(string, sizeof(string), "Ban dong y cho %s unmute tren kenh /newb.", GetPlayerNameEx(Reports[reportid][ReportFrom]));
					SendClientMessageEx(playerid, COLOR_LIGHTRED, string);
				}
				case 3: { // NRN
					giveplayerid = GetPVarInt(Reports[reportid][ReportFrom], "_rRepID");
					if(IsPlayerConnected(giveplayerid)) {
						if (PlayerInfo[giveplayerid][pAdmin] < 2) {
							format(string, sizeof(string), "[MAYCHU] %s da yeu cau %s doi ten mien phi, ten bi coi la NON-RP.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
							foreach(new i: Player) {
								if(PlayerInfo[i][pSMod] == 1) {
									SendClientMessageEx(i, COLOR_YELLOW, string);
								}
							}
							ABroadCast( COLOR_YELLOW, string, 2);
							ShowPlayerDialog(giveplayerid, DIALOG_NAMECHANGE2, DIALOG_STYLE_INPUT, "Mien phi thay doi ten","Day la mot may chu roleplay noi ban phai co mot ten o dinh dang nay: HoDem_Ten.\nVi du: Trong_Dat hoac Long_Trieu\n\nAdmin da cung cap cho ban thay doi ten cua ban theo dinh dang chinh xac mien phi. Vui long nhap ten ban muon vao ben duoi.\n\nLuu y: Neu ban nhan huy bo, ban se duoc kick khoi may chu.", "Thay doi", "Huy bo" );
						}
						else
						{
							SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the yeu cau cho mot admin.");
						}
					}
				}
				case 4: { // RK /kills
					giveplayerid = GetPVarInt(Reports[reportid][ReportFrom], "_rRepID");
					if(IsPlayerConnected(giveplayerid)) {
						SendClientMessageEx(playerid, COLOR_GREEN, "________________________________________________");
						format(string, sizeof(string), "<< Last 10 Kills/Deaths cua %s >>", GetPlayerNameEx(giveplayerid));
						SendClientMessageEx(playerid, COLOR_YELLOW, string);
						GetLatestKills(playerid, giveplayerid);
					}
				}
				case 5: { // Auto Spectate
					giveplayerid = GetPVarInt(Reports[reportid][ReportFrom], "_rRepID");
					if(IsPlayerConnected(giveplayerid)) {
						SpectatePlayer(playerid, giveplayerid);
					}
				}
				case 6: { // Bug Player
					giveplayerid = GetPVarInt(Reports[reportid][ReportFrom], "_rRepID");
					if(IsPlayerConnected(giveplayerid)) {
						SetPVarInt(playerid, "BigEar", 6);
						SetPVarInt(playerid, "BigEarPlayer", giveplayerid);
						rBigEarT[playerid] = 30;
						format(string, sizeof(string), "Ban se thay tat ca cac thu tu %s (ID: %d) trong 30 giay. su dung /bigears neu ban muon vo hieu hoa no.", GetPlayerNameEx(giveplayerid), giveplayerid);
						SendClientMessageEx(playerid, COLOR_WHITE, string);
					}
				}
			}
		}		PlayerInfo[playerid][pAcceptReport]++;
		ReportCount[playerid]++;
		ReportHourCount[playerid]++;
		Reports[reportid][ReplyTimerr] = SetTimerEx("ReplyTimer", 30000, 0, "d", reportid);
		Reports[reportid][CheckingReport] = playerid;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
		DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");	}
	return 1;
}

CMD:tr(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /tr [reportid]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao phai tu 0 den 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong hop le!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi bao cao da mat ket noi!");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the loai bo quang cao nay, ban phai /ar de xem xet no.");
		}
		format(string, sizeof(string), "[MAYCHU] %s da tu choi bao cao %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]));
		ABroadCast(COLOR_ORANGE, string, 2);
		format(string, sizeof(string), "%s da danh dau bao cao cua ban khong hop le, bao cao se duoc phe duyet. Vui long kiem tra /reporttips", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		PlayerInfo[playerid][pTrashReport]++;
        DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");		Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}

CMD:dmr(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid, giveplayerid;
		if(sscanf(params, "du", reportid, giveplayerid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /dmr [reportid] [DM'ers ID]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong duoi 0 va qua 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   ID bao cao khong hop le!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Nguoi bao cao da mat ket noi!");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the loai bo quang cao nay, ban phai /ar de xem xet no.");
		}
		format(string, sizeof(string), "[MAYCHU] %s da chuyen bao cao cua %s (RID: %d) voi he thong bao cao", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]), reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		format(string, sizeof(string), "%s has acknowledged your report about death matching.", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Trong tuong lai, xin vui long su dung /dmreport lenh cho tat ca cac bao cao lien quan den DM.");

		if(PlayerInfo[Reports[reportid][ReportFrom]][pAdmin] >= 2 || PlayerInfo[Reports[reportid][ReportFrom]][pSMod] == 1) format(string, sizeof(string), "INSERT INTO dm_watchdog (id,reporter,timestamp,superwatch) VALUES (%d,%d,%d,1)", GetPlayerSQLId(giveplayerid), GetPlayerSQLId(Reports[reportid][ReportFrom]), gettime());
		else format(string, sizeof(string), "INSERT INTO dm_watchdog (id,reporter,timestamp) VALUES (%d,%d,%d)", GetPlayerSQLId(giveplayerid), GetPlayerSQLId(Reports[reportid][ReportFrom]), gettime());
		mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "ii", SENDDATA_THREAD, Reports[reportid][ReportFrom]);

        DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");     	Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}

CMD:nao(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /nao [reportid]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoi 0 hoac hon 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoc su dung!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Cac phong vien da bi ngat' ket' noi !");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "You cannot trash/post this advertisement, you must accept it with /ar.");
		}
		format(string, sizeof(string), "[MAYCHU] %s has cleared report from %s (RID: %d) due to not having admin of sufficient authority online.", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]), reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		format(string, sizeof(string), "%s da xem set bao cao cua ban, Tuy nhien do' khong phai la mot quan tri vien hien truc tuyen voi day du tham quyen de xu ly yeu cau ban.", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		//SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "You can post a request on the forums for additional assistance (www.ng-gaming.net/forums). Our apologies for the inconvenience. ");
        DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");
		Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}

CMD:post(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /post [reportid]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoi 0 hoac hon 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoc su dung!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Cac phong vien da bi ngat' ket' noi' !");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co thung rac/gui quang cao nay, ban phai chap nhan voi no /ar.");
		}
		format(string, sizeof(string), "[MAYCHU] %s da thong bao cao tu %s (RID: %d) do do' can phai su ly tren dien dan", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]), reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		format(string, sizeof(string), "%s da xem xet bao cao cua ban va xac dinh bao cao nay can duoc xu ly tren cac dien dan (Nghia la khieu nai hoac yeu cau.)", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		//SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Please only report for items that are actively occuring in game. (www.ng-gaming.net/forums)");
        DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");		Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}

CMD:st(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], reportid;
		if(sscanf(params, "d", reportid)) return SendClientMessageEx(playerid, COLOR_WHITE,"SU DUNG: /st [reportid]");

		if(reportid < 0 || reportid > 999) { SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoi' 0 hoac cao hon 999!"); return 1; }
		if(Reports[reportid][BeingUsed] == 0)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Bao cao ID khong duoc su dung!");
			return 1;
		}
		if(!IsPlayerConnected(Reports[reportid][ReportFrom]))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "   Cac phong vien da bi ngat' ket noi !");
			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
			Reports[reportid][BeingUsed] = 0;
			return 1;
		}
		if(GetPVarInt(Reports[reportid][ReportFrom], "RequestingAdP") == 1)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong co thung rac/gui quan cao nay, ban phai chap nhan voi no /ar.");
		}
		format(string, sizeof(string), "[MAYCHU] %s da thong bao cao tu %s (RID: %d) do do' can phai duoc xu ly thong qua /shoporder", GetPlayerNameEx(playerid), GetPlayerNameEx(Reports[reportid][ReportFrom]), reportid);
		ABroadCast(COLOR_ORANGE, string, 2);
		format(string, sizeof(string), "%s da xem xet bao cao cua ban va xac dinh no can phai duoc xu ly boi mot cua hang cong nghe.", GetPlayerNameEx(playerid));
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, string);
		SendClientMessageEx(Reports[reportid][ReportFrom], COLOR_WHITE, "Vui long su dung /shoporder de co the duoc don hang cua ban duoc xu ly boi mot cua hang cong n ghe.");
        DeletePVar(Reports[reportid][ReportFrom], "HasReport");
		DeletePVar(Reports[reportid][ReportFrom], "_rAutoM");
		DeletePVar(Reports[reportid][ReportFrom], "_rRepID");			Reports[reportid][ReportFrom] = INVALID_PLAYER_ID;
		Reports[reportid][BeingUsed] = 0;
		Reports[reportid][TimeToExpire] = 0;
		strmid(Reports[reportid][Report], "None", 0, 4, 4);
	}
	return 1;
}
CMD:shopstats(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	mysql_function_query(MainPipeline, "SELECT `id`, `Month` FROM `sales`", true, "CheckSales", "i", playerid);
	return 1;
}
CMD:togshopnotices(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		if(ShopReminder == 0)
		{
			ShopReminder = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da kich hoat cua hang thong bao.");
		}
		else
		{
			ShopReminder = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da vo hieu hoa cua hang thong bao.");
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	return 1;
}
CMD:reloadstats(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

    mysql_function_query(MainPipeline, "SELECT * FROM `sales` WHERE `Month` > NOW() - INTERVAL 1 MONTH", true, "OnQueryFinish", "iii", LOADSALEDATA_THREAD, INVALID_PLAYER_ID, -1);
    SendClientMessageEx(playerid, COLOR_WHITE, "Tai lai so lieu thong ke ban.");
	return 1;
}
CMD:closesellcredits(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	if(SellClosed == 0)
	{
	    SellClosed = 1;
	    SendClientMessageEx(playerid, COLOR_WHITE, "The shop is now closed.");
	}
	else
	{
	    SellClosed = 0;
	    SendClientMessageEx(playerid, COLOR_WHITE, "The shop is now opened.");
	}
	return 1;
}

CMD:closeshop(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	if(ShopClosed == 0)
	{
	    ShopClosed = 1;
	    SendClientMessageEx(playerid, COLOR_WHITE, "The shop is now closed.");
	}
	else
	{
	    ShopClosed = 0;
	    SendClientMessageEx(playerid, COLOR_WHITE, "The shop is now opened.");
	}
	g_mysql_SaveMOTD();
	return 1;
}

CMD:editshop(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

    if (isnull(params)) {
		SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /editshop <code>");
		return 1;
	}

	if (strcmp(params, SecurityCode) == 0)
	{
	    ShowPlayerDialog(playerid, DIALOG_EDITSHOPMENU, DIALOG_STYLE_LIST, "Edit Shop", "Edit Shop Prices\nEdit Business Shop", "Chon", "Thoat");
	    if(GetPVarType(playerid, "CodeAttempts")) DeletePVar(playerid, "CodeAttempts");
	}
	else
	{
	    if(GetPVarInt(playerid, "CodeAttempts") != 3) {
	        SendClientMessageEx(playerid, COLOR_GREY, "Mat khau nhap khong hop le.");
			SetPVarInt(playerid, "CodeAttempts", GetPVarInt(playerid, "CodeAttempts")+1);
	    }
	    else
	    {
	        new string[128];
	        format(string, sizeof(string), "[MAYCHU] %s has been auto-banned, reason: To many failed attempts.", GetPlayerNameEx(playerid)), ABroadCast(COLOR_YELLOW,string,2);
			PlayerInfo[playerid][pBanned] = 1;
			SystemBan(playerid, "[System] (To many failed attempts)");
			Kick(playerid);
	    }
	}
	return 1;
}
CMD:chargeplayer(playerid, params[])
{
	new string[128], giveplayerid, amount, reason[64];
	if(sscanf(params, "uds[64]", giveplayerid, amount, reason)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /chargeplayer [player] [amount] [reason]");

	if (PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pShopTech] == 2)
	{
		if(IsPlayerConnected(giveplayerid))
		{
			if (amount < 1)
				return SendClientMessageEx(playerid, COLOR_GREY, "So tien phai lon hon 0");

			if(PlayerInfo[giveplayerid][pCredits] < amount)
			    return SendClientMessageEx(playerid, COLOR_GREY, "May nghe nhac ma khong co nhieu credits.");

			format(string, sizeof(string), "Ban da cung cap %s mot phu trach %s credits cho %s.",  GetPlayerNameEx(giveplayerid), number_format(amount), reason);
			SendClientMessageEx(playerid, COLOR_CYAN, string);

			SetPVarInt(giveplayerid, "FineAmount", amount), SetPVarInt(giveplayerid, "FineBy", playerid), SetPVarString(giveplayerid, "FineReason", reason);
			format(string, sizeof(string), "Admin: %s\nReason: %s\nCredits Co san: %s\nSo tien phat: %s", GetPlayerNameEx(playerid), reason, number_format(PlayerInfo[giveplayerid][pCredits]), number_format(amount));
			ShowPlayerDialog(giveplayerid, DIALOG_CHARGEPLAYER, DIALOG_STYLE_MSGBOX, "Credit Fine", string, "Chap nhan", "Tu choi");
			return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong phai la mot quan tri vien cao cap.");
	}
	return 1;
}
CMD:givecredits(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	new szMessage[128], Player, Amount;

	if(sscanf(params, "ud", Player, Amount))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /givecredits [Player] [Amount]");

	if(!IsPlayerConnected(Player))
	    return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");

	PlayerInfo[Player][pCredits] += Amount;

	format(szMessage, sizeof(szMessage), "UPDATE `accounts` SET `Credits`=%d WHERE `id` = %d", PlayerInfo[Player][pCredits], GetPlayerSQLId(Player));
	mysql_function_query(MainPipeline, szMessage, false, "OnQueryFinish", "ii", SENDDATA_THREAD, Player);
	print(szMessage);

	format(szMessage, sizeof(szMessage), "[SETCREDITS] [So tien: %d] [Nguoi su dung: %s(%i)] [IP: %s] [Credits: %s] [Admin: %s] [IP: %s]",Amount,GetPlayerNameEx(Player), GetPlayerSQLId(Player), GetPlayerIpEx(Player), number_format(PlayerInfo[Player][pCredits]), GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
	Log("logs/credits.log", szMessage), print(szMessage);

	format(szMessage, sizeof(szMessage), "Ban da cho %s %s credits.", GetPlayerNameEx(Player), number_format(Amount));
	SendClientMessageEx(playerid, COLOR_CYAN, szMessage);
	return 1;
}
CMD:setcredits(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	new szMessage[128], Player, Amount;

	if(sscanf(params, "ud", Player, Amount))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setcredits [Player] [Amount]");

	if(!IsPlayerConnected(Player))
	    return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");

	PlayerInfo[Player][pCredits] = Amount;

	format(szMessage, sizeof(szMessage), "UPDATE `accounts` SET `Credits`=%d WHERE `id` = %d", PlayerInfo[Player][pCredits], GetPlayerSQLId(Player));
	mysql_function_query(MainPipeline, szMessage, false, "OnQueryFinish", "ii", SENDDATA_THREAD, Player);
	print(szMessage);

	format(szMessage, sizeof(szMessage), "[SETCREDITS] [So tien: %d] [Nguoi su dung: %s(%i)] [IP: %s] [Credits: %s] [Admin: %s] [IP: %s]",Amount,GetPlayerNameEx(Player), GetPlayerSQLId(Player), GetPlayerIpEx(Player), number_format(PlayerInfo[Player][pCredits]), GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
	Log("logs/credits.log", szMessage), print(szMessage);

	format(szMessage, sizeof(szMessage), "Ban da cho %s's credits thanh %s.", GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pCredits]));
	SendClientMessageEx(playerid, COLOR_CYAN, szMessage);
	return 1;
}

CMD:settotalcredits(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7 && PlayerInfo[playerid][pShopTech] != 3)
	    return 0;

	new szMessage[128], Player, Amount;

	if(sscanf(params, "ud", Player, Amount))
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /settotalcredits [Player] [Amount]");

	if(!IsPlayerConnected(Player))
	    return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");

	PlayerInfo[Player][pTotalCredits] = Amount;

    format(szMessage, sizeof(szMessage), "UPDATE `accounts` SET `TotalCredits`=%d WHERE `id` = %d", PlayerInfo[Player][pTotalCredits], GetPlayerSQLId(Player));
	mysql_function_query(MainPipeline, szMessage, false, "OnQueryFinish", "ii", SENDDATA_THREAD, Player);

	format(szMessage, sizeof(szMessage), "[SETTOTALCREDITS][Amount: %d] [User: %s(%i)] [IP: %s] [Admin: %s] [IP: %s]",Amount, GetPlayerNameEx(Player), GetPlayerSQLId(Player), GetPlayerIpEx(Player), GetPlayerNameEx(playerid), GetPlayerIpEx(playerid));
	Log("logs/credits.log", szMessage), print(szMessage);

	format(szMessage, sizeof(szMessage), "Ban da cho %s's thong so credits thanh %s.", GetPlayerNameEx(Player), number_format(PlayerInfo[Player][pTotalCredits]));
	SendClientMessageEx(playerid, COLOR_CYAN, szMessage);
	return 1;
}
CMD:nrn(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pSMod] == 1)
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /nrn [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if (PlayerInfo[giveplayerid][pAdmin] >= 2)
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "You can not use that command on admins!");
				return 1;
			}
			format(string, sizeof(string), "[MAYCHU] %s has offered %s a free name change because their name is non-RP.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
			foreach(new i: Player)
			{
				if(PlayerInfo[i][pSMod] == 1)
				{
					SendClientMessageEx(i, COLOR_YELLOW, string);
				}
			}
			ABroadCast( COLOR_YELLOW, string, 2);
			ShowPlayerDialog(giveplayerid, DIALOG_NAMECHANGE2, DIALOG_STYLE_INPUT, "Doi ten mien phi","Mot admin cam thay ten cua ban khong duoc nhap vai cho lam\ncho nen ban hay dat cho minh mot ten moi\nVD Nguyen_Duy Thanh_Duy\nneu ban tu choi se bi kick khoi may chu", "Change", "Cancel" );
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}
CMD:arrestedit(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], choice[32], id, amount;
		if(sscanf(params, "s[32]dD", choice, id, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /arrestedit [name] [id] [amount]");
			SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Position, Type, Delete");
			return 1;
		}

		if(id >= MAX_ARRESTPOINTS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "Diem bat giu ID khong hop le!");
			return 1;
		}

		if(strcmp(choice, "position", true) == 0)
		{
			GetPlayerPos(playerid, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]);
			ArrestPoints[id][arrestInt] = GetPlayerInterior(playerid);
			ArrestPoints[id][arrestVW] = GetPlayerVirtualWorld(playerid);
			format(string, sizeof(string), "Ban da thay doi dia diem bat giu Arrest #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			switch(ArrestPoints[id][arrestType])
			{
				case 0:
				{
					format(string, sizeof(string), "/batgiam\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 2:
				{
					format(string, sizeof(string), "/docbatgiam\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 3:
				{
					format(string, sizeof(string), "/warrantarrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 4:
				{
					format(string, sizeof(string), "/jarrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
			}
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s da thay doi vi tri bat giu  ID %d's .", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "type", true) == 0)
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			ArrestPoints[id][arrestType] = amount;
			format(string, sizeof(string), "You have changed the type for Arrest Point #%d to %d.", id, amount);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			switch(ArrestPoints[id][arrestType])
			{
				case 0:
				{
					format(string, sizeof(string), "/arrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 2:
				{
					format(string, sizeof(string), "/docarrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 3:
				{
					format(string, sizeof(string), "/warrantarrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
				case 4:
				{
					format(string, sizeof(string), "/jarrest\nArrest Point #%d", id);
					ArrestPoints[id][arrestTextID] = CreateDynamic3DTextLabel(string, COLOR_DBLUE, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], -1);
					ArrestPoints[id][arrestPickupID] = CreateDynamicPickup(1247, 23, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW]);
				}
			}
			SaveArrestPoint(id);
			format(string, sizeof(string), "%s has changed the type on Arrest Point ID %d to %d.", GetPlayerNameEx(playerid), id, amount);
			Log("logs/arrestedit.log", string);
			return 1;
		}
		else if(strcmp(choice, "delete", true) == 0)
		{
			if(ArrestPoints[id][arrestPosX] == 0)
			{
				format(string, sizeof(string), "Arrest Point #%d does not exist.", id);
				SendClientMessageEx(playerid, COLOR_WHITE, string);
				return 1;
			}
			DestroyDynamic3DTextLabel(ArrestPoints[id][arrestTextID]);
			DestroyDynamicPickup(ArrestPoints[id][arrestPickupID]);
			ArrestPoints[id][arrestPosX] = 0.0;
			ArrestPoints[id][arrestPosY] = 0.0;
			ArrestPoints[id][arrestPosZ] = 0.0;
			ArrestPoints[id][arrestVW] = 0;
			ArrestPoints[id][arrestInt] = 0;
			ArrestPoints[id][arrestType] = 0;
			SaveArrestPoint(id);
			format(string, sizeof(string), "You have deleted Arrest Point #%d.", id);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s has deleted Arrest Point ID %d.", GetPlayerNameEx(playerid), id);
			Log("logs/arrestedit.log", string);
			return 1;
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:arreststatus(playerid, params[])
{
	new id;
	if(sscanf(params, "i", id))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /arreststatus [id]");
		return 1;
	}
	if (PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new string[128];
		format(string,sizeof(string),"|___________ Arrest Point Status (ID: %d) ___________|", id);
		SendClientMessageEx(playerid, COLOR_GREEN, string);
		format(string, sizeof(string), "[Position] X: %f | Y: %f | Z: %f | VW: %d | Int: %d | Type: %d", ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ], ArrestPoints[id][arrestVW], ArrestPoints[id][arrestInt], ArrestPoints[id][arrestType]);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:arrestnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Danh sach cac diem bat giu tiep theo...");
		for(new x = 0; x < MAX_ARRESTPOINTS; x++)
		{
			if(ArrestPoints[x][arrestPosX] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d hien co san de su dung.", x);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
		return 1;
	}
	return 1;
}

CMD:makeleader(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3 || PlayerInfo[playerid][pFactionModerator] == 1)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makeleader [player]");
		}
		else {
			if(IsPlayerConnected(giveplayerid))	{
   				SetPVarInt(playerid, "MakingLeader", giveplayerid);
   				SetPVarInt(playerid, "MakingLeaderSQL", GetPlayerSQLId(giveplayerid));
				Group_ListGroups(playerid, DIALOG_MAKELEADER);
			}
			else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");

	return 1;
}

CMD:gotoarrestpoint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotoarrestpoint [id]");

		SetPlayerPos(playerid, ArrestPoints[id][arrestPosX], ArrestPoints[id][arrestPosY], ArrestPoints[id][arrestPosZ]);
		SetPlayerInterior(playerid, ArrestPoints[id][arrestInt]);
		PlayerInfo[playerid][pInt] = ArrestPoints[id][arrestInt];
		SetPlayerVirtualWorld(playerid, ArrestPoints[id][arrestVW]);
		PlayerInfo[playerid][pVW] = ArrestPoints[id][arrestVW];
	}
	return 1;
}
CMD:editconcacbamay(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 8 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		Group_ListGroups(playerid);
	}
	return 1;
}

CMD:groupaddjurisdiction(playerid, params[]) {
	if(PlayerInfo[playerid][pAdmin] >= 5 || PlayerInfo[playerid][pFactionModerator] >= 1) Group_ListGroups(playerid, DIALOG_GROUP_JURISDICTION_ADD);
	return 1;
}
CMD:bedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay!");
		return 1;
	}

	new choice[32], businessid, amount, string[128];
	if(sscanf(params, "s[32]dD(0)", choice, businessid, amount))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /bedit [name] [businessid] [amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : Exterior, Interior, SupplyPoint, Price, Type, Inventory, InventoryCapacity, SafeBalance, Delete");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san : CustomInterior, CustomExterior, Months, GymEntryFee, GymType, VW, Grade");
		return 1;
	}

	if (!IsValidBusinessID(businessid))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Invalid business ID entered.");
		return 1;
	}
	if(!strcmp(choice, "grade", true))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the grade on this business!");
		format(string, sizeof(string), "%s has changed BusinessID %d's Grade to %i", GetPlayerNameEx(playerid), businessid, amount);
		Businesses[businessid][bGrade] = amount;
		Log("logs/bedit.log", string);
	}
    if(!strcmp(choice, "months", true))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the months left on this business!");
		format(string, sizeof(string), "%s has changed BusinessID %d's Months to %i", GetPlayerNameEx(playerid), businessid, amount);
		Businesses[businessid][bMonths] = 2592000*amount+gettime()+259200;
		Log("logs/bedit.log", string);
	}
	else if(!strcmp(choice, "vw", true))
	{
		Businesses[businessid][bVW] = amount;
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the VW!");
		format(string, sizeof(string), "%s has changed BusinessID %d's vw to %d", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}
	if(!strcmp(choice, "exterior", true))
	{
		GetPlayerPos(playerid, Businesses[businessid][bExtPos][0], Businesses[businessid][bExtPos][1], Businesses[businessid][bExtPos][2]);
		GetPlayerFacingAngle(playerid, Businesses[businessid][bExtPos][3]);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the exterior!");
		format(string, sizeof(string), "%s has changed BusinessID %d's Exterior to X:%f Y:%f Z:%f", GetPlayerNameEx(playerid), businessid, Businesses[businessid][bExtPos][0], Businesses[businessid][bExtPos][1],Businesses[businessid][bExtPos][2]);
		Log("logs/bedit.log", string);
	}
	else if(!strcmp(choice, "interior", true))
	{
		GetPlayerPos(playerid, Businesses[businessid][bIntPos][0], Businesses[businessid][bIntPos][1], Businesses[businessid][bIntPos][2]);
		GetPlayerFacingAngle(playerid, Businesses[businessid][bIntPos][3]);
		Businesses[businessid][bInt] = GetPlayerInterior(playerid);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have changed the interior!");
		format(string, sizeof(string), "%s has changed BusinessID %d's Interior to X:%f Y:%f Z:%f", GetPlayerNameEx(playerid), businessid, Businesses[businessid][bIntPos][0], Businesses[businessid][bIntPos][1],Businesses[businessid][bIntPos][2]);
		Log("logs/bedit.log", string);
	}
	else if(strcmp(choice, "custominterior", true) == 0)
	{
		if(Businesses[businessid][bCustomInterior] == 0)
		{
			Businesses[businessid][bCustomInterior] = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "Business set to custom interior!");
		}
		else
		{
			Businesses[businessid][bCustomInterior] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "Business set to normal (not custom) interior!");
		}
		format(string, sizeof(string), "%s has edited BusinessID %d's CustomInterior.", GetPlayerNameEx(playerid), businessid);
		Log("logs/bedit.log", string);
		return 1;
	}
	else if(strcmp(choice, "customexterior", true) == 0)
	{
		if(Businesses[businessid][bCustomExterior] == 0)
		{
			Businesses[businessid][bCustomExterior] = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "Business set to custom exterior!");
		}
		else
		{
			Businesses[businessid][bCustomExterior] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "Business set to normal (not custom) exterior!");
		}
		format(string, sizeof(string), "%s has edited BusinessID %d's CustomExterior.", GetPlayerNameEx(playerid), businessid);
		Log("logs/bedit.log", string);
		return 1;
	}
	else if(!strcmp(choice, "supplypoint", true))
	{
		if(Businesses[businessid][bOrderState] == 2)
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "You can't change the supply point when a delivery is on its way.");
		}
		GetPlayerPos(playerid, Businesses[businessid][bSupplyPos][0], Businesses[businessid][bSupplyPos][1], Businesses[businessid][bSupplyPos][2]);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have edited the supply point!");
		format(string, sizeof(string), "%s has changed BusinessID %d's Supply Point to X:%f Y:%f Z:%f", GetPlayerNameEx(playerid), businessid, Businesses[businessid][bSupplyPos][0], Businesses[businessid][bSupplyPos][1],Businesses[businessid][bSupplyPos][2]);
		Log("logs/bedit.log", string);
	}

	else if(!strcmp(choice, "price", true))
	{
		Businesses[businessid][bValue] = amount;
		format(string, sizeof(string), "You have set the business price to $%d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %d's Price to $%d.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}

	else if(!strcmp(choice, "type", true))
	{
		if(Businesses[businessid][bOrderState] == 2)
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "You can't change the business type when a delivery is on its way.");
		}
		Businesses[businessid][bType] = amount;
		format(string, sizeof(string), "You have set the business type to %s.", GetBusinessTypeName(amount));
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %d's Type to %s (%d).", GetPlayerNameEx(playerid), businessid, GetBusinessTypeName(amount), amount);
		Log("logs/bedit.log", string);
	}

	else if(!strcmp(choice, "inventory", true))
	{
		Businesses[businessid][bInventory] = amount;
		format(string, sizeof(string), "You have set the business inventory to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %d's Inventory to %d.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}
	else if(!strcmp(choice, "InventoryCapacity", true))
	{
		Businesses[businessid][bInventoryCapacity] = amount;
		format(string, sizeof(string), "You have set the business inventory capacity to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %d's Inventory Capacity to %d.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}

	else if(!strcmp(choice, "safebalance", true))
	{
		Businesses[businessid][bSafeBalance] = amount;
		format(string, sizeof(string), "You have set the business safe to %d.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %d's safe to %d.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}

	else if (!strcmp(choice, "gymentryfee", true))
	{
		if (Businesses[businessid][bType] != BUSINESS_TYPE_GYM)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD2, "Only Gyms can have entrance fees!");
		}

		Businesses[businessid][bGymEntryFee] = amount;
		format(string, sizeof(string), "You have set the gym entry fee to %i.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %i's gym entry fee to %i.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}

	else if (!strcmp(choice, "gymtype", true))
	{
		if (Businesses[businessid][bType] != BUSINESS_TYPE_GYM)
		{
			return SendClientMessageEx(playerid, COLOR_GRAD2, "You can only use this command on a gym!");
		}

		if (amount == 1) // swimming pool & boxing arena
		{
			Businesses[businessid][bGymType] = amount;
		}
		else if (amount == 2) // bike parkour
		{
			Businesses[businessid][bGymType] = amount;
		}
		else
		{
			return SendClientMessageEx(playerid, COLOR_GRAD2, "Available types are: Swimming Pool / Boxing Arena(1) or Bike Parkour (2)");
		}

		format(string, sizeof(string), "You have the set the gym type to %i.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has changed BusinessID %i's gym type to %i.", GetPlayerNameEx(playerid), businessid, amount);
		Log("logs/bedit.log", string);
	}

	else if(!strcmp(choice, "delete", true))
	{
		Businesses[businessid][bExtPos][0] = 0;
		Businesses[businessid][bExtPos][1] = 0;
		Businesses[businessid][bExtPos][2] = 0;
		Businesses[businessid][bName][0] = 0;
		Businesses[businessid][bType] = 0;
		format(string, sizeof(string), "You have deleted the business.", amount);
		SendClientMessageEx(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has deleted BusinessID %d.", GetPlayerNameEx(playerid), businessid);
		Log("logs/bedit.log", string);
		//TODO IMPROVE
		for (new i; i < MAX_BUSINESS_GAS_PUMPS; i++) {
			DestroyDynamicGasPump(businessid, i);
		}
		for (new i; i < MAX_BUSINESS_DEALERSHIP_VEHICLES; i++) {
			DestroyVehicle(Businesses[businessid][bVehID][i]);
		}
	}

	RefreshBusinessPickup(businessid);
	SaveBusiness(businessid);
	Streamer_UpdateEx(playerid, Businesses[businessid][bExtPos][0], Businesses[businessid][bExtPos][1], Businesses[businessid][bExtPos][2]);

	return 1;
}

CMD:bname(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new name[40], businessid;

		if(sscanf(params, "ds[40]", businessid, name)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /bname [business id] [name]");
		}
		else if (!IsValidBusinessID(businessid)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Invalid business specified.");
		}
		else if(strfind(name, "\r") != -1 || strfind(name, "\n") != -1) {
			return SendClientMessageEx(playerid, COLOR_GREY, "Newline characters are forbidden.");
		}

		strcpy(Businesses[businessid][bName], name, sizeof(name));
		SaveBusiness(businessid);
		SendClientMessageEx(playerid, COLOR_WHITE, "You have successfully changed the name of this business.");
		RefreshBusinessPickup(businessid);

		new string[128];
		format(string, sizeof(string), "%s has edited business ID %d's name to %s.", GetPlayerNameEx(playerid), businessid, Businesses[businessid][bName]);
		Log("logs/bedit.log", string);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}

	return 1;
}

CMD:bnext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Danh sanh cac cua hang tiep theo...");
		for(new i; i<MAX_BUSINESSES;i++)
		{
		    if(Businesses[i][bType] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "%d is available to use.", i);
		        SendClientMessageEx(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}


CMD:bnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		SendClientMessageEx(playerid, COLOR_RED, "* Danh sach cac cua hang trong 30 met");
		for(new i;i<MAX_BUSINESSES;i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 30, Businesses[i][bExtPos][0], Businesses[i][bExtPos][1], Businesses[i][bExtPos][2]))
			{
			    new string[128];
		    	format(string, sizeof(string), "Business ID %d | %f from you", i, GetPlayerDistanceFromPoint(playerid,Businesses[i][bExtPos][0], Businesses[i][bExtPos][1], Businesses[i][bExtPos][2]));
		    	SendClientMessageEx(playerid, COLOR_WHITE, string);
			}
		}
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:gotobiz(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /gotobiz [business id]");
		if(!IsValidBusinessID(id)) return SendClientMessageEx(playerid, COLOR_GREY, "Invalid business ID specified.");
		if (Businesses[id][bExtPos][0] == 0.0) return SendClientMessageEx(playerid, COLOR_GREY, "No exterior set for this business.");
		GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		PlayerInfo[playerid][pInt] = 0;
		PlayerInfo[playerid][pVW] = 0;
		SetPlayerPos(playerid,Businesses[id][bExtPos][0],Businesses[id][bExtPos][1],Businesses[id][bExtPos][2]);
		SetPlayerFacingAngle(playerid,Businesses[id][bExtPos][3]);
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}


CMD:goinbiz(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pShopTech] >= 1)
	{
		new id;
		if(sscanf(params, "d", id)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /goinbiz [businessid]");
		if(!IsValidBusinessID(id)) return SendClientMessageEx(playerid, COLOR_GREY, "ID kinh doanh hop le quy dinh.");
		if (Businesses[id][bExtPos][0] == 0.0) return SendClientMessageEx(playerid, COLOR_GREY, "Khong co noi that cho cua hang nay.");
		SetPlayerInterior(playerid,Businesses[id][bInt]);
		SetPlayerPos(playerid,Businesses[id][bIntPos][0],Businesses[id][bIntPos][1],Businesses[id][bIntPos][2]);
		SetPlayerFacingAngle(playerid,Businesses[id][bIntPos][3]);

		if(Businesses[id][bVW] == 0) SetPlayerVirtualWorld(playerid, BUSINESS_BASE_VW + id), PlayerInfo[playerid][pVW] = BUSINESS_BASE_VW + id;
		else SetPlayerVirtualWorld(playerid, Businesses[id][bVW]), PlayerInfo[playerid][pVW] = Businesses[id][bVW];
	}
	else
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:asellbiz(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] < 4) {
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}

	new string[128], biz;
	if(sscanf(params, "d", biz)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /asellbiz [business id]");

	Businesses[biz][bOwner] = -1;
	SaveBusiness(biz);
	RefreshBusinessPickup(biz);
	new ip[16];
	GetPlayerIp(playerid,ip,sizeof(ip));
	format(string,sizeof(string),"Administrator %s (IP: %s) da ban cua hang kinh doanh ID %d (duoc so huu boi %d).",GetPlayerNameEx(playerid),ip,biz,Businesses[biz][bOwner]);
	Log("logs/business.log", string);
	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	format(string, sizeof(string), "~w~Ban da ban cua hang %d.", biz);
	GameTextForPlayer(playerid, string, 10000, 3);
	foreach(new j: Player) {
		if(PlayerInfo[j][pBusiness] == biz) {
			PlayerInfo[j][pBusiness] = INVALID_BUSINESS_ID;
			PlayerInfo[j][pBusinessRank] = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "Mot Admin da ban cua hang nay, so lieu thong ke cua hang ban duoc thiet lap lai.");
		}
	}

	format(string, sizeof(string), "UPDATE `accounts` SET `Business` = "#INVALID_BUSINESS_ID", `BusinessRank` = 0 WHERE `Business` = '%d'", biz);
	mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
	return 1;
}
CMD:creategaspump(playerid, params[])
{
    new string[128], iBusinessID;
    if(PlayerInfo[playerid][pAdmin] >= 4) {

		if(sscanf(params, "d", iBusinessID)) {
			return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /creategaspump [business id]");
		}
		else
		{
			if (GetFreeGasPumpID(iBusinessID) == INVALID_GAS_PUMP)
			return SendClientMessageEx(playerid, COLOR_GRAD1, "So luong xang da dat muc toi da.");

			if (!(0 <= iBusinessID < MAX_BUSINESSES)) {
				return SendClientMessageEx(playerid, COLOR_GREY, "Invalid business specified.");
			}
		 	if (!Businesses[iBusinessID][bType]) {
		 		return SendClientMessageEx(playerid, COLOR_GREY, "Cua hang kinh doanh nay phai duoc thiet lap truoc khi su dung lenh nay.");
		 	}
			if(!IsBusinessGasAble(Businesses[iBusinessID][bType])) {
		        return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the tao tram xang cho cua hang nay.");
		    }
		    if(!IsPlayerInRangeOfPoint(playerid, 150.0, Businesses[iBusinessID][bExtPos][0], Businesses[iBusinessID][bExtPos][1], Businesses[iBusinessID][bExtPos][2])) {
		        return SendClientMessageEx(playerid, COLOR_GREY, "Ban o qua xa cua hang.");
		    }
			new iPump = GetFreeGasPumpID(iBusinessID);
			//Businesses[iBusinessID][GasPumpCapacity][iPump] = Businesses[iBusinessID][bLevel] * 100;
			Businesses[iBusinessID][GasPumpCapacity][iPump] = 1000;
			CreateDynamicGasPump(playerid, iBusinessID, iPump);
			SaveBusiness(iBusinessID);

			format(string, sizeof(string), "%s da tao ra mot tram xang cho %s (%d)", Businesses[iBusinessID][bName], iBusinessID);
			Log("logs/bedit.log", string);
			return 1;

		}
    } else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
}

CMD:editgaspump(playerid, params[])
{
    new iBusinessID, iPumpID, szLog[128], szName[9], Float: fValue;
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
    }

	if(sscanf(params, "dds[9]F(0)", iBusinessID, iPumpID, szName, fValue)) {
		SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /editgaspump [business id] [pump id] [name] [value]");
		SendClientMessageEx(playerid, COLOR_GREY, "Ten co san: Capacity, Gas, Position");
		return 1;
	}

	if (!(0 <= iBusinessID < MAX_BUSINESSES))
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Lai hinh khong hop le.");
	}
	else if (!(0 <= iPumpID < MAX_BUSINESS_GAS_PUMPS))
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Bom xang khong hop le.");
	}
	else if(Businesses[iBusinessID][GasPumpVehicleID][iPumpID])
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the chinh sua tram gas trong khi no dang duoc su dung.");
	}

	if(!strcmp(szName, "position", true))
	{
	    if(!IsPlayerInRangeOfPoint(playerid, 150.0, Businesses[iBusinessID][bExtPos][0], Businesses[iBusinessID][bExtPos][1], Businesses[iBusinessID][bExtPos][2])) {
        	return SendClientMessageEx(playerid, COLOR_GREY, "Ban o xa cua hang.");
    	}
    	format(szLog, sizeof(szLog), "%s thay doi vi tri tram gas %d cho cua hang %d", GetPlayerNameEx(playerid), iPumpID, iBusinessID);

		DestroyDynamicGasPump(iBusinessID, iPumpID);
		CreateDynamicGasPump(playerid, iBusinessID, iPumpID);
		SaveBusiness(iBusinessID);

	}
	else if(!strcmp(szName, "gas", true))
	{
	    if (fValue > Businesses[iBusinessID][GasPumpCapacity][iPumpID])
	    {
		    SendClientMessageEx(playerid, COLOR_GREY, "Gia tri khong duoc cao hon cong suat!");
		    return 1;
	    }
		Businesses[iBusinessID][GasPumpGallons][iPumpID] = fValue;
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua dung luong bom khi gas!");
		format(szLog, sizeof(szLog), "%s da thay doi luong khi gas %d cho %s (%d) den %.2f", GetPlayerNameEx(playerid), iPumpID, Businesses[iBusinessID][bName], iBusinessID, fValue);
	}
	else if(!strcmp(szName, "capacity", true))
	{
		Businesses[iBusinessID][GasPumpCapacity][iPumpID] = fValue;
		SendClientMessageEx(playerid, COLOR_WHITE, "Ban da chinh sua cong suat bom gas!");
		format(szLog, sizeof(szLog), "%s da thay doi cong suat tram gas %d cho %s (%d) den %.2f", GetPlayerNameEx(playerid), iPumpID, Businesses[iBusinessID][bName], iBusinessID, fValue);
	}

	SaveBusiness(iBusinessID);
	Log("logs/bedit.log", szLog);
	return 1;
}

CMD:deletegaspump(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) {
        return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
    }
    new businessid, id, string[128];
	if(sscanf(params, "dd", businessid, id)) {
		return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /deletegaspump [business id] [pump id]");
	}
	if(!IsValidBusinessID(businessid) || id < 0 || id >= MAX_BUSINESS_GAS_PUMPS || Businesses[businessid][GasPumpPosX][id] == 0) {
		return SendClientMessageEx(playerid, COLOR_GREY, "Khong tim thay tram xang nao trung ID.");
	}
	if(Businesses[businessid][GasPumpVehicleID][id]) {
		return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the xoa tramg xang trong khi no dang duoc su dung.");
	}

 	DestroyDynamicGasPump(businessid, id);
	Businesses[businessid][GasPumpPosX][id] = 0;
	Businesses[businessid][GasPumpPosY][id] = 0;
	Businesses[businessid][GasPumpPosZ][id] = 0;
	Businesses[businessid][GasPumpAngle][id] = 0;
	Businesses[businessid][GasPumpCapacity][id] = 0;
	Businesses[businessid][GasPumpGallons][id] = 0;
	Businesses[businessid][GasPumpSaleGallons][id] = 0;
	Businesses[businessid][GasPumpSalePrice][id] = 0;
	SaveBusiness(businessid);

    format(string, sizeof(string), "Ban da xoa tram ga ID %d cho cua hang %d.", id, businessid);
    SendClientMessageEx(playerid, COLOR_WHITE, string);

	format(string, sizeof(string), "Admin %s xoa tram ga cua hang %d", businessid);
	Log("logs/bedit.log", string);

	return 1;
}
CMD:togglecleo(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6)
	    return 0;

	if(prisonactive == 0)
		SendClientMessageEx(playerid, COLOR_CYAN, "Cleo he thong nha tu ngung hoat dong."), prisonactive = 1;
	else
	    SendClientMessageEx(playerid, COLOR_CYAN, "Cleo he thong nha tu kich hoat."), prisonactive = 0;

	return 1;
}
CMD:reloadlist(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
	    ToyList2 = LoadModelSelectionMenu("ToyList.txt");
		CarList2 = LoadModelSelectionMenu("CarList.txt");
		PlaneList = LoadModelSelectionMenu("PlaneList.txt");
		BoatList = LoadModelSelectionMenu("BoatList.txt");
		SendClientMessageEx(playerid, COLOR_CYAN, "List's have been reloaded.");
	}
	return 1;
}
CMD:mods(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[3024]; // This is what happens when there is 100 moderators online
		foreach(new i : Player)
		{
			if(PlayerInfo[i][pAdmin] == 1)
			{
				format(string, sizeof(string), "%s\nModerator %s (ID %i)", string, GetPlayerNameEx(i), i);
			}
		}
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "Moderators dang Online", string, "Dong", "");
	}
	else
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay!");
	return 1;
}

// Relay For Life

CMD:setlapcount(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new totallaps;
	if(sscanf(params, "i", totallaps)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setlapcount [totallaps]");
   	RaceTotalLaps = totallaps;
	new string[52];
   	format(string, sizeof(string), "Ban da thay tong so vong hoan thanh: %d", RaceTotalLaps);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}
CMD:eventstats(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new string[50];
	format(string, sizeof(string), "Tong vong hoan thanh: %d | Tong cong: %d", RaceTotalLaps, TotalJoinsRace);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	return 1;
}

CMD:rfltoggle(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	if(rflstatus > 0) {
		rflstatus = 0;
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da tat relay for life.");
		Misc_Save();
	}
	else {
		rflstatus = 1;
		SendClientMessageEx(playerid, COLOR_GREY, "Ban da kick hoat relay for life.");
		Misc_Save();
	}
	return 1;
}

CMD:toglapcount(playerid, params[]) {
    if(PlayerInfo[playerid][pAdmin] < 5) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	if(toglapcount == 0) {
   		toglapcount = 1;
		SendClientMessageEx(playerid, COLOR_WHITE, "Tat thiet lap theo doi, nguoi choi hoan thanh vong moi se khong duoc tinh.");
	} else {
	    toglapcount = 0;
		SendClientMessageEx(playerid, COLOR_WHITE, "Bat thiet lap theo doi, nguoi choi hoan thanh vong moi se duoc tinh.");
	}
	return 1;
}

CMD:rflscore(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_RFL_SEL, DIALOG_STYLE_LIST, "Relay For Life Bang diem", "Diem team\nTop 25 Nguoi choi", "Chon", "Dong");
	return 1;
}

CMD:buyrflteam(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life chua duoc kich hoat.");
	if(PlayerInfo[playerid][pRFLTeam] != -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban da la thanh vien cua team.");
	if(GetPlayerCash(playerid) < 100000) return SendClientMessageEx(playerid, COLOR_GREY, "Ban can $100000 de tao team.");
	for(new i = 0; i < MAX_RFLTEAMS; i++) {
		if(RFLInfo[i][RFLmembers] < 1) {
			format(RFLInfo[i][RFLname], 25, "Team %s", GetPlayerNameEx(playerid));
			format(RFLInfo[i][RFLleader], 25, "%s", GetPlayerNameEx(playerid));
			RFLInfo[i][RFLused] = 1;
			RFLInfo[i][RFLmembers] = 1;
			RFLInfo[i][RFLlaps] = 0;
			PlayerInfo[playerid][pRFLTeam] = i;
			PlayerInfo[playerid][pRFLTeamL] = i;
			GivePlayerCash(playerid, -100000);
			SendClientMessageEx(playerid, COLOR_GREY, "ban tao mot team voi gia $100000. Ban su dung /rflhelp de tro giup.");
			if( GetPVarInt( playerid, "EventToken" ) == 1 ) {
				if( EventKernel[ EventStatus ] == 1 || EventKernel[ EventStatus ] == 2 ) {
					if(EventKernel[EventType] == 3) {
						new Float:X, Float:Y, Float:Z, string[64];
						GetPlayerPos( playerid, X, Y, Z );
						format(string, sizeof(string), "Team: %s", RFLInfo[i][RFLname]);
						RFLTeamN3D[playerid] = CreateDynamic3DTextLabel(string,0x008080FF,X,Y,Z,10.0,.attachedplayer = playerid, .worldid = GetPlayerVirtualWorld(playerid));
					}
				}
			}
			SaveRelayForLifeTeam(i);
			OnPlayerStatsUpdate(i);
			return 1;
		}
	}
	SendClientMessageEx(playerid, COLOR_GREY, "Tat ca Slot team da duoc su dung.");
	return 1;
}

CMD:leaverflteam(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life chua duoc kich hoat.");
	if(PlayerInfo[playerid][pRFLTeam] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai thanh vien cua team.");
	new team = PlayerInfo[playerid][pRFLTeam];
	if(PlayerInfo[playerid][pRFLTeamL] == team)
	{
		new string[128];
		format(RFLInfo[team][RFLname], 25, "Unused");
		format(RFLInfo[team][RFLleader], 25, "None");
		RFLInfo[team][RFLlaps] = 0;
		RFLInfo[team][RFLmembers] = 0;
		RFLInfo[team][RFLused] = 0;
		PlayerInfo[playerid][pRFLTeam] = -1;
		PlayerInfo[playerid][pRFLTeamL] = -1;
		if(IsValidDynamic3DTextLabel(RFLTeamN3D[playerid])) {
			DestroyDynamic3DTextLabel(RFLTeamN3D[playerid]);
		}
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "Team cua ban da bi xoa,vi vay ban la leader moi.");
		foreach(new i: Player) {
			if(PlayerInfo[i][pRFLTeam] == team) {
				PlayerInfo[i][pRFLTeam] = -1;
				PlayerInfo[i][pRFLTeamL] = -1;
				if(IsValidDynamic3DTextLabel(RFLTeamN3D[i])) {
					DestroyDynamic3DTextLabel(RFLTeamN3D[i]);
				}
				SendClientMessageEx(i, COLOR_LIGHTBLUE, "You have been removed from your team due to it being removed.");
				OnPlayerStatsUpdate(i);
			}
		}
		OnPlayerStatsUpdate(playerid);
		format(string, sizeof(string), "UPDATE `accounts` SET `RFLTeam` = -1, `RFLTeamL` = -1 WHERE `RFLTeam` = %d", team);
		mysql_function_query(MainPipeline, string, false, "OnQueryFinish", "i", SENDDATA_THREAD);
	}
	else
	{
		RFLInfo[team][RFLmembers] -= 1;
		PlayerInfo[playerid][pRFLTeam] = -1;
		PlayerInfo[playerid][pRFLTeamL] = -1;
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "You have left the team.");
		OnPlayerStatsUpdate(playerid);
	}
	SaveRelayForLifeTeam(team);
	return 1;
}

CMD:rflinvite(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life chua duoc kich hoat");
	if(PlayerInfo[playerid][pRFLTeam] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai thanh vien cua team");
	if(PlayerInfo[playerid][pRFLTeamL] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai nha leader cua team nay.");
	//if(RFMM8ECLaq9zC4xgck6QUJACuAxDkZyouDAnm]][RFLmembers] >= 20) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the moi qua 19 thanh vien.");
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rflinvite [playerid/PlayerName]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	if(PlayerInfo[giveplayerid][pRFLTeam] != -1) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay dang la thanh vien cua team.");
	new string[128];
	SetPVarInt(giveplayerid, "RFLTeam_Invite", 1);
	SetPVarInt(giveplayerid, "RFLTeam_Team", PlayerInfo[playerid][pRFLTeam]);
	SetPVarInt(giveplayerid, "RFLTeam_Inviter", playerid);
	format(string, sizeof(string), "* Ban da moi %s tham gia team cua ban.", GetPlayerNameEx(giveplayerid));
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s da moi ban tham gia team . Su dung /chapnhan De chap nhan vao team .", GetPlayerNameEx(playerid));
	SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
	return 1;
}

CMD:rflkick(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life chua duoc kinh hoat.");
	if(PlayerInfo[playerid][pRFLTeam] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong trong team.");
	if(PlayerInfo[playerid][pRFLTeamL] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai leader cua team.");
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rflkick [playerid/PlayerName]");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	if(PlayerInfo[giveplayerid][pRFLTeam] != PlayerInfo[playerid][pRFLTeam]) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi nay khong co trong nhom cua ban.");
	new string[128], team = PlayerInfo[playerid][pRFLTeam];
	PlayerInfo[giveplayerid][pRFLTeam] = -1;
	PlayerInfo[giveplayerid][pRFLTeamL] = -1;
	RFLInfo[team][RFLmembers] -=1;
	format(string, sizeof(string), "* Ban da duoi %s ra khoi team.", GetPlayerNameEx(giveplayerid));
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s da duoi ban ra khoi team.", GetPlayerNameEx(playerid));
	SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
	if(IsValidDynamic3DTextLabel(RFLTeamN3D[giveplayerid])) {
		DestroyDynamic3DTextLabel(RFLTeamN3D[giveplayerid]);
	}
	OnPlayerStatsUpdate(giveplayerid);
	SaveRelayForLifeTeam(team);
	return 1;
}

CMD:rflmembers(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life hien chua duoc kich hoat.");
	if(PlayerInfo[playerid][pRFLTeam] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai thanh phan trong team");
	new string[64];
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "* Danh sach thanh vien trong team:");
	foreach(new i: Player) {
		if(PlayerInfo[i][pRFLTeam] == PlayerInfo[playerid][pRFLTeam]) {
			if(PlayerInfo[i][pRFLTeamL] != -1) {
				format(string, sizeof(string), "%s - Leader", GetPlayerNameEx(i));
				SendClientMessageEx(playerid, COLOR_GREY, string);
			}
			else {
				SendClientMessageEx(playerid, COLOR_GREY, GetPlayerNameEx(i));
			}
		}
	}
	return 1;
}

CMD:rflchangename(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life hien chua duoc kich hoat.");
	if(PlayerInfo[playerid][pRFLTeam] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai nguoi choi trong team.");
	if(PlayerInfo[playerid][pRFLTeamL] == -1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai leader cua team.");
	new name[25];
	if(sscanf(params, "s[25]", name)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /rflchangename <teamname>");
	if(GetPVarType(playerid, "HasReport")) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the gui mot bao cao cho hoat dong nay. (/cancelreport)");
		return 1;
	}
	if(strfind(name, "'", true) != -1) {
		SendClientMessageEx(playerid, COLOR_GREY, "Xin vui long khong su dung lai Ten cua doi ban.");
		return 1;
	}
	new String[128];
	SetPVarInt(playerid, "RFLNameRequest", 1);
	SetPVarString(playerid, "NewRFLName", name);
   	format( String, sizeof( String ), "Ban da yeu cau doi ten nhom  %s, xin vui long doi trong giay lat de Admin duyet.", name);
   	SendClientMessageEx( playerid, COLOR_YELLOW, String );
	SendReportToQue(playerid, "Ten doi Request", 2, 4);
	return 1;
}


CMD:rflhelp(playerid, params[])
{
	if(rflstatus < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Relay For Life is currently not enabled.");
	SendClientMessageEx(playerid, COLOR_WHITE, "Relay For Life Commands");
	SendClientMessageEx(playerid, COLOR_GREEN, "_____________________________________________________________________________________________________");
	SendClientMessageEx(playerid, COLOR_GREY, "GENERAL: /rflscore /buyrflteam(100k) /leaverflteam");
	if(PlayerInfo[playerid][pRFLTeam] != -1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "MEMBER: /rflmembers");
	}
	if(PlayerInfo[playerid][pRFLTeamL] != -1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "TEAMOWNER: /rflinvite (20 Members Max.) /rflkick /rflchangename");
	}
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "ADMIN: /toglapcount /rfltoggle /setlapcount /eventstats /seteventtype race /editevent checkpoints");
	}
	SendClientMessageEx(playerid, COLOR_GREEN, "_____________________________________________________________________________________________________");
	return 1;
}

CMD:checkvouchers(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay!");
	if(sscanf(params, "u", targetid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkvouchers [player]");
	if(!IsPlayerConnected(targetid)) return SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");

	ShowVouchers(playerid, targetid);
	return 1;
}
CMD:givesprize(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6 && PlayerInfo[playerid][pHR] < 2) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new PName[MAX_PLAYER_NAME], choice[16], amount;
	if(sscanf(params, "s[24]s[16]d", PName, choice, amount))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "SU DUNG: /givesprize [playerid/PlayerName] [Choice] [Amount]");
		SendClientMessageEx(playerid, COLOR_GREY, "Choice: CarSlot | ToySlot | CarVoucher | GiftVoucher");
		SendClientMessageEx(playerid, COLOR_GREY, "Note: This command works offline and online.");
		return 1;
	}
	if(amount < 1) return SendClientMessage(playerid, COLOR_GREY, "Amount cannot go below 1");
	new string[128];
	new pID = ReturnUser(PName);
	if(IsPlayerConnected(pID))
	{
		if(strcmp(choice, "carslot", true) == 0)
		{
			PlayerInfo[pID][pVehicleSlot] += amount;
			LoadPlayerDisabledVehicles(pID);
			format(string, sizeof(string), "[MAYCHU] %s has given %s %d free car slot(s).", GetPlayerNameEx(playerid), GetPlayerNameEx(pID), amount);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "Ban nhan duoc %d free car slot(s) tu %s.",amount, GetPlayerNameEx(playerid));
			SendClientMessageEx(pID, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da cho %s %d car slot(s).", GetPlayerNameEx(pID), amount);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[Admin] %s(IP:%s) da cho %s(IP:%s) %d free car slot(s).", GetPlayerNameEx(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(pID), GetPlayerIpEx(pID), amount);
			Log("logs/adminrewards.log", string);
		}
		else if(strcmp(choice, "toyslot", true) == 0)
		{
			PlayerInfo[pID][pToySlot] += amount;
			format(string, sizeof(string), "[MAYCHU] %s has given %s %d free toy slot(s).", GetPlayerNameEx(playerid), GetPlayerNameEx(pID), amount);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "Ban nhan duoc %d free toy slot(s) tu %s.",amount, GetPlayerNameEx(playerid));
			SendClientMessageEx(pID, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da cho %s %d toy slot(s).", GetPlayerNameEx(pID), amount);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[Admin] %s(IP:%s) da cho %s(IP:%s) %d free toy slot(s).", GetPlayerNameEx(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(pID), GetPlayerIpEx(pID), amount);
			Log("logs/adminrewards.log", string);
		}
		else if(strcmp(choice, "carvoucher", true) == 0)
		{
			PlayerInfo[pID][pVehVoucher] += amount;
			format(string, sizeof(string), "[MAYCHU] %s has given %s %d free car voucher(s).", GetPlayerNameEx(playerid), GetPlayerNameEx(pID), amount);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "Ban nhan duoc %d free car voucher(s) tu %s.",amount, GetPlayerNameEx(playerid));
			SendClientMessageEx(pID, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da cho %s %d car voucher(s).", GetPlayerNameEx(pID), amount);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[Admin] %s(IP:%s) da cho %s(IP:%s) %d free car voucher(s).", GetPlayerNameEx(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(pID), GetPlayerIpEx(pID), amount);
			Log("logs/adminrewards.log", string);
		}
		else if(strcmp(choice, "giftvoucher", true) == 0)
		{
			PlayerInfo[pID][pGiftVoucher] += amount;
			format(string, sizeof(string), "[MAYCHU] %s has given %s %d free gift reset voucher(s).", GetPlayerNameEx(playerid), GetPlayerNameEx(pID), amount);
			ABroadCast(COLOR_LIGHTRED, string, 2);
			format(string, sizeof(string), "Ban nhan duoc %d free gift reset voucher(s) tu %s.",amount, GetPlayerNameEx(playerid));
			SendClientMessageEx(pID, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "Ban da cho %s %d gift reset voucher(s).", GetPlayerNameEx(pID), amount);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "[Admin] %s(IP:%s) da cho %s(IP:%s) %d free gift reset voucher(s).", GetPlayerNameEx(playerid), GetPlayerIpEx(playerid), GetPlayerNameEx(pID), GetPlayerIpEx(pID), amount);
			Log("logs/adminrewards.log", string);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Lua chon khong hop le.");
		}
	}
	else
	{
		new tmpName[24];
		if(strcmp(choice, "carslot", true) == 0)
		{
			mysql_escape_string(PName, tmpName);
			format(string, sizeof(string), "UPDATE `accounts` SET `VehicleSlot` = `VehicleSlot`+%d WHERE `Username`='%s'",amount, tmpName);
			mysql_function_query(MainPipeline, string, false, "OnStaffPrize", "i", playerid);
			format(string, sizeof(string), "Da cho %s %d car slot(s)..", tmpName, amount);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			SetPVarString(playerid, "OnSPrizeType", "Car Slot(s)");
			SetPVarString(playerid, "OnSPrizeName", tmpName);
			SetPVarInt(playerid, "OnSPrizeAmount", amount);
		}
		else if(strcmp(choice, "toyslot", true) == 0)
		{
			mysql_escape_string(PName, tmpName);
			format(string, sizeof(string), "UPDATE `accounts` SET `ToySlot` = `ToySlot`+%d WHERE `Username`='%s'",amount, tmpName);
			mysql_function_query(MainPipeline, string, false, "OnStaffPrize", "i", playerid);
			format(string, sizeof(string), "Da cho %s %d toy slot(s)..", tmpName, amount);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			SetPVarString(playerid, "OnSPrizeType", "Toy Slot(s)");
			SetPVarString(playerid, "OnSPrizeName", tmpName);
			SetPVarInt(playerid, "OnSPrizeAmount", amount);
		}
		else if(strcmp(choice, "carvoucher", true) == 0)
		{
			mysql_escape_string(PName, tmpName);
			format(string, sizeof(string), "UPDATE `accounts` SET `VehVoucher` = `VehVoucher`+%d WHERE `Username`='%s'",amount, tmpName);
			mysql_function_query(MainPipeline, string, false, "OnStaffPrize", "i", playerid);
			format(string, sizeof(string), "Da cho %s %d car voucher(s)..", tmpName, amount);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			SetPVarString(playerid, "OnSPrizeType", "Car Voucher(s)");
			SetPVarString(playerid, "OnSPrizeName", tmpName);
			SetPVarInt(playerid, "OnSPrizeAmount", amount);
		}
		else if(strcmp(choice, "giftvoucher", true) == 0)
		{
			mysql_escape_string(PName, tmpName);
			format(string, sizeof(string), "UPDATE `accounts` SET `GiftVoucher` = `GiftVoucher`+%d WHERE `Username`='%s'",amount, tmpName);
			mysql_function_query(MainPipeline, string, false, "OnStaffPrize", "i", playerid);
			format(string, sizeof(string), "Da cho %s %d gift reset voucher(s)..", tmpName, amount);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			SetPVarString(playerid, "OnSPrizeType", "Thiet lap Gift(s)");
			SetPVarString(playerid, "OnSPrizeName", tmpName);
			SetPVarInt(playerid, "OnSPrizeAmount", amount);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Lua chon khong hop le.");
		}
	}
	return 1;
}
CMD:gtedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pGangModerator] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	ShowPlayerDialog(playerid, DIALOG_GANGTAG_MAIN, DIALOG_STYLE_LIST, "Gang Tags", "Create new gang tag\nEdit gang tag", "Lua chon", "Dong lai");
	return 1;
}

CMD:gtnear(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pGangModerator] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new string[128];
	SendClientMessageEx(playerid, COLOR_RED, "Danh sach tag gang trong ban kinh 30 met...");
	for(new i = 0; i < MAX_GANGTAGS; i++)
	{
		if(GangTags[i][gt_Used] != 0 && IsPlayerInRangeOfPoint(playerid, 30, GangTags[i][gt_PosX], GangTags[i][gt_PosY], GangTags[i][gt_PosZ]))
		{
			format(string, sizeof(string), "ID: %d | Range: %f | VW: %d | Int: %d", i, GetPlayerDistanceFromPoint(playerid, GangTags[i][gt_PosX], GangTags[i][gt_PosY], GangTags[i][gt_PosZ]), GangTags[i][gt_VW], GangTags[i][gt_Int]);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
	}
	return 1;
}

CMD:gotogt(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pGangModerator] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new gangtag;
	if(sscanf(params, "d", gangtag)) return SendClientMessageEx(playerid, COLOR_WHITE, "Syntax: /gotogt <gangtag>");
	if(gangtag < 0 || gangtag > MAX_GANGTAGS) return SendClientMessageEx(playerid, COLOR_GREY, "Tag gang khong hop le.");
	if(GangTags[gangtag][gt_Used] == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Tag gang khong duoc su dung.");
	SetPlayerPos(playerid, GangTags[gangtag][gt_PosX], GangTags[gangtag][gt_PosY], GangTags[gangtag][gt_PosZ]);
	SendClientMessageEx(playerid, COLOR_GREY, "Ban da duoc dich chuyen.");
	return 1;
}

CMD:gtstatus(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pGangModerator] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new gangtag;
	if(sscanf(params, "d", gangtag)) return SendClientMessageEx(playerid, COLOR_WHITE, "Syntax: /gtstatus <gangtag>");
	if(gangtag < 0 || gangtag > MAX_GANGTAGS) return SendClientMessageEx(playerid, COLOR_GREY, "Tag gang khong hop le.");
	new string[128];
	format(string, sizeof(string), "Tinh trang cua tag %d:", gangtag);
	SendClientMessageEx(playerid, COLOR_GREEN, string);
	SendClientMessageEx(playerid, COLOR_GREEN, "__________________________________________________________________________________");
	format(string, sizeof(string), "SQLID: %d | PosX: %f | PosY: %f | PosZ: %f", GangTags[gangtag][gt_SQLID], GangTags[gangtag][gt_PosX], GangTags[gangtag][gt_PosY], GangTags[gangtag][gt_PosZ]);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "RotX: %f | RotY: %f | RotZ: %f", GangTags[gangtag][gt_PosRX], GangTags[gangtag][gt_PosRY], GangTags[gangtag][gt_PosRZ]);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "Family: %d | ObjectID: %d | VW: %d | Int: %d | Time: %d", GangTags[gangtag][gt_Family], GangTags[gangtag][gt_ObjectID], GangTags[gangtag][gt_VW], GangTags[gangtag][gt_Int], GangTags[gangtag][gt_Time]);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	SendClientMessageEx(playerid, COLOR_GREEN, "__________________________________________________________________________________");
	return 1;
}
CMD:tagperm(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4 && PlayerInfo[playerid][pGangModerator] < 1) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Syntax: /tagperm <FamilyMember>");
		SendClientMessageEx(playerid, COLOR_GREY, "LUU Y: Nguoi choi phai la R6.");
		SendClientMessageEx(playerid, COLOR_GREY, "LUU Y: Su dung lenh nay mot lan nua de go bo quyen su dung tren nguoi nay.");
		return 1;
	}
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
	new string[128];
	if(GetPVarType(giveplayerid, "gt_Perm"))
	{
		DeletePVar(giveplayerid, "gt_Perm");
		format(string, sizeof(string), "Ban da bi %s thu hoi quyen su dung /tagedit .", GetPlayerNameEx(giveplayerid));
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		format(string, sizeof(string), "%s da thu hoi quyen su dung /tagedit khoi ban.", GetPlayerNameEx(playerid));
		SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
		return 1;
	}
	if(PlayerInfo[giveplayerid][pFMember] == INVALID_FAMILY_ID) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay khong phai thanh vien Family.");
	if(PlayerInfo[giveplayerid][pRank] < 6) return SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi nay khong phai R6.");
	SetPVarInt(giveplayerid, "gt_Perm", 1);
	format(string, sizeof(string), "Ban da duoc %s cap quyen su dung /tagedit cho Family %s.", GetPlayerNameEx(giveplayerid), FamilyInfo[PlayerInfo[giveplayerid][pFMember]][FamilyName]);
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "%s da chp phep ban su dung /tagedit.", GetPlayerNameEx(playerid));
	SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "%s da duoc phep %s su dung /tagedit cho family '%s'.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid), FamilyInfo[PlayerInfo[giveplayerid][pFMember]][FamilyName]);
	Log("Logs/GangTags.log", string);
	return 1;
}

CMD:switchgroup(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 6 || PlayerInfo[playerid][pFactionModerator] >= 1) {
		Group_ListGroups(playerid, DIALOG_SWITCHGROUP);
	}else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the dung lenh nay.");
	return 1;
}

CMD:switchfam(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pGangModerator] >= 1 || PlayerInfo[playerid][pFactionModerator] >= 4)
	{
		new string[128], familyid;
		if(sscanf(params, "d", familyid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /switchfam [familyid]");
		if(familyid < 1 || familyid > MAX_FAMILY) return SendClientMessageEx(playerid, COLOR_WHITE, "Invalid Family Number.");
		format(string, sizeof(string), "You have switched to family ID %d (%s).", familyid, FamilyInfo[familyid][FamilyName]);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		PlayerInfo[playerid][pRank] = 6;
		PlayerInfo[playerid][pFMember] = familyid;
		PlayerInfo[playerid][pMember] = INVALID_GROUP_ID;
		PlayerInfo[playerid][pLeader] = INVALID_GROUP_ID;

	}
	return 1;
}
CMD:tagedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		ShowPlayerDialog(playerid, DIALOG_GANGTAG_FTAGSEL, DIALOG_STYLE_INPUT, "Family ID", "Chon mot ID Family hop le:", "Lua chon", "Dong lai");
	}
	else if(GetPVarInt(playerid, "gt_Perm") == 1 && PlayerInfo[playerid][pFMember] != INVALID_FAMILY_ID && PlayerInfo[playerid][pRank] >= 6)
	{
		new string[32];
		format(string, sizeof(string), "Gang Tag Edit - %s", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
		SetPVarInt(playerid, "gt_Fam", PlayerInfo[playerid][pFMember]);
		ShowPlayerDialog(playerid, DIALOG_GANGTAG_FTAG, DIALOG_STYLE_LIST, string, "Chu\nMau sac\nFont\nKich co chu\nBackcolor\nIn dam\nSP Tags", "Lua chon", "Dong lai");
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

CMD:togfireworks(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5)
	{
		if(fireworktog == 0)
		{
			fireworktog = 1;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da kich hoat vi tri phao hoa.");
		}
		else
		{
			fireworktog = 0;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da vo hieu hoa phao hoa.");
		}
	}
	else return SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

// Dynamic Giftbox
CMD:dgedit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
		new string[128], choice[32], type, amount;
		if(sscanf(params, "s[32]dD", choice, type, amount))
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "SU DUNG: /dgedit [choice] [type] [value]");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Available Choices: Money, RimKit, Firework, 7DayGVIP, 1MonthGVIP, 7DaySVIP, 1MonthSVIP, CarSlot, ToySlot");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Available Choices: FullArmor, Firstaid, DDFlag, GateFlag, Credits, PriorityAd, HealthNArmor, Giftreset, Material");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Available Choices: Warning, Pot, Crack, PaintballToken, VIPToken, RespectPoint, CarVoucher, BuddyInvite, Laser");
			SendClientMessageEx(playerid, COLOR_GRAD1, "Available Choices: CustomToy, AdmuteReset, NewbieMuteReset, RestrictedCarVoucher, PlatVIPVoucher");
			return SendClientMessageEx(playerid, COLOR_RED, "Available Types: 0 = Enable/Disable | 1 = Quantity available | 2 = Quantity Given | 3 = Category");
		}

		if(type < 0 || type > 3)
		{
			SendClientMessageEx(playerid, COLOR_GRAD1, "Invalid Type!");
			return SendClientMessageEx(playerid, COLOR_RED, "Available Type: 0 = Enable/Disable | 1 = Quantity available | 2 = Quantity Given | 3 = Category");
		}

		if(amount < 0)
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the chon so tien duoi 0!");

		if(strcmp(choice, "money", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh $%s.", number_format(amount));
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgMoney[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "rimkit", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgRimKit[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "firework", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgFirework[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "7daygvip", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgGVIP[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "1monthgvip", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgGVIPEx[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "7daysvip", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgSVIP[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "1monthsvip", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgSVIPEx[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "carslot", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgCarSlot[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "toyslot", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgToySlot[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "fullarmor", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgArmor[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "firstaid", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgFirstaid[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "ddflag", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgDDFlag[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "gateflag", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgGateFlag[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "credits", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgCredits[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "priorityad", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgPriorityAd[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "healthnarmor", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgHealthNArmor[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "giftreset", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgGiftReset[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "material", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgMaterial[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "warning", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgWarning[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "pot", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgPot[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "crack", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgCrack[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "paintballtoken", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgPaintballToken[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "viptoken", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgVIPToken[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "respectpoint", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgRespectPoint[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "carvoucher", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgCarVoucher[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "buddyinvite", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgBuddyInvite[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "laser", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgLaser[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "customtoy", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgCustomToy[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "admutereset", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgAdmuteReset[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "newbiemutereset", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgNewbieMuteReset[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "restrictedcarvoucher", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgRestrictedCarVoucher[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else if(strcmp(choice, "platvipvoucher", true) == 0)
		{
			// Prepare the proper and approriate string
			switch(type)
			{
				case 0:
				{
					// Little check to make sure they're not inserting invalid values
					if(amount < 0 || amount > 1)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Vo hieu | 1 - Kich hoat");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da vo hieu Gift box.");
						case 1: format(string, sizeof(string), "Ban da kich hoat Gift box.");
						default: return true;
					}
				}
				case 1:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 2:
				{
					format(string, sizeof(string), "Ban da thiet lap so luong qua tang thanh %d.", amount);
				}
				case 3:
				{
					if(amount < 0 || amount > 3)
						return SendClientMessageEx(playerid, COLOR_RED, "0 = Thong Dung | 1 = Thong Thuong | 2 = Hiem | 3 = Sieu Hiem");

					switch(amount)
					{
						case 0: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Dung.");
						case 1: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Thong Thuong.");
						case 2: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Hiem.");
						case 3: format(string, sizeof(string), "Ban da thiet lap cac muc thanh Sieu Hiem.");
						default: return true;
					}
				}
				default: return true;
			}

			// Set the data to the variable
			dgPlatinumVIPVoucher[type] = amount;

			// Save the GiftBox Stuff
			SaveDynamicGiftBox();

			// Send the client message
			SendClientMessageEx(playerid, COLOR_WHITE, string);
		}
		else
			return SendClientMessageEx(playerid, COLOR_GRAD1, "Lua chon khong hop le!");
	}
	else
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong phai Executive Administrator!");
	return true;
}

CMD:viewgiftbox(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
		ShowPlayerDynamicGiftBox(playerid);
	}
	else
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong phai Executive Administrator!");
	return true;
}

CMD:togdynamicgift(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 7)
	{
		if(IsDynamicGiftBoxEnabled == false)
		{
			IsDynamicGiftBoxEnabled = true;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da kich hoat Dynamic GiftBox, xin vui long su dung /dgedit de sua item giftbox.");
		}
		else if(IsDynamicGiftBoxEnabled == true)
		{
			IsDynamicGiftBoxEnabled = false;
			SendClientMessageEx(playerid, COLOR_WHITE, "Ban da vo hieu hoa Dynamic Giftbox.");
		}
	}
	else
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong phai Executive Administrator!");
	return true;
}

CMD:fireworknear(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float: pos[3];
        SendClientMessageEx(playerid, COLOR_RED, "* Liet ke tat ca phao hoa cua ban trong ban kinh 30 met..");
		for(new i, string[128]; i < MAX_PLAYERS; i++)
		{
			if(RocketExplosions[i] != -1)
			{
				pos[0] = GetPVarFloat(i, "fxpos");
				pos[1] = GetPVarFloat(i, "fypos");
				pos[2] = GetPVarFloat(i, "fzpos");
				if(IsPlayerInRangeOfPoint(playerid, 30, pos[0], pos[1], pos[2]))
				{
					format(string, sizeof(string), "** Chu so huu phao hoa: %s | %f tu ban", GetPlayerNameEx(i), GetPlayerDistanceFromPoint(playerid, GetPVarFloat(i, "fxpos"), GetPVarFloat(i, "fypos"), GetPVarFloat(i, "fzpos")));
					SendClientMessageEx(playerid, COLOR_WHITE, string);
				}
			}
		}
	}
	else
		return SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong the su dung lenh nay!");
	return true;
}
