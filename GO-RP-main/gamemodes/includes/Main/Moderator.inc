#include <a_samp>
#include <YSI_Coding\y_hooks>

CMD:setchucvu(playerid,params[])
{
    new uid,chucvu,a[45];
	if(PlayerInfo[playerid][pAdmin] < 8) return SendClientMessage(playerid,-1,"Ban chua du quyen han de su dung lenh nay!");
    if(sscanf(params,"ud",uid,chucvu)) return SendClientMessageEx(playerid,-1,"TEN l [uid]\n1 Fmod\n2 Gmod\n3 Eshop");
    if(!IsPlayerConnected(uid)) return SendClientMessageEx(playerid,-1,"Admin Nay co ve chua online");
    if(PlayerInfo[uid][pAdmin] < 2) return SendClientMessageEx(playerid,-1,"Nguoi choi nay khong phai team admin trong LsG");
    switch(chucvu)
    {
        case 1:{
            if(PlayerInfo[uid][pFactionModerator] == 1){
                PlayerInfo[uid][pFactionModerator] = 0;
                format(a,sizeof(a),"Ban da bi %s cat chuc vu Fmod",playerid);
                SendClientMessageEx(uid,-1,a);
                format(a,sizeof(a),"Ban vua cat chuc Admin %s (Fmod)",uid);
            }
            else{
                PlayerInfo[uid][pFactionModerator] = 1;
                format(a,sizeof(a),"Ban vua cap quyen Fmod cho Admin %s",uid);
                SendClientMessageEx(playerid,-1,a);
                format(a,sizeof(a),"Ban vua duoc Admin %s quyen Fmod",playerid);
                SendClientMessageEx(uid,-1,a);
            }
        }
        case 2:{
            if(PlayerInfo[uid][pGangModerator] == 1){
                PlayerInfo[uid][pGangModerator] = 0;
                format(a,sizeof(a),"Ban da bi %s cat chuc vu Gmod",playerid);
                SendClientMessageEx(uid,-1,a);
                format(a,sizeof(a),"Ban vua cat chuc Admin %s (Gmod)",uid);
            }
            else{
                PlayerInfo[uid][pGangModerator] = 1;
                format(a,sizeof(a),"Ban vua cap quyen Gmod cho Admin %s",uid);
                SendClientMessageEx(playerid,-1,a);
                format(a,sizeof(a),"Ban vua duoc Admin %s  quyen Gmod",playerid);
                SendClientMessageEx(uid,-1,a);
            }
        }
    }
    return 1;
}
CMD:switchgroup(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7 || PlayerInfo[playerid][pFactionModerator] == 1) {
		Group_ListGroups(playerid, DIALOG_SWITCHGROUP);
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You are not authorized.");
	return 1;
}

CMD:switchfam(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 7 || PlayerInfo[playerid][pGangModerator] >= 1)
	{
		new string[128], familyid;
		if(sscanf(params, "d", familyid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /switchfam [familyid]");
		if(familyid < 1 || familyid > MAX_FAMILY) return SendClientMessageEx(playerid, COLOR_WHITE, "Invalid Family Number.");
		format(string, sizeof(string), "You have switched to family ID %d (%s).", familyid, FamilyInfo[familyid][FamilyName]);
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
		PlayerInfo[playerid][pRank] = 6;
		PlayerInfo[playerid][pFMember] = familyid;
		PlayerInfo[playerid][pMember] = INVALID_GROUP_ID;
		PlayerInfo[playerid][pLeader] = INVALID_GROUP_ID;

	}
	return 1;
}
CMD:makeleader(playerid, params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 7 || PlayerInfo[playerid][pFactionModerator] >= 1)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) {
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /makeleader [player]");
		}
		else {
			if(IsPlayerConnected(giveplayerid))	{
   				SetPVarInt(playerid, "MakingLeader", giveplayerid);
   				SetPVarInt(playerid, "MakingLeaderSQL", GetPlayerSQLId(giveplayerid));
				Group_ListGroups(playerid, DIALOG_MAKELEADER);
			}
			else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
		}
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");

	return 1;
}
CMD:eshopntv1(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{

		new string[128], giveplayerid, statcode, amount;
		if(sscanf(params, "udd", giveplayerid, statcode, amount))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /setstat [player] [statcode] [amount]");
			SendClientMessageEx(playerid, COLOR_GRAD4, "|1 Level |2 ArmorUpgrade |3 UpgradePoints |4 Model |5 BankAccount |6 PhoneNumber |7 RespectPoints |8 House1 |9 House2");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|11 FMember |12 Det |13 Lawyer |14 Fixer |17 Drug |18 Sex |19 Box |20 Arms |21 Materials |22 Pot |23 Crack");
			SendClientMessageEx(playerid, COLOR_GRAD2, "|24 Fishing |25 Job |26 Rank |27 Packages |28 Crates |29 Smuggler |30 Insurance |31 Warnings |32 Screwdriver");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|33 Age |34 Gender |35 NMute |36 AdMute |37 Faction |38 Restricted Weapon Time |39 Gang Warns |40 RMute |41 Reward Hours");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|42 Playing Hours |43 Gold Box Tokens |44 Computer Drawings |45 Papers |46 Business |47 BusinessRank | 48 Spraycan");
			SendClientMessageEx(playerid, COLOR_GRAD1, "|49 Heroin |50 RawOpium |51 Syringes |52 Hunger |53 Fitness |54 Event Tokens |55 Modkit");
			return 1;
		}

		if(IsPlayerConnected(giveplayerid))
		{
			switch (statcode)
			{
			case 1:
				{
					PlayerInfo[giveplayerid][pLevel] = amount;
					format(string, sizeof(string), "   %s's Level has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
					SetPlayerScore(giveplayerid, PlayerInfo[giveplayerid][pLevel]);
				}
			case 2:
				{
					PlayerInfo[giveplayerid][pSHealth] = amount;
					format(string, sizeof(string), "   %s's ArmorUpgrade has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 3:
				{
					PlayerInfo[giveplayerid][gPupgrade] = amount;
					format(string, sizeof(string), "   %s's Upgrade Points has been set %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 4:
				{
					PlayerInfo[giveplayerid][pModel] = amount;
					format(string, sizeof(string), "   %s's Model has been set %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 5:
				{
					PlayerInfo[giveplayerid][pAccount] = amount;
					format(string, sizeof(string), "   %s's Bank Account has been set to $%d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 6:
				{
					if(amount == 0)
					{
						PlayerInfo[giveplayerid][pPnumber] = amount;
						format(string, sizeof(string), "   %s had their phone removed", GetPlayerNameEx(giveplayerid));
					}
					else
					{
						new query[128];
						SetPVarInt(giveplayerid, "WantedPh", amount);
						SetPVarInt(giveplayerid, "CurrentPh", PlayerInfo[giveplayerid][pPnumber]);
						SetPVarInt(giveplayerid, "PhChangeCost", 50000);
						SetPVarInt(giveplayerid, "PhChangerId", playerid);
						format(query, sizeof(query), "SELECT `Username` FROM `accounts` WHERE `PhoneNr` = '%d'",amount);
						mysql_function_query(MainPipeline, query, true, "OnPhoneNumberCheck", "ii", giveplayerid, 4);
						return 1;
					}
				}
			case 7:
				{
					PlayerInfo[giveplayerid][pExp] = amount;
					format(string, sizeof(string), "   %s's Respect Points have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 8:
				{
					PlayerInfo[giveplayerid][pPhousekey] = amount;
					format(string, sizeof(string), "   %s's House 1 has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 9:
				{
					PlayerInfo[giveplayerid][pPhousekey2] = amount;
					format(string, sizeof(string), "   %s's House 2 has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 11:
				{
					PlayerInfo[giveplayerid][pFMember] = amount;
					format(string, sizeof(string), "   %s's Family Membership has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 12:
				{
					PlayerInfo[giveplayerid][pDetSkill] = amount;
					format(string, sizeof(string), "   %s's Detective Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 13:
				{
					PlayerInfo[giveplayerid][pLawSkill] = amount;
					format(string, sizeof(string), "   %s's Lawyer Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 14:
				{
					PlayerInfo[giveplayerid][pMechSkill] = amount;
					format(string, sizeof(string), "   %s's Car Mechanic Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 17:
				{
					PlayerInfo[giveplayerid][pDrugsSkill] = amount;
					format(string, sizeof(string), "   %s's Drug Dealer Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 18:
				{
					PlayerInfo[giveplayerid][pSexSkill] = amount;
					format(string, sizeof(string), "   %s's Sex Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 19:
				{
					PlayerInfo[giveplayerid][pBoxSkill] = amount;
					format(string, sizeof(string), "   %s's Box Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 20:
				{
					PlayerInfo[giveplayerid][pArmsSkill] = amount;
					format(string, sizeof(string), "   %s's Arms Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 21:
				{
					PlayerInfo[giveplayerid][pMats] = amount;
					format(string, sizeof(string), "   %s's Materials have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 22:
				{
					PlayerInfo[giveplayerid][pPot] = amount;
					format(string, sizeof(string), "   %s's Pot has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 23:
				{
					PlayerInfo[giveplayerid][pCrack] = amount;
					format(string, sizeof(string), "   %s's Crack has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 24:
				{
					PlayerInfo[giveplayerid][pFishSkill] = amount;
					format(string, sizeof(string), "   %s's Fishing Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 25:
				{
					PlayerInfo[giveplayerid][pJob] = amount;
					format(string, sizeof(string), "   %s's Job has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 26:
				{
					PlayerInfo[giveplayerid][pRank] = amount;
					format(string, sizeof(string), "   %s's Rank has been to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 27:
				{
					SetPVarInt(playerid, "Packages", amount);
					format(string, sizeof(string), "   %s's Materials Packages have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 28:
				{
					PlayerInfo[giveplayerid][pCrates] = amount;
					format(string, sizeof(string), "   %s's Drug Crates have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 29:
				{
					PlayerInfo[giveplayerid][pSmugSkill] = amount;
					format(string, sizeof(string), "   %s's Smuggler Skill has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 30:
				{
					PlayerInfo[giveplayerid][pInsurance] = amount;
					format(string, sizeof(string), "   %s's Insurance has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 31:
				{
					PlayerInfo[giveplayerid][pWarns] = amount;
					format(string, sizeof(string), "   %s's Warnings have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 32:
				{
					PlayerInfo[giveplayerid][pScrewdriver] = amount;
					format(string, sizeof(string), "   %s's Screwdrivers have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			/*case 33:
				{
					PlayerInfo[giveplayerid][pBirthDate] = amount;
					format(string, sizeof(string), "   %s's Age has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}*/
			case 34:
				{
					PlayerInfo[giveplayerid][pSex] = amount;
					format(string, sizeof(string), "   %s's Gender has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 35:
				{
					PlayerInfo[giveplayerid][pNMuteTotal] = amount;
					format(string, sizeof(string), "   %s's Total Newbie Mutes has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 36:
				{
					PlayerInfo[giveplayerid][pADMuteTotal] = amount;
					format(string, sizeof(string), "   %s's Total Ad Mutes has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 37:
				{
					PlayerInfo[giveplayerid][pMember] = amount;
					format(string, sizeof(string), "   %s's Faction has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 38:
				{
					if(PlayerInfo[giveplayerid][pConnectHours] >= 2) {
						PlayerInfo[giveplayerid][pWRestricted] = amount;
						format(string, sizeof(string), "   %s's Weapon Restricted Time has been set to %d.", GetPlayerNameEx(giveplayerid), amount);
					}
					else {
						return SendClientMessageEx(playerid, COLOR_GREY, "You cannot set this on a person who has under 2 playing hours.");
					}
				}
			case 39:
				{
					PlayerInfo[giveplayerid][pGangWarn] = amount;
					format(string, sizeof(string), "   %s's Gang Warns have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 40:
				{
					PlayerInfo[giveplayerid][pRMutedTotal] = amount;
					format(string, sizeof(string), "   %s's Report Mutes have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 41:
				{
					PlayerInfo[giveplayerid][pRewardHours] = amount;
					format(string, sizeof(string), "   %s's Reward Playing Hours have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 42:
				{
					PlayerInfo[giveplayerid][pConnectHours] = amount;
					format(string, sizeof(string), "   %s's Playing Hours have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 43:
				{
					PlayerInfo[giveplayerid][pGoldBoxTokens] = amount;
					format(string, sizeof(string), "   %s's Box Tokens have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 44:
				{
					PlayerInfo[giveplayerid][pRewardDrawChance] = amount;
					format(string, sizeof(string), "   %s's Computer Drawings have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 45:
				{
					PlayerInfo[giveplayerid][pPaper] = amount;
					format(string, sizeof(string), "   %s's Papers have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 46:
				{
				    if (amount < 0 || amount >= MAX_BUSINESSES) return 1;
					PlayerInfo[giveplayerid][pBusiness] = amount;
					format(string, sizeof(string), "   %s's Business have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 47:
				{
				    if (amount < 0 || amount > 5) return 1;
					PlayerInfo[giveplayerid][pBusinessRank] = amount;
					format(string, sizeof(string), "   %s's Business Rank have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 48:
				{
                	PlayerInfo[giveplayerid][pSpraycan] = amount;
					format(string, sizeof(string), "   %s's Spraycans have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 49:
			    {
			        PlayerInfo[giveplayerid][pHeroin] = amount;
			        format(string, sizeof(string), "   %s's Heroin have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
			    }
			case 50:
				{
                	PlayerInfo[giveplayerid][pRawOpium] = amount;
					format(string, sizeof(string), "   %s's raw opium have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}
            case 51:
				{
                	PlayerInfo[giveplayerid][pSyringes] = amount;
					format(string, sizeof(string), "   %s's Syringes have been set to %d.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 52:
				{
					if (amount <= 0)
					{
						amount = 1;
						PlayerInfo[playerid][pHungerTimer] = 1799;
					} else if (amount > 100)
					{
						amount = 100;
					}

					PlayerInfo[playerid][pHungerDeathTimer] = 0;

					PlayerInfo[giveplayerid][pHunger] = amount;
					format(string, sizeof(string), "   %s's Hunger has been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 53:
				{
					PlayerInfo[giveplayerid][pFitness] = amount;
					format(string, sizeof(string), "   %s's Fitness has been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}

			case 54:
				{
					PlayerInfo[giveplayerid][pTrickortreat] = amount;
					format(string, sizeof(string), "   %s's Event Tokens have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}
			case 55:
				{
					PlayerInfo[giveplayerid][pRimMod] = amount;
					format(string, sizeof(string), "   %s's Rim Kits have been set to %i.", GetPlayerNameEx(giveplayerid), amount);
				}

			default:
				{
					format(string, sizeof(string), "   Invalid stat code.", amount);
				}
			}


			format(string, sizeof(string), "%s by %s", string, GetPlayerNameEx(playerid));
			Log("logs/stats.log", string);
			SendClientMessageEx(playerid, COLOR_GRAD1, string);

		}
	}
	return 1;
}
