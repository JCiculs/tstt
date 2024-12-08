#include <a_samp>
#include <YSI_Coding\y_hooks>
#define  DIALOG_THUEXE 999
#define  VITRI_LAYXE 2458.5942,-2076.1543,13.5469 // vi tri lay xe
#define  VITRI_LAYHANG 2427.9241,-2122.6602,13.5522 // khu vuc lay hang
#define  VITRI_CP 1268.4641,-1269.8646,13.5060 // cp 1
#define  VITRI_CP1 1072.6162,-1384.9764,13.8716 // cp 2
#define  VITRI_CP2 1565.7850,-1170.4961,24.0788 // cp 3
#define  VITRI_CP3 2244.4150,-1665.3550,15.4766 // cp 4
#define  VITRI_CP4 2105.3188,-1806.3674,13.5547 // cp 5
#define  VITRI_XINVIEC 2426.3901,-2114.2390,13.5522 // vi tri xin viec
#define  VITRI_QUAYVE 2484.6802,-2120.4834,13.5469 
#define  DIALOG_TRUCKERJOB 998
new quayvenhantientrucker[MAX_PLAYERS];
new hanglau[MAX_PLAYERS];
//new TruckerMap[89];
new ActorTruckerNew[1];
new dalock[MAX_PLAYERS];
CMD:giathitruong(playerid)
{
	new s[129];
	format(s,sizeof(s),"Gia hang hoa hien tai la: {1db4ee}%d",giathitruong);
	SendClientMessage(playerid, -1, s);
	format(s,sizeof(s),"Gia xang dau hien tai la: {cea809}%d",giadauhientai);
	SendClientMessage(playerid, -1, s);
	return 1;
}
/*CMD:checkgia(playerid)
{
	new str[128];
	format(str,128,"%d",giathitruong);
	SendClientMessage(playerid, -1,str);
	return 1;
}*/
// 1 tieng
task UpdateGiaThiTruong[600000](){
	new str[128];
	new ngaunhien = Random(200,1000);
	giathitruong = ngaunhien;
	format(str,sizeof(str),"{1db4ee}[Hang hoa]{FFFFFF}: Gia thi truong hien da cap nhap hien tai la %d",giathitruong);
	SendClientMessageToAll(-1, str);
}
hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(GetPVarInt(playerid, "camhang") == 1)
	{
	    DeletePVar(playerid, "camhang");
	}
	return 1;
}
CMD:traxe(playerid, params[])
{
	//#include "./includes/congviec/truckerjob.inc"
	new vehicleid = GetPlayerVehicleID(playerid);
	new Float:health;
	GetVehicleHealth(vehicleid, health);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_LAYXE))
	{
		if(dalayxetrucker[playerid] == 1)
		{
			/*if(health <= 600)
			{
				truckerdonhang[playerid] = 0;
				SoLanTrucker[playerid] = 0;
				soluonghang[playerid] = 0;
				DestroyVehicle(TruckerOwner[playerid][Player_Vehicle_ID]);
				dalayxetrucker[playerid] = 0;
				DeletePVar(playerid, "camhang");
				RemovePlayerAttachedObject(playerid, 0);
				TruckerOwner[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
				TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
				SendClientMessage(playerid, -1, "Ban da tra xe lai cho cong ty");
				SendClientMessage(playerid, COLOR_GREY,"Do hu hong qua nang nen cua hang da phat ban 100$ tien sua chua phuong tien");
				PlayerInfo[playerid][pCash] -= 100;
			}
			else
			{
				PlayerInfo[playerid][pCash] += 100;
				truckerdonhang[playerid] = 0;
				SoLanTrucker[playerid] = 0;
				soluonghang[playerid] = 0;
				DestroyVehicle(TruckerOwner[playerid][Player_Vehicle_ID]);
				dalayxetrucker[playerid] = 0;
				DeletePVar(playerid, "camhang");
				RemovePlayerAttachedObject(playerid, 0);
				TruckerOwner[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
				TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
				SendClientMessage(playerid, -1, "Ban da tra xe lai cho cong ty");
				SendClientMessage(playerid, COLOR_YELLOW, "Do ban y thuc tot nen cua hang da tra lai so tien 100$");
			}*/
			truckerdonhang[playerid] = 0;
			SoLanTrucker[playerid] = 0;
			soluonghang[playerid] = 0;
			DestroyVehicle(TruckerOwner[playerid][Player_Vehicle_ID]);
			dalayxetrucker[playerid] = 0;
			DeletePVar(playerid, "camhang");
			RemovePlayerAttachedObject(playerid, 0);
			TruckerOwner[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;
			TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
			SendClientMessage(playerid, -1, "Ban da tra xe lai cho cong ty");
			return 1;
		}
		else SendClientMessage(playerid, COLOR_GREY, "Ban khong thue xe");
	}
	return 1;
}

CMD:huybogiaohang(playerid, params[])
{
	hanglau[playerid] = 0;
	quayvenhantientrucker[playerid] = 0;
	truckerdonhang[playerid] = 0;
	TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
	DeletePVar(playerid, "camhang");
	soluonghang[playerid] = 0;
	SoLanTrucker[playerid] = 0;
	SendClientMessage(playerid, -1, "Ban da huy bo giao hang hay lay hang lai va tiep tuc");
	return 1;
}
CMD:giaohang(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_GREY, "Ban can o tren xe");
	if(TruckerOwner[playerid][Player_Vehicle_ID] != vehicleid) 
		return SendClientMessageEx(playerid, COLOR_GREY, "Day khong phai la phuong tien cua ban");
	if(truckerdonhang[playerid] == 1) return SendClientMessage(playerid, -1, "Ban dang giao hang khong the giap tiep /huybogiaohang");
	//if(TimerTruckerJob <= 0) return SendClientMessage(playerid, -1, "Khung gio lam viec cua trucker la 6h den 12h"); 
	if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20) 
	{
		ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX,"Thong bao","Hay chay den vi tri cham do, chon don hang ma ban muon giao di","OK","");
		SetPlayerCheckpoint(playerid, VITRI_QUAYVE, 5.0);
		CP[playerid] = 10;
	}
	return 1;

}

