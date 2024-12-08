#include <YSI_Coding\y_hooks>


hook OnPlayerDeath(playerid, killerid, reason)
{
	if(SuDungMask[playerid] == 1)
	{
		SuDungMask[playerid] = 0;
		new playerName[MAX_PLAYER_NAME+1];
		GetPVarString(playerid, "NameMask", playerName, sizeof(playerName));

		RemovePlayerAttachedObject(playerid, 1);

		SetPlayerName(playerid, playerName);

		PlayerInfo[playerid][pMask] = 0;
	}
   	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	if(SuDungMask[playerid] == 1)
	{
		SuDungMask[playerid] = 0;
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
    if(SuDungMask[playerid] == 1)
	{
		SuDungMask[playerid] = 0;
		new playerName[MAX_PLAYER_NAME+1];
		GetPVarString(playerid, "NameMask", playerName, sizeof(playerName));

		RemovePlayerAttachedObject(playerid, 1);

		SetPlayerName(playerid, playerName);
	}
    return 1;
}

CMD:mask(playerid, params[])
{
	new string[2080];
	if(PlayerInfo[playerid][pMask] == 1)
	{
		if(SuDungMask[playerid] == 0)
		{
			SuDungMask[playerid] = 1;

			new playerName[MAX_PLAYER_NAME+1];
		    GetPlayerName(playerid, playerName, MAX_PLAYER_NAME);
		    SetPVarString(playerid, "NameMask", playerName);

		    SetPlayerAttachedObject(playerid, 1, 19036,2, 0.093999, 0.026000, -0.004999, 93.800018, 82.199951, -3.300001, 1.098000, 1.139999, 1.173000);

			SetPlayerToTeamColor(playerid);
		    format(string, sizeof(string), "Stranger_%d", playerid+5315);
		    SetPlayerName(playerid, string);
		    format(string, sizeof(string), "[He Thong] %s (ID %d) Da Deo Mat Na Len Ten Mat Na La %s ", playerName, playerid, GetPlayerNameEx(playerid));
            ABroadCast(COLOR_YELLOW, string, 2);
		    format(string, sizeof(string), "* Nguoi la lay mat na ra va deo len mat.");
	      	ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
		else {
			SuDungMask[playerid] = 0;
			new playerName[MAX_PLAYER_NAME+1];
    		GetPVarString(playerid, "NameMask", playerName, sizeof(playerName));

    		RemovePlayerAttachedObject(playerid, 1);

			SetPlayerName(playerid, playerName);
			format(string, sizeof(string), "* Nguoi la mat da thao mat na va cat di.");
	      	ProxDetector(15.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}
	}
	else {
		SendClientMessage(playerid, -1, "{FF0000}[?] {FFFFFF}Ban khong co mat na trong nguoi!");
	}
	return 1;
}

CMD:muamatna(playerid, params[])
{
	if (!IsAt247(playerid)) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "   Ban khong dung o cua hang 24/7!");
        return 1;
    }
    
	if(PlayerInfo[playerid][pMask] == 0)
	{
		if(PlayerInfo[playerid][pCash] >= 5000)
		{
			PlayerInfo[playerid][pCash] -= 5000;
			SendClientMessage(playerid, -1, "{FF0000}[!] {FFFFFF}Ban da mua mat na voi gia $5.000");
			PlayerInfo[playerid][pMask] = 1;
		}
	}
	else {
		SendClientMessage(playerid, -1, "{FF0000}[?] {FFFFFF}Ban khong the mua them bat ky mat na nao");
	}
	return 1;
}