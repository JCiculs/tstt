static
PlayerText:TDEditor_TD[MAX_PLAYERS][3];
#include <YSI_Coding\y_hooks>
hook OnPlayerConnect(playerid)
{

TDEditor_TD[playerid][2] = CreatePlayerTextDraw(playerid, 497.899688, 167.833480, "500.0 Mau");
PlayerTextDrawAlignment(playerid, TDEditor_TD[playerid][2], 1);
PlayerTextDrawColor(playerid, TDEditor_TD[playerid][2], -16776961);
PlayerTextDrawSetShadow(playerid, TDEditor_TD[playerid][2], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_TD[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_TD[playerid][2], 255);
PlayerTextDrawFont(playerid, TDEditor_TD[playerid][2], 1);
PlayerTextDrawSetProportional(playerid, TDEditor_TD[playerid][2], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_TD[playerid][2], 0);


}

task ssname_speedo[100]()
{
	foreach(new playerid: Player)
	{
	if(IsPlayerInAnyVehicle(playerid) && PLAYER_STATE_DRIVER == GetPlayerState(playerid))
	{
		new
			str[64], Float:s, iVeh = GetPlayerVehicleID(playerid);
		GetVehicleHealth(iVeh, s);
		format(str, sizeof(str), "%0.2f ~r~Health", s);
		PlayerTextDrawSetString(playerid, TDEditor_TD[playerid][2], str);

		for(new i = 0; i < 3; i ++)
		{
			PlayerTextDrawShow(playerid, TDEditor_TD[playerid][i]);
		}
	}
	else
	{
		for(new i = 0; i < 3; i ++)
		{
			PlayerTextDrawHide(playerid, TDEditor_TD[playerid][i]);
		}
	}
	}
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(PLAYER_STATE_DRIVER == oldstate && newstate == PLAYER_STATE_ONFOOT)
	{
		for(new i = 0; i < 3; i ++)
		{
			PlayerTextDrawHide(playerid, TDEditor_TD[playerid][i]);
		}
	}
	return 1;
}
