#include <YSI_Coding\y_hooks>
const 
	DIALOG_HIRE_VEHICLE = 2022;

enum E_HIRE_VEHICLE_DATA
{
	hv_Model,
	hv_Price,
}

static hireInfo[][E_HIRE_VEHICLE_DATA] =
{
	{453, 200} // id xe gia xe
//	{462, 1250}, // id xe gia xe
//	{489, 1500} //id xe gia xe
};

static
	hireVehicleId[MAX_PLAYERS] = {0,...};

hook OnPlayerConnect(playerid)
{
	hireVehicleId[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	if(hireVehicleId[playerid])
	{
		DestroyVehicle(hireVehicleId[playerid]);
		stop FinishHire(playerid);
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_HIRE_VEHICLE && response)
	{
		new index = listitem;
		if(0 <= index <= sizeof(hireInfo) - 1)
		{
				if(PlayerInfo[playerid][pCash] >= hireInfo[index][hv_Price])
				{
					new 
						Float:x, Float:y, Float:z;

					GetPlayerPos(playerid, x, y, z);
					SendClientMessage(playerid, -1, "{66FF33}Ban da thue mot phuong tien - co thoi gian la 120 phut (thoat game se bi mat xe)");
					hireVehicleId[playerid] = CreateVehicle(hireInfo[index][hv_Model], 464.4939,-1927.1388,-0.7551, 90, -1, -1, 0);
					GivePlayerCash(playerid, -hireInfo[index][hv_Price]);
					PutPlayerInVehicle(playerid, hireVehicleId[playerid], 0);
					defer FinishHire(playerid);
				}
			}
		}
	return 0;
}

CMD:thuexe(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 423.7521,-1890.5820,2.0243))
	{
	if(!hireVehicleId[playerid])
	{
		new str[300];
		for(new i = 0; i <= sizeof(hireInfo) -1; i ++)
		{
			format(str, sizeof(str), "%s\n%s ($%s)", str, VehicleName[hireInfo[i][hv_Model] - 400], number_format(hireInfo[i][hv_Price]));
		}
		ShowPlayerDialog(playerid, DIALOG_HIRE_VEHICLE, DIALOG_STYLE_LIST, "He thong thue xe", str, "{ae0202}Chon","{FFFFFF}Huy");
		}
	}
	return 1;
}

timer FinishHire[7200000](playerid)
{
	if(hireVehicleId[playerid])
	{
		DestroyVehicle(hireVehicleId[playerid]);
		hireVehicleId[playerid] = 0;
		SendClientMessage(playerid, -COLOR_GREY, "Ban da het thoi gian thue phuong tien - phuong tien da bi huy");
	}
}
