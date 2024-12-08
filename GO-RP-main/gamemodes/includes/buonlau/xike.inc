#include <a_samp>
#include <YSI_Coding\y_hooks>
#include "./includes/ntv/commands.pwn"
new xike[10];
hook OnGameModeInit()
{
	xike[1] = CreateActor(134,1978.2430,-1550.0165,13.6449,336.9051); // xike
	ApplyActorAnimation(xike[1], "crack", "CRCKDETH2", 4.0999, 1, 0, 0, 0, 0);
	xike[2] = CreateActor(13,2766.2610,-2369.0356,13.6328,1.9596); // nhando
	ApplyActorAnimation(xike[2], "SMOKING", "M_smklean_loop", 4.0999, 1, 0, 0, 0, 0);
	//ApplyActorAnimation(xike[1], "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
	CreateDynamic3DTextLabel("{6600CC}XIKE",COLOR_YELLOW,1978.2430,-1550.0165,13.6449+0.5,4.0);
	CreateDynamic3DTextLabel("DAICA\n/nhanmatuy\nGia:5000",COLOR_YELLOW,2766.2610,-2369.0356,13.6328+0.5,4.0);

}


hook OnPlayerEnterCheckpoint(playerid)
{
	if (GetPVarInt(playerid, "GIAODA") > 0)
	{
		new stage = GetPVarInt(playerid, "GIAODA");

		switch (stage)
		{
			case 2:
			{
				if(GetPVarInt(playerid, "GIAODA") == 2)
				{
					cmd_me(playerid, "Dat goi hang len ban va dong goi mot cach can than...");
					ApplyAnimation(playerid, "wash_up", 4.0999, 1, 0, 0, 0, 0);
					SetTimer("DongGoi", 2000, false); 
				}
			}
			case 3:
			{
				if(GetPVarInt(playerid, "GIAODA") == 3)
				{
					DisablePlayerCheckpoint(playerid);
					DeletePVar(playerid, "GIAODA");
				}
				switch(random(100))
				{
					case 0..44:
					{
							GivePlayerMoney(playerid, 850);
							SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Ban nhan duoc so tien tu viec ban da (850)");
					}
					case 45..89:
					{
							GivePlayerMoney(playerid, 950);
							SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Ban nhan duoc so tien tu viec ban da (950)");
					}
					case 90..99:
					{
							GivePlayerMoney(playerid, 1100);
							SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Ban nhan duoc so tien tu viec ban da (1100)");
					}
				}
			}
		}
	}


	if(CP[playerid] == 5)
	{
		CP[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		ShowPlayerDialog(playerid, DADENNOINHANVIECLAM, DIALOG_STYLE_MSGBOX, "Notice", "Ban da den noi /nhanmatuy de lam viec", "ok", "");
	}
	return 1;
}
forward DongGoi(playerid);
public DongGoi(playerid)
{
	if(GetPVarInt(playerid, "GIAODA") == 2)
	{
		ClearAnimations(playerid);
		TogglePlayerControllable(playerid, 1);
		SetPlayerCheckpoint(playerid, 1978.2430,-1550.0165,13.6449, 3.0);
		SetPVarInt(playerid, "GIAODA", 3);
		PlayerInfo[playerid][pCash] -= 500;
		SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Ban da dong goi thanh cong");
		SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Hay dem di tieu thu");
	}
	return 1;
}
forward layhang(playerid);
public layhang(playerid)
{
	if(GetPVarInt(playerid, "GIAODA") == 1)
	{
		ClearAnimations(playerid);
		TogglePlayerControllable(playerid, 1);
		SetPlayerCheckpoint(playerid, 2790.8271,-2426.0901,13.6329, 3.0);
		SetPVarInt(playerid, "GIAODA", 2);
		SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Ban da lay hang");
		SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Hay di theo chi dan de goi hang nhe");
	}
	return 1;
}
CMD:nhanmatuy(playerid,params[])
{
	if(PlayerInfo[playerid][pCash] < 500)
	{
		SendClientMessage(playerid, COLOR_GREY, "Khong du tien roi oce luon");  // dieu kien 5k
		return 1;
	}
	if (GetPVarInt(playerid, "GIAODA") == 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban dang thi khong the thi tiep");
		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 2766.2610,-2369.0356,13.6328))
	{	
		SetPVarInt(playerid, "GIAODA", 1);
		cmd_me(playerid, "Tho tay vao tui va lay so tien dua cho nguoi ban hang!");
		cmd_do(playerid, "Xoet.. xoet...");
		SetTimerEx("layhang", 2000, 0, "d",playerid); // 1000 = 1s
		ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.0999, 1, 0, 0, 0, 0);
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban khong o gan");
	}
	return 1;
}
CMD:trogiupxike(playerid, params[])
{
	if(isnull(params))
	{
		SendClientMessageEx(playerid, -1, "SU DUNG: /trorgiupxike [noidung]");
		SendClientMessageEx(playerid, COLOR_GRAD1, "layda");
		return 1;
	}
	if(strcmp(params, "layda",true) == 0)
	{
		SendClientMessage(playerid, -1, "{003300}[XIKE]{FFFFFF}Hay chay theo vi tri cham do tren ban do");
		CP[playerid] = 5;
		SetPlayerCheckpoint(playerid, 2766.2610,-2369.0356,13.6328, 2.0);
		return 1;
	}
	return 1;
}
