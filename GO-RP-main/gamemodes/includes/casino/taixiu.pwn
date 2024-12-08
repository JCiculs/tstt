#include <a_samp>
#include <YSI_Coding\y_hooks>

new BaoTriTaiXiu;
new PTX_HoanTien[MAX_PLAYERS];
new TaiXiu_stt;
new TaiXiu[1000];
new TimeTaiXiu = 30;
new pTaiXiu[MAX_PLAYERS];
new mTaiXiu[MAX_PLAYERS];
new ChonTaiAll;
new ChonXiuAll;
new TienCuocTaiAll;
new TienCuocXiuAll;
new Phientaixiu = 1;
new TienIdTaiWin = -1;
new TienIdXiuWin = -1;
new IdTaiWin = -1;
new IdXiuWin = -1;
new TTPhienTaiXiu[1000][1024];
new TTWinTaiXiu[1000][1024];
new TTCuocTaiXiu[1000][1024];
new KetQuaTaiXiu;
new TaiXiuHoanTien;

hook OnGameModeInit(){
	for(new i; i < 1000; i++)
	{
	    TaiXiu[i] = -1;
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	// tai xiu by cadell
    if(dialogid == 123)
	{
	    if(GetPVarInt(playerid,"phien") > 0)
	    {
	        if(response)
	    	{
	    	    /*if(listitem == 3)
	    	    {
	    	        new str[128];
	    	        format(str,128,"Thong tin nhung nguoi dat Tai trong phien %d",GetPVarInt(playerid,"phien"));
	    	        ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, str, TienIdTaiWin[GetPVarInt(playerid,"phien")],"Dong","");
				}*/
	    	    if(listitem == 5)
				{
				    new str[128];
				    new string2[1024];
				    format(string2,sizeof(string2),"Ten\tSo tien thang cuoc\n%s",TTWinTaiXiu[GetPVarInt(playerid,"phien")]);
				    format(str,128,"Thong tin nhung nguoi thang trong phien %d",GetPVarInt(playerid,"phien"));
				    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, str, string2,"Dong","");
				}
				if(listitem == 6)
				{
				    new str[128];
					new string2[1024];
				    format(string2,sizeof(string2),"Ten\tDat cuoc vao\tso tien\n%s",TTCuocTaiXiu[GetPVarInt(playerid,"phien")]);
				    format(str,128,"Thong tin nhung nguoi da dat cuoc trong phien %d",GetPVarInt(playerid,"phien"));
				    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST_HEADERS, str,string2,"Dong","");
				}
	    	}
	    }
	}
}


