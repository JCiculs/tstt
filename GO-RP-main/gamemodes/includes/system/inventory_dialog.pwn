#include <a_samp>
#include <YSI_Coding\y_hooks>

CMD:tuido(playerid, params[])
{
    if(gPlayerLogged{playerid} != 0) ShowInventoryy(playerid, playerid);
    return 1;
}

/*CMD:tuido(playerid, params[])	{
	new targetid;
	ShowInventoryy(playerid, targetid);
	return 1;
}*/