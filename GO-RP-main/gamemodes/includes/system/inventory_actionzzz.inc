#include <YSI_Coding\y_hooks>
static arr_action[][32] =
{
	"button_use", 		//	INV_BTN_USE
	"button_info", 		//	INV_BTN_INFO
	"button_cancel"  	//	INV_BTN_CANCEL
};

enum
{
	INV_BTN_USE,
	INV_BTN_INFO,
	INV_BTN_CANCEL,
}

static
	var[MAX_PLAYERS],
	Task:task_Action[MAX_PLAYERS],
	Text:Action[MAX_PLAYERS][sizeof(arr_action)];

Task: Inventory_ActionShow(playerid, Float:X, Float:Y, btn_use = 1)
{
	var[playerid] = 1;
	if(task_Action[playerid] == Task:0)
	{
		task_Action[playerid] = task_new();
	}

	task_detach();
	task_yield(task_Action[playerid]);

	X += 40.0;
	Y += 30.0;

	for(new str[32], i = 0; i < sizeof(arr_action); i ++)
	{
		if(btn_use == 0 && i == 0)
			continue;

		if(Action[playerid][i] != Text:0)
		{
			TextDrawDestroy(Action[playerid][i]);
			Action[playerid][i] = Text:0;
		}
		format(str, sizeof(str), "mdl-2002:%s", arr_action[i]);

		// print(str);
		Action[playerid][i] = TextDrawCreate(X, Y, str);
		TextDrawTextSize(Action[playerid][i], 60.000000, 17.000000);
		TextDrawSetSelectable(Action[playerid][i], true);
		TextDrawSetShadow(Action[playerid][i], 0);
		TextDrawFont(Action[playerid][i], 4);
		TextDrawShowForPlayer(playerid, Action[playerid][i]);

		Y += 17.85;
	}
	var[playerid] = 0;
	return task_Action[playerid];
} // doi xiu de sua lai het

Inventory_ActionDestroy(playerid)
{
	for(new i = 0; i < sizeof(arr_action); i ++)
	{
		if(Action[playerid][i] != Text:0)
		{
			TextDrawDestroy(Action[playerid][i]);
			Action[playerid][i] = Text:0;
		}
	}

	new
		const Task:tsk = task_Action[playerid];

	task_Action[playerid] = Task: 0;
	if(task_valid(tsk)) task_delete(tsk);
}

hook OnPlayerConnect(playerid)
{
	for(new i = 0; i < sizeof(arr_action); i ++)
	{
		Action[playerid][i] = Text:0;
	}
	task_Action[playerid] = Task: 0;
}

hook OnPlayerDisconnect(playerid, reason)
{
	Inventory_ActionDestroy(playerid);
}

forward InvAction_OnClick(playerid, PlayerText:playertext);
public InvAction_OnClick(playerid, PlayerText:playertext)
{
	if(task_Action[playerid] != Task:0 && var[playerid] == 0)
	{
/*		for(new i = 0; i < sizeof(arr_action); i ++)
		{
			if(playertext == Action[playerid][i])
			{
				if(task_valid(task_Action[playerid]))
				{
					task_set_result(task_Action[playerid], i);
				}
				else
				{
					Inventory_Hide(playerid);
				}
				Inventory_ActionDestroy(playerid);
				return ~1;
			}
		}*/
	}
	return 1;
}