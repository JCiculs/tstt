#include <a_samp>
#include <YSI_Coding\y_hooks>


new bool:InfoMessage[MAX_PLAYERS] = true;

hook OnPlayerConnect(playerid)
{
    InfoMessage[playerid] = true;
	return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    new Float:h;
    GetPlayerHealth(playerid, h);

    return 1;
}
hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
	return 1;
}
