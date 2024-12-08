#include <a_samp>
#include <YSI_Coding\y_hooks>

new Text:Drink;
new Text:Food;
//new SendGvOMessage[MAX_PLAYERS];

hook OnGameModeInit()
{
	Drink = TextDrawCreate(10.000000, 181.000000, "mdl-2014:water_100");
	TextDrawLetterSize(Drink, 0.000000, 0.000000);
	TextDrawTextSize(Drink, 18.000000, 22.000000);
	TextDrawAlignment(Drink, 1);
	TextDrawColor(Drink, -1);
	TextDrawSetShadow(Drink, 0);
	TextDrawSetOutline(Drink, 0);
	TextDrawBackgroundColor(Drink, 255);
	TextDrawFont(Drink, 4);
	TextDrawSetProportional(Drink, 0);
	TextDrawSetShadow(Drink, 0);

	Food = TextDrawCreate(9.000000, 213.000000, "mdl-2015:food_100");
	TextDrawLetterSize(Food, 0.000000, 0.000000);
	TextDrawTextSize(Food, 18.000000, 22.000000);
	TextDrawAlignment(Food, 1);
	TextDrawColor(Food, -1);
	TextDrawSetShadow(Food, 0);
	TextDrawSetOutline(Food, 0);
	TextDrawBackgroundColor(Food, 255);
	TextDrawFont(Food, 4);
	TextDrawSetProportional(Food, 0);
	TextDrawSetShadow(Food, 0);
	return 1;
}

stock GetTrangThaiDrink(playerid)
{
	if(PlayerInfo[playerid][pKhatNuoc] == 0)
	{
		TextDrawSetString(Drink,"mdl-2014:water_0");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] > 0 && PlayerInfo[playerid][pKhatNuoc] <= 15)
	{
		TextDrawSetString(Drink,"mdl-2014:water_10");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] >= 15 && PlayerInfo[playerid][pKhatNuoc] <= 25)
	{
		TextDrawSetString(Drink,"mdl-2014:water_20");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] >= 25 && PlayerInfo[playerid][pKhatNuoc] <= 50)
	{
		TextDrawSetString(Drink,"mdl-2014:water_50");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] >= 50 && PlayerInfo[playerid][pKhatNuoc] <= 75)
	{
		TextDrawSetString(Drink,"mdl-2014:water_70");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] >= 75 && PlayerInfo[playerid][pKhatNuoc] <= 85)
	{
		TextDrawSetString(Drink,"mdl-2014:water_80");
		TextDrawShowForPlayer(playerid, Drink);
	}
	else if(PlayerInfo[playerid][pKhatNuoc] >= 85 && PlayerInfo[playerid][pKhatNuoc] <= 100)
	{
		TextDrawSetString(Drink,"mdl-2014:water_100");
		TextDrawShowForPlayer(playerid, Drink);
	}
	return 1;
}
stock GetTrangThaiFood(playerid)
{
	if(PlayerInfo[playerid][pHunger] == 0)
	{
		TextDrawSetString(Food,"mdl-2015:food_0");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] > 0 && PlayerInfo[playerid][pHunger] <= 15)
	{
		TextDrawSetString(Food,"mdl-2015:food_10");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] >= 15 && PlayerInfo[playerid][pHunger] <= 25)
	{
		TextDrawSetString(Food,"mdl-2015:food_20");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] >= 25 && PlayerInfo[playerid][pHunger] <= 50)
	{
		TextDrawSetString(Food,"mdl-2015:food_40");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] >= 50 && PlayerInfo[playerid][pHunger] <= 75)
	{
		TextDrawSetString(Food,"mdl-2015:food_60");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] >= 75 && PlayerInfo[playerid][pHunger] <= 85)
	{
		TextDrawSetString(Food,"mdl-2015:food_80");
		TextDrawShowForPlayer(playerid, Food);
	}
	else if(PlayerInfo[playerid][pHunger] >= 85 && PlayerInfo[playerid][pHunger] <= 100)
	{
		TextDrawSetString(Food,"mdl-2015:food_100");
		TextDrawShowForPlayer(playerid, Food);
	}
	return 1;
}

task UpdateStatus[1000]()
{
	foreach(new i:Player)
	{
		if(gPlayerLogged{i})
		{
			GetTrangThaiFood(i);
			GetTrangThaiDrink(i);
		}
	}
	return 1;
}
task  UpdateKhatStatus[60000 * 10]()
{
	foreach(new i:Player)
	{
		if(gPlayerLogged{i})
		{
			PlayerInfo[i][pKhatNuoc] -= 5;
		//	SendGvOMessage(i, "Ban Da Bi Tru 20 Do Khat");
		}
	}
}
task  UpdateDoiStatus[60000 * 10]()
{
	foreach(new i:Player)
	{
		if(gPlayerLogged{i})
		{
			PlayerInfo[i][pHunger] -= 5;
		//	SendGvOMessage(i, "Ban Da Bi Tru 20 Do Doi");
		}
	}
}
task DeathHud[30000]()
{
	foreach(new i: Player)
	{
		if(PlayerInfo[i][pKhatNuoc] <= 0 ||PlayerInfo[i][pHunger] <= 0)
		{
			new Float:HealthPlayer;
			GetPlayerHealth(i, HealthPlayer);
			SetPlayerHealth(i, HealthPlayer - 10);
	//		SendGvOMessage(i, "Ban Dang Rat Doi , Vui Long Di An Ngay Lap Tuc");
		}
	}
}

hook OnPlayerConnect(playerid)
{
	TextDrawShowForPlayer(playerid, Drink);
	TextDrawShowForPlayer(playerid, Food);
	return 1;
}
/*CMD:setdrink(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 99999)
	{
		new player,amount;
		if(sscanf(params, "ud", player, amount)) return;

		if(IsPlayerConnected(player))
		{
			PlayerInfo[player][pKhatNuoc] = amount;
		}
		//else SendGvOMessage(playerid, "ID Khong Hop Le");
	}
//	else SendGvOMessage(playerid, "Bug cai lon duoc ne");
	return 1;
}
CMD:setfood(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 99999)
	{
		new player,amount;
		if(sscanf(params, "ud", player, amount)) return;

		if(IsPlayerConnected(player))
		{
			PlayerInfo[player][pHunger] = amount;
		}
		//else SendGvOMessage(playerid, "ID Khong Hop Le");
	}
//	else SendGvOMessage(playerid, "Bug cai lon duoc ne");
	return 1;
}*/