stock PhanTramTX(playerid)
{
    new a = mTaiXiu[playerid]*2,b = a/100, str[64];
    b = b*5;
	format(str,64,"%i",b);
    a = a - strval(str);
    return a;
}
stock ThanhToanTaiXiu()
{
	new string[128];
	for(new i = 999; i >= 0; i--)
	{
	    new playerid = TaiXiu[i];
	    if(TaiXiu[i] != -1)
		{
			new moneylon,moneytra = Businesses[6][bSafeBalance] - TienCuocXiuAll - TienCuocTaiAll;
		    if(TienCuocXiuAll > TienCuocTaiAll)
			{
				moneylon = (TienCuocXiuAll - TienCuocTaiAll);
				if(moneylon > moneytra)
				{
					if(pTaiXiu[playerid] == 2 && mTaiXiu[playerid] > 0)
					{
					    mTaiXiu[playerid] -= 1;
					    PTX_HoanTien[playerid] = PTX_HoanTien[playerid] + 1;
					    TienCuocXiuAll -= 1;
					    Businesses[6][bSafeBalance] -= 1;
					    i++;
					}
				}
			}
			if(TienCuocXiuAll < TienCuocTaiAll)
			{
				moneylon = (TienCuocTaiAll - TienCuocXiuAll);
				if(moneylon > moneytra)
				{
					if(pTaiXiu[playerid] == 1 && mTaiXiu[playerid] > 0)
					{
					    mTaiXiu[playerid] -= 1;
					    PTX_HoanTien[playerid] = PTX_HoanTien[playerid] + 1;
					    TienCuocTaiAll -= 1;
					    Businesses[6][bSafeBalance] -= 1;
					    i++;
					}
				}
			}
			if(mTaiXiu[playerid] == 0)
			{
			    pTaiXiu[playerid] = 0;
			}
		}
	}
    for(new playerid; playerid < MAX_PLAYERS; playerid++)
    {
        new tiencuoc = mTaiXiu[playerid];
        switch(pTaiXiu[playerid])
	   	{
	   	    case 1:
	   	    {
		        if(tiencuoc > TienIdTaiWin)
			    {
			        IdTaiWin = playerid;
			        TienIdTaiWin = tiencuoc;
			    }
			}
			case 2:
			{
			    if(tiencuoc > TienIdXiuWin)
		        {
		            IdXiuWin = playerid;
		            TienIdXiuWin = tiencuoc;
		        }
		    }
	    }
        if(PTX_HoanTien[playerid] > 0)
		{
	        format(string,128,"[TAI XIU] Ban duoc tra tien %s$ va loai khoi phien nay de can bang tien giua tai va xiu",number_format(PTX_HoanTien[playerid]));
			SendClientMessage(playerid, -1,string);
			SendClientMessage(playerid, -1, "[TAI XIU] Co gang tham gia som hon de khong bi loai ra nhe ^^.");
			GivePlayerCash(playerid, PTX_HoanTien[playerid]);
			TaiXiuHoanTien += PTX_HoanTien[playerid];
		}
	}
}
CMD:togtaixiu(playerid, params[])
{
	if(PlayerInfo[playerid][pTogTaiXiu] == 0)
	{
		PlayerInfo[playerid][pTogTaiXiu] = 1;
		SendClientMessageEx(playerid, -1, "Ban da tat kenh Tai Xiu.");
	}
	else
	{
		PlayerInfo[playerid][pTogTaiXiu] = 0;
		SendClientMessageEx(playerid, -1, "Ban da bat kenh Tai Xiu.");
	}
	return 1;
}
CMD:taixiu(playerid, params[])
{
    if(PlayerInfo[playerid][pTogTaiXiu] == 0)
	{
		if(PlayerInfo[playerid][pLevel] <2 )
		{
			SendClientMessageEx(playerid, -1, "Ban phai dat Level 2 tro len de co the choi Tai Xiu.");
			return 1;
		}
	    new string[128], chon[32], tiencuoc;
	    if(sscanf(params, "s[32]d", chon, tiencuoc))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "SU DUNG: /taixiu [0 = tai | 1 = xiu] [price]");
			SendClientMessage(playerid, 0xFFFFFFAA, "SU DUNG: /taixiuinfo de xem thong tin phien hien tai");
			SendClientMessage(playerid, 0xFFFFFFAA, "SU DUNG: /thongtinphien [so phien tai xiu] de xem thong tin cua phien cu");
			return 1;
		}
	    if(BaoTriTaiXiu == 1)
		{
		    SendClientMessage(playerid, 0xFFFFFFAA, "Song tai xiu chi mo luc 19h - 23h");
			return 1;
		}
		else if(TimeTaiXiu <= 3) return SendClientMessage(playerid, 0xFFFFFFAA, "[TAI XIU] Ban dat qua cham, hay nhanh tay hon o phien sau");
		else if(tiencuoc < 1 || tiencuoc > 20000) return SendClientMessage(playerid, 0xFFFFFFAA, "[TAI XIU] Tien cuoc khong the duoi $1,000 va tren $20,000.");
		else if(pTaiXiu[playerid] > 0) return SendClientMessage(playerid, 0xFFFFFFAA, "[TAI XIU] Ban da dat cuoc o phien nay roi");
		else if(PlayerInfo[playerid][pCash] < tiencuoc) return SendClientMessage(playerid, 0xFFFFFFAA, "[TAI XIU] Ban khong co du tien de dat cuoc");
		//else if(GetPlayerCash(playerid) < tiencuoc) return SendClientMessage(playerid, 0xFFFF0000, "[TAI XIU] Ban Khong Du Tien De Dat Tai Xiu");
		else if(strcmp(chon,"0",true) == 0)
		{
	        pTaiXiu[playerid] = 1;
	        ChonTaiAll++;
	        mTaiXiu[playerid] = tiencuoc;
	        GivePlayerCash(playerid,-tiencuoc);
	        TienCuocTaiAll += tiencuoc;
	        Businesses[6][bSafeBalance] += tiencuoc;
	        format(string,sizeof(string),"[TAI XIU] Ban da dat cuoc %s$ vao{ff0000} Tai{FFFFFF} o phien tai xiu so %d",number_format(tiencuoc),Phientaixiu);
	        SendClientMessage(playerid, -1, string);
	        TaiXiu[TaiXiu_stt] = playerid;
	        TaiXiu_stt++;

	        format(TTCuocTaiXiu[Phientaixiu],1024,"%s\n%s\t{ff0000}Tai{ffffff}\t%s$",TTCuocTaiXiu[Phientaixiu],GetPlayerNameEx(playerid),number_format(tiencuoc));
		}
		else if(strcmp(chon,"1",true) == 0)
		{
	        pTaiXiu[playerid] = 2;
	        ChonXiuAll++;
	        mTaiXiu[playerid] = tiencuoc;
	        GivePlayerCash(playerid,-tiencuoc);
	        TienCuocXiuAll += tiencuoc;
	        Businesses[6][bSafeBalance] += tiencuoc;
	        format(string,sizeof(string),"[TAI XIU] Ban da dat cuoc %s$ vao{3aea46} Xiu{FFFFFF} o phien tai xiu so %d",number_format(tiencuoc),Phientaixiu);
	        SendClientMessage(playerid, -1, string);
	        TaiXiu[TaiXiu_stt] = playerid;
	        TaiXiu_stt++;

	        format(TTCuocTaiXiu[Phientaixiu],1024,"%s\n%s\t{3aea46}Xiu{ffffff}\t%s$",TTCuocTaiXiu[Phientaixiu],GetPlayerNameEx(playerid),number_format(tiencuoc));
		}
	}
	else SendClientMessage(playerid, -1, "Kenh choi tai xiu dang tat !");
	return 1;
}

