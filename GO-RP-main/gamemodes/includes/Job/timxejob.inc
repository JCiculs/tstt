#include <a_samp>
/*CMD:traxecongviec(playerid,params[])
{
	new loaixe[32];
	if(sscanf(params, "s[32]", loaixe))
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Su dung: /traxecongviec [ten xe]");
		SendClientMessageEx(playerid,COLOR_GREY,"pizza, trucker");
		return 1;
	}	
	if(strcmp(loaixe, "pizza", true) == 0)
	{
		if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
			return ChatHoTro(playerid, 255, "Ban khong phai Pizza Boy",5000);
		if(XeGiaoPizza[playerid][veh_id] == 0) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Pizza Boy ~w~nao!",5000);
		DestroyVehicle(XeGiaoPizza[playerid][veh_id]);
		dalayxe[playerid] = 0;
		DemPizza[playerid] = 0;
		batdaugiaobanh[playerid] = 0;
		BanhPizza[playerid] = 0;
		TienTraPizza[playerid] = 0;
		ChatHoTro(playerid,255,"Ban da tra xe cho cong ty",5000);
	}
	if(strcmp(loaixe, "trucker", true) == 0)
	{
		if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20)
			return ChatHoTro(playerid, 255, "Ban khong phai nguoi lam ben cong ty Trucker",5000);
		if(XeGiaoTrucker[playerid][veh_id] == INVALID_VEHICLE_ID) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Trucker ~w~nao!",5000);
		DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
		DestroyDynamic3DTextLabel(Text3DTrucker[playerid]);	
		DeletePVar(playerid,"DalayXe");
		ChatHoTro(playerid,255,"Ban da tra xe cho cong ty",5000);

	}
	return 1;
}*/
CMD:timxejob(playerid,params[])
{
	new loaixe[32];
	if(sscanf(params, "s[32]", loaixe))
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Su dung: /timxejob [ten xe]");
		SendClientMessageEx(playerid,COLOR_GREY,"pizza, trucker, miner");
		return 1;
	}	
	if(strcmp(loaixe, "pizza", true) == 0)
	{
		if(PlayerInfo[playerid][pJob] != 21 && PlayerInfo[playerid][pJob2] != 21)
			return ChatHoTro(playerid, 255, "Ban khong phai Pizza Boy",5000);
		if(XeGiaoPizza[playerid][veh_id] == 0) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Pizza Boy ~w~nao!",5000);
		new Float:VPos[3];
		GetVehiclePos(XeGiaoPizza[playerid][veh_id],VPos[0],VPos[1],VPos[2]);
		SetPlayerCheckpoint(playerid,VPos[0],VPos[1],VPos[2],3.0);
		CP[playerid] = 2;
		ChatHoTro(playerid,255,"Xe Pizza cua ban da duoc hien thi o tren ban do",5000);		
	}
	/*if(strcmp(loaixe, "miner", true) == 0)
	{
		if(PlayerInfo[playerid][pJob] != 22 && PlayerInfo[playerid][pJob2] != 22)
			return ChatHoTro(playerid, 255, "Ban khong phai nguoi lam Miner",5000);
		if(MinerOwner[playerid][Player_Vehicle_MINER] == INVALID_VEHICLE_ID) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Miner ~w~nao!",5000);
		new Float:VPos[3];
		GetVehiclePos(MinerOwner[playerid][Player_Vehicle_MINER],VPos[0],VPos[1],VPos[2]);
		SetPlayerCheckpoint(playerid,VPos[0],VPos[1],VPos[2],3.0);
		CP[playerid] = 2;
		ChatHoTro(playerid,255,"Xe Miner cua ban da duoc hien thi o tren ban do",5000);
	}*/
	if(strcmp(loaixe, "trucker", true) == 0)
	{
		if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20)
			return ChatHoTro(playerid, 255, "Ban khong phai nguoi lam ben cong ty Trucker",5000);
		if(XeGiaoTrucker[playerid][veh_id] == INVALID_VEHICLE_ID) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Trucker ~w~nao!",5000);
		new Float:VPos[3];
		GetVehiclePos(XeGiaoTrucker[playerid][veh_id],VPos[0],VPos[1],VPos[2]);
		SetPlayerCheckpoint(playerid,VPos[0],VPos[1],VPos[2],3.0);
		CP[playerid] = 2;
		ChatHoTro(playerid,255,"Xe Trucker cua ban da duoc hien thi o tren ban do",5000);		
	}
	return 1;
}
