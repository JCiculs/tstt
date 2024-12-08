#include <YSI_Coding\y_hooks>
const
	INV_MAX_ITEM_PER_PAGE = 15;

enum E_INV
{
	InvShow, 
	InvCurPage,
	InvMaxPage,  

	InvClickAble,
	List:InvItems,
}

enum E_INV_ITEM_DATA
{
	e_inv_item_id, 
	e_inv_item_use,
	e_inv_item_name[64],
	// for PC
	e_inv_item_texture[32], 
	// for Mobile
	e_inv_item_model,  
	Float:e_inv_item_RotX,
	Float:e_inv_item_RotY,
	Float:e_inv_item_RotZ, 
	Float:e_inv_item_Zoom,
}

static const InvArray[][E_INV_ITEM_DATA] =
{
	{pTienBan, 0, "Tien ban", "item_cash", 0, 0.0, 0.0, 0.0, 0.0},
	{pCansap, 0, "La can sa", "item_cannabis", 0, 0.0, 0.0, 0.0, 0.0},
	//{pPhoneBook, 0, "Danh Ba", "item_sim", 0, 0.0, 0.0, 0.0, 0.0},
	{pKimCuong, 0, "Kim Cuong", "item_kimcuong", 0, 0.0, 0.0, 0.0, 0.0},
	{pRuby, 0, "Ruby", "item_ruby", 0, 0.0, 0.0, 0.0, 0.0},
	{pVang, 0, "Vang", "item_vang", 0, 0.0, 0.0, 0.0, 0.0},
	{pKGFish, 0, "Ca", "item_ca", 0, 0.0, 0.0, 0.0, 0.0},
	{pDice, 0, "Xuc Xac", "item_dice", 0, 0.0, 0.0, 0.0, 0.0},
	{pDau, 0, "Dau", "item_dau", 0, 0.0, 0.0, 0.0, 0.0},
	{pCigar, 1, "Thuoc La", "item_thuocla", 0, 0.0, 0.0, 0.0, 0.0},
	{pGo, 0, "Go nho", "item_go", 0, 0.0, 0.0, 0.0, 0.0},
	{pMats, 0, "Vat Lieu", "item_vatlieu", 0, 0.0, 0.0, 0.0, 0.0},
	{pRadio, 0, "Radio", "item_radio", 0, 0.0, 0.0, 0.0, 0.0},
	{pPnumber, 0, "Dien Thoai", "item_dienthoai", 0, 0.0, 0.0, 0.0, 0.0},
	{pBanhMi, 1, "Banh Burger", "item_bread", 0, 0.0, 0.0, 0.0, 0.0},
	{pNuocLoc, 1, "Nuoc Loc", "item_waterbottle", 0, 0.0, 0.0, 0.0, 0.0},
	{pSat, 0, "Sat", "item_bac", 0, 0.0, 0.0, 0.0, 0.0},
	{pPot, 1, "Pot", "item_pot", 0, 0.0, 0.0, 0.0, 0.0},
	{pCrack, 1, "Crack", "item_crack", 0, 0.0, 0.0, 0.0, 0.0},
	{pMedkit, 1, "First Aid", "item_firstaid", 0, 0.0, 0.0, 0.0, 0.0},
	{pGiap, 1, "Giap", "item_giap", 0, 0.0, 0.0, 0.0, 0.0},
	{pMask, 1, "Mask", "item_mask", 0, 0.0, 0.0, 0.0, 0.0},
	{pXabeng, 1, "Xa Beng", "item_xabeng", 0, 0.0, 0.0, 0.0, 0.0},
	{pPhieunuoibo, 1, "Phieu Nuoi Bo", "item_nuoibo", 0, 0.0, 0.0, 0.0, 0.0}
};

static 
	Player[MAX_PLAYERS][E_INV],
	Text:TDEditor_TD[3],
	PlayerText:PTD_Item[MAX_PLAYERS][INV_MAX_ITEM_PER_PAGE][2], // [0 = Item, 1 = Amount]
	Float:inv_pos@[INV_MAX_ITEM_PER_PAGE][2]; // [0 TextDraw, 1 Player TextDraw]

stock Inventory_Show(playerid)
{
	if(Player[playerid][InvShow])
		return Inventory_Hide(playerid);

	new List: lst = Player[playerid][InvItems];
	if(list_valid(lst) && list_clear(lst))
	{
		new item_count;
		for(new item, i = 0; i < sizeof(InvArray); i ++) ///ai zo vps vay
		{
			item = InvArray[i][e_inv_item_id];
			if(PlayerInfo[playerid][item])
			{
				printf("%d, %d, %d", item, pCash, PlayerInfo[playerid][item]);
				list_add(lst, i);
			}
			
		}
		for(new i = 0; i < sizeof(TDEditor_TD); i ++)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[i]);
		}
		item_count = list_size(lst);
		SelectTextDraw(playerid, -1);
		Inventory_ShowPage(playerid, 0);
		Player[playerid][InvShow] = 1;
		Player[playerid][InvMaxPage] = floatround
		(
			item_count % INV_MAX_ITEM_PER_PAGE == 0?
			item_count / INV_MAX_ITEM_PER_PAGE:
			item_count / INV_MAX_ITEM_PER_PAGE + 1
		);
		return 1;
	}
	return 0;
}

stock Inventory_Hide(playerid)
{
	Player[playerid][InvShow] = 0;
	for(new i = 0; i < INV_MAX_ITEM_PER_PAGE; i ++)
	{
		Inventory_HideIndex(playerid, i);
	}
	for(new i = 0; i < sizeof(TDEditor_TD); i ++)
	{
		TextDrawHideForPlayer(playerid, TDEditor_TD[i]);
	}
	CancelSelectTextDraw(playerid);
	Inventory_ActionDestroy(playerid);
	PlayerPlaySound(playerid, 1136, 0.0, 0.0, 0.0);
	return 1;
}

static Inventory_GetXY(index, &Float:x, &Float:y)
{
	x = inv_pos@[index][0];
	y = inv_pos@[index][1];
}

static Inventory_SetSelectAble(playerid, select)
{
	for(new j = 0; j < INV_MAX_ITEM_PER_PAGE; j ++)
	{
		if(PTD_Item[playerid][j][0])
		{
			PlayerTextDrawSetSelectable(playerid, PTD_Item[playerid][j][0], select);
			PlayerTextDrawShow(playerid, PTD_Item[playerid][j][0]);
		}
	}	
	Player[playerid][InvClickAble] = select;
}

static Inventory_ShowPage(playerid, page = 0)
{
	new 
		List:lst = Player[playerid][InvItems];
	
	Player[playerid][InvClickAble] = 1;
	Player[playerid][InvCurPage] = page;
	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	for(new str[33], item, result, v = 0, i = 0; i < INV_MAX_ITEM_PER_PAGE; i ++)
	{
		v = i + page * INV_MAX_ITEM_PER_PAGE;
		result = (list_valid(lst) && v < list_size(lst));

		if(result) 
		{
			item = list_get(lst, v);
			format(str, sizeof(str), "mdl-2002:%s", InvArray[item][e_inv_item_texture]);
			Inventory_ShowIndex(playerid, i, str, PlayerInfo[playerid][InvArray[item][e_inv_item_id]], InvArray[item][e_inv_item_id]);
		}
		else Inventory_HideIndex(playerid, i);
	}
	return 1;
}

stock Inventory_ShowIndex(playerid, index, item[], amount, type)
{
	new 
		Float:x, Float:y, str[16];

	Inventory_GetXY(index, x, y);
	Inventory_HideIndex(playerid, index);

	PTD_Item[playerid][index][0] = CreatePlayerTextDraw(playerid, x, y, item);
	PlayerTextDrawTextSize(playerid, PTD_Item[playerid][index][0], 47.000000, 56.000000);
	PlayerTextDrawSetSelectable(playerid, PTD_Item[playerid][index][0], true);
	PlayerTextDrawAlignment(playerid, PTD_Item[playerid][index][0], 1);
	PlayerTextDrawSetShadow(playerid, PTD_Item[playerid][index][0], 0);
	PlayerTextDrawColor(playerid, PTD_Item[playerid][index][0], -1);
	PlayerTextDrawFont(playerid, PTD_Item[playerid][index][0], 4);
	
	format(str, sizeof(str), "%s%s", type == pCash ? "$" : "", number_format(amount));
	PTD_Item[playerid][index][1] = CreatePlayerTextDraw(playerid, x + 43.399902, y + 1.144447, str);
	PlayerTextDrawLetterSize(playerid, PTD_Item[playerid][index][1], 0.122666, 0.849183);
	PlayerTextDrawSetProportional(playerid, PTD_Item[playerid][index][1], 1);
	PlayerTextDrawAlignment(playerid, PTD_Item[playerid][index][1], 3);
	PlayerTextDrawSetShadow(playerid, PTD_Item[playerid][index][1], 0);
	PlayerTextDrawFont(playerid, PTD_Item[playerid][index][1], 2);

	PlayerTextDrawShow(playerid, PTD_Item[playerid][index][1]);
	PlayerTextDrawShow(playerid, PTD_Item[playerid][index][0]);

	printf("%s, %s, %f, %f", str, item, x, y);
}

stock Inventory_HideIndex(playerid, index)
{
	for(new i = 0; i < 2; i ++)
	{
		if(PTD_Item[playerid][index][i] != PlayerText:0)
		{
			PlayerTextDrawDestroy(playerid, PTD_Item[playerid][index][i]);
			PTD_Item[playerid][index][i] = PlayerText:0;
		}
	}
}
hook OnPlayerConnect(playerid)
{
	new 
		i[E_INV];

	Player[playerid] = i;
	Player[playerid][InvItems] = list_new();
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	if(list_valid(Player[playerid][InvItems]))
	{
		list_delete(Player[playerid][InvItems]);
	}

	for(new i = 0; i < INV_MAX_ITEM_PER_PAGE; i ++)
	{
		Inventory_HideIndex(playerid, i);
	}
	return 1;
}

hook OnGameModeInit()
{
	TDEditor_TD[0] = TextDrawCreate(166.666687, 105.222221, "mdl-2002:inventory");
	TextDrawTextSize(TDEditor_TD[0], 304.000000, 225.000000);
	TextDrawSetShadow(TDEditor_TD[0], 0);
	TextDrawColor(TDEditor_TD[0], -1);
	TextDrawFont(TDEditor_TD[0], 4);

	TDEditor_TD[1] = TextDrawCreate(422.333435, 87.800018, "mdl-2002:button_close");
	TextDrawTextSize(TDEditor_TD[1], 48.000000, 14.000000);
	TextDrawSetSelectable(TDEditor_TD[1], true);
	TextDrawSetShadow(TDEditor_TD[1], 0);
	TextDrawFont(TDEditor_TD[1], 4);

	TDEditor_TD[2] = TextDrawCreate(417.000091, 308.866760, "mdl-2002:button_nextpage");
	TextDrawTextSize(TDEditor_TD[2], 48.000000, 14.000000);
	TextDrawSetSelectable(TDEditor_TD[2], true);
	TextDrawSetShadow(TDEditor_TD[2], 0);
	TextDrawFont(TDEditor_TD[2], 4);	

    new
        Float:X = 177.933456,
        Float:Y = 116.422241;

    for(new i = 0; i < INV_MAX_ITEM_PER_PAGE; i ++) 
    {
		if(i && (i % 5 == 0)) 
		{
			X = 177.933456;
			Y += 5.0 + 58.0;
		}
        inv_pos@[i][0] = X;
		inv_pos@[i][1] = Y;

        X += 58.5;
    }
}

CMD:tuidonew(playerid,params[])
{
	if(GetPVarInt(playerid, "NotAndroid") == 0){
	    if(gPlayerLogged{playerid} != 0) ShowInventory(playerid, playerid);
	    return 1;
	}
	else if(gPlayerLogged{playerid} != 0) Inventory_Show(playerid);
	return 1;
}

forward Inv_OnResponse(playerid, Text:clickedid);
public Inv_OnResponse(playerid, Text:clickedid)
{
	if(Player[playerid][InvShow])
	{
		if(clickedid == Text:INVALID_TEXT_DRAW || clickedid == TDEditor_TD[1] /* Button Click */)
		{
			return Inventory_Hide(playerid);
		}
		else if(clickedid == TDEditor_TD[2] && Player[playerid][InvClickAble])
		{
			new 
				page = Player[playerid][InvCurPage],
				maxPage = Player[playerid][InvMaxPage];
			
			if(++page >= maxPage)
			{
				page = 0;
			}
			// printf("> %d, %d", page, maxPage);
			Inventory_ShowPage(playerid, page);
		}
	}
	return 1;
}

