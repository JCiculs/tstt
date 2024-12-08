#include <YSI_Coding\y_hooks>
#include <a_samp>
new Inventory[15];






Inventory_Show(playerid, bool:reshow = false)
{
    if(reshow == false)
    {
        for(new i = 0; i < sizeof(InventoryTD); i ++)
	    {
		    TextDrawShowForPlayer(playerid, Inventory[0]);
	    }
    }
}
Inventory_Hide(playerid)
{
	for(new i = 0; i < 12; i ++)
	{
		Inventory_HideIndex(playerid, i);
	}
	CancelSelectTextDraw(playerid);
	PlayerInventory[playerid][inv_show] = false;
	for(new i = 0; i < sizeof(InventoryTD); i ++)
	{
		TextDrawHideForPlayer(playerid, Inventory[i]);
	}

	return 1;
}
forward inv_OnPlayerClickTD(playerid, Text:clickedid);
public inv_OnPlayerClickTD(playerid, Text:clickedid)
{
	if(PlayerInventory[playerid][inv_show] && clickedid == Inventory[10])
	{
		Inventory_Hide(playerid);
	}
	if(clickedid == InventoryTD[6] && PlayerInventory[playerid][inv_show])
	{
		new
			maxpage, iPage = PlayerInventory[playerid][inv_curpage];

		maxpage = floatround(list_size(player_Inventory[playerid]) % 12 == 0 ? list_size(player_Inventory[playerid]) / 12 : list_size(player_Inventory[playerid]) / 12 + 1);

		if(++iPage >= maxpage)
		{
			iPage = 0;
		}
		Inventory_ShowPage(playerid, iPage);
		printf("%d", iPage);
	}
	return 1;
}
forward inv_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
public inv_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(PlayerInventory[playerid][inv_show])
	{
		for(new item, i = 0, j = 0; i < 12; i ++)
		{
				j = i + PlayerInventory[playerid][inv_curpage] * 12;
				if(list_valid(player_Inventory[playerid]) && j < list_size(player_Inventory[playerid]))
				{
					item = list_get(player_Inventory[playerid], j);
					switch(ItemInfo[item][inv_item_varId])
					{
						case pCrack: return cmd_usecrack(playerid, "\0");
						case pPot: return cmd_usepot(playerid, "\0");
						case pHeroin: return cmd_useheroin(playerid, "\0");
						case pPaper: return cmd_guithu(playerid, "\0");
						case pRope: return cmd_troi(playerid, "\0");
						case pCigar: return cmd_hutthuoc(playerid, "\0");
						case pGPS: return cmd_gps(playerid, "\0");
						case pFirstaid: return cmd_firstaid(playerid, "\0");
						case pBoombox: return cmd_placeboombox(playerid, "\0");
						case pRimMod: return cmd_userimkit(playerid, "\0");
						case pFirework: return cmd_placefirework(playerid, "\0");
						case pSprunk: return cmd_uongnuoc(playerid, "\0");
						case pDice: return cmd_dice(playerid, "\0");
						case pSpraycan: return cmd_mauxe(playerid, "\0");
						default: SendClientMessageEx(playerid, -1, "Vat pham nay khong the su dung");
					}
					//Inventory_SetSelect(playerid, 1, true);
					PlayerPlaySound(playerid, 17803, 0, 0, 0);
				}
				return ~1;
		}
	}
	return 1;
}

