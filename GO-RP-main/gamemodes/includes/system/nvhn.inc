/*
	made by quang huy
*/

#include <YSI_Coding\y_hooks>
#include <a_samp>

#define DIALOG_NVHN 2800

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == DIALOG_NVHN)
	{
		if(!response) return 1;
		if(PlayerInfo[playerid][pNVMiner] >= 8 && PlayerInfo[playerid][pNVPizza] >= 5 && PlayerInfo[playerid][pNVTruck] >= 20 && PlayerInfo[PlayerInfo][pNVOnline] >= 30)
		{
			if(PlayerInfo[playerid][pNVDaNhan] == 0)
			{
				PlayerInfo[playerid][pNVKhoBau] += 1;
				PlayerInfo[playerid][pNVDaNhan] = 1;
				ChatHoTro(playerid,255,"Ban vua nhan duoc mot hom kho bau tu phan thuong nhiem vu hang ngay",5000);	
			}
			else ChatHoTro(playerid,255,"Ban da nhan phan thuong ngay hom nay roi !",5000);
		}
	}
	return 1;
}

CMD:nhiemvu(playerid,params)
{
	new str[1248];
	format(str,sizeof(str),"{FFFFFF}Nhiem vu Trucker\t{BDBDBD}%d/{58FA58}20 {FFFFFF}thung hang\nNhiem vu Pizza\t{BDBDBD}%d/{58FA58}5 {FFFFFF}chuyen\nNhiem vu Miner\t{BDBDBD}%d/{58FA58}8 {FFFFFF}cuc da\nThoi gian Online\t{BDBDBD}%d/{58FA58}30 {FFFFFF}phut",
			PlayerInfo[playerid][pNVTruck],PlayerInfo[playerid][pNVPizza],PlayerInfo[playerid][pNVMiner],PlayerInfo[playerid][pNVOnline]);
	ShowPlayerDialog(playerid, DIALOG_NVHN, DIALOG_STYLE_MSGBOX, "{A4A4A4}Nhiem vu hang ngay",str,"Nhan thuong","Huy bo");
	return 1;
}