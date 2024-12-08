#include <a_samp>
#include <YSI_Coding\y_hooks>
#include "./includes/ntv/commands.pwn"

#define DIALOG_PHONGVAN (555)
#define DIALOG_PHONGVAN1 (666)
#define DIALOG_PHONGVAN2 (777)

CMD:invitephongvan(playerid, params[])
{
	new giveplayerid, str[128];

	if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, -1, "/invitephongvan [ID/NAME]");
	if(IsPlayerConnected(giveplayerid))
	//if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the tu lam tren chinh ban than minh"); return 1; }
	
	if(IsACop(playerid))
	{
		SetPVarInt(playerid, "INVITEPHONGVAN", 1);
		format(str, 128, "%s da tham gia phong van vui long cho ket qua",GetPlayerNameEx(giveplayerid));
		SendClientMessage(playerid, -1, str);
		SetPVarInt(giveplayerid, "PHONGVAN", 1);
		ShowPlayerDialog(giveplayerid, DIALOG_PHONGVAN, DIALOG_STYLE_INPUT, "PHONG VAN", "Hay tra loi cau hoi\nTHOI GIAN:15 giay\nHay suy nghi cho ky cau tra loi\nLUAT:thong tin ap dung OOC vao IC duoc gio la luat gi\n1 MG\n 2DM\3 SK","TRA LOI","HUY");
	}
	
	else SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la mot lanh dao co quyen han phong van");

	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_PHONGVAN)
	{
		if(!response)
		{
			SendClientMessage(playerid, COLOR_GREY, "Ban da huy phong van fail 1/5");
		}
		else
		{
			if(strfind(inputtext, "1", true) == 0)
			{
				SendClientMessage(playerid, -1,"Ban da tra loi dung 1/5");
				ShowPlayerDialog(playerid, DIALOG_PHONGVAN1, DIALOG_STYLE_INPUT, "PHONG VAN", "Hay tra loi cau hoi\nTHOI GIAN:15 giay\nHay suy nghi cho ky cau tra loi\nLUAT:Khi ban dang o mot khu dong nguoi ma giet mot nguoi nao do truoc mat nguoi khac? duoc goi la gu\n1 DM\n 2 KOS\3 CB","TRA LOI","HUY");
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Ban da tra loi sai fail 1/5");
				ShowPlayerDialog(playerid, DIALOG_PHONGVAN1, DIALOG_STYLE_INPUT, "PHONG VAN", "Hay tra loi cau hoi\nTHOI GIAN:15 giay\nHay suy nghi cho ky cau tra loi\nLUAT:Khi ban dang o mot khu dong nguoi ma giet mot nguoi nao do truoc mat nguoi khac? duoc goi la gu\n1 DM\n 2 KOS\3 CB","TRA LOI","HUY");
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_PHONGVAN1)
	{
		if(!response)
		{
			SendClientMessage(playerid, COLOR_GREY, "Ban da huy phong van fail 2/5");
		}
		else
		{
			if(strfind(inputtext, "2", true) == 0)
			{
				SendClientMessage(playerid, -1,"Ban da tra loi dung 2/5");
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Ban da tra loi sai fail 2/5");
			}
		}
		return 1;
	}
	return 1;
}