CMD:testtuido(playerid, params[])
{
    return Inventory_Show(playerid);
}
hook OnGameModeInit()
{
    Inventory[0] = TextDrawCreate(249.000000, 76.000000, "_");
    TextDrawFont(Inventory[0], 1);
    TextDrawLetterSize(Inventory[0], 1.558333, 20.800003);
    TextDrawTextSize(Inventory[0], 318.500000, 179.500000);
    TextDrawSetOutline(Inventory[0], 1);
    TextDrawSetShadow(Inventory[0], 0);
    TextDrawAlignment(Inventory[0], 2);
    TextDrawColor(Inventory[0], -1);
    TextDrawBackgroundColor(Inventory[0], 255);
    TextDrawBoxColor(Inventory[0], 135);
    TextDrawUseBox(Inventory[0], 1);
    TextDrawSetProportional(Inventory[0], 1);
    TextDrawSetSelectable(Inventory[0], 0);

    Inventory[1] = TextDrawCreate(171.000000, 79.000000, "_");
    TextDrawFont(Inventory[1], 1);
    TextDrawLetterSize(Inventory[1], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[1], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[1], 1);
    TextDrawSetShadow(Inventory[1], 0);
    TextDrawAlignment(Inventory[1], 2);
    TextDrawColor(Inventory[1], -1);
    TextDrawBackgroundColor(Inventory[1], 255);
    TextDrawBoxColor(Inventory[1], 135);
    TextDrawUseBox(Inventory[1], 1);
    TextDrawSetProportional(Inventory[1], 1);
    TextDrawSetSelectable(Inventory[1], 1);

    Inventory[2] = TextDrawCreate(171.000000, 108.000000, "_");
    TextDrawFont(Inventory[2], 1);
    TextDrawLetterSize(Inventory[2], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[2], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[2], 1);
    TextDrawSetShadow(Inventory[2], 0);
    TextDrawAlignment(Inventory[2], 2);
    TextDrawColor(Inventory[2], -1);
    TextDrawBackgroundColor(Inventory[2], 255);
    TextDrawBoxColor(Inventory[2], 135);
    TextDrawUseBox(Inventory[2], 1);
    TextDrawSetProportional(Inventory[2], 1);
    TextDrawSetSelectable(Inventory[2], 1);

    Inventory[3] = TextDrawCreate(201.000000, 80.000000, "_");
    TextDrawFont(Inventory[3], 1);
    TextDrawLetterSize(Inventory[3], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[3], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[3], 1);
    TextDrawSetShadow(Inventory[3], 0);
    TextDrawAlignment(Inventory[3], 2);
    TextDrawColor(Inventory[3], -1);
    TextDrawBackgroundColor(Inventory[3], 255);
    TextDrawBoxColor(Inventory[3], 135);
    TextDrawUseBox(Inventory[3], 1);
    TextDrawSetProportional(Inventory[3], 1);
    TextDrawSetSelectable(Inventory[3], 1);

    Inventory[4] = TextDrawCreate(228.000000, 136.000000, "_");
    TextDrawFont(Inventory[4], 1);
    TextDrawLetterSize(Inventory[4], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[4], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[4], 1);
    TextDrawSetShadow(Inventory[4], 0);
    TextDrawAlignment(Inventory[4], 2);
    TextDrawColor(Inventory[4], -1);
    TextDrawBackgroundColor(Inventory[4], 255);
    TextDrawBoxColor(Inventory[4], 135);
    TextDrawUseBox(Inventory[4], 1);
    TextDrawSetProportional(Inventory[4], 1);
    TextDrawSetSelectable(Inventory[4], 1);

    Inventory[5] = TextDrawCreate(228.000000, 108.000000, "_");
    TextDrawFont(Inventory[5], 1);
    TextDrawLetterSize(Inventory[5], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[5], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[5], 1);
    TextDrawSetShadow(Inventory[5], 0);
    TextDrawAlignment(Inventory[5], 2);
    TextDrawColor(Inventory[5], -1);
    TextDrawBackgroundColor(Inventory[5], 255);
    TextDrawBoxColor(Inventory[5], 135);
    TextDrawUseBox(Inventory[5], 1);
    TextDrawSetProportional(Inventory[5], 1);
    TextDrawSetSelectable(Inventory[5], 1);

    Inventory[6] = TextDrawCreate(171.000000, 136.000000, "_");
    TextDrawFont(Inventory[6], 1);
    TextDrawLetterSize(Inventory[6], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[6], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[6], 1);
    TextDrawSetShadow(Inventory[6], 0);
    TextDrawAlignment(Inventory[6], 2);
    TextDrawColor(Inventory[6], -1);
    TextDrawBackgroundColor(Inventory[6], 255);
    TextDrawBoxColor(Inventory[6], 135);
    TextDrawUseBox(Inventory[6], 1);
    TextDrawSetProportional(Inventory[6], 1);
    TextDrawSetSelectable(Inventory[6], 1);

    Inventory[7] = TextDrawCreate(200.000000, 108.000000, "_");
    TextDrawFont(Inventory[7], 1);
    TextDrawLetterSize(Inventory[7], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[7], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[7], 1);
    TextDrawSetShadow(Inventory[7], 0);
    TextDrawAlignment(Inventory[7], 2);
    TextDrawColor(Inventory[7], -1);
    TextDrawBackgroundColor(Inventory[7], 255);
    TextDrawBoxColor(Inventory[7], 135);
    TextDrawUseBox(Inventory[7], 1);
    TextDrawSetProportional(Inventory[7], 1);
    TextDrawSetSelectable(Inventory[7], 1);

    Inventory[8] = TextDrawCreate(200.000000, 136.000000, "_");
    TextDrawFont(Inventory[8], 1);
    TextDrawLetterSize(Inventory[8], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[8], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[8], 1);
    TextDrawSetShadow(Inventory[8], 0);
    TextDrawAlignment(Inventory[8], 2);
    TextDrawColor(Inventory[8], -1);
    TextDrawBackgroundColor(Inventory[8], 255);
    TextDrawBoxColor(Inventory[8], 135);
    TextDrawUseBox(Inventory[8], 1);
    TextDrawSetProportional(Inventory[8], 1);
    TextDrawSetSelectable(Inventory[8], 1);

    Inventory[9] = TextDrawCreate(171.000000, 108.000000, "_");
    TextDrawFont(Inventory[9], 1);
    TextDrawLetterSize(Inventory[9], 0.600000, 2.099998);
    TextDrawTextSize(Inventory[9], 283.500000, 20.000000);
    TextDrawSetOutline(Inventory[9], 1);
    TextDrawSetShadow(Inventory[9], 0);
    TextDrawAlignment(Inventory[9], 2);
    TextDrawColor(Inventory[9], -1);
    TextDrawBackgroundColor(Inventory[9], 255);
    TextDrawBoxColor(Inventory[9], 135);
    TextDrawUseBox(Inventory[9], 1);
    TextDrawSetProportional(Inventory[9], 1);
    TextDrawSetSelectable(Inventory[9], 1);

    Inventory[10] = TextDrawCreate(455.000000, 248.000000, "Tat");
    TextDrawFont(Inventory[10], 1);
    TextDrawLetterSize(Inventory[10], 0.600000, 2.000000);
    TextDrawTextSize(Inventory[10], 400.000000, 17.000000);
    TextDrawSetOutline(Inventory[10], 1);
    TextDrawSetShadow(Inventory[10], 0);
    TextDrawAlignment(Inventory[10], 1);
    TextDrawColor(Inventory[10], -1);
    TextDrawBackgroundColor(Inventory[10], 255);
    TextDrawBoxColor(Inventory[10], 50);
    TextDrawUseBox(Inventory[10], 0);
    TextDrawSetProportional(Inventory[10], 1);
    TextDrawSetSelectable(Inventory[10], 1);
}