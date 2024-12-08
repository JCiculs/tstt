// Includes được tạo vào 11:09 PM / 22-05-2023 bởi Jonhien //

#include <YSI_Coding\y_hooks>
#include <a_samp>

new PlayerText:ALPR[MAX_PLAYERS][11],
	alprStatus[MAX_PLAYERS],
	SetSpeedLimit[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	alprStatus[playerid] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	alprStatus[playerid] = 0;
	return 1;
}

stock LoadALPRTextdraw(playerid)
{
	ALPR[playerid][0] = CreatePlayerTextDraw(playerid, 483.1329, 385.0993, "mdl-2719:ALPR");
	PlayerTextDrawTextSize(playerid, ALPR[playerid][0], 107.0000, 59.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][0], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][0], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][0], 0);

	ALPR[playerid][1] = CreatePlayerTextDraw(playerid, 518.8341, 401.7597, "~y~East_Los_Santos");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][1], 0.1490, 0.6955);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][1], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][1], -1820929);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][1], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][1], 0);

	ALPR[playerid][2] = CreatePlayerTextDraw(playerid, 516.0355, 409.1705, "~y~Lucas_Freeman");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][2], 0.1490, 0.6955);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][2], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][2], -1820929);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][2], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][2], 0);

	ALPR[playerid][3] = CreatePlayerTextDraw(playerid, 519.2683, 417.1415, "~y~Bobcat");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][3], 0.1490, 0.6955);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][3], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][3], -1820929);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][3], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][3], 0);

	ALPR[playerid][4] = CreatePlayerTextDraw(playerid, 514.0360, 425.6570, "~y~N/A");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][4], 0.1490, 0.6955);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][4], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][4], -1820929);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][4], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][4], 0);

	ALPR[playerid][5] = CreatePlayerTextDraw(playerid, 509.1689, 434.4165, "~y~$1,000");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][5], 0.1490, 0.6955);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][5], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][5], -1820929);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][5], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][5], 0);

	ALPR[playerid][6] = CreatePlayerTextDraw(playerid, 569.0347, 428.1054, "D28F92K");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][6], 0.1840, 0.9943);
	PlayerTextDrawTextSize(playerid, ALPR[playerid][6], 0.0000, 37.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][6], 2);
	PlayerTextDrawColor(playerid, ALPR[playerid][6], 255);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][6], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][6], 0);

	ALPR[playerid][7] = CreatePlayerTextDraw(playerid, 480.6997, 315.7629, "mdl-2719:VRadar");
	PlayerTextDrawTextSize(playerid, ALPR[playerid][7], 161.0000, 69.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][7], 1);
	PlayerTextDrawColor(playerid, ALPR[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][7], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][7], 0);

	ALPR[playerid][8] = CreatePlayerTextDraw(playerid, 514.4330, 342.3073, "999");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][8], 0.4000, 1.6000);
	PlayerTextDrawTextSize(playerid, ALPR[playerid][8], 0.0000, 23.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][8], 2);
	PlayerTextDrawColor(playerid, ALPR[playerid][8], -1115404545);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][8], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][8], 3);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][8], 0);

	ALPR[playerid][9] = CreatePlayerTextDraw(playerid, 553.4237, 342.2518, "999");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][9], 0.4000, 1.6000);
	PlayerTextDrawTextSize(playerid, ALPR[playerid][9], 0.0000, 23.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][9], 2);
	PlayerTextDrawColor(playerid, ALPR[playerid][9], -1825822209);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][9], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][9], 3);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][9], 0);

	ALPR[playerid][10] = CreatePlayerTextDraw(playerid, 599.9961, 337.1737, "999");
	PlayerTextDrawLetterSize(playerid, ALPR[playerid][10], 0.5493, 2.3259);
	PlayerTextDrawTextSize(playerid, ALPR[playerid][10], 0.0000, 33.0000);
	PlayerTextDrawAlignment(playerid, ALPR[playerid][10], 2);
	PlayerTextDrawColor(playerid, ALPR[playerid][10], -1629718785);
	PlayerTextDrawBackgroundColor(playerid, ALPR[playerid][10], 255);
	PlayerTextDrawFont(playerid, ALPR[playerid][10], 3);
	PlayerTextDrawSetProportional(playerid, ALPR[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, ALPR[playerid][10], 0);
	return 1;
}

stock ShowPlayerALPR(playerid)
{
	for(new i = 0; i < 11; i ++) PlayerTextDrawShow(playerid, ALPR[playerid][i]);
	return 1;
}

stock HidePlayerALPR(playerid)
{
	for(new i = 0; i < 11; i ++) PlayerTextDrawHide(playerid, ALPR[playerid][i]);
	return 1;
}

task ALPRUpdate[100]()
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER && alprStatus[i] == 1)
			{
				UpdateALPR();
			}
		}
	}
}

