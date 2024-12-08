
#include <YSI_Coding\y_hooks>

#define  THOIGIANLAYTHAN 5
hook OnGameModeInit(){
	CreateDynamic3DTextLabel("{66CC66}Noi lam viec\n\n(/laythan)\tKhu mo than",COLOR_YELLOW,2162.1455,-1999.0358,14.1977+0.5,4.0);
	return 1;
}
new timelaythan[MAX_PLAYERS];
hook OnPlayerDisconnect(playerid, reason)
{
	dakhaithac[playerid] = 0;
	KillTimer(timelaythan[playerid]);
	DeletePVar(playerid, "laythan");
	RemovePlayerAttachedObject(playerid, 0);
	RemovePlayerAttachedObject(playerid, 1);
}
CMD:laythan(playerid, params[])
{

		if(GetPVarType(playerid, "laythan") == 1)
			return SendClientMessage(playerid, COLOR_GREY, "Ban dang thuc hien");

		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2162.1455,-1999.0358,14.1977))
		{
			SetPVarInt(playerid, "laythan", 1);
			SetPlayerAttachedObject(playerid, 1, 19631, 6, 0.443999, 0.060999, -0.007999, -128.6, 173.7, -85.5, 1.0, 1.0, 1.0);
			ApplyAnimation(playerid, "SWORD", "sword_4", 4.0999, 1, 0, 0, 0, 0);
			GameTextForPlayer(playerid, "~w~Bat dau lay than...", 5000, 1);
			//SetTimer("OnPlayerLayThan", 5000, 0);
			timelaythan[playerid] = SetTimerEx("OnPlayerLayThan", THOIGIANLAYTHAN*1000, 0, "dd",playerid);

		}
		else
			SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan vi tri lay than");
		return 1;
}

forward OnPlayerLayThan(playerid);
public OnPlayerLayThan(playerid)
{
	if(GetPVarInt(playerid, "laythan") == 1)
	{
		DeletePVar(playerid, "laythan");
		dakhaithac[playerid] = 1;
		RemovePlayerAttachedObject(playerid, 1);
		ClearAnimations(playerid);
		PlayerInfo[playerid][pServiceTime] = gettime()+10;
		TogglePlayerControllable(playerid, 1);
		SetPlayerCheckpoint(playerid, 2075.6323,-2006.9265,13.5469, 3.0);
		SetPlayerAttachedObject(playerid, 0, 3930, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
		SendClientMessage(playerid, -1, "Ban dao duoc mot cuc than hay rinh no vao vi tri de than");
	}
}
hook OnPlayerEnterCheckpoint(playerid)
{
	if(dakhaithac[playerid] == 1)
	{
		if(gettime() < PlayerInfo[playerid][pServiceTime])
		{ 
			Kick(playerid);
			printf("%s Da bi kick vi su dung hacking", GetPlayerNameEx(playerid));
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 2075.6323,-2006.9265,13.5469))
		{
			dakhaithac[playerid] = 0;
			KillTimer(timelaythan[playerid]);
			DisablePlayerCheckpoint(playerid);
			RemovePlayerAttachedObject(playerid, 0);
			ClearAnimations(playerid);
			TogglePlayerControllable(playerid, 1);
			switch(random(2))
			{
				case 0:
				{
					PlayerInfo[playerid][pCash] += 15;
					SendClientMessage(playerid, -1, "Ban nhan duoc tien tu viec khai thac than 15$");
				}
				case 1:
				{
					PlayerInfo[playerid][pCash] += 15;
					PlayerInfo[playerid][pThuocSung] ++;
					SendClientMessage(playerid, -1, "Ban nhan duoc 15$ tien tu viec khai thac than.");
					SendClientMessage(playerid, -1,"Nhat duoc mot chut thuoc sung");
				}
			}
		}
		else
		{
			DisablePlayerCheckpoint(playerid);
			KillTimer(timelaythan[playerid]);
			RemovePlayerAttachedObject(playerid, 0);
			dakhaithac[playerid] = 0;
		}
	}

}