forward Inv_OnClick(playerid, PlayerText:playertext);
public Inv_OnClick(playerid, PlayerText:playertext)
{
	if(Player[playerid][InvShow])
	{
		new page = Player[playerid][InvCurPage];
		for(new item, i = 0, clicked = page * INV_MAX_ITEM_PER_PAGE; clicked < (page + 1) * INV_MAX_ITEM_PER_PAGE; i ++, clicked ++)
		{
			if(0 <= i < INV_MAX_ITEM_PER_PAGE)
			{
				if(playertext == PTD_Item[playerid][i][0])
				{
					new 
						await_result, Float:x, Float:y, List:list = Player[playerid][InvItems];
					
					if(0 <= clicked < list_size(list))
					{
						Inventory_GetXY(i, x, y);
						item = list_get(list, clicked);
						Inventory_SetSelectAble(playerid, 0);
						PlayerPlaySound(playerid, 6801, 0.0, 0.0, 0.0);
						await_result = await Inventory_ActionShow(playerid, x, y, InvArray[item][e_inv_item_use]);
						// 
						PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
						Inventory_SetSelectAble(playerid, 1);
						switch(await_result)
						{
							case INV_BTN_USE:
							{
								CallLocalFunction("Inv_OnClickUse", "dd", playerid, InvArray[item][e_inv_item_id]);
							}
							case INV_BTN_INFO:
							{
								CallLocalFunction("Inv_OnClickInfo", "dd", playerid, InvArray[item][e_inv_item_id]);
							}
							case INV_BTN_DROP:
							{
								CallLocalFunction("Inv_OnClickdrop", "dd", playerid, InvArray[item][e_inv_item_id]);
							}
						}
					}
					return 1;
				}
			}
		}
		InvAction_OnClick(playerid, playertext);
	}
	return 1;
}


forward Inv_OnClickdrop(playerid, itemid);
public Inv_OnClickdrop(playerid, itemid)
{
	switch(itemid)
	{
        case pBanhMi:
		{
				PlayerInfo[playerid][pBanhMi] -= 1;
				SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut bo 1 Banh mi");
		}
        case pNuocLoc:
		{
				PlayerInfo[playerid][pNuocLoc] -= 1;
				SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut bo 1 Nuoc loc");
		}
		case pMedkit:
		{
				PlayerInfo[playerid][pMedkit] -= 1;
				SendClientMessageEx(playerid, COLOR_GREY, "Ban da vut bo 1 med kit");
		}
	}
	return 1;
}

forward Inv_OnClickUse(playerid, itemid);
public Inv_OnClickUse(playerid, itemid)
{
	switch(itemid)
	{
		case pPhieunuoibo:
		{
			return cmd_nuoibo(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban vua su dung phieu nuoi bo, de chan nuoi");
		}
		case pMask:
		{
			return cmd_mask(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban da lay mat na va deo len, su dung 1 lan nua de thao mat na.");
		}
		case pGiap:
		{
			return cmd_usegiap(playerid, "");
			SendClientMessage(playerid, COLOR_YELLOW, "Ban Dang Mac Ao Giap, Vui Long Cho...");
		}
	    case pCigar:
		{
			return cmd_hutthuoc(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban Vua Cham 1 Dieu Thuoc Len Va Hut.");
		}
		case pMedkit:
		{
			return cmd_usemedkit(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang su dung 1 medkit");
		}
		case pXabeng:
		{
			return cmd_bekhoa(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban Dang Be Khoa Xe....");
		}
	    case pPot:
		{
			return cmd_usepot(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang su dung 1 Pot");
		}
		 case pCrack:
		{
			return cmd_usecrack(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang su dung 1 Crack");
		}
		case pBanhMi:
		{
			return cmd_anbanh(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang su dung 1 Banh mi");
		}
        case pNuocLoc:
		{
			return cmd_uongnuoc(playerid, "");
			SendClientMessageEx(playerid, COLOR_YELLOW, "Ban dang su dung 1 Nuoc loc");
  		}
 	}
	return 1;
}

forward Inv_OnClickInfo(playerid, itemid);
public Inv_OnClickInfo(playerid, itemid)
{
	switch(itemid)
	{
	    case pDice:
	    {
	        return SendClientMessageEx(playerid,-1,"/dice de do xuc sac");
		}
		case pPnumber:
		{
		    return SendClientMessageEx(playerid,-1,"/call de goi dien thoai");
		}
		case pVang:
		{
		    return SendClientMessage(playerid,-1,"Dung de che xe");
		}
		case pKimCuong:
		{
   			return SendClientMessage(playerid,-1,"Dung de che xe");
		}
		case pCansap:
		{
			return SendClientMessageEx(playerid, -1, "La can sa dung de giao dich ra pot o Black Market.");
		}
        case pPot:
		{
			return SendClientMessageEx(playerid, -1, "Dung de choi do tang mau.");
		}
		case pNuocLoc:
		{
			return SendClientMessageEx(playerid, -1, "dung de choi do tang giap.");
		}
	}	
	return 1;
}
