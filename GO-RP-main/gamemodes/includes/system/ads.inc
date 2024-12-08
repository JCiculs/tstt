#include <YSI_Coding\y_hooks>
#include <a_samp>
new SDTGoiADS[MAX_PLAYERS];
new soluongquangcao;
new dangxoa;
enum QC_Enum
{
	QC_Noidung[124],
	QC_SDT
}

new QuangCao[100][QC_Enum];

hook OnGameModeInit()
{
	soluongquangcao = 0;
	dangxoa = 0;
	return 1;
}

forward DeleteADS(vitriADS);
public DeleteADS(vitriADS)
{
	if(dangxoa == 1) return SetTimerEx("DeleteADS", 1000, 0, "d",vitriADS);
	for(new i=vitriADS;i<soluongquangcao;i++){
		dangxoa = 1;
		new str[124];
		format(str, 124,"%s",QuangCao[i+1][QC_Noidung]);
		QuangCao[i][QC_Noidung] = str;
		QuangCao[i][QC_SDT] = QuangCao[i+1][QC_SDT];
	}
	soluongquangcao --;
	dangxoa = 0;
	return 1;
}

forward TimViTriADS(qcsdt);
public TimViTriADS(qcsdt)
{
	new cothe=1;
	for(new i=0;i<soluongquangcao;i++){
		if(cothe == 0) break;
		if(QuangCao[i][QC_SDT] == qcsdt){
			SetTimerEx("DeleteADS", 1000, 0, "d",i);
			cothe = 0;
			break;
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_ADMAIN1H)
	{
		if(response)
		{
			if(strlen(inputtext) > 124) return cmd_ads(playerid,"/");
			new noidungne[124];
			format(noidungne,124,"%s",inputtext);
			QuangCao[soluongquangcao][QC_SDT] = PlayerInfo[playerid][pPnumber];
			QuangCao[soluongquangcao][QC_Noidung] = noidungne;
			SetTimerEx("TimViTriADS", 60000*60, 0, "i",QuangCao[soluongquangcao][QC_SDT]);
			soluongquangcao++;
			GivePlayerCash(playerid,-5);
			SendClientMessageEx(playerid,-1,"Dat quang cao thanh cong, quang cao ton tai trong 1 gio. ($5)");
		}
		else return cmd_ads(playerid,"/");
	}
	if(dialogid == DIALOG_ADMAINTG)
	{
		if(response)
		{
			if(PlayerInfo[playerid][pPnumber] == 0) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban khong co dien thoai");
			if(strlen(inputtext) > 124) return cmd_ads(playerid,"/");
			new noidungne[124];
			format(noidungne,124,"%s",inputtext);
			QuangCao[soluongquangcao][QC_SDT] = PlayerInfo[playerid][pPnumber];
			QuangCao[soluongquangcao][QC_Noidung] = noidungne;
			SetTimerEx("TimViTriADS", 60000*60*5, 0, "i",QuangCao[soluongquangcao][QC_SDT]);
			soluongquangcao++;
			GivePlayerCash(playerid,-100);
			SendClientMessageEx(playerid,-1,"Dat quang cao the gioi thanh cong, quang cao ton tai trong 5 gio. ($100)");
			new str[124];
			format(str,sizeof(str),"{00a6ff}Advertisement: %s. Lien he: %d",noidungne,PlayerInfo[playerid][pPnumber]);
			SendClientMessageToAll(COLOR_YELLOW,str);
		}
		else return cmd_ads(playerid,"/");
	}
	if(dialogid == DIALOG_ADMAINGOI)
	{
		if(response)
		{
			new str[128];
			format(str,sizeof(str),"%d",SDTGoiADS[playerid]);
			return cmd_goi(playerid,str);
		}
		else return cmd_ads(playerid,"/");
	}
	if(dialogid == DIALOG_ADMAIN)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: ShowPlayerDialog(playerid,DIALOG_ADMAIN1H,DIALOG_STYLE_INPUT,"> Nhap quang cao","Hay nhap quang cao phia duoi (124 ky tu)","Gui","Huy");
				case 1: ShowPlayerDialog(playerid,DIALOG_ADMAINTG,DIALOG_STYLE_INPUT,"> Nhap quang cao","Hay nhap quang cao phia duoi (124 ky tu)","Gui","Huy");
				case 2: return cmd_ads(playerid,"/");
				case 4..100:{
					new str[200];
					format(str,sizeof(str),"* %s\nBan co muon goi %d?",QuangCao[listitem-4][QC_Noidung],QuangCao[listitem-4][QC_SDT]);
					ShowPlayerDialog(playerid,DIALOG_ADMAINGOI,DIALOG_STYLE_MSGBOX,"> Quang cao",str,"Goi","Huy");
					SDTGoiADS[playerid] = QuangCao[listitem-4][QC_SDT];
				}
			}
		}
	}
	return 1;
}

CMD:ads(playerid,params[])
{
	if(PlayerInfo[playerid][pPnumber] == 0) return SendClientMessageEx(playerid, COLOR_WHITE,"Ban khong co dien thoai");
	{
	new str[4096];
	format(str,sizeof(str),"Dat quang cao ({088A29}5${FFFFFF})\nDat quang cao the gioi ({088A29}100${FFFFFF})\n            - (Click Loading) -\n \n");
	for(new i=0;i<soluongquangcao;i++){
		format(str,sizeof(str),"%s%s (%d)\n",str,QuangCao[i][QC_Noidung],QuangCao[i][QC_SDT]);
	}
	ShowPlayerDialog(playerid,DIALOG_ADMAIN,DIALOG_STYLE_LIST,"> Quang cao",str,"Chon","Huy");
	return 1;
	}
}