CMD:taixiuinfo(playerid, params[])
{
    if(BaoTriTaiXiu == 1) return 1;
	new string[128],taixiu[32],taixiuid[32],string2[1024];
	switch(pTaiXiu[playerid])
	{
		case 1: taixiu = "{ff0000}Tai{ffffff}";
		case 2: taixiu = "{3aea46}Xiu{ffffff}";
    }
	format(string,sizeof(string),"{ffec8b}_____________TAI XIU(%d)_(Con %d giay)_____________",Phientaixiu,TimeTaiXiu);
	SendClientMessage(playerid, -1, string);
	format(string,sizeof(string),"{ff0000}Tai {ffffff}(%d nguoi)>>> VS <<<{3aea46}Xiu {ffffff}(%d nguoi)",ChonTaiAll,ChonXiuAll);
	SendClientMessage(playerid, -1, string);
	format(string,sizeof(string),"{ff0000}Tai {ffffff}({33aa6d}$%s{ffffff})>>> VS <<<{3aea46}Xiu {ffffff}({33aa6d}$%s{ffffff})",number_format(TienCuocTaiAll),number_format(TienCuocXiuAll));
	SendClientMessage(playerid, -1, string);
	if(pTaiXiu[playerid] == 1)
	{
		format(string,sizeof(string),"Ban da dat cuoc vao {ff0000}Tai{ffffff} so tien %s $",number_format(mTaiXiu[playerid]));
 		SendClientMessage(playerid, -1, string);
	}
	if(pTaiXiu[playerid] == 2)
	{
		format(string,sizeof(string),"Ban da dat cuoc vao {3aea46}Xiu{ffffff} so tien %s $",number_format(mTaiXiu[playerid]));
 		SendClientMessage(playerid, -1, string);
	}
	format(string,sizeof(string),"{ffec8b}____________________________________________");
	SendClientMessage(playerid, -1, string);
	new szDialog[1024];
	new a;
	while(a < 1000)
	{
		new play = TaiXiu[a];
		if(play != -1)
		{
		    switch(pTaiXiu[play])
			{
				case 1: taixiuid = "{ff0000}Tai{ffffff}";
				case 2: taixiuid = "{3aea46}Xiu{ffffff}";
	    	}
			format(szDialog, sizeof(szDialog), "%s\n%s\t%s\t%s", szDialog, GetPlayerNameEx(play),taixiuid,number_format(mTaiXiu[play]));
		}
		a++;
	}
	format(string2,sizeof(string2),"Ten\tDat cuoc vao\tso tien\n%s",szDialog);
	if(!isnull(szDialog))
	{
 		strdel(szDialog, 0, 1);
	  	ShowPlayerDialog(playerid, 123,DIALOG_STYLE_TABLIST_HEADERS, "Tai Xiu info",string2,"chon", "thoat");
 	}
	return 1;
}

