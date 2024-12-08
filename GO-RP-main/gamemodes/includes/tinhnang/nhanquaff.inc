#include <YSI\y_hooks>
#include <a_samp>

hook OnGameModeInit()
{
	CreateActor(27, 1134.3121,-1472.5818,15.7925,360.00); // npc khoangsan
	CreateDynamic3DTextLabel("{FF00FF}Su kien doi qua Free Fire cuc chat",COLOR_YELLOW,1134.3121,-1472.5818,15.7925+0.5,4.0);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1134.3121,-1472.5818,15.7925))
		{
			new str[200];
			format(str,sizeof(str),"Su kien doi qua Free Fire: Skin hop qua\tSat\tRuby\tVang\nHop qua thuong\t100\t50\t0\nHop qua vang\t300\t100\t5\nHop qua VIP(1 kim cuong)\t500\t200\t10");
			ShowPlayerDialog(playerid,2752,DIALOG_STYLE_TABLIST_HEADERS,"Su kien doi qua cuc khung Lua Chua",str,"{ae0202}Chon","{FFFFFF}Huy");
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == 2753)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pQuathuong] > 0)
				{
					SendClientMessageEx(playerid,-1,"Dang mo qua: 0%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 10%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 20%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 30%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 40%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 50%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 60%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 70%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 80%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 90%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 100%...");
					PlayerInfo[playerid][pQuathuong] -= 1;
					new str[128];
					switch(random(100))
					{
						case 0..30:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc 500$ tu hop qua thuong",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung thuong 500$");
							PlayerInfo[playerid][pCash] += 500;
						}
						case 31..40:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s khong mo duoc gi tu hop qua thuong",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							SendClientMessageEx(playerid,-1,"Chuc ban may man lan sau!");
						}
						case 41..90:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot chiec Sadler tu hop qua thuong",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung mot chiec xe Sadler");
							new Float: arr_fPlayerPos[4];
							GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
							GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
							CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 543, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 126, 126, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

						}
						case 91..98:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot hop qua thuong tu hop qua thuong",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da duoc tang them mot hop qua thuong");
							PlayerInfo[playerid][pQuathuong]++;
						}
						case 99..100:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot hop qua vang tu hop qua vang",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot hop qua vang");
							PlayerInfo[playerid][pQuavang]++;
						}
					}
				}
				else return ChatHoTro(playerid,255,"Ban khong co hop qua thuong",5000);
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pQuavang] > 0)
				{
					SendClientMessageEx(playerid,-1,"Dang mo qua: 0%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 10%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 20%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 30%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 40%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 50%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 60%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 70%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 80%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 90%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 100%...");
					PlayerInfo[playerid][pQuavang] -= 1;
					new str[128];
					switch(random(100))
					{
						case 0..30:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc 1000$ tu hop qua vang",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung thuong 1000$");
							PlayerInfo[playerid][pCash] += 1000;
						}
						case 31:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot chiec rimkit tu hop qua vang",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung thuong mot chiec rimkit");
							PlayerInfo[playerid][pRimMod] += 1;
						}
						case 32..40:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va khong nhan duoc gi",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Chuc ban may man lan sau!");							
						}
						case 41..45:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va nhan duoc vip gold 1 thang",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc vip gold 1 thang [/myvouchers] de xem");	
							PlayerInfo[playerid][pGVIPVoucher] += 1;						
						}
						case 46..70:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va nhan duoc hop qua vang",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot hop qua vang");	
							PlayerInfo[playerid][pQuavang] += 1;
						}
						case 71:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va nhan duoc mot chiec xe Sultan",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot chiec xe Sultan");	
							new Float: arr_fPlayerPos[4];
							GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
							GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
							CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 560, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 126, 126, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

						}
						case 72..90:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va nhan duoc mot can nha loai nho",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot can nha loai nho, hay lien he Admin de nhan qua");								
						}
						case 91..100:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da mo hop qua vang va nhan duoc mot can nha loai vua",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot can nha loai vua, hay lien he Admin de nhan qua");							
						}
					}
				}
				else return ChatHoTro(playerid,255,"Ban khong co hop qua Vang",5000);
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pQuavip] > 0)
				{
					SendClientMessageEx(playerid,-1,"Dang mo qua: 0%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 10%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 20%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 30%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 40%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 50%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 60%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 70%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 80%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 90%...");
					await task_ms(1000);
					SendClientMessageEx(playerid,-1,"Dang mo qua: 100%...");
					PlayerInfo[playerid][pQuavip] -= 1;
					new str[128];
					switch(random(100))
					{
						case 0..30:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc 10000$ tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung thuong 10000$");
							PlayerInfo[playerid][pCash] += 10000;							
						}
						case 31..50:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot can nha loai vua tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung mot can nha loai vua, hay lien he Admin de nhan qua");
						}
						case 51..55:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot can nha loai to tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung mot can nha loai to, hay lien he Admin de nhan qua");							
						}
						case 56..60:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot Car Voucher tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung mot Car Voucher tu hop qua VIP");
							PlayerInfo[playerid][pVehVoucher] += 1;							
						}
						case 61..80:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc mot can nha custom tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung mot can nha custom tu hop qua VIP, hay lien he Admin de nhan qua");
						}
						case 81..85:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc 10 hop qua vang tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung 10 hop qua Vang tu hop qua VIP");
							PlayerInfo[playerid][pQuavang] += 10;
						}
						case 86..100:{
							format(str,sizeof(str),"Su kien doi qua Free Fire: %s da nhan duoc VIP Kim cuong 30 ngay tu hop qua VIP",GetPlayerNameEx(playerid));
							Log("logs/quafreefire.log", str);
							ABroadCast(COLOR_YELLOW, str, 2);
							SendClientMessageEx(playerid,-1,"Ban da trung VIP Kim cuong 30 ngay tu hop qua VIP, hay lien he Admin de nhan qua");						
						}
					}
				}
				else return ChatHoTro(playerid,255,"Ban khong co hop qua VIP",5000);
			}
		}
	}
	if(dialogid == 2752)
	{
		if(response)
		{
			if(listitem == 0) // hop qua thuong
			{
				if(PlayerInfo[playerid][pSat] >= 100 && PlayerInfo[playerid][pRuby] >= 50)
				{
					PlayerInfo[playerid][pSat] -= 100;
					PlayerInfo[playerid][pRuby] -= 50;
					PlayerInfo[playerid][pQuathuong] += 1;
					ChatHoTro(playerid,255,"Ban da mua mot hop qua thuong tu su kien Free Fire cuc chat",5000);
				}
				else return ChatHoTro(playerid,255,"Ban khong co du khoang san de doi qua Free Fire cuc vip",5000);
			}
			if(listitem == 1) // hop qua vang
			{
				if(PlayerInfo[playerid][pSat] >= 300 && PlayerInfo[playerid][pRuby] >= 100 && PlayerInfo[playerid][pVang] >= 5)
				{
					PlayerInfo[playerid][pSat] -= 300;
					PlayerInfo[playerid][pRuby] -= 100;
					PlayerInfo[playerid][pVang] -= 5;					
					PlayerInfo[playerid][pQuavang] += 1;
					ChatHoTro(playerid,255,"Ban da mua mot hop qua Vang tu su kien Free Fire cuc chat",5000);
				}
				else return ChatHoTro(playerid,255,"Ban khong co du khoang san de doi qua Free Fire cuc vip",5000);
			}
			if(listitem == 2) // hop qua VIP
			{
				if(PlayerInfo[playerid][pSat] >= 500 && PlayerInfo[playerid][pRuby] >= 200 && PlayerInfo[playerid][pVang] >= 10 && PlayerInfo[playerid][pKimCuong] >=1)
				{
					PlayerInfo[playerid][pSat] -= 500;
					PlayerInfo[playerid][pRuby] -= 200;
					PlayerInfo[playerid][pVang] -= 10;
					PlayerInfo[playerid][pKimCuong] -= 1;
					PlayerInfo[playerid][pQuavip] += 1;
					ChatHoTro(playerid,255,"Ban da mua mot hop qua VIP tu su kien Free Fire cuc chat",5000);
				}
				else return ChatHoTro(playerid,255,"Ban khong co du khoang san de doi qua Free Fire cuc vip",5000);
			}
		}
	}
	return 1;
}

CMD:moqua(playerid,params)
{
	new str[128];
	format(str,sizeof(str),"Su kien doi qua Free Fire: Goi qua\tSo luong\nHop qua thuong\t%d\nHop qua vang\t%d\nHop qua VIP\t%d",PlayerInfo[playerid][pQuathuong],PlayerInfo[playerid][pQuavang],PlayerInfo[playerid][pQuavip]);
	ShowPlayerDialog(playerid,2753,DIALOG_STYLE_TABLIST_HEADERS,"Hop qua cua ban",str,"Chon","Huy");
	return 1;
}
