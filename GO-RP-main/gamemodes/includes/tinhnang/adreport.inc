#include <YSI_Coding\y_hooks>
#include <a_samp>

new SOSReportText[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	SOSReportText[playerid] = -1;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(SOSReportText[playerid] != -1)
	{
		new str[128];
		new giveplayerid = SOSReportText[playerid];
		if(PlayerInfo[playerid][pAdmin] < 2)
		{
			format(str,sizeof(str),"{FF7F24}[AdReply]{FFFFFF} Nguoi choi %s vua thoat khoi may chu nen bao cao ket thuc",GetPlayerNameEx(playerid));
		}
		else format(str,sizeof(str),"{FF7F24}[AdReply]{FFFFFF} Admin %s da thoat khoi may chu nen bao cao ket thuc",GetPlayerNameEx(playerid));
		DeletePVar(giveplayerid,"ReportSOS");		
		SOSReportText[giveplayerid] = -1;
	}
	return 1;
}

CMD:baocao(playerid, params[])
{
    if(GetPVarInt(playerid, "ReportSOS") == 1) {
		SendClientMessageEx(playerid, COLOR_GREY, "Ban chi co the co 1 bao cao. (/huybaocao)");
	}
 	else if(PlayerInfo[playerid][pAdmin] >= 2 && PlayerInfo[playerid][pAdmin] < 6) {
		SendClientMessageEx(playerid, COLOR_GRAD2, "You can't submit reports as an administrator.");
	}
	else if(PlayerInfo[playerid][pRMuted] != 0) {
	    //ShowPlayerDialog(playerid, 7955, DIALOG_STYLE_MSGBOX,"Report blocked","You are blocked from submitting any reports!\n\nTips when reporting:\n- Report what you need, not who you need.\n- Be specific, report exactly what you need.\n- Do not make false reports.\n- Do not flame admins.\n- Report only for in-game items.\n- For shop orders use the /shoporder command","Dong", "");
		ChatHoTro(playerid,255,"~r~Ban dang bi mute report!",5000);
	}
	else {
	    //ShowPlayerDialog(playerid, DIALOG_REPORTMENU, DIALOG_STYLE_LIST, "Bao cao", "Vi pham luat\nBug\nNonRP Name\nVan de ve Shop\nYeu cau unmute\nLien he rieng voi Admin","Chon", "Thoat");
		if(isnull(params)) return ChatThatBai(playerid,255,"Su dung: [/baocao (noi dung)]",5000);
		ChatThanhCong(playerid,255,"Ban da gui bao cao thanh cong",5000);
		SetPVarInt(playerid,"ReportSOS",1);
		SendReportToQue(playerid, params, 2, 5);
	}
	return 1;
}
CMD:huybaocao(playerid,params)
{
	if(GetPVarInt(playerid, "ReportSOS") != 1) return ChatThatBai(playerid,255,"Ban khong co bao cao nao",5000);
    for(new i = 0; i < MAX_REPORTS; i++)
	{
	    if(Reports[i][ReportFrom] == playerid)
	    {
	        Reports[i][ReportFrom] = INVALID_PLAYER_ID;
			Reports[i][BeingUsed] = 0;
			Reports[i][TimeToExpire] = 0;
        	Reports[i][ReportPriority] = 0;
        	Reports[i][ReportLevel] = 0;
			DeletePVar(playerid, "HasReport");

			if(GetPVarInt(Reports[i][ReportFrom], "RequestingAdP") == 1)
			{
				DeletePVar(Reports[i][ReportFrom], "PriorityAdText");
				DeletePVar(Reports[i][ReportFrom], "RequestingAdP");
			}
			DeletePVar(playerid,"ReportSOS");
			return ChatThanhCong(playerid,255,"Ban da huy bao cao thanh cong",5000);
		}
	}
	return 1;
}

CMD:adreply(playerid,params[])
{
	new str[400];
	if(SOSReportText[playerid] == -1) return ChatHoTro(playerid,255,"Ban khong co bao cao nao",5000);
	if(isnull(params)) return ChatHoTro(playerid,255,"Su dung ~r~[/adreply (noidung)]",5000);
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		format(str,sizeof(str),"{FF7F24}(( [AdReply] {FFFFFF}Admin %s: {FF7F24}%s ))",GetPlayerNameEx(playerid),params);
		SendClientMessageEx(SOSReportText[playerid],0xFF7F24FF,str);
		SendClientMessageEx(playerid,0xFF7F24FF,str);
	}
	else
	{
		format(str,sizeof(str),"{FF7F24}(( [AdReply] {FFFFFF}Member %s: {FF7F24}%s ))",GetPlayerNameEx(playerid),params);
		SendClientMessageEx(playerid,0xFF7F24FF,str);
		SendClientMessageEx(SOSReportText[playerid],0xFF7F24FF,str);
	}
	return 1;
}
CMD:ketthucsos(playerid,params)
{
	if(PlayerInfo[playerid][pAdmin] < 2) return 1;
	if(SOSReportText[playerid] == -1) return ChatHoTro(playerid,255,"~r~Ban dang khong trong tro giup nao!",5000);
	new giveplayerid = SOSReportText[playerid];
	new str[128];
	format(str,sizeof(str),"{FF7F24}(( [END-SOS] {FFFFFF}Admin %s{FF7F24} vua ket thuc phien ho tro! ))",GetPlayerNameEx(playerid));
	SendClientMessageEx(giveplayerid,0xFF7F24FF,str);
	ABroadCast(0xFF7F24FF,str,2);
	SendClientMessageEx(playerid,0xFF7F24FF,"Ban da ket thuc bao cao");
	DeletePVar(giveplayerid,"ReportSOS");
	SOSReportText[giveplayerid] = -1;
	SOSReportText[playerid] = -1;
	return 1;
}
CMD:chapnhansos(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params,"d",giveplayerid)) return ChatThatBai(playerid,255,"Su dung: /chapnhansos [ID]",5000);
	if(IsPlayerConnected(giveplayerid))
	{
		if(GetPVarInt(giveplayerid,"ReportSOS") != 1) return ChatThatBai(playerid,255,"Nguoi choi khong co bao cao nao",5000);
		if(SOSReportText[playerid] != -1) return ChatThatBai(playerid,255,"Ban dang duyet 1 bao cao khac (/ketthucsos) de ket thuc",5000);
		if(SOSReportText[giveplayerid] != -1) return ChatThatBai(playerid,255,"Dang co nguoi duyet bao cao nay",5000);
		SOSReportText[playerid] = giveplayerid;
		SOSReportText[giveplayerid] = playerid;
		new str[128];
		format(str,128,"{FF7F24}(( [ACCEPT-SOS] {FFFFFF}%s {FF7F24}vua chap nhan S.O.S cua: %s",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid));
		ABroadCast(0xFF7F24FF,str,2);
		format(str,128,"{FFFFFF}Admin %s {FF7F24}vua chap nhan yeu cau bao cao cua ban (([/adreply] de noi chuyen voi admin))",GetPlayerNameEx(playerid));
		SendClientMessageEx(giveplayerid,0xFF7F24FF,str);
	}
	else return ChatThatBai(playerid,255,"Nguoi choi khong online",5000);
	return 1;
}
CMD:tuchoisos(playerid,params[])
{
	new giveplayerid, reason[50];
	if(sscanf(params,"ds[50]",giveplayerid, reason)) return ChatThatBai(playerid,255,"Su dung: /tuchoisos [ID] [noi dung]",5000);
	if(IsPlayerConnected(giveplayerid))
	{
		if(GetPVarInt(giveplayerid,"ReportSOS") != 1) return ChatThatBai(playerid,255,"Nguoi choi khong co bao cao nao",5000);
		if(SOSReportText[giveplayerid] != -1) return ChatThatBai(playerid,255,"Dang co nguoi duyet bao cao nay",5000);
		DeletePVar(giveplayerid,"ReportSOS");
		SOSReportText[giveplayerid] = -1;
		new str[128];
		format(str,128,"{FF7F24}(( [ACCEPT-SOS] {FFFFFF}%s {FF7F24}vua tu choi S.O.S cua: %s | ly do: %s",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid), reason);
		ABroadCast(0xFF7F24FF,str,2);
		format(str,128,"{FFFFFF}Admin %s {FF7F24}vua tu choi yeu cau bao cao cua ban | Li do: %s",GetPlayerNameEx(playerid), reason);
		SendClientMessageEx(giveplayerid,0xFF7F24FF,str);
	}
	else return ChatThatBai(playerid,255,"Nguoi choi khong online",5000);
	return 1;		
}
CMD:reportsold(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128];
		SendClientMessageEx(playerid, COLOR_GREEN, "____________________ BAO CAO _____________________");
		for(new i = 0; i < MAX_REPORTS; i++)
		{
			if(Reports[i][BeingUsed] == 1 && Reports[i][ReportPriority] == 5)
			{
			    if(Reports[i][ReportLevel] == 2 || PlayerInfo[playerid][pAdmin] >= 2)
			    {
					//format(string, sizeof(string), "%s (ID: %i) | RID: %i | Bao cao: %s | Thoi gian: %d phut truoc | Uu tien: %i", GetPlayerNameEx(Reports[i][ReportFrom]), Reports[i][ReportFrom], i, (Reports[i][Report]), Reports[i][TimeToExpire], Reports[i][ReportPriority]);
					format(string, sizeof(string),"{FF7F24}(( [SOS] [ID:%d] %s bao cao:%s )) [/chapnhansos %d]",Reports[i][ReportFrom],GetPlayerNameEx(Reports[i][ReportFrom]),(Reports[i][Report]));
					SendClientMessageEx(playerid, COLOR_REPORT, string);
				}
			}
		}
		SendClientMessageEx(playerid, COLOR_GREEN, "___________________________________________________");
	}
	return 1;
}

CMD:reports(playerid, params[]) return cmd_reportsold(playerid, params);
CMD:xembaocao(playerid, params[])
{
	return cmd_reportsold(playerid, params);
}