CMD:thongtinphien(playerid, params[])
{
    if(BaoTriTaiXiu == 1) return 1;
	new number;
    if(sscanf(params, "d", number))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "SU DUNG: /thongtinphien [phien]");
	}
	new string1[128];
	format(string1,sizeof(string1),"Phien Tai Xiu %d",number);
    SetPVarInt(playerid,"phien",number);
  	ShowPlayerDialog(playerid, 123,DIALOG_STYLE_LIST,string1,TTPhienTaiXiu[number],"chon", "thoat");

	return 1;
}


CMD:toglichsu(playerid, params[])
{
    if(InfoMessage[playerid] == false)
    {
        SendClientMessageEx(playerid, COLOR_WHITE, "Ban da bat lich su chien dau.");
        InfoMessage[playerid] = true;
    }
    else
    {
        SendClientMessageEx(playerid, COLOR_WHITE, "Ban da tat lich su chien dau.");
        InfoMessage[playerid] = false;
    }
    return 1;
}



CMD:locktaixiu(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 7) return 1;
	if(BaoTriTaiXiu == 0)
    {
        BaoTriTaiXiu = 1;
		SendClientMessageToAllEx(COLOR_RED, "[TAI XIU] Tai Xiu Da Bi Khoa Se Mo Khoa Tu 19:00 - 23:00");
    }
    else
    {
        BaoTriTaiXiu = 0;
		SendClientMessageToAllEx(COLOR_RED, "[TAI XIU] Tai Xiu Da Duoc Mo Khoa..");
    }
	return 1;
}

