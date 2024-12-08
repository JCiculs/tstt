#include <a_samp>
#include <YSI_Coding\y_hooks>

	//-------------------------------------------------------------------
	//					Project create by #nDP 						   //
	//					Fb.com/nguyenduyphuong.com  			       //
	//					Copyright by nDP" 							   //
	//-------------------------------------------------------------------

//____________________________________________________________________________//

#define         DIALOG_247                  (29122)
#define         DIALOG_LOCKER247            (29121)
stock ShowBuy247(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_247, DIALOG_STYLE_LIST, "Ban vui long chon vat pham ban muon mua.", "Dien thoai di dong (300$)\nDice (100$)\nGiay thung (50$)\nXi ga` (100$)\nRadio lien lac (200$)\nKhoa Phuong Tien (1000$)\nBanh Mi (3 cai) (45$)\nNuoc Loc (3 chai) (30$)\nAo Giap Chong Dan (4000$)\nMat Na (10000$)\nXa Beng (1000$)\nPhieu Nuoi Bo (3000$)", "Mua", "Huy bo");
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_YES))
    {
        if(ActorPos(playerid, Actor247[1])) {
			ShowBuy247(playerid);
			ApplyActorAnimation(Actor247[1], "ped", "IDLE_CHAT", 4.1, 0, 0, 0, 0, 0);
			SetPVarInt(playerid, "BuyActorID", 1);
		}
        if(ActorPos(playerid, Actor247[2])) {
	 		ShowBuy247(playerid);
	 		ApplyActorAnimation(Actor247[2], "ped", "IDLE_CHAT", 4.1, 0, 0, 0, 0, 0);
	 		SetPVarInt(playerid, "BuyActorID", 2);
		}
        if(ActorPos(playerid, Actor247[3])) {
	 		ShowBuy247(playerid);
	 		ApplyActorAnimation(Actor247[3], "ped", "IDLE_CHAT", 4.1, 0, 0, 0, 0, 0);
	 		SetPVarInt(playerid, "BuyActorID", 3);
  }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[1280];
    if(dialogid == DIALOG_247)
	{
	    if(response)
	    {
	        switch(listitem)
	        {
                case 0: //  Dien thoai di dong (50 KC)
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 300)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 300;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        new randphone = 99999 + random(900000);
						new query[128];
						SetPVarInt(playerid, "WantedPh", randphone);
						SetPVarInt(playerid, "CurrentPh", PlayerInfo[playerid][pPnumber]);
					    SetPVarInt(playerid, "PhChangeCost", 0);
						format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `PhoneNr` = '%d'",randphone);
						mysql_function_query(MainPipeline, query, true, "OnPhoneNumberCheck", "ii", playerid, 2);

						format(string,sizeof(string),"Ban da mua thanh cong Dien thoai di dong voi gia (300$) - %d.", randphone);
						SendClientMessage(playerid, COLOR_GRAD2, string);
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}

				/*case 1: //  Danh ba dien thoai (25 KC)
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 25000)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 25000;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pPhoneBook] = 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua danh ba dien thoai, bay gio ban co the tim so dien thoai cua moi nguoi.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung /sdt <id/name>.");

						format(string,sizeof(string),"Ban da mua thanh cong Danh ba dien thoai voi gia (25,000$).");
						SendClientMessage(playerid, COLOR_YELLOW, string);
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}*/
				
				case 1: //  Dice
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 100)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 100;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pDice] = 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua xuc xac voi gia (100$)");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
				
				case 2: //  Giay thung
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 50)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 50;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pRope] += 3;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua 3 day thung.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung /troi(/coitroi) de troi nguoi khac tren chiec xe cua minh.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
				
				case 3: //  Xi ga
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 100)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 100;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pCigar] = 10;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua 10 chiec xi ga.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung /hutthuoc de hut xi ga, bam chuot trai de hut thuoc, bam F de vut dieu thuoc di.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}

				case 4: //  Radio lien lac (100 KC)
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 200)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 200;
	  			        
	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pRadio] = 1;
						PlayerInfo[playerid][pRadioFreq] = 0;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua radio lien lac.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung /pr de lien lac voi nhung nguoi trong cung tan so.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung /tanso de thay doi tan so radio.");

						format(string,sizeof(string),"Ban da mua thanh cong Radio lien lac voi gia (200$)");
						SendClientMessage(playerid, COLOR_YELLOW, string);
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du tien de mua mon do nay");
				}

				case 5: //  Khoa' Dien (250 KC)
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 1000)
	  			    {
	  			        if(GetPlayerVehicleCount(playerid) != 0)
						{
							SetPVarInt(playerid, "lockmenu", 2);
						    for(new i=0; i<MAX_PLAYERVEHICLES; i++)
			                {
							     if(PlayerVehicleInfo[playerid][i][pvId] != INVALID_PLAYER_VEHICLE_ID)
							     {
				                     format(string, sizeof(string), "Xe %d | Ten: %s.",i+1,GetVehicleName(PlayerVehicleInfo[playerid][i][pvId]));
				                     SendClientMessageEx(playerid, COLOR_WHITE, string);
							     }
						    }
						    PlayerInfo[playerid][pCash] -= 1000;

						    ShowPlayerDialog(playerid, DIALOG_LOCKER247, DIALOG_STYLE_INPUT, "Khoa xe;"," Chon mon chiec xe ma ban muon cai dat khoa len:", "Lua chon", "Huy bo");
						}else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co chiec xe nao - Ban muon cai dat no len dau?");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du tien de mua mon do nay");
				}
				case 6: //  banh mi
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 45)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 45;

	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pBanhMi] += 3;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua 3 banh mi.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/anbanh] hoac [H] de tuong tac su dung.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
					case 7: //  nuoc loc
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 30)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 30;

	  			        if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pNuocLoc] += 3;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua 3 chai nuoc loc.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/uongnuoc] hoac [H] de tuong tac su dung.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
					case 8: //  áo giáp
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 4000)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 4000;

	  			        //if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pGiap] += 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua 1 ao giap thanh cong.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/usegiap] hoac [H] de tuong tac su dung.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
				case 9: //  mask
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 10000)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 10000;

	  			        //if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pMask] += 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua mat na thanh cong.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/mask] hoac [H] de tuong tac su dung.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
				case 10: //  mask
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 1000)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 1000;

	  			        //if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pXabeng] += 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua xa beng thanh cong.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/bekhoa] hoac [H] de tuong tac su dung cuop xe.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
				case 11: //  mask
	  			{
	  			    if(PlayerInfo[playerid][pCash] >= 3000)
	  			    {
	  			        PlayerInfo[playerid][pCash] -= 3000;

	  			        //if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
					    //else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

	  			        PlayerInfo[playerid][pPhieunuoibo] += 1;
						SendClientMessageEx(playerid, COLOR_GRAD4, "Ban da mua phieu nuoi bo thanh cong.");
						SendClientMessageEx(playerid, COLOR_WHITE, "HUONG DAN: Su dung [/nuoibo] hoac [H] de tuong tac su dung.");
	  			    }else SendClientMessage(playerid, COLOR_GRAD2, "Ban khong co du $ de mua mon do nay");
				}
			}
		}
		else {
			if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
		    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
		    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
		}
	}

	if(dialogid == DIALOG_LOCKER247)
	{
		if(response)
		{
		    if(GetPVarInt(playerid, "lockmenu") == 2)
			{
			    new pvid;
	            if (IsNumeric(inputtext))
		        {
		            pvid = strval(inputtext)-1;
				    if(PlayerVehicleInfo[playerid][pvid][pvId] == INVALID_PLAYER_VEHICLE_ID)
				    {
						SendClientMessageEx(playerid, COLOR_GRAD4, "ERROR: Ban khong co xe trong slot nay.");
						SetPVarInt(playerid, "lockmenu", 0);
						return 1;
					}
					if(PlayerVehicleInfo[playerid][pvid][pvLock] == 2)
					{
						SendClientMessageEx(playerid, COLOR_GRAD4, "ERROR: Da co khoa tuong tu duoc cai dat tren xe nay.");
						SetPVarInt(playerid, "lockmenu", 0);
						return 1;
					}

                    if(GetPVarInt(playerid, "BuyActorID") == 1) ApplyActorAnimation(Actor247[1], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
				    else if(GetPVarInt(playerid, "BuyActorID") == 2) ApplyActorAnimation(Actor247[2], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);
				    else if(GetPVarInt(playerid, "BuyActorID") == 3)  ApplyActorAnimation(Actor247[3], "ped", "SEAT_idle", 4.1, 0, 0, 0, 0, 0);

                    SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua thanh cong khoa xe voi gia (1000$)");
					SendClientMessageEx(playerid, COLOR_YELLOW, "HINT: Su dung /pvlock de khoa xe cua ban.");
					PlayerVehicleInfo[playerid][pvid][pvLock] = 2;
					g_mysql_SaveVehicle(playerid, pvid);
					SetPVarInt(playerid, "lockmenu", 0);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					return 1;
				}
			}
		}
	}
	return 1;
}
