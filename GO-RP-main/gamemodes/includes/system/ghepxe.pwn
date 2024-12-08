#include <YSI_Coding\y_hooks>

#define DIALOG_GHEPXE       (150301)

CMD:chetaoxe(playerid, params[])
{
    if(PlayerInfo[playerid][pLevel] > 0)
	{
	   ShowPlayerDialog(playerid, DIALOG_GHEPXE, DIALOG_STYLE_LIST,"HE THONG GHEP XE","Bullet\nSFPD\nHPV-1000\nSWAT-VAN\nPOLICE RANGER\nFBI TRUCK","Dong Y","Huy");
	}
	else
	{
	   SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong the su dung lenh nay.");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_GHEPXE)
	{
	    if(response)
	    {
	       	if(listitem == 0)
		    {
			    if(PlayerInfo[playerid][pRuby] >= 250)
			    if(PlayerInfo[playerid][pSat] >= 400)
			    if(PlayerInfo[playerid][pVang] >= 10)
			    
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung Vat Pham ( Bullet ) da che tao thanh cong mot chiec ( Bullet )");
                	PlayerInfo[playerid][pRuby] -= 250;
                	PlayerInfo[playerid][pSat] -= 400;
                	PlayerInfo[playerid][pVang] -= 10;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG CHE TAO] %s da che tao thanh cong mot chiec (Bullet), Vo tay~~~~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 541, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[HE THONG CHE TAO] Ban Khong Co Du Vat Pham De Che Tao (250 Ruby - 400 Sat - 10 Vang).");
                }
			}
			if(listitem == 1)
		    {
				if(PlayerInfo[playerid][pVang] >= 300)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 300 Manh Xe ( LSPD ) de ghep thanh cong mot chiec ( LSPD )");
                	PlayerInfo[playerid][pVang] -= 300;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (Xe Police SFPD), Vo tay~~~~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 7, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			if(listitem == 3)
		    {
				if(PlayerInfo[playerid][pVang] >= 200)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 200 Manh Xe ( LVPD ) de ghep thanh cong mot chiec ( LVPD )");
                	PlayerInfo[playerid][pVang] -= 200;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (Xe Police LVPD), Qua gat roi may anh em oi .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 598, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 4)
		    {
				if(PlayerInfo[playerid][pVang] >= 400)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 400 Manh Xe ( HPV-1000 ) de ghep thanh cong mot chiec ( HPV-1000 )");
                	PlayerInfo[playerid][pVang] -= 400;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (HPV-1000), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 598, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (400 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 5)
		    {
				if(PlayerInfo[playerid][pVang] >= 800)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 800 Manh Xe ( SWAT-VAN ) de ghep thanh cong mot chiec ( SWAT-VAN )");
                	PlayerInfo[playerid][pVang] -= 800;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (SWAT-VAN), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 601, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (800 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 6)
		    {
				if(PlayerInfo[playerid][pVang] >= 200)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 200 Manh Xe ( POLICE RANGER ) de ghep thanh cong mot chiec ( POLICE RANGER )");
                	PlayerInfo[playerid][pVang] -= 200;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (POLICE RANGER), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 599, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (200 manh ghep) moi co the ghep thanh cong.");
                }
			}
			//
			if(listitem == 7)
		    {
				if(PlayerInfo[playerid][pVang] >= 300)
                {
                	SendClientMessage(playerid, COLOR_YELLOW,"Ban da su dung 300 Manh Xe ( FBI Truck ) de ghep thanh cong mot chiec ( FBI Truck )");
                	PlayerInfo[playerid][pVang] -= 300;
                	//========================================================//
                	new string[128];
					format(string, sizeof(string), "[HE THONG GHEP XE] %s da ghep thanh cong mot chiec (FBI Truck), That la dinh~ dinh~ .", GetPlayerNameEx(playerid));
					SendClientMessageToAll(COLOR_WHITE, string);
		            Log("logs/ghepxe.log", string);
			     	new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 528, arr_fPlayerPos[0]+2, arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                }
                else
                {
                	SendClientMessage(playerid, COLOR_RED,"[!] Ban da that bai khi ghep xe, can phai co du (300 manh ghep) moi co the ghep thanh cong.");
                }
			}
		}
 }
	return 1;
}