task eventtaixiu[1000]()
{
    if(BaoTriTaiXiu == 1) return 1;
    if(TimeTaiXiu > 0)
	{
	    TimeTaiXiu--;
	}
	if(TimeTaiXiu == 0)
	{
	    
	    new string[128],ketqua[32];
		new random1,random2,random3;
		random1=random(6)+1; random2=random(6)+1; random3=random(6)+1;
		new ketquaxucxac=random1+random2+random3;
		if(ketquaxucxac>10){
			KetQuaTaiXiu = 1;
			ketqua = "{ff0000}Tai{ffffff}";
		}
		else{
			KetQuaTaiXiu = 2;
			ketqua = "{3aea46}Xiu{ffffff}";
		}
		new totalwealth;
		totalwealth = TienCuocTaiAll + TienCuocXiuAll;
		ThanhToanTaiXiu();

		if(IdTaiWin != -1) TienIdTaiWin = PhanTramTX(IdTaiWin);
		if(IdXiuWin != -1) TienIdXiuWin = PhanTramTX(IdXiuWin);
	    foreach(new i: Player)
		{
			if(pTaiXiu[i] == KetQuaTaiXiu)
			{
			    mTaiXiu[i] = PhanTramTX(i);
        		format(string,sizeof(string),"Chuc mung ban da thang o phien tai xiu %d va ban nhan duoc %s$",Phientaixiu,number_format(mTaiXiu[i]));
        		SendClientMessage(i, -1, string);
            	format(TTWinTaiXiu[Phientaixiu], 1024,"%s\n%s\t%s",
                TTWinTaiXiu[Phientaixiu],
				GetPlayerNameEx(i),number_format(mTaiXiu[i]));
            	GivePlayerCash(i, mTaiXiu[i]);
            	Businesses[6][bSafeBalance] -= mTaiXiu[i];
			}
		    if(TienCuocTaiAll == 0 && KetQuaTaiXiu == 1)
			{

			    if(PlayerInfo[i][pTogTaiXiu] == 0)
			    {
					    format(string,sizeof(string),"[TAI XIU] Ket qua xuc xac so %d : %d - %d - %d (Tong diem: %d)",Phientaixiu,random1,random2,random3,ketquaxucxac);
					    SendClientMessage(i, -1, string);
		        		format(string,sizeof(string),"[TAI XIU] Phien #%d khui ra: {ff0000}Tai {ffffff}(Tong tien cuoc: %s$)",Phientaixiu,number_format(totalwealth));
		        		SendClientMessage(i, -1, string);
	        	}
			}
			if(TienCuocTaiAll > 0 && KetQuaTaiXiu == 1)
			{
			    if(PlayerInfo[i][pTogTaiXiu] == 0)
			    {
					    format(string,sizeof(string),"[TAI XIU] Ket qua xuc xac so %d : %d - %d - %d (Tong diem: %d)",Phientaixiu,random1,random2,random3,ketquaxucxac);
					    SendClientMessage(i, -1, string);
		        		format(string,sizeof(string),"[TAI XIU] Phien #%d khui ra: {ff0000}Tai {ffffff}(Tong tien cuoc: %s$ - An nhieu nhat: %s [%s$])",Phientaixiu,number_format(totalwealth),GetPlayerNameEx(IdTaiWin),number_format(TienIdTaiWin));
		        		SendClientMessage(i, -1, string);
				}
			}
			if(TienCuocXiuAll == 0 && KetQuaTaiXiu == 2)
			{
			    if(PlayerInfo[i][pTogTaiXiu] == 0)
			    {
					    format(string,sizeof(string),"[TAI XIU] Ket qua xuc xac so %d : %d - %d - %d (Tong diem: %d)",Phientaixiu,random1,random2,random3,ketquaxucxac);
					    SendClientMessage(i, -1, string);
		        		format(string,sizeof(string),"[TAI XIU] Phien #%d khui ra: {3aea46}Xiu {FFFFFF}(Tong tien cuoc: %s$)",Phientaixiu,number_format(totalwealth));
		        		SendClientMessage(i, -1, string);
				}
			}
			if(TienCuocXiuAll > 0 && KetQuaTaiXiu == 2)
			{
			    if(PlayerInfo[i][pTogTaiXiu] == 0)
			    {
					    format(string,sizeof(string),"[TAI XIU] Ket qua xuc xac so %d : %d - %d - %d (Tong diem: %d)",Phientaixiu,random1,random2,random3,ketquaxucxac);
					    SendClientMessage(i, -1, string);
		        		format(string,sizeof(string),"[TAI XIU] Phien #%d khui ra: {3aea46}Xiu {FFFFFF}(Tong tien cuoc: %s$ - An nhieu nhat: %s [%s$])",Phientaixiu,number_format(totalwealth),GetPlayerNameEx(IdXiuWin),number_format(TienIdXiuWin));
		        		SendClientMessage(i, -1, string);
				}
			}
        	/*if(pTaiXiu[i] != KetQuaTaiXiu && pTaiXiu[i] > 0)
        	{
        		SendClientMessage(i, -1, "[TAI XIU] ban da thua trong phien nay");
			}*/
		}
		new year, month, day;
		new gio, phut, giay;
		gettime(gio, phut, giay);
		getdate(year, month, day);
		format(TTPhienTaiXiu[Phientaixiu], 1024, "Thoi gian: %d/%d/%d - %d:%d:%d\n\
		Ket qua: %s\n\
		Tong Tien Cuoc Tai: %s\n\
		Tong Tien Cuoc Xiu: %s\n\
		Tong Tien Hoan Tra: %s\n\
		>> Chi Tiet Nguoi Thang Cuoc.\n\
		>> Chi Tiet Nguoi Choi Dat Cuoc.",
		month, day, year, gio, phut, giay,
		ketqua,
		number_format(TienCuocTaiAll),
		number_format(TienCuocXiuAll),
		number_format(TaiXiuHoanTien));

	 	if(Phientaixiu < 999)
	 	{
		 	Phientaixiu++;
	 	}
	 	if(Phientaixiu == 999)
	 	{
	 	    Phientaixiu = 1;
	 	}
		KetQuaTaiXiu = 0;
		TimeTaiXiu = 90;
		ChonTaiAll = 0;
		ChonXiuAll = 0;
		TienCuocTaiAll = 0;
		TienCuocXiuAll = 0;
		IdTaiWin = -1;
		IdXiuWin = -1;
		TienIdTaiWin = 0;
		TienIdXiuWin = 0;
        TaiXiu_stt = 0;
        TaiXiuHoanTien = 0;
        for(new i; i < 499; i++)
        {
            TaiXiu[i] = -1;
            PTX_HoanTien[i] = 0;
            pTaiXiu[i] = 0;
            mTaiXiu[i] = 0;
        }
	}
	return 1;
}
