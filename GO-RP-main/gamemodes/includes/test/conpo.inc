#include <YSI_Coding\y_hooks>
const MAX_GRASS = 20;

new 
	player_fed[MAX_PLAYERS],
	player_grass[MAX_PLAYERS], player_cp_fed[MAX_PLAYERS], player_time_fed[MAX_PLAYERS];

new const Float:cow_pos[][] = 
{
	{-913.5104, -564.0698, 24.7579},
	{-912.7842, -572.6274, 23.3132},
	{-919.4968, -570.5179, 23.6435},
	{-920.9568, -557.1888, 25.5204},
	{-932.0703, -561.1192, 25.1544},
	{-926.7429, -576.3782, 23.2911},
	{-921.2476, -584.6594, 23.8032}
};

new const Float:grass_pos[][] =
{
	{-898.4528, -554.6115, 26.0900, 260.8176},
	{-888.1139, -566.7441, 29.8733, 209.4305},
	{-891.7451, -547.1021, 27.4844, 44.9523},
	{-881.8949, -555.7625, 31.4684, 15.1854},
	{-899.7763, -535.3710, 26.1331, 40.8789},
	{-916.0803, -559.7542, 25.3936, 129.8665},
	{-941.2408, -590.9286, 23.7429, 155.5600},
	{-933.5249, -599.9118, 25.7461, 233.5808},
	{-941.2445, -609.2556, 26.3086, 136.1332},
	{-952.5250, -603.9150, 26.2118, 30.5389},
	{-957.7560, -593.9626, 24.5924, 11.4254},
	{-953.5338, -584.9532, 23.1250, 333.5117}
};

hook OnGameModeInit()
{
	CreateDynamicObject(19833, -913.5104, -564.0698, 24.7579 - 1.0,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19833, -912.7842, -572.6274, 23.3132 - 1.0,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19833, -919.4968, -570.5179, 23.6435 - 1.0,   0.00000, 0.00000, 113.00000);
	CreateDynamicObject(19833, -920.9568, -557.1888, 25.5204 - 1.0,   0.00000, 0.00000, 69.00000);
	CreateDynamicObject(19833, -932.0703, -561.1192, 25.1544 - 1.0,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(19833, -926.7429, -576.3782, 23.2911 - 1.0,   0.00000, 0.00000, -102.00000);
	CreateDynamicObject(19833, -921.2476, -584.6594, 23.8032 - 1.0,   0.00000, 0.00000, 156.00000);
}

hook OnPlayerConnect(playerid)
{
	player_fed[playerid] = 0;
	player_grass[playerid] = 0;	
	player_cp_fed[playerid] = 0;
	player_time_fed[playerid] = 0;
}


hook OnPlayerEnterCheckpoint(playerid)
{
	if(player_cp_fed[playerid])
	{
		player_cp_fed[playerid] = 0;
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1);
		player_grass[playerid] = ++player_grass[playerid] > MAX_GRASS ? MAX_GRASS : player_grass[playerid];
		DisablePlayerCheckpoint(playerid);
		
		new 
			string[128];
		
		format(string, 128, "Ban da cat duoc %d/%d.", player_grass[playerid], MAX_GRASS);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
	}
}


stock Cow_GetRandomGrassPos(&Float:x, &Float:y, &Float:z)
{
	new 
		i = random(sizeof(grass_pos));

	x = grass_pos[i][0];
	y = grass_pos[i][1];
	z = grass_pos[i][2];
}

CMD:catco(playerid)
{
	if(CheckPointCheck(playerid)) return SendClientMessageEx(playerid, COLOR_WHITE, "Xin hay chac chan rang cac diem checkpoint cua ban da bi xoa bo.");
	if(player_grass[playerid] >= MAX_GRASS)
		return SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Ban da du 20 co, hay cho bo an.");

	new Float:X, Float:Y, Float:Z;
	Cow_GetRandomGrassPos(X, Y, Z);
	SetPlayerCheckpoint(playerid, X, Y, Z, 1.0);
	player_cp_fed[playerid] = 1;
	return 1;
}

CMD:choan(playerid)
{
	if(player_time_fed[playerid] - gettime() > 0) return SendClientMessage(playerid, COLOR_GRAD1, "Vui long doi 1 lat hay cho an tiep");
	if(player_grass[playerid])
	{
		new result;
		for(new i = 0; i < sizeof(cow_pos); i ++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, cow_pos[i][0], cow_pos[i][1], cow_pos[i][2] - 1.0))
			{
				result = 1;
				break;
			}
		}
		if(result)
		{
			new 
				string[128], count = MAX_GRASS / 2;

			player_grass[playerid] --;
			player_fed[playerid] ++;
			format(string, 128, "Ban da cho bo an %d. Ban se nhan duoc $200 khi cho bo an them %d nua", player_grass[playerid], (count - player_fed[playerid]));
			SendClientMessageEx(playerid, COLOR_YELLOW, string);			
			if(player_fed[playerid] >= count)
			{
				player_fed[playerid] = 0;
				PlayerInfo[playerid][pCash] += 200;
				SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Ban da cho bo an 10 lan va nhan duoc $200");
			}
			player_time_fed[playerid] = gettime() + 5;
		}
		else SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Ban khong dung gan con bo nao ca.");
	}
	else SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Ban khong du co de cho bo an. (/catco)");
	return 1;
}