CMD:vlock(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetVehiclePos(TruckerOwner[playerid][Player_Vehicle_ID], X, Y, Z);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, X, Y, Z))
	{
		if(dalock[playerid] == 0)
		{
			dalock[playerid] = 1;
			TextDrawShowForPlayer(playerid, Notifix[7]);
			SendClientMessage(playerid, COLOR_GREY, "[DOOR] Lock");
			vehicle_lock_doors(TruckerOwner[playerid][Player_Vehicle_ID]);
			await task_ms(1000);
			TextDrawHideForPlayer(playerid, Notifix[7]);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "[DOOR] Unlock");
			dalock[playerid] = 0;
			TextDrawShowForPlayer(playerid, Notifix[8]);
			vehicle_unlock_doors(TruckerOwner[playerid][Player_Vehicle_ID]);
			await task_ms(1500);
			TextDrawHideForPlayer(playerid, Notifix[8]);
		}
		return 1;
	}
	else SendClientMessage(playerid, -1, "Ban khong o gan xe cua ban");
	return 1;
}
CMD:chathang(playerid, params[])
{
		new Float:TruckerX, Float:TruckerY, Float:TruckerZ;
		new TongSoLuongTrucker = TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]];
		GetVehiclePos(TruckerOwner[playerid][Player_Vehicle_ID], TruckerX, TruckerY, TruckerZ);
		if(IsPlayerInRangeOfPoint(playerid, 6, TruckerX,TruckerY,TruckerZ))
		{
			if(soluonghang[playerid] == 0) return 1;
			if(IsPlayerInAnyVehicle(playerid)) return 1;
			
			new engine,lights,alarm,doors,bonnet,boot,objective;
			new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID, 10.0);
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
			{	
				SendClientMessageEx(playerid, COLOR_GRAD1, "Ban can mo cop xe moi co de dat hang len duoc");
				return 1;
			}
			if(TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] >= 5)
			{
				SendClientMessage(playerid, -1, "Ban da chat day thung hang");
				return 1;
			}
			if(GetPVarInt(playerid, "DANGCHATHANG") == 1)
			{
				return SendClientMessage(playerid, -1, "Tu tu thoi ban ey");
			}
			new str[128];
			SetPVarInt(playerid, "DANGCHATHANG", 1);
			TogglePlayerControllable(playerid, 0);
			ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.0999, 1, 0, 0, 0, 0);
			format(str, sizeof(str),"Dang chat hang len xe");
			PlayerTextDrawSetString(playerid, Notistr[playerid],str);
			PlayerTextDrawShow(playerid, Notistr[playerid]);
			ClearAnimations(playerid);
			await task_ms(3000);
			DeletePVar(playerid, "DANGCHATHANG");
			TogglePlayerControllable(playerid, 1);
			PlayerTextDrawHide(playerid, Notistr[playerid]);
			switch(TongSoLuongTrucker)
			{
				case 0:
				{
					RemovePlayerAttachedObject(playerid, 0);
					TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] ++;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF}Ban da dat mot thung hang len xe 1/5");
					soluonghang[playerid] = 0;
				}
				case 1:
				{
					RemovePlayerAttachedObject(playerid, 0);
					TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] ++;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF}Ban da dat mot thung hang len xe 2/5");
					soluonghang[playerid] = 0;
				}
				case 2:
				{
					RemovePlayerAttachedObject(playerid, 0);
					TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] ++;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF}Ban da dat mot thung hang len xe 3/5");
					soluonghang[playerid] = 0;
				}
				case 3:
				{
					RemovePlayerAttachedObject(playerid, 0);
					TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] ++;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF}Ban da dat mot thung hang len xe 4/5");
					soluonghang[playerid] = 0;
				}
				case 4:
				{
					RemovePlayerAttachedObject(playerid, 0);
					TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] ++;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF}Ban da dat mot thung hang len xe 5/5");
					soluonghang[playerid] = 0;
					SendClientMessage(playerid, -1,"{1db4ee}[TRUCKER]{FFFFFF} Ban da lay du so luong hang hay /giaohang de bat dau di giao hang tren cac dia diem");
				}
			}
			
		}
		return 1;		
}
CMD:layhang(playerid, params[])
{
		new Float:TruckerX, Float:TruckerY, Float:TruckerZ;
		GetVehiclePos(TruckerOwner[playerid][Player_Vehicle_ID], TruckerX, TruckerY, TruckerZ);
		if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20) 
		{
			if(!IsPlayerInAnyVehicle(playerid))
			{

				if(truckerdonhang[playerid] == 1 || hanglau[playerid] == 1)
				{
					if(IsPlayerInRangeOfPoint(playerid, 5, TruckerX,TruckerY,TruckerZ))
					{
						new vehicleid = GetClosestCar(playerid, INVALID_VEHICLE_ID, 10.0);
						new engine,lights,alarm,doors,bonnet,boot,objective;
						GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
						if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
						{
							SendClientMessageEx(playerid, COLOR_GRAD1, "Ban can mo cop xe moi co the lay hang xuong");
							return 1;
						}
						if(GetPVarInt(playerid, "camhang") == 1)
							return SendClientMessage(playerid, COLOR_GREY,"Ban da lay hang roi hay dua vao cua hang va lay tiep");
						
						TogglePlayerControllable(playerid, 0);
						ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.0999, 1, 0, 0, 0, 0);
						await task_ms(1000);
						TextDrawShowForPlayer(playerid, Notifix[4]);
						SetPVarInt(playerid, "textdrawlayhang", 1);
						SetTimerEx("OnPlayerLayHang",1000,0,"i",playerid);
						SetPlayerAttachedObject(playerid, 0, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
						ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
						SetPVarInt(playerid, "camhang", 1);
						TogglePlayerControllable(playerid, 1);
					}
					else SendClientMessage(playerid, -1, "Ban khong o gan phuong tien cua ban");
					return 1;
				}
			}
		}
		return 1;

}
CMD:giaohang11ntv(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_GREY, "Ban can o tren xe");
	if(TruckerOwner[playerid][Player_Vehicle_ID] != vehicleid) 
		return SendClientMessageEx(playerid, COLOR_GREY, "Day khong phai la phuong tien cua ban");
	if(truckersoluong < 1) return SendClientMessage(playerid, COLOR_GREY, "Hien tai da het hang");
	if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
	{
		if(TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] >= 5)
		{
			/*switch(random(5))
			{
				case 0:
				{
					truckerdonhang[playerid] = 1;
					SoLanTrucker[playerid] = 1;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
					SetPlayerCheckpoint(playerid, VITRI_CP, 5.0);
				}
				case 1:
				{
					truckerdonhang[playerid] = 1;
					SoLanTrucker[playerid] = 2;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
					SetPlayerCheckpoint(playerid, VITRI_CP1, 5.0);
				}
				case 2:
				{
					truckerdonhang[playerid] = 1;
					SoLanTrucker[playerid] = 2;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
					SetPlayerCheckpoint(playerid, VITRI_CP2, 5.0);
				}
				case 3:
				{
					truckerdonhang[playerid] = 1;
					SoLanTrucker[playerid] = 2;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
					SetPlayerCheckpoint(playerid, VITRI_CP3, 5.0);
				}
				case 4:
				{
					truckerdonhang[playerid] = 1;
					SoLanTrucker[playerid] = 2;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
					SetPlayerCheckpoint(playerid, VITRI_CP4, 5.0);
				}
			}*/
			SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da nhan duoc mot don hang hay chay theo vi tri cham do tren ban do de giao");
			SoLanTrucker[playerid] = 1;
			truckerdonhang[playerid] = 1;
			SetPlayerCheckpoint(playerid, 1606.6876,733.3566,10.8203, 5.0);
			truckersoluong -= 1;
		}
		else SendClientMessage(playerid, -1,"Ban chua lay du don hang");
	}
	else SendClientMessage(playerid, COLOR_GREY,"Ban chua nhan cong viec");
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_TRUCKERJOB)
	{
		if(response)
		{
			if(listitem == 0)
			{
				cmd_giaohang11ntv(playerid,"");
			}
			if(listitem == 1)
			{
				if(hanglau[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban da nhan don hang roi hay di giao");
				new vehicleid = GetPlayerVehicleID(playerid);
				if(khosung < 1) return SendClientMessage(playerid, COLOR_GREY, "Hien kho dang het hang");
				if(TruckerOwner[playerid][Player_Vehicle_ID] == vehicleid){
					if(TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] >= 5){
						khosung --;
						hanglau[playerid] = 1;
						SetPlayerCheckpoint(playerid, 1341.5193,324.5612,20.5010, 5.0);
						SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Hay van chuyen ra ngoai o, ban co the bi canh sat bat neu bi phat hien");
					}
					else SendClientMessage(playerid, COLOR_GREY, "Ban chua lay du so hang");
				}
				else SendClientMessage(playerid, COLOR_GREY, "Ban can o tren phuong tien cua ban");
			}
		}
	}
	if(dialogid == DIALOG_THUEXE)
	{
		if(!response)
		{
			SendClientMessage(playerid, -1,"{1db4ee}[TRUCKER]{FFFFFF} Hen gap lai");
		}
		else
		{
			if(dalayxetrucker[playerid] == 1)
				return SendClientMessage(playerid,COLOR_GREY,"Ban da thue mot chiec khong the thue tiep /huybo trucker");
			new lights,alarm,bonnet,objective;
			new vehicleid = GetPlayerVehicleID(playerid);
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(playerid, X, Y, Z);
			TruckerOwner[playerid][Player_Vehicle_ID] = CreateVehicle(414, X+2,Y,Z, -1, -1, -1, -1);

			dalayxetrucker[playerid] = 1;
			SendClientMessageEx(playerid, -1,"Ban da thue mot phuong tien giao hang - tu cong ty van chuyen");
			//PutPlayerInVehicle(playerid, TruckerOwner[playerid][Player_Vehicle_ID], 0);
			SetVehicleParamsEx(TruckerOwner[playerid][Player_Vehicle_ID],VEHICLE_PARAMS_OFF,lights,alarm,0,bonnet,0,objective);
			SendClientMessage(playerid, -1, "Neu het xang hay /bomxang de bom xang cho phuong tien cua minh nhe");
			VehicleFuel[vehicleid] = TruckerOwner[playerid][Player_Vehicle_ID] + 100.0;
			VehicleFuel[TruckerOwner[playerid][Player_Vehicle_ID]] += 1000.0;
			new str[128];
			format(str, sizeof(str),"/vlock de mo khoa - khoa xe lai tranh bi cuop");
			PlayerTextDrawSetString(playerid, Notistr[playerid],str);
			PlayerTextDrawShow(playerid, Notistr[playerid]);
			await task_ms(2000);
			PlayerTextDrawHide(playerid, Notistr[playerid]);

		}		
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	/*if(TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] > 0)
	{
		TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
	}*/
	hanglau[playerid] = 0;
	dalock[playerid] = 0;
	DeletePVar(playerid, "DANGCHATHANG");
	truckerdonhang[playerid] = 0;
	DestroyVehicle(TruckerOwner[playerid][Player_Vehicle_ID]);
	TextDrawHideForPlayer(playerid, Notifix[4]);
	SoLanTrucker[playerid] = 0;
	soluonghang[playerid] = 0;
	dalayxetrucker[playerid] = 0;
	DeletePVar(playerid, "camhang");
	RemovePlayerAttachedObject(playerid, 0);
	quayvenhantientrucker[playerid] = 0;
	TruckerOwner[playerid][Player_Vehicle_ID] = INVALID_VEHICLE_ID;

}
forward OnPlayerLayHang(playerid);
public OnPlayerLayHang(playerid)
{
	if(GetPVarType(playerid, "textdrawlayhang") == 1)
	{
		DeletePVar(playerid, "textdrawlayhang");
		TextDrawHideForPlayer(playerid, Notifix[4]);
	}
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, VITRI_LAYXE))
		{
			if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20) 
			{
				ShowPlayerDialog(playerid, DIALOG_THUEXE, DIALOG_STYLE_MSGBOX, "Vehicle", "Ban co muon thue mot chiec xe da giao hang khong\nSo tien thue cho mot chiec xe la 200 dolar", "Thue", "Khong");
			}
			else SendClientMessage(playerid, COLOR_GREY,"Ban chua nhan cong viec");
		}
		if(IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_XINVIEC))
        {
       		ShowPlayerDialog(playerid, ACTOR_XINVIEC, DIALOG_STYLE_LIST, "Cong viec", "{006666}Xin Viec\n \n  Cap do 1\n  Phuong tien\tMule", "{ae0202}Chon","{FFFFFF}Huy");
		}
		new Float:TruckerX, Float:TruckerY, Float:TruckerZ;
		GetVehiclePos(TruckerOwner[playerid][Player_Vehicle_ID], TruckerX, TruckerY, TruckerZ);
		if(IsPlayerInRangeOfPoint(playerid, 5, TruckerX,TruckerY,TruckerZ))
		{
			if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
			{
				cmd_layhang(playerid,"");
			}
			if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
			{
				cmd_chathang(playerid,"");
			}
		}
	}
	if(newkeys & KEY_CTRL_BACK)
	{
		if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
		{ 
			if(IsPlayerInRangeOfPoint(playerid, 3, VITRI_LAYHANG))
			{
				new vehicleid = GetPlayerVehicleID(vehicleid);
				if(IsPlayerInAnyVehicle(playerid))
					return SendClientMessage(playerid, COLOR_GREY,"Ban can xuong xe");
				if(dalayxetrucker[playerid] == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua thue phuong tien");
				if(soluonghang[playerid] != 1)
				{
					TogglePlayerControllable(playerid, 0);
					ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 1, 0, 0, 0, 0);
					await task_ms(1500);
					TogglePlayerControllable(playerid, 1);
					soluonghang[playerid] = 1;
					SetPlayerAttachedObject(playerid, 0, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
					ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,0);
					ClearAnimations(playerid);
					SendClientMessage(playerid, -1,"{1db4ee}[TRUCKER]{FFFFFF}Hay mang ve phuong tien cho hang cua ban");
				}
				else SendClientMessage(playerid, COLOR_GREY,"Ban da lay hang");
			}
		}
	}
	return 1;
}
hook OnGameModeInit()
{
	truckersoluong = 50;
	giathitruong = 350;
	CreateDynamicPickup(1081,0,VITRI_LAYXE,-1,0);
	CreateDynamicPickup(1212,0,VITRI_QUAYVE,-1,0);
	CreateDynamic3DTextLabel("Khu vuc thue phuong tien\n\n'{993300}Y{FFFFFF}'\n'traxe'", -1, VITRI_LAYXE, 15);
	CreateDynamic3DTextLabel("Khu vuc lay hang\n\n'{00FFCC}H{FFFFFF}'", -1, VITRI_LAYHANG, 15);

	//thung go
	CreateObject(2912, 2461.76538, -2120.16602, 12.49076,   0.00000, 0.00000, 359.65479);
	CreateObject(2912, 2460.83398, -2120.85938, 12.48362,   0.00000, 0.00000, 0.00000);
	CreateObject(2912, 2461.68677, -2120.81738, 12.48362,   0.00000, 0.00000, 0.00000);
	CreateObject(2912, 2462.35669, -2120.42944, 12.56065,   0.00000, 0.00000, 358.08728);
	CreateObject(2912, 2462.12183, -2120.57495, 13.20083,   0.00000, 0.00000, 359.69696);
	CreateObject(2912, 2460.09326, -2120.58276, 12.56065,   0.00000, 0.00000, 358.08728);
	CreateObject(2912, 2460.05127, -2119.72998, 12.56065,   0.00000, 0.00000, 358.08728);
	CreateObject(2912, 2460.93311, -2120.04346, 12.56065,   0.00000, 0.00000, 358.08728);
	CreateObject(2912, 2460.25415, -2120.22363, 13.20083,   0.00000, 0.00000, 359.69696);
	CreateObject(2912, 2461.17725, -2120.96313, 13.20083,   0.00000, 0.00000, 359.69696);
	
	// mapping
	new tmpobjid;
	tmpobjid = CreateObject(3095, 2429.309326, -2120.135498, 11.996866, 0.000000, 0.000000, -179.899963);
	SetObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateObject(19360, 2432.093994, -2115.702636, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19411, 2432.196044, -2106.733642, 14.242234, 0.000000, 0.000000, -89.799934);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(3095, 2429.297119, -2111.165039, 11.996866, 0.000000, 0.000000, -179.899963);
	SetObjectMaterial(tmpobjid, 0, 12946, "ce_bankalley1", "sw_brick03", 0x00000000);
	tmpobjid = CreateObject(19411, 2426.025390, -2106.751953, 14.242234, 0.000000, 0.000000, -89.799934);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 12.549755, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 13.669757, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2106.817626, 13.679764, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.707763, -2106.817626, 12.469746, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.802001, -2106.720703, 16.814565, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 12944, "ce_bankalley2", "sw_brick04", 0x00000000);
	tmpobjid = CreateObject(1502, 2430.615722, -2106.641357, 11.065073, 0.000000, 0.000000, -179.700103);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(1502, 2427.618408, -2106.720214, 11.035404, 0.000000, -1.000000, -0.100187);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(19360, 2433.714111, -2108.305175, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 13.629755, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 12.529758, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19360, 2433.714111, -2114.981201, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2111.676513, 12.989828, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2108.425048, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2111.586425, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2114.728271, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2117.909912, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2121.060791, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2426.419677, -2124.602294, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2429.622314, -2124.578613, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2432.255126, -2124.556152, 14.246891, 0.000000, 0.000000, -89.599845);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2426.240722, -2115.744628, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.919921, -2123.795654, 14.256405, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.933349, -2122.183105, 14.256405, 0.000000, 0.000000, 0.599757);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2108.450195, 16.802446, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2111.901367, 16.778356, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2115.364746, 16.754161, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2118.865966, 16.729730, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2122.357177, 16.705373, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2122.907714, 16.701517, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2431.981445, -2124.543212, 16.690107, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.488769, -2124.578857, 16.689849, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2425.526855, -2124.609619, 16.689636, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2431.888183, -2115.722167, 16.751703, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.968261, -2115.749023, 16.751502, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2425.565429, -2115.782958, 16.751256, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2432.003906, -2106.691894, 16.814767, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2426.159423, -2106.738525, 16.814432, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.739257, -2123.751220, 14.217487, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2117.594726, 16.738620, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2122.878417, 16.701749, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2119.415283, 16.725923, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(2639, 2433.344238, -2108.139648, 13.162235, 0.000000, 0.000000, 88.999984);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 13.619770, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 12.509761, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 12.509761, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 13.649760, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 14.799765, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2113.961669, 16.763961, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2110.510009, 16.788055, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2108.559814, 16.801675, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(1502, 2430.660156, -2115.679931, 11.065073, 0.000000, 0.000000, -179.700103);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(1502, 2427.682373, -2115.735839, 11.035404, 0.000000, -1.000000, -0.100187);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.832519, -2122.727783, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.935791, -2112.393066, 16.882783, -0.599996, -89.999984, -90.400024);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.889404, -2119.294433, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.947265, -2115.832519, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.956054, -2109.239990, 16.882783, -0.599996, -89.999984, -90.400024);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2426.428710, -2107.485107, 17.006484, 0.000000, 91.599952, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2432.318847, -2108.367431, 16.847869, 0.000000, 91.599952, 90.300003);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2429.780517, -2107.485107, 16.912948, 0.000000, 91.599952, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2432.939453, -2108.366699, 16.847869, 0.000000, 91.599952, 90.300003);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(11729, 2433.156005, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(1649, 2433.773437, -2111.621093, 14.326903, 0.000000, 0.000000, 90.399971);
	tmpobjid = CreateObject(1649, 2433.773437, -2111.621093, 14.326903, 0.000000, 0.000000, -90.599967);
	tmpobjid = CreateObject(2714, 2429.273437, -2106.556152, 16.893018, 0.000000, 0.000000, -179.000045);
	tmpobjid = CreateObject(2008, 2425.716796, -2113.708251, 12.572230, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19999, 2425.814208, -2114.887939, 12.552231, 0.000000, 0.000000, 146.200057);
	tmpobjid = CreateObject(2182, 2432.146240, -2114.103515, 12.552231, 0.000000, 0.000000, -90.200073);
	tmpobjid = CreateObject(2639, 2433.239501, -2112.429199, 13.162235, 0.000000, 0.000000, 88.599990);
	tmpobjid = CreateObject(2639, 2433.292236, -2110.270019, 13.162235, 0.000000, 0.000000, 88.599990);
	tmpobjid = CreateObject(16780, 2429.147460, -2111.364990, 16.797708, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2427.966552, -2119.848144, 16.850215, 0.200003, -2.199999, -179.999984);
	tmpobjid = CreateObject(1893, 2431.255859, -2119.848144, 16.723911, 0.200003, -2.199999, -179.999984);
	tmpobjid = CreateObject(2991, 2426.063964, -2122.473144, 13.128541, 0.000000, 0.000000, -89.299980);
	tmpobjid = CreateObject(2991, 2426.001953, -2118.079345, 13.128541, 0.000000, 0.000000, -89.299980);
	tmpobjid = CreateObject(2912, 2425.452636, -2121.447998, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.218750, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.999511, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.770019, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.439697, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.589111, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2121.748535, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.178955, 15.056874, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.119873, 15.056874, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.689453, 15.686883, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19825, 2429.054443, -2115.640625, 16.325563, 0.000000, 0.000000, -177.299926);
	tmpobjid = CreateObject(11729, 2431.154052, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2431.834716, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2432.485351, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	
	
	//mapping
	/*TruckerMap[0] = CreateObject(19353, 2443.3405, -2119.9458, 14.3029, 0.0000, 0.0000, -1.6999); //wall001
	TruckerMap[1] = CreateObject(19399, 2443.7333, -2107.1303, 14.3067, 0.0000, 0.0000, -1.7999); //wall047
	TruckerMap[2] = CreateObject(19353, 2443.4375, -2116.7272, 14.3029, 0.0000, 0.0000, -1.6999); //wall001
	TruckerMap[3] = CreateObject(19353, 2443.5317, -2113.5390, 14.3029, 0.0000, 0.0000, -1.6999); //wall001
	TruckerMap[4] = CreateObject(19353, 2443.6274, -2110.3332, 14.3029, 0.0000, 0.0000, -1.6999); //wall001
	TruckerMap[5] = CreateObject(19353, 2443.8212, -2103.9345, 14.3029, 0.0000, 0.0000, -1.6999); //wall001
	TruckerMap[6] = CreateObject(19353, 2426.4536, -2099.4946, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[7] = CreateObject(19353, 2429.6433, -2099.4392, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[8] = CreateObject(19353, 2442.4916, -2099.2145, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[9] = CreateObject(19353, 2443.9475, -2100.8552, 14.3029, 0.0000, 0.0000, 177.4998); //wall001
	TruckerMap[10] = CreateObject(19353, 2439.4033, -2099.2685, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[11] = CreateObject(19383, 2432.8500, -2099.3808, 14.3067, 0.0000, 0.0000, 90.6998); //wall031
	TruckerMap[12] = CreateObject(19353, 2436.3637, -2099.3210, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[13] = CreateObject(19353, 2435.8933, -2099.3291, 14.3029, 0.0000, 0.0000, 91.0000); //wall001
	TruckerMap[14] = CreateObject(19353, 2441.6750, -2121.5344, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[15] = CreateObject(19353, 2438.6020, -2121.3298, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[16] = CreateObject(19353, 2435.4982, -2121.1228, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[17] = CreateObject(19353, 2432.3459, -2120.9118, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[18] = CreateObject(19353, 2429.2246, -2120.7041, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[19] = CreateObject(19353, 2426.4704, -2120.5212, 14.3029, 0.0000, 0.0000, 86.1999); //wall001
	TruckerMap[20] = CreateObject(19353, 2424.9438, -2118.8383, 14.3043, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[21] = CreateObject(19353, 2424.9980, -2115.9890, 14.3043, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[22] = CreateObject(19353, 2424.9980, -2115.9890, 14.3043, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[23] = CreateObject(19353, 2425.0603, -2112.7692, 14.3043, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[24] = CreateObject(19353, 2425.1313, -2109.5717, 14.3142, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[25] = CreateObject(19353, 2425.1921, -2106.4025, 14.3142, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[26] = CreateObject(19353, 2425.1921, -2106.4025, 14.3142, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[27] = CreateObject(19353, 2425.2512, -2103.3234, 14.3142, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[28] = CreateObject(19353, 2425.2939, -2101.0942, 14.3142, 0.0000, 1.0000, -1.0999); //wall001
	TruckerMap[29] = CreateObject(2714, 2432.8146, -2099.2268, 15.4566, 0.0000, 0.0000, 176.2998); //CJ_OPEN_SIGN_2
	TruckerMap[30] = CreateObject(2164, 2443.3820, -2111.1787, 12.6199, 0.0000, 0.0000, -93.1000); //MED_OFFICE_UNIT_5
	TruckerMap[31] = CreateObject(11729, 2443.6457, -2099.6599, 12.5594, 0.0000, 0.0000, -91.9999); //GymLockerClosed1
	TruckerMap[32] = CreateObject(11729, 2443.6247, -2100.2802, 12.5594, 0.0000, 0.0000, -91.9999); //GymLockerClosed1
	TruckerMap[33] = CreateObject(11729, 2443.6008, -2100.9604, 12.5594, 0.0000, 0.0000, -91.9999); //GymLockerClosed1
	TruckerMap[34] = CreateObject(11729, 2443.5805, -2101.5607, 12.5594, 0.0000, 0.0000, -91.9999); //GymLockerClosed1
	TruckerMap[35] = CreateObject(11745, 2443.5463, -2100.1384, 14.7677, 0.0000, 0.0000, 0.0000); //HoldAllEdited1
	TruckerMap[36] = CreateObject(19904, 2443.5493, -2100.7729, 14.9089, 3.2000, 0.0000, -94.5000); //ConstructionVest1
	TruckerMap[37] = CreateObject(19904, 2443.5156, -2101.1921, 14.9089, 3.2000, 0.0000, -94.5000); //ConstructionVest1
	TruckerMap[38] = CreateObject(19904, 2443.4829, -2101.6015, 14.9089, 3.2000, 0.0000, -94.5000); //ConstructionVest1
	TruckerMap[39] = CreateObject(19899, 2443.1418, -2109.3723, 12.5628, 0.0000, 0.0000, 175.7998); //ToolCabinet1
	TruckerMap[40] = CreateObject(19921, 2442.7204, -2109.4743, 14.7390, 0.0000, 0.0000, -95.5998); //CutsceneToolBox1
	TruckerMap[41] = CreateObject(3397, 2425.9094, -2108.0937, 12.5265, 0.0000, 0.0000, 179.6999); //a51_sdsk_1_
	TruckerMap[42] = CreateObject(1736, 2443.3530, -2103.9672, 15.3767, 0.0000, 0.0000, -97.3999); //CJ_Stags_head
	TruckerMap[43] = CreateObject(1977, 2443.2060, -2105.3583, 12.5268, 0.0000, 0.0000, -92.0000); //vendin3
	TruckerMap[44] = CreateObject(3391, 2425.6169, -2118.5495, 12.4960, -0.3000, 0.0000, 178.0998); //a51_sdsk_ncol2_
	TruckerMap[45] = CreateObject(3392, 2425.8232, -2115.0395, 12.5768, 0.0000, 0.0000, 177.5998); //a51_sdsk_ncol3_
	TruckerMap[46] = CreateObject(3393, 2425.9069, -2111.5786, 12.5567, 0.0000, 0.0000, -179.8999); //a51_sdsk_ncol4_
	TruckerMap[47] = CreateObject(11706, 2425.5012, -2105.6960, 12.5385, 0.0000, 0.0000, -91.5000); //SmallWasteBin1
	TruckerMap[48] = CreateObject(19999, 2431.0244, -2120.0661, 12.5671, 0.0000, 0.0000, 174.3999); //CutsceneChair2
	TruckerMap[49] = CreateObject(1806, 2426.9675, -2118.5019, 12.5279, 0.0000, 0.0000, 92.9999); //MED_OFFICE_CHAIR
	TruckerMap[50] = CreateObject(2008, 2430.4892, -2119.0200, 12.5539, 0.0000, 0.0000, -4.9000); //officedesk1
	TruckerMap[51] = CreateObject(1806, 2427.1633, -2114.9633, 12.5079, 0.0000, 0.0000, 92.9999); //MED_OFFICE_CHAIR
	TruckerMap[52] = CreateObject(1806, 2427.1335, -2111.5239, 12.5279, 0.0000, 0.0000, 92.9999); //MED_OFFICE_CHAIR
	TruckerMap[53] = CreateObject(1806, 2427.0583, -2107.9731, 12.5279, 0.0000, 0.0000, 92.9999); //MED_OFFICE_CHAIR
	TruckerMap[54] = CreateObject(1723, 2442.4191, -2118.9689, 12.5272, 0.0000, 0.0000, -92.9999); //mrk_seating1
	TruckerMap[55] = CreateObject(1723, 2442.5705, -2116.0834, 12.5272, 0.0000, 0.0000, -92.9999); //mrk_seating1
	TruckerMap[56] = CreateObject(19825, 2430.9792, -2120.6970, 15.2068, 0.0000, 0.0000, 178.6999); //SprunkClock1
	TruckerMap[57] = CreateObject(2356, 2430.9501, -2117.6926, 12.5411, 0.0000, 0.0000, 173.8999); //police_OFF_CHAIR
	TruckerMap[58] = CreateObject(19273, 2433.8437, -2099.5175, 14.4868, 0.0000, 0.0000, 0.0000); //KeypadNonDynamic
	TruckerMap[59] = CreateObject(19810, 2425.4418, -2114.8620, 14.7728, 0.0000, 0.0000, -97.9000); //StaffOnlySign1
	TruckerMap[60] = CreateObject(19916, 2442.7309, -2115.2524, 12.4380, -0.1999, 0.0000, -94.7998); //CutsceneFridge1
	TruckerMap[61] = CreateObject(11738, 2442.8041, -2110.3076, 14.6770, 0.0000, 0.0000, -96.3000); //MedicCase1
	TruckerMap[62] = CreateObject(11737, 2443.1018, -2113.4206, 15.4544, 89.8000, -98.5000, 7.0999); //RockstarMat1
	TruckerMap[63] = CreateObject(19166, 2439.6708, -2121.2299, 15.0256, -90.5998, 5.3000, 0.0000); //GTASAMap3
	TruckerMap[64] = CreateObject(18976, 2442.7321, -2110.3056, 13.9629, 0.0000, 0.0000, 170.2998); //MotorcycleHelmet2
	TruckerMap[65] = CreateObject(2690, 2442.7282, -2109.9545, 14.1892, 0.0000, 0.0000, 81.8999); //CJ_FIRE_EXT
	TruckerMap[66] = CreateObject(19825, 2430.9792, -2120.6970, 15.2068, 0.0000, 0.0000, 178.6999); //SprunkClock1
	TruckerMap[67] = CreateObject(19376, 2438.9619, -2107.2585, 15.9928, -0.3000, 89.7998, 88.1998); //wall024
	TruckerMap[68] = CreateObject(19433, 2440.4230, -2099.9501, 15.9987, 2.6000, 89.8000, 1.0000); //wall073
	TruckerMap[69] = CreateObject(19433, 2426.6125, -2100.2016, 16.1139, 2.8999, 92.1000, 1.0000); //wall073
	TruckerMap[70] = CreateObject(19433, 2430.0244, -2100.1325, 16.0190, 2.8999, 91.4000, 1.0000); //wall073
	TruckerMap[71] = CreateObject(19433, 2433.4868, -2100.0671, 15.9745, 2.6000, 89.8000, 1.0000); //wall073
	TruckerMap[72] = CreateObject(19433, 2436.9296, -2100.0097, 15.9865, 2.6000, 89.8000, 1.0000); //wall073
	TruckerMap[73] = CreateObject(19433, 2442.2722, -2099.9194, 16.0251, 2.0000, 89.8000, 0.9000); //wall073
	TruckerMap[74] = CreateObject(19433, 2426.5773, -2101.7766, 16.0531, 2.6000, 91.9000, 0.5000); //wall073
	TruckerMap[75] = CreateObject(19433, 2426.5930, -2103.3657, 15.9809, 2.6000, 91.9000, 0.5000); //wall073
	TruckerMap[76] = CreateObject(19433, 2426.6079, -2104.9436, 15.9393, 0.1999, 91.9000, 0.5000); //wall073
	TruckerMap[77] = CreateObject(19433, 2426.6232, -2106.5344, 15.9337, 0.1999, 91.9000, 0.5000); //wall073
	TruckerMap[78] = CreateObject(19433, 2426.6398, -2108.1257, 15.9482, -0.2000, 91.9000, 0.5000); //wall073
	TruckerMap[79] = CreateObject(19433, 2426.6193, -2109.6767, 15.9625, 0.1999, 92.0000, 0.5000); //wall073
	TruckerMap[80] = CreateObject(19433, 2430.0585, -2101.7429, 15.9378, 2.6000, 91.9000, 0.5000); //wall073
	TruckerMap[81] = CreateObject(19433, 2433.4777, -2101.6579, 15.8848, 2.6000, 90.0000, 0.5000); //wall073
	TruckerMap[82] = CreateObject(19433, 2436.9562, -2101.5900, 15.9148, 2.6000, 89.8000, 1.0000); //wall073
	TruckerMap[83] = CreateObject(19433, 2440.4392, -2101.5317, 15.9270, 2.6000, 89.8000, 1.0000); //wall073
	TruckerMap[84] = CreateObject(19433, 2442.2426, -2101.4106, 15.9952, 0.2000, 89.3999, -1.8999); //wall073
	TruckerMap[85] = CreateObject(19376, 2438.9619, -2107.2585, 15.9928, -0.3000, 89.7998, 88.1998); //wall024
	TruckerMap[86] = CreateObject(19376, 2438.3232, -2116.5031, 16.0275, -0.1000, 89.7998, 178.4999); //wall024
	TruckerMap[87] = CreateObject(19376, 2429.4418, -2116.0017, 16.0604, -0.4000, 90.0999, 176.0998); //wall024
	TruckerMap[88] = CreateObject(19376, 2430.0942, -2106.4638, 15.9572, -0.4000, 90.0999, 176.0998); //wall024*/
	ActorTruckerNew[0] = CreateActor(7, 2426.3901,-2114.2390,13.5522,325.8958); //Taxi Driver/Train Dr
	ApplyActorAnimation(ActorTruckerNew[0], "BAR", "BARSERVE_LOOP", 4.0998, 1, 0, 0, 0, 0);
	/*ActorTruckerNew[1] = CreateActor(147, 2431.0405, -2119.7785, 13.6267, 0.0000); //Businessman
	ApplyActorAnimation(ActorTruckerNew[1], "FOOD", "FF_SIT_EAT1", 4.0998, 1, 0, 0, 0, 0);
	ActorTruckerNew[2] = CreateActor(184, 2426.9479, -2114.9304, 14.3267, 90.7998); //Normal Ped
	ApplyActorAnimation(ActorTruckerNew[2], "INT_OFFICE", "OFF_SIT_CRASH", 4.0998, 1, 0, 0, 0, 0);
	ActorTruckerNew[3] = CreateActor(170, 2426.7204, -2118.4194, 13.7567, 101.6999); //Normal Ped
	ApplyActorAnimation(ActorTruckerNew[3], "FOOD", "FF_SIT_EAT1", 4.0998, 1, 0, 0, 0, 0);
	ActorTruckerNew[4] = CreateActor(113, 2426.9013, -2111.5756, 13.5467, 88.8999); //The Russian Mafia
	ApplyActorAnimation(ActorTruckerNew[4], "INT_OFFICE", "OFF_SIT_IDLE_LOOP", 4.0998, 1, 0, 0, 0, 0);
	ActorTruckerNew[5] = CreateActor(72, 2426.9257, -2107.9521, 13.5467, 93.5998); //Hippy
	ApplyActorAnimation(ActorTruckerNew[5], "INT_OFFICE", "OFF_SIT_TYPE_LOOP", 4.0998, 1, 0, 0, 0, 0);*/
}
hook OnPlayerEnterCheckpoint(playerid)
{
	if(hanglau[playerid] == 1)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, 1341.5193,324.5612,20.5010)){
			return SendClientMessage(playerid, COLOR_GREY, "Bug ha mai bo di nha /xoamuctieu");
		}

		if(GetPVarInt(playerid, "camhang") == 0){
			return SendClientMessage(playerid, COLOR_GREY, "Ban chua lay hang tu cop xe");
		}
		SetPlayerCheckpoint(playerid, VITRI_QUAYVE ,5.0);
		DeletePVar(playerid, "camhang");
		TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
		RemovePlayerAttachedObject(playerid, 0);
		shopsung ++;
		hanglau[playerid] = 2;
		SendClientMessage(playerid, -1, "Ban da giao hang thanh cong hay quay ve nhan tien");
	}
	if(hanglau[playerid] == 2)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.0,VITRI_QUAYVE))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(TruckerOwner[playerid][Player_Vehicle_ID] == vehicleid)
			{
				SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban nhan duoc so tien 500$ tu viec van chuyen, va 1 crack");
				PlayerInfo[playerid][pCrack] ++;
				PlayerInfo[playerid][pCash] += 500;
				PlayerInfo[playerid][pTruckSkill] ++;
				Misc_Save();
				DeletePVar(playerid, "camhang");
				TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
				RemovePlayerAttachedObject(playerid, 0);
				OnPlayerStatsUpdate(playerid);
				OnPlayerStatsUpdate(playerid);
				DisableCheckPoint(playerid);
				hanglau[playerid] = 0;
			}
			else SendClientMessage(playerid, COLOR_GREY, "Ban can o tren phuong tien cua ban");
		}
		//else SendClientMessage(playerid, COLOR_GREY, "Day khong phai vi tri duoc chi dinh");
	}
	if(CP[playerid] == 10)
	{
		new str[128];
		CP[playerid] = 0;
		format(str, sizeof(str),"Don Hang\tVi Tri\t{DC7633}Kho\n{CCCC00}Cua Hang\t{FFFFFF}trong thanh pho\t%d\n{DF1019}Vu khi\t{FFFFFF}Ngoai Thanh Pho\t%d",truckersoluong,khosung);
		ShowPlayerDialog(playerid, DIALOG_TRUCKERJOB,DIALOG_STYLE_TABLIST_HEADERS,"Ban muon van chuyen don vi nao?",str,"{ae0202 }Chon","{FFFFFF}Huy");
	}
	if(quayvenhantientrucker[playerid] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(TruckerOwner[playerid][Player_Vehicle_ID] == vehicleid) 
		{
			new str[128];
			// new payment;
			// new level = PlayerInfo[playerid][pTruckSkill];
			// if(level >= 0 && level <= 100) payment = 220;
			// else if(level >= 101 && level <= 200) payment = 280;
			// else if(level >= 201 && level <= 300) payment = 340;
			// else if(level >= 301 && level <= 999) payment = 400;
			// else if(level >= 1000) payment = 470;
			// GivePlayerCash(playerid, payment);
			PlayerInfo[playerid][pCash] += giathitruong;
			format(str, sizeof(str),"Ban da giao thanh cong 2 chuyen hang va nhan duoc so tien la %d va mot so kinh nghiem",giathitruong);
			SendClientMessage(playerid, -1,str);
			format(str, sizeof(str),"%s da giao thanh cong 2 chuyen hang va nhan duoc so tien la %d",GetPlayerNameEx(playerid),giathitruong);
			Log("logs/farmtruck.log", str);
			PlayerInfo[playerid][pTruckSkill] += 1;
			PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE;
			switch(random(3))
			{
				case 0:
				{
					if(PlayerInfo[playerid][pNuocLoc] < 5)
					{
						PlayerInfo[playerid][pNuocLoc] ++;
						SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} do ban lam tot nen duoc thuong mot chai nuoc");
					}
					else SendClientMessage(playerid, COLOR_GREY,"Ban lam chua duoc tot lam nen chua nhan duoc phan thuong");

				}
				case 1:
				{
					PlayerInfo[playerid][pMats] += 25;
					SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban duoc phan thuong them 25 vat lieu do lam tot trong qua trinh van chuyen");
				}
				case 2:
				{
					SendClientMessage(playerid, COLOR_GREY,"Ban lam chua duoc tot lam nen chua nhan duoc phan thuong");
				}
			}
			truckerdonhang[playerid] = 0;
			Misc_Save();
			DeletePVar(playerid, "camhang");
			TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] = 0;
			RemovePlayerAttachedObject(playerid, 0);
			DisableCheckPoint(playerid);
			SoLanTrucker[playerid] = 0;
			quayvenhantientrucker[playerid] = 0;
   			OnPlayerStatsUpdate(playerid);
		}
		else SendClientMessage(playerid, COLOR_GREY, "Ban can o tren phuong tien giao hang cua ban");
	}
	if(truckerdonhang[playerid] == 1)
	{
		if(SoLanTrucker[playerid] == 0)
		{
			thunghang = 10;
			SetPlayerCheckpoint(playerid, VITRI_QUAYVE, 5.0);
			quayvenhantientrucker[playerid] = 1;
			TextDrawHideForPlayer(playerid, Notifix[4]);
			RemovePlayerAttachedObject(playerid, 0);
			SendClientMessage(playerid, -1, "{1db4ee}[TRUCKER]{FFFFFF} Ban da giao hang thanh cong hay quay ve nhan tien");
		}
		else
		switch(random(5))
		{
			case 0:
			{
					//if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_CP4)) return SendClientMessage(playerid, -1, "Day khong phai vi tri giao hang");
					if(GetPVarInt(playerid, "camhang") == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua lay hang tu sau cop xe");
					TextDrawHideForPlayer(playerid, Notifix[4]);
					SendClientMessage(playerid, -1,"Ban da nhan don hang moi hay di giao");
					DeletePVar(playerid, "camhang");
					SoLanTrucker[playerid] -= 1;
					RemovePlayerAttachedObject(playerid, 0);
					SetPlayerCheckpoint(playerid, VITRI_CP4, 5.0);
			}
			case 1:
			{
					//if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_CP3)) return SendClientMessage(playerid, -1, "Day khong phai vi tri giao hang");
					if(GetPVarInt(playerid, "camhang") == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua lay hang tu sau cop xe");
					TextDrawHideForPlayer(playerid, Notifix[4]);
					DeletePVar(playerid, "camhang");
					RemovePlayerAttachedObject(playerid, 0);
					SendClientMessage(playerid, -1,"Ban da nhan don hang moi hay di giao");
					SetPlayerCheckpoint(playerid, VITRI_CP3, 5.0);
					SoLanTrucker[playerid] -= 1;
			}
			case 2:
			{
					//if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_CP1)) return SendClientMessage(playerid, -1, "Day khong phai vi tri giao hang");
					if(GetPVarInt(playerid, "camhang") == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua lay hang tu sau cop xe");
					TextDrawHideForPlayer(playerid, Notifix[4]);
					SendClientMessage(playerid, -1,"Ban da nhan don hang moi hay di giao");
					DeletePVar(playerid, "camhang");
					RemovePlayerAttachedObject(playerid, 0);
					SetPlayerCheckpoint(playerid, VITRI_CP1, 5.0);
					SoLanTrucker[playerid] -= 1;
			}
			case 3:
			{
					//if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_CP)) return SendClientMessage(playerid, -1, "Day khong phai vi tri giao hang");
					if(GetPVarInt(playerid, "camhang") == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua lay hang tu sau cop xe");
					TextDrawHideForPlayer(playerid, Notifix[4]);	
					SendClientMessage(playerid, -1,"Ban da nhan don hang moi hay di giao");
					DeletePVar(playerid, "camhang");
					RemovePlayerAttachedObject(playerid, 0);
					SetPlayerCheckpoint(playerid, VITRI_CP, 5.0);
					SoLanTrucker[playerid] -= 1;
			}
			case 4:
			{
					//if(!IsPlayerInRangeOfPoint(playerid, 5.0, VITRI_CP2)) return SendClientMessage(playerid, -1, "Day khong phai vi tri giao hang");
					if(GetPVarInt(playerid, "camhang") == 0)
					return SendClientMessage(playerid, COLOR_GREY,"Ban chua lay hang tu sau cop xe");
					TextDrawHideForPlayer(playerid, Notifix[4]);	
					SendClientMessage(playerid, -1,"Ban da nhan don hang moi hay di giao");
					DeletePVar(playerid, "camhang");
					RemovePlayerAttachedObject(playerid, 0);
					SetPlayerCheckpoint(playerid, VITRI_CP2, 5.0);
					SoLanTrucker[playerid] -= 1;
			}
		}
		TruckerCarGo[TruckerOwner[playerid][Player_Vehicle_ID]] -= 1;
	}
	return 1;
}
