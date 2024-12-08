// -------- Cong viec giao hang vietnamse ------ 
// -------- Nguyễn Thanh Vĩ ------
// -------- Facebook.com/ntv.god -----
// -------- Hotline:039.515.2362 -----
// -------- cộng đồng máy chủ mobile -----

#include <a_samp>
#include <YSI_Coding\y_hooks>
hook OnGameModeInit()
{
	CreateDynamic3DTextLabel("{66CC66}Job:Nguoi van chuyen\n\n(Y)\t{FFFF99}Cap do yeu cau:1",COLOR_YELLOW,2090.7449,-2068.3030,17.3572+0.5,4.0);// Trucker (LS)
	CreateDynamic3DTextLabel("{33CCCC}Vi Tri\n{FF3333}Hay bat dau mot cong viec giao hang\n/batdaulamviec", COLOR_YELLOW, 2088.2673,-2092.2964,13.5469+0.6,18.0);
}

stock IsAGiaoHang1Car(carid)
{
	for (new v = 0; v < sizeof(GiaoHang1Vehicles); v++) {
	    if(carid == GiaoHang1Vehicles[v]) return 1;
	}
	return 0;
}

CMD:huygiaohang(playerid, params[])
{
	SendClientMessage(playerid, -1, "Ban da huy giao hang de co the lam viec tiep /batdaulamviec");
	DeletePVar(playerid, "GiaoHang");
	return 1;
}
CMD:batdaulamviec(playerid, params[]) 
{
	if(CheckPointCheck(playerid))
	{
	    SendClientMessageEx(playerid, COLOR_GRAD2, "Ban dang co danh dau (/xoamuctieu)");
	    return 1;
	}
	if (GetPVarInt(playerid, "GiaoHang") >= 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao hang khong the nhan tiep /huygiaohang");
		return 1;
	}
	if(PlayerInfo[playerid][pJob] != 23 && PlayerInfo[playerid][pJob2] != 23)
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban hhong phai nguoi van chuyen");
		return 1;
	}
	if(IsABike(GetPlayerVehicleID(playerid)))
	{
		return SendClientMessage(playerid, -1, "Phuong tien nay khong phai phuong tien 4 banh");
	}
	for(new d = 0 ; d < MAX_PLAYERVEHICLES; d++)
	{
		if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[playerid][d][pvId]))
		{
			PlayerInfo[playerid][pServiceTime] = gettime()+15;
			SendClientMessage(playerid, -1, "Hay den vi tri cham do de lay hang");
			SetPlayerCheckpoint(playerid, 2088.2673,-2092.2964,13.5469, 5.0);
			SetPVarInt(playerid, "GiaoHang", 1);
		}
	}
	SendClientMessage(playerid, -1, "Day khong phai la phuong tien cua ban");
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if (GetPVarInt(playerid, "GiaoHang") > 0)
	{
		new stage = GetPVarInt(playerid, "GiaoHang");

		switch (stage)
		{
			case 1:
			{
				SetPlayerCheckpoint(playerid, 2484.6802,-2120.4834,13.5469, 5.0);
				SendClientMessage(playerid, -1, "Ban da lay hang hay di giao no");
				SetPVarInt(playerid, "GiaoHang", 2);
			}
			case 2:
			{
				truckersoluong ++;
				SetPlayerCheckpoint(playerid, 2244.1130,-1665.0106,15.4766, 5.0);
				SendClientMessage(playerid, -1, "Ban da giao thanh cong mot so vat pham cho ben kho trucker");
				SendClientMessage(playerid, -1, "Hay quay ve vi tri tren ban do de nhan tien");
				SetPVarInt(playerid, "GiaoHang", 3);
			}
			case 3:
			{
				if(gettime() < PlayerInfo[playerid][pServiceTime])
				{ 
					Kick(playerid);
					printf("%s Da bi kick vi su dung hacking", GetPlayerNameEx(playerid));
				}
				DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid, COLOR_GREY, "Do phuong tien hu hong qua nang khong the nhan tien");
				DisablePlayerCheckpoint(playerid);
				PlayAudioStreamForPlayer(playerid, "http://web.samp-vn.com/hoanthanhcongviec.mp3");
				DeletePVar(playerid, "GiaoHang");	
				PlayerInfo[playerid][pCash] += 150;
				PlayerInfo[playerid][pMats] += 25;
				SendClientMessage(playerid, -1, "Ban da giao hang thanh cong va nhan duoc so tien 150$, 25 vat lieu tu kho");
			}
		}
	}
	return 1;
 }


hook OnPlayerDisconnect(playerid, reason)
{
	DeletePVar(playerid, "GiaoHang");	
}
  

