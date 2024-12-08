#include <YSI_Coding\y_hooks>

const 
	DIALOG_HIRE_VEHICLE = 2022;

enum E_HIRE_VEHICLE_DATA
{
	thuexemodel,
	giathuexe,
}

static hireInfo[][E_HIRE_VEHICLE_DATA] =
{
	{510, 2000}
	
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
			if(GetPlayerVirtualWorld(playerid) == 0  && GetPlayerInterior(playerid) == 0)
			{
				if(PlayerInfo[playerid][pCash] >= hireInfo[index][giathuexe])
				{
					new 
						Float:x, Float:y, Float:z;

					GetPlayerPos(playerid, x, y, z);
					hireVehicleId[playerid] = CreateVehicle(hireInfo[index][thuexemodel], x, y, z, 90, -1, -1, -1);
					GivePlayerCash(playerid, -hireInfo[index][giathuexe]);
					PutPlayerInVehicle(playerid, hireVehicleId[playerid], 0);

					VehicleFuel[hireVehicleId[playerid]] = 100.0;
				}
			}
			else SendClientMessage(playerid, -1, "[!] Ban chi co the thue xe o the gioi that.");
		}
	}
	return 0;
}

CMD:thuexeproproc(playerid)
{
	if(!hireVehicleId[playerid])
	{
		new str[300];
		for(new i = 0; i <= sizeof(hireInfo) -1; i ++)
		{
			format(str, sizeof(str), "%s\n%s ($%s)", str, VehicleName[hireInfo[i][thuexemodel] - 400], number_format(hireInfo[i][giathuexe]));
		}
		ShowPlayerDialog(playerid, DIALOG_HIRE_VEHICLE, DIALOG_STYLE_LIST, "Thue Xe", str, "Thue", "Huy");
	}
	return 1;
}
