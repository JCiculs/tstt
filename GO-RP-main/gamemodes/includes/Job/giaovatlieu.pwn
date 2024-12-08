#include <a_samp>
#include <YSI_Coding\y_hooks>
#define DIALOG_GIAOVL  (5070)
#define DIALOG_GIAOVL2 (5068)
#define DIALOG_LAYVATLIEU (5069)
#define DIALOG_TRAVLZ     (7072)
new GIAOVLCAR[MAX_PLAYERS];
new Text3D:GIAOVLTEXT[MAX_PLAYERS];
new Camhanghoa[MAX_PLAYERS] = 0;
new Vatlieuxe[MAX_PLAYERS] = 0;
new OBJECTVL[MAX_PLAYERS];
new PICKUPLVL;
hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	new vehicle = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    if(GIAOVLCAR[playerid] == vehicle)
	    {
	        if(Vatlieuxe[playerid] == 1)
		 	{
		        SetPlayerCheckpoint(playerid,1599.6896,-2175.4043,13.5779,3.0);
				CP[playerid] = 2;
			}
		}
	}
	return 1;
}
hook OnPlayerDisconnect(playerid)
{
	DestroyVehicle(GIAOVLCAR[playerid]);
	DestroyDynamicObject(OBJECTVL[playerid]);
	//DestroyDynamic3DTextLabel(GIAOVLTEXT[playerid]);
	Delete3DTextLabel(GIAOVLTEXT[playerid]);
	DestroyDynamic3DTextLabel(GIAOVLTEXT[playerid]);
	Camhanghoa[playerid] = 0;
	Vatlieuxe[playerid] = 0;
	RemovePlayerAttachedObject(playerid,9);
	return 1;
}
	
	
hook OnGameModeInit()
{
    CreateDynamic3DTextLabel("{D7DF01}Giao vat lieu\nBuoc vao day de giao!",COLOR_YELLOW,1599.6896,-2175.4043,13.5779,10.0);
    PICKUPLVL = CreatePickup(1318, 1, 1599.6896,-2175.4043,13.5779);
	CreateActor(2, 2540.0505,-1717.1962,13.5098,94.7934);
	CreateDynamic3DTextLabel("{D7DF01}Job Vat lieu\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de xin viec",COLOR_YELLOW,2540.0505,-1717.1962,13.5098,10.0);
	return 1;
}
hook OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == PICKUPLVL)
	{
	    if(Camhanghoa[playerid] == 1)
	    {
	        new level = PlayerInfo[playerid][pLevel], matthem = level*3,string[333];
	        new tong = matthem + 10;
    		Camhanghoa[playerid] = 0;
    		PlayerInfo[playerid][pMats] += 100 + matthem;
    		format(string,333,"{0174DF}Giao vat lieu thanh cong ban duoc {00FF00}%d vat lieu{0174DF}",tong);
    		SendClientMessageEx(playerid,-1,string);
    		RemovePlayerAttachedObject(playerid,9);
    		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
	    }
	    else {
	        new string[123];
			format(string, sizeof(string), "~w~Ban khong cam thung hang!");
			GameTextForPlayer(playerid, string, 1000, 3);
		}
	}
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
	    if(IsPlayerInRangeOfPoint(playerid,3.0,2540.0505,-1717.1962,13.5098))
	    {
	        ShowPlayerDialog(playerid,DIALOG_GIAOVL,DIALOG_STYLE_LIST,"Giao Vat Lieu JOB","XIN VIEC\nTHUE XE/TRA XE\nLAY VAT LIEU[200$]\nTRA HANG[75 phan tram]","SELECT","CANCEL");
		}
	}
	if(newkeys & KEY_YES)
	{
		new closestcar = GetClosestCar(playerid);
		if(closestcar == GIAOVLCAR[playerid] && GIAOVLCAR[playerid] != INVALID_VEHICLE_ID)
		{
			new Float:xyz[3];
			GetVehiclePos(closestcar,xyz[0],xyz[1],xyz[2]);
			if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid,-1,"VUI LONG XUONG XE DE DUA VAT LIEU LEN XE");
	    	if(IsPlayerInRangeOfPoint(playerid ,2, xyz[0],xyz[1],xyz[2]))
	    	{
	    	    if(Vatlieuxe[playerid] == 0)
	    	    {
	    	        if(Camhanghoa[playerid] == 1)
	    	        {
		    	        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		    	        OBJECTVL[playerid] = CreateDynamicObject(1271,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
						AttachDynamicObjectToVehicle(OBJECTVL[playerid], GIAOVLCAR[playerid], 0.000, -0.770, 0.350, 0.000, 0.000, 0.000);
			    	    RemovePlayerAttachedObject(playerid,9);
			    	    Camhanghoa[playerid] = 0;
						Vatlieuxe[playerid] = 1;
					}
				}
				else if(Vatlieuxe[playerid] == 1)
				{
				    Vatlieuxe[playerid] = 0;
				    Camhanghoa[playerid] = 1;
				    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
				    DestroyDynamicObject(OBJECTVL[playerid]);
					SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
					//TogglePlayerControllable(playerid,1);
					PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
				}
	    	}
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_GIAOVL)
	{
	    if(response)
	    {
	        if(listitem == 0)
	        {
	            if(PlayerInfo[playerid][pJob] == 0) {
	                PlayerInfo[playerid][pJob] = 18;
	                SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"[JOB 1]Xin viec thanh cong, hay lay xe va bat dau cong viec!");
	                return 1;
	            }
	            else if((PlayerInfo[playerid][pDonateRank] > 0 || PlayerInfo[playerid][pFamed] > 0) && PlayerInfo[playerid][pJob2] == 0) {
	                PlayerInfo[playerid][pJob2] = 18;
	                SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"[JOB 2]Xin viec thanh cong, hay lay xe va bat dau cong viec!");
	            }
				else ShowPlayerDialog(playerid,DIALOG_GIAOVL2,DIALOG_STYLE_MSGBOX,"Giao Vat Lieu  JOB","Ban da co cong viec, vui long [/quitjob]","Dong","");
	        }
	        if(listitem == 1)
	        {
	            if(PlayerInfo[playerid][pJob] == 18 || PlayerInfo[playerid][pJob2] == 18) 
	            {
		            if(GetPVarInt(playerid, "Dalayxejob") == 0)
		            {
			            new virtual = GetPlayerVirtualWorld(playerid);
			            GIAOVLCAR[playerid] = CreateVehicle(510,2533.3469,-1712.7354,13.5719,262.5076, -1, -1, -1, 0);
						SetVehicleVirtualWorld(GIAOVLCAR[playerid],virtual+1);
						SetVehicleVirtualWorld(GIAOVLCAR[playerid],virtual);
						SetPVarInt(playerid,"Dalayxejob",1);
						SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Lay xe thanh cong!");
						/////
						//new str[50],name[20];
						//GetPlayerName(playerid,name,20);
						//format(str,sizeof(str),"{CC0033}Xe MTB cua %s",name);
						//GIAOVLTEXT[playerid] = CreateDynamic3DTextLabel(str, 0xCC0033FF, 0, 0, 0.4, 30, .attachedvehicle = GIAOVLCAR[playerid]);
		            }
		            else ShowPlayerDialog(playerid,DIALOG_LAYVATLIEU,DIALOG_STYLE_MSGBOX,"Giao Vat Lieu JOB","Ban co muon tra lai xe khong?","Tra","Huy");
				}
				else SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Ban khong phai la nguoi giao vat lieu!");
			}
	        if(listitem == 2)
	        {
	            if(Vatlieuxe[playerid] == 1) return SendClientMessageEx(playerid,-1,"Chi co the lay 1 thung hang");
	            if(PlayerInfo[playerid][pCash] < 200) return SendClientMessageEx(playerid,COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Ban khong du tien de mua vat lieu");
	            if(PlayerInfo[playerid][pJob] != 18 && PlayerInfo[playerid][pJob2] != 18) return SendClientMessageEx(playerid,COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Ban khong phai la nguoi giao vat lieu!");
	            if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid,COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Vui long xuong xe de lay thung vat lieu.");
	            if(Camhanghoa[playerid] == 0)
	            {
					Camhanghoa[playerid] = 1;
					GivePlayerCash(playerid, -200);
					SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
					//ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 0, 0, 0, 0, 0);
					//await task_ms(1200);
					//ClearAnimations(playerid);
					//TogglePlayerControllable(playerid,1);
					PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
					SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"[GIAO VAT LIEU] Ban da lay thung vat lieu voi gia 200$!");
				}
				else{
					SendClientMessageEx(playerid,-1,"Ban da lay vat lieu tren tay");
				}
			}
	        if(listitem == 3)
	        {
	            if(Camhanghoa[playerid] == 1)
	            {
	            	ShowPlayerDialog(playerid,DIALOG_TRAVLZ,DIALOG_STYLE_MSGBOX,"Giao Vat Lieu JOB","Gia tra lai la 150$","Tra","Huy");
				}
				else SendClientMessageEx(playerid,-1,"Ban chua cam hang hoa tren tay");
			}
		}
	}
	if(dialogid == DIALOG_TRAVLZ)
	{
	    if(response)
	    {
			RemovePlayerAttachedObject(playerid,9);
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
			Camhanghoa[playerid] = 0;
			PlayerInfo[playerid][pCash] += 150;
			SendClientMessageEx(playerid,-1,"Ban da tra vat lieu lai va nhan duoc 300$");
		}
	}
	if(dialogid == DIALOG_LAYVATLIEU)
	{
	    if(response)
	    {
	    	if(GetPVarInt(playerid, "Dalayxejob") == 1)
	    	{
	            DestroyVehicle(GIAOVLCAR[playerid]);
	            DestroyDynamicObject(OBJECTVL[playerid]);
				DestroyDynamic3DTextLabel(GIAOVLTEXT[playerid]);
				Vatlieuxe[playerid] = 0;
				SendClientMessageEx(playerid,COLOR_YELLOW,"[GIAO VAT LIEU JOB] Tra xe thanh cong!");
				DeletePVar(playerid,"Dalayxejob");
			}
		}
	}
	return 1;
}