forward UpdateALPR();
public UpdateALPR()
{
	foreach(new p : Player)
    {
        if (!IsPlayerConnected(p) || !IsPlayerInAnyVehicle(p)) continue;

        new target = -1;
        new Float:tempDist = 40.0;

        if(alprStatus[p] == 1)
        {
            foreach(new t : Player)
            {
                if (!IsPlayerInAnyVehicle(t) || t == p || IsPlayerInVehicle(t, GetPlayerVehicleID(p))) continue;

                new Float:distance = GetDistanceBetweenPlayers(p, t);

                if (distance < tempDist)
                {
                    target = t;
                    tempDist = distance;
                }
            }

            new str[60], myvehicle = GetPlayerVehicleID(p);
            format(str, sizeof(str), "%d", SetSpeedLimit[p]);
            PlayerTextDrawSetString(p, ALPR[p][9], str);

            format(str, sizeof(str), "%d", floatround(vehicle_get_speed(myvehicle)));
            PlayerTextDrawSetString(p, ALPR[p][10], str);

            if(target == -1)
            {
                // no target was found
                PlayerTextDrawSetString(p, ALPR[p][1], "~y~N/A"); // Vị trí
                PlayerTextDrawSetString(p, ALPR[p][2], "~y~N/A"); // Chủ sở hữu
                PlayerTextDrawSetString(p, ALPR[p][3], "~y~N/A"); // Model Name
                PlayerTextDrawSetString(p, ALPR[p][4], "~y~N/A"); // Tình trạng (N/A - Bị đánh cắp)
                PlayerTextDrawSetString(p, ALPR[p][5], "~y~N/A"); // Ticket 
                PlayerTextDrawSetString(p, ALPR[p][6], "XXXXXXX");

                PlayerTextDrawSetString(p, ALPR[p][8], "000");
            }
            else
            {
                new targetVehicle = GetPlayerVehicleID(target);
                new Float:speed = player_get_speed(target);

			    new Float: x, 
			    Float: y, 
			    Float: z,
			    location[MAX_ZONE_NAME],
			    location2[MAX_ZONE_NAME];


				GetVehiclePos(targetVehicle, x, y, z);
				Get3DZone(x, y, z, location2, sizeof(location2));
			    GetPlayerStreetZone(x, y, location, location2, sizeof(location));

                format(str, sizeof(str), "~y~%s", location);
                PlayerTextDrawSetString(p, ALPR[p][1], str);

                format(str, sizeof(str), "~y~%s (%i)", GetVehicleName(targetVehicle), targetVehicle);
                PlayerTextDrawSetString(p, ALPR[p][3], str);

                if(SetSpeedLimit[p] > 0)
                {
                	if(floatround(speed, floatround_round) >= SetSpeedLimit[p])
	                {
				        PlayerPlaySound(p, 4203, 0, 0, 0);
	                }
                }

                format(str, sizeof(str), "%d", floatround(speed, floatround_round));
		        PlayerTextDrawSetString(p, ALPR[p][8], str);


                foreach(new i : Player)
                {
                    new veh = GetPlayerVehicle(i, targetVehicle);
                    if (veh != -1 && PlayerVehicleInfo[i][veh][pvTicket] > 0)
                    {
                        format(str, sizeof(str), "~y~$%s", number_format(PlayerVehicleInfo[i][veh][pvTicket]));
                        PlayerTextDrawSetString(p, ALPR[p][5], str);

                        if (gettime() >= (GetPVarInt(p, "_lastTicketWarning") + 10))
                        {
                            SetPVarInt(p, "_lastTicketWarning", gettime());
                            PlayerPlaySound(p, 4202, 0.0, 0.0, 0.0);
                        }
                        
                        format(str, sizeof(str), "%s", PlayerVehicleInfo[i][veh][pvPlate]);
                		PlayerTextDrawSetString(p, ALPR[p][6], str);

                		format(str, sizeof(str), "~y~%s", GetCharacterName(i));
            			PlayerTextDrawSetString(p, ALPR[p][2], str);


                    	if(PlayerVehicleInfo[i][veh][pvPlate])
		                {
		                	format(str, sizeof(str), "~g~Da dang kiem");
		                	PlayerTextDrawSetString(p, ALPR[p][4], str);
		                }
		                else
		                {
		                	format(str, sizeof(str), "~r~Chua dang kiem");
			                PlayerTextDrawSetString(p, ALPR[p][4], str);
			            }
                    }
                }
            }
        }
    }
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(alprStatus[playerid] == 1)
		{
			ShowPlayerALPR(playerid);
		}
	}
	return 1;
}

hook OnPlayerExitVehicle(playerid, vehicle)
{
	if(alprStatus[playerid] == 1)
	{
		HidePlayerALPR(playerid);
	}
	return 1;
}

CMD:setlimit(playerid, params[])
{
	if(!IsACop(playerid)) return SCM(playerid, "~w~Ban khong phai la ~y~LSPD~w~.");
	if(alprStatus[playerid] == 0) return SCM(playerid, "~w~ALPR & Vehicle Radar cua ban hien tai dang ~r~tat~w~, vui long bat len truoc.");
    new string[128], value;
    if(sscanf(params, "d", value)) return SendClientMessageEx(playerid, COLOR_CHAT, "{873D37}SU DUNG:{9E9E9E} /setlimit [value]");
    SetSpeedLimit[playerid] = value;
    format(string, sizeof(string), "Set Limit Value: %d", value);
    SendClientMessageEx(playerid, COLOR_CHAT, string);
    return 1;
}

CMD:alpr(playerid, params[])
{
	if(!IsACop(playerid)) return SCM(playerid, "~w~Ban khong phai la ~y~LSPD~w~.");
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
	{
		if(alprStatus[playerid] == 0)
		{
			LoadALPRTextdraw(playerid);
			alprStatus[playerid] = 1;
			ShowPlayerALPR(playerid);
		}
		else
		{
			HidePlayerALPR(playerid);
			alprStatus[playerid] = 0;
		}
	}
	else
	{
		SCM(playerid, "~w~Ban can phai ngoi tren ~y~1 phuong tien~w~ bat ky de thuc hien lenh nay.");
	}
	return 1;
}