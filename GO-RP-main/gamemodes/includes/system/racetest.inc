#include <a_samp>

//#include <config_colors>

#include <YSI_Coding\y_hooks>
#include <y_iterate>

#define MAX_RACE 5
#define MAX_RACER 15

//thêm ở vị trí dialog
#define DIALOG_RACE_MENU 1500 //thay đổi id 1 thành id tiếp theo của dialog đã có sẵn trước đó trong 
#define DIALOG_RACE_BET 1501
#define DIALOG_RACE_RACERS 1052
#define DIALOG_RACE_VEHICLE 1053
#define DIADIEM_DUAXE 2214.3713, -1491.7854, 23.5336

//#define waiting 0
//#define ready 1
//#define racing 2
enum {
    waiting,
    ready,
    racing
}

enum {
    map_ls,
    map_sf,
    map_lv,
    map_mb
}

enum raceData {
    status_race,
    owner_race,
    map_race,
    bet_race,
    step_race,
    finish_racer
};
new race[MAX_RACE][raceData],
    Iterator:racer[MAX_RACE]<MAX_PLAYERS>,
    Iterator:vehicle_race[MAX_RACE]<MAX_VEHICLES>,
    raceTimer[MAX_RACE];

new racercount[MAX_RACE];
new RacerVeh[MAX_RACE][MAX_PLAYERS];

new bool:isRacer[MAX_PLAYERS],
    racerOfRace[MAX_PLAYERS],
    curPointRace[MAX_PLAYERS];

new Float:checkpointRaceVehicle[][4] =
{
    //LS 0-14
    {2209.4797, -1511.4734, 23.5529, 359.0622},
    {2212.4751, -1511.4803, 23.5552, 358.7914},
    {2215.3291, -1511.5994, 23.5552, 2.7771},
    {2209.4055, -1517.6942, 23.5552, 0.5338},
    {2212.3882, -1517.7568, 23.5552, 0.8830},
    {2215.4929, -1517.6967, 23.5552, 0.5714},
    {2209.0632, -1524.0023, 23.5552, 358.6034},
    {2212.1868, -1524.1287, 23.5552, 358.4074},
    {2215.3611, -1524.3571, 23.5552, 0.4331},
    {2209.2947, -1529.8961, 23.5552, 359.7458},
    {2212.0864, -1530.0349, 23.5552, 0.2799},
    {2215.1042, -1529.9196, 23.5552, 359.8860},
    {2209.3289, -1536.0355, 23.5552, 359.5563},
    {2212.2659, -1535.8662, 23.5552, 359.5515},
    {2215.0027, -1535.9575, 23.5552, 359.3437},

    //SF 15-29
    {-1549.5331, 735.6147, 6.7666, 357.7543},
    {-1545.4310, 735.2003, 6.7646, 357.5213},
    {-1541.7307, 735.2052, 6.7661, 359.1570},
    {-1537.7178, 734.7159, 6.8023, 357.9508},
    {-1549.8004, 729.6239, 6.7661, 357.4672},
    {-1545.8115, 728.9637, 6.7609, 358.0493},
    {-1542.0593, 729.0646, 6.7662, 355.3990},
    {-1538.1378, 728.8038, 6.7661, 354.6720},
    {-1550.1676, 723.6360, 6.7661, 356.5589},
    {-1546.4597, 722.6487, 6.7661, 356.7721},
    {-1542.3967, 722.4723, 6.7661, 358.5976},
    {-1538.6243, 722.0742, 6.7662, 355.9856},
    {-1550.5913, 717.2722, 6.7661, 357.7233},
    {-1546.6223, 716.5894, 6.7661, 357.3446},
    {-1542.6882, 716.4149, 6.7661, 357.0821},

    //LV 30-44
    {1791.8995, 1432.9819, 6.4691, 178.9004},
    {1788.4124, 1433.2083, 6.4653, 179.7093},
    {1785.0291, 1433.2848, 6.4615, 177.5436},
    {1781.4115, 1433.4698, 6.4999, 177.5266},
    {1792.0079, 1439.0996, 6.4691, 179.6606},
    {1788.4836, 1439.3790, 6.4652, 178.4254},
    {1785.3929, 1439.4065, 6.4615, 178.7427},
    {1781.5792, 1439.2865, 6.4948, 179.5267},
    {1792.1077, 1445.2512, 6.4691, 178.3866},
    {1788.7018, 1445.3220, 6.4653, 177.1196},
    {1785.4158, 1445.3312, 6.4615, 178.6311},
    {1782.0990, 1445.4034, 6.4846, 178.4361},
    {1792.2726, 1451.4998, 6.4691, 178.2840},
    {1788.8470, 1451.4930, 6.4652, 180.2462},
    {1785.5767, 1451.5436, 6.4615, 179.8342},

    //MB 45-59
    {1205.7705,-94.6331,38.9071,48.7738},
    {1204.8881,-96.4360,39.0622,48.2694},
    {1205.9722,-92.9389,38.7793,68.2260},
    {1206.7645,-90.9681,38.6385,45.4064},
    {1208.8082,-92.9998,38.7379,45.2718},
    {1208.7440,-94.9387,38.8620,53.5979},
    {1208.6212,-97.1152,39.0326,53.7571},
    {1207.7822,-97.2856,39.0634,40.1483},
    {1207.0016,-100.4325,39.3123,47.2259},
    {1205.3972,-101.4680,39.3998,38.8596},
    {1207.4100,-103.8522,39.5518,43.4024},
    {1209.0764,-103.3092,39.4815,51.1593},
    {1210.8260,-100.9914,39.2785,51.1348},
    {1212.0961,-95.0540,38.8160,10.6984},
    {1212.0059,-96.1232,38.8848,56.2837}
};

new Float:spawnRace[][4] = {
    {2212.1501, -1500.6074, 23.8281, 182.7926}, //LS
    {-1544.4320, 744.2868, 7.0391, 179.0543}, //SF
    {1788.6388, 1417.0464, 6.7420, 359.9514}, //LV
    {1206.9899,-95.8361,39.3617,44.6008} //MB
};

//0-8
new Float:checkpointRace[][3] = {
    //LS 0-8
    {2215.3467, -1395.8969, 23.5244},
    {2258.0620, -1299.2638, 23.5383},
    {2264.8035, -1148.7839, 26.5211},
    {2055.1262, -1082.6437, 24.4198},
    {1853.9020, -1178.8015, 23.3473},
    {1368.6665, -1140.8489, 23.3601},
    {1085.6914, -1143.6624, 23.3619},
    {1047.8622, -1398.7695, 13.1072},
    {798.7021, -1401.0698, 13.1316},

    //SF 9-18
    {-1543.7668,744.8023,6.7398},
    {-1531.0580,910.0482,6.7456},
    {-1628.4467,1241.7617,6.7507},
    {-2049.3711,1295.3910,6.8926},
    {-2268.2227,1242.5680,44.7569},
    {-2261.7732,1090.3273,81.2365},
    {-2263.5613,791.5715,49.0055},
    {-2268.0723,576.0207,34.7192},
    {-2383.6343,565.6249,24.4479},
    {-2539.3816,566.0482,14.1663},

    //LV 19-25
    {1787.3987,1107.3381,6.4466},
    {1785.1377,859.6110,10.3819},
    {1704.6765,853.2948,7.9962},
    {1535.5822,851.3772,6.5171},
    {1267.5695,927.6299,6.5181},
    {1228.6492,1318.3329,6.4476},
    {1228.9220,1818.9723,6.4388},

    //Moutain Bike 26-45
    {1160.2795,-68.2252,28.7681},
    {1024.1774,-67.5193,22.2362},
    {854.3357,-98.1618,26.5959},
    {759.5296,-146.8277,19.0261},
    {668.6104,-155.5891,24.1369},
    {546.7573,-140.9578,36.6064},
    {516.3797,-203.1034,36.6069},
    {470.3348,-404.5092,27.4589},
    {626.2551,-414.6258,16.3673},
    {642.0999,-473.1927,15.7943},
    {715.4446,-483.3912,15.8759},
    {721.8336,-526.8447,15.7824},
    {822.9401,-532.0657,15.7804},
    {936.0078,-525.5992,35.3827},
    {1123.4663,-432.7819,36.810},
    {1246.8822,-417.3836,2.4261},
    {1239.6908,-301.9303,10.724},
    {1185.5906,-172.7250,40.246},
    {1218.7159,-142.8594,39.272},
    {1203.9230,-91.5912,38.7104}
};

hook OnGameModeInit()
{
    for(new i = 0; i < MAX_RACE; i++)
    {
        race[i][owner_race] = -1;
        racercount[i] = 0;
    }
    return true;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {
    if (newkeys & KEY_YES) {
        if (IsPlayerInRangeOfPoint(playerid, 5.0, DIADIEM_DUAXE)) {
            new string[1024];
            format(string, sizeof string, "Loai xe\tSo nguoi tham gia\tTrang thai\nNRG-500\t%d/14\t(%s)\nBullet\t%d/14\t(%s)\nElegy\t%d/14\t(%s)\nSultan\t%d/14\t(%s)\nMountain Bike\t%d/14\t(%s)", 
            racercount[0], !race[0][status_race] ? "{FF0000}Dang cho{ffffff}" : "{008000}Dang dua{ffffff}",racercount[1], !race[1][status_race] ? "{FF0000}Dang cho{ffffff}" : "{008000}Dang dua{ffffff}",
            racercount[2], !race[2][status_race] ? "{FF0000}Dang cho{ffffff}" : "{008000}Dang dua{ffffff}",racercount[3], !race[3][status_race] ? "{FF0000}Dang cho{ffffff}" : "{008000}Dang dua{ffffff}",
            racercount[4], !race[4][status_race] ? "{FF0000}Dang cho{ffffff}" : "{008000}Dang dua{ffffff}");
            ShowPlayerDialog(playerid, DIALOG_RACE_VEHICLE, DIALOG_STYLE_TABLIST_HEADERS, "Dua xe | Chon phuong tien", string, "Lua chon", "Dong");
        }
    }
    return true;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == DIALOG_RACE_VEHICLE) {
        if (response) {
            if (isRacer[playerid])
                return SendClientMessage(playerid, COLOR_RED, "Ban da tham gia mot cuoc dua roi, khong them tham gia tiep.");

            new rid = listitem;
            if (race[rid][status_race] != waiting)
                return SendClientMessage(playerid, COLOR_RED, "Vong dua loai phuong tien nay hien dang dien ra, khong the tham gia.");            

            if (GetPlayerCash(playerid) < race[rid][bet_race])
                return SendClientMessage(playerid, COLOR_RED, "Ban khong du tien de tham gia cuoc dua nay.");

            // tim chu phong
            new cochu = 0;
            foreach(new i : Player)
            {
                if(race[rid][owner_race] == i) cochu = 1;
            }
            //if (Iter_Count(racer[rid]) < 1) {
            if(cochu == 0) {
                race[rid][owner_race] = playerid;
                race[rid][status_race] = waiting;
                race[rid][map_race] = map_ls;
                race[rid][bet_race] = 0;
                Iter_Add(racer[rid], playerid);
                racercount[rid]++;

                isRacer[playerid] = true;
                racerOfRace[playerid] = rid;

                SendClientMessage(playerid, COLOR_YELLOW, "Ban la chu phong, hay dieu chinh cuoc dua va bat dau.");

                showConfigRace(playerid, rid);
                return true;
            }

            racerOfRace[playerid] = rid;
            isRacer[playerid] = true;
            SendClientMessage(playerid, COLOR_YELLOW, "Vui long doi chu phong dieu chinh phong va bat dau cuoc dua...");
            Iter_Add(racer[rid], playerid);
            racercount[rid]++;
            //new test[128];
            //format(test,128,"%d",racercount[rid]);
            //SendClientMessage(playerid, -1,test);
            return true;
        }
    } else if (dialogid == DIALOG_RACE_MENU) {
        if (response) {
            new rid = racerOfRace[playerid];
            if (rid < 0) {
                SendClientMessage(playerid, COLOR_RED, "Da xay ra loi, co the ban chua tham gia cuoc dua nao.");
                isRacer[playerid] = false;
                racerOfRace[playerid] = -1;
                return true;
            }
                
            switch(listitem) {
                case 0: {
                    race[rid][map_race] = (race[rid][map_race] == map_ls) ? map_sf : (race[rid][map_race] == map_sf) ? map_lv : (race[rid][map_race] == map_lv) ? map_mb : map_ls;
                    showConfigRace(playerid, rid);
                    return true;
                }
                case 1: {
                    ShowPlayerDialog(playerid, DIALOG_RACE_BET, DIALOG_STYLE_LIST, "Dua xe | So tien cuoc", "$2,000\n$5,000\n$10,000", "Xac nhan", "Quay lai");
                    return true;
                }
                case 2: {
                    new string[1024] = "ID\tTen tay dua\n";
                    foreach(new i : Player) {
                        if(racerOfRace[i] == rid)
                        { 
                            format(string, sizeof string, "%s\n%d\t%s", string, i, GetPlayerNameEx(i));
                        }
                    }
                    ShowPlayerDialog(playerid, DIALOG_RACE_RACERS, DIALOG_STYLE_TABLIST_HEADERS, "Dua xe | Tay dua", string, "Dong", "");
                }
                case 3: {
                    if (racercount[rid] >= 3) {
                        if (race[rid][bet_race] < 2000) {
                            SendClientMessage(playerid, COLOR_RED, "Ban chua dieu chinh tien cuoc.");
                            showConfigRace(playerid, rid);
                            return true;
                        }
                        
                        race[rid][status_race] = ready;
                        race[rid][finish_racer] = 0;

                        new map_selected;
                        switch(race[rid][map_race]) {
                            case map_ls: map_selected = 0;
                            case map_sf: map_selected = 15;
                            case map_lv: map_selected = 30;
                            case map_mb: map_selected = 45;
                        }

                        if (rid != 4) {
                            if (race[rid][map_race] == map_mb) {
                                showConfigRace(playerid, rid);
                                return SendClientMessage(playerid, COLOR_RED, "Phong nay khong the lua chon map nay!");
                            }
                        } else {
                            if (race[rid][map_race] != map_mb) {
                                showConfigRace(playerid, rid);
                                return SendClientMessage(playerid, COLOR_RED, "Phong nay chi the lua chon map Mountain Bike!");
                            }
                        }

                        for(new i = 0; i < racercount[rid]; i++) {
                            new modelid = !rid ? 522 : (rid == 1) ? 541 : (rid == 2) ? 562 : (rid == 3) ? 560 : (rid == 4) ? 510 : 522;
                            RacerVeh[rid][i] = CreateVehicle(modelid, checkpointRaceVehicle[map_selected+i][0], checkpointRaceVehicle[map_selected+i][1], checkpointRaceVehicle[map_selected+i][2], checkpointRaceVehicle[map_selected+i][3], Random(0, 256), Random(0, 256), -1);
                            
                            Iter_Add(vehicle_race[rid], RacerVeh[rid][i]);
                            SetVehicleVirtualWorld(RacerVeh[rid][i], rid+500);
                        }

                        // for(new i = map_selected; i < Iter_Count(racer[rid])+map_selected; i++) {
                            
                        //     new modelid = !rid ? 522 : (rid == 1) ? 541 : (rid == 2) ? 562 : (rid == 3) ? 560 : (rid == 4) ? 510 : 522;
                        //     new vehicleid = CreateVehicle(modelid, checkpointRaceVehicle[i][0], checkpointRaceVehicle[i][1], checkpointRaceVehicle[i][2], checkpointRaceVehicle[i][3], RandomEx(0, 256), RandomEx(0, 256), -1);
                        //     Iter_Add(vehicle_race[rid], vehicleid);
                        //     SetVehicleVirtualWorld(vehicleid, rid+500);
                        // }

                        foreach(new i : Player) {
                            if(racerOfRace[i] == rid){
                                if (IsPlayerConnected(i)) {
                                    SendClientMessage(i, COLOR_YELLOW, "Cuoc dua se bat dau trong 30 giay nua, vi the hay lua chon phuong tien cua minh!");
                                    SetPlayerVirtualWorld(i, rid+500);
                                    SetPlayerPos(i, spawnRace[race[rid][map_race]][0], spawnRace[race[rid][map_race]][1], spawnRace[race[rid][map_race]][2]);
                                    SetPlayerFacingAngle(i, spawnRace[race[rid][map_race]][3]);
                                }
                            }
                        }

                        raceTimer[rid] = SetTimerEx("onRaceReady", 30000, false, "i", rid);
                    } else {
                        SendClientMessage(playerid, COLOR_RED, "Hien khong du nguoi choi de co the bat dau cuoc dua!");

                        showConfigRace(playerid, rid);
                        return true;
                    }
                }
            }
        } else {
            //out
            new rid = racerOfRace[playerid];
            race[rid][status_race] = waiting;
            race[rid][owner_race] = -1;
            race[rid][map_race] = map_ls;
            race[rid][bet_race] = 0;
            race[rid][step_race] = 0;

            foreach(new i : Player) {
                if(racerOfRace[i] == rid)
                {
                    SendClientMessage(i, COLOR_RED, "Cuoc dua da bi huy do chu phong da roi.");
                    SetPlayerPos(i, DIADIEM_DUAXE);
                    SetPlayerVirtualWorld(i, 0);
                    SetPlayerInterior(i, 0);

                    if (i != playerid) racerOfRace[i] = -1;
                    isRacer[i] = false;
                }
            }
            
            racerOfRace[playerid] = -1;
            Iter_Clear(racer[rid]);
            racercount[rid] = 0;
        }
    } else if (dialogid == DIALOG_RACE_BET) {
        new rid = racerOfRace[playerid];
        if (response) {
            race[rid][bet_race] = !listitem ? 2000 : (listitem == 1) ? 5000 : (listitem == 2) ? 10000 : 2000;

            showConfigRace(playerid, rid);
            return true;
        } else {
            showConfigRace(playerid, rid);
        }
    } else if (dialogid == DIALOG_RACE_RACERS) {
        new rid = racerOfRace[playerid];
        showConfigRace(playerid, rid);
    }
    return true;
}

hook OnPlayerStateChange(playerid, newstate, oldstate) {
    if (newstate == PLAYER_STATE_DRIVER) {
        if (isRacer[playerid]) {
            new rid = racerOfRace[playerid];
            if (race[rid][status_race] != racing) {
                TogglePlayerControllable(playerid, false);
                SendClientMessage(playerid, COLOR_GREEN, "Ban da bi dong bang, hay doi nguoi choi khac de bat dau cuoc dua.");
                new vehicleid = GetPlayerVehicleID(playerid);
                if (GetVehicleModel(vehicleid) != 522)
                    AddVehicleComponent(vehicleid, 1010);
            }
        }
    }
    return true;
}

hook OnPlayerEnterRaceCheckpoint(playerid) {
    if (isRacer[playerid]) {
        new rid = racerOfRace[playerid];
        switch (race[rid][map_race]) {
            case map_ls: {
                if (curPointRace[playerid] < 7) {
                    curPointRace[playerid]++;
                    SetPlayerRaceCheckpoint(playerid, 0, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    checkpointRace[curPointRace[playerid]+1][0], checkpointRace[curPointRace[playerid]+1][1], checkpointRace[curPointRace[playerid]+1][2],8.0);
                } else {
                    SetPlayerRaceCheckpoint(playerid, 1, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    0.0, 0.0, 0.0,8.0);
                    finishRace(playerid, rid);
                }
            }
            case map_sf: {
                if (curPointRace[playerid] < 17) {
                    curPointRace[playerid]++;
                    SetPlayerRaceCheckpoint(playerid, 0, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    checkpointRace[curPointRace[playerid]+1][0], checkpointRace[curPointRace[playerid]+1][1], checkpointRace[curPointRace[playerid]+1][2],8.0);
                } else {
                    SetPlayerRaceCheckpoint(playerid, 1, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    0.0, 0.0, 0.0,8.0);
                    finishRace(playerid, rid);
                }
            }
            case map_lv: {
                if (curPointRace[playerid] < 24) {
                    curPointRace[playerid]++;
                    SetPlayerRaceCheckpoint(playerid, 0, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    checkpointRace[curPointRace[playerid]+1][0], checkpointRace[curPointRace[playerid]+1][1], checkpointRace[curPointRace[playerid]+1][2],8.0);
                } else {
                    SetPlayerRaceCheckpoint(playerid, 1, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    0.0, 0.0, 0.0,8.0);
                    finishRace(playerid, rid);
                }
            }
            case map_mb: {
                if (curPointRace[playerid] < 44) {
                    curPointRace[playerid]++;
                    SetPlayerRaceCheckpoint(playerid, 0, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    checkpointRace[curPointRace[playerid]+1][0], checkpointRace[curPointRace[playerid]+1][1], checkpointRace[curPointRace[playerid]+1][2],8.0);
                } else {
                    SetPlayerRaceCheckpoint(playerid, 1, checkpointRace[curPointRace[playerid]][0], checkpointRace[curPointRace[playerid]][1], checkpointRace[curPointRace[playerid]][2],
                    0.0, 0.0, 0.0,8.0);
                    finishRace(playerid, rid);
                }
            }
        }
    }
}

hook OnPlayerConnect(playerid)
{
    curPointRace[playerid] = -1;
    isRacer[playerid] = false;
    racerOfRace[playerid] = -1;
    return true;
}

hook OnPlayerDisconnect(playerid, reason) {
    if (isRacer[playerid]) {
        SetPlayerPos(playerid, DIADIEM_DUAXE);
        SetPlayerVirtualWorld(playerid, 0);
        SetPlayerInterior(playerid, 0);
        isRacer[playerid] = false;

        new rid = racerOfRace[playerid];

        new vehicleid = GetPlayerVehicleID(playerid);
        DestroyVehicle(vehicleid);
        //Iter_Remove(vehicle_race[rid], vehicleid);

        for(new i = 0; i < MAX_RACE; i++) {
            if (race[i][status_race] == waiting) {
                if (race[i][owner_race] == playerid) {
                    foreach(new j : Player) {
                        if(racerOfRace[j] == rid)
                        {
                            SetPlayerPos(j, DIADIEM_DUAXE);
                            SetPlayerVirtualWorld(j, 0);
                            SetPlayerInterior(j, 0);
                            isRacer[j] = false;
                            SendClientMessage(j, COLOR_RED, "Tran dua da bi huy, do chu phong da roi khoi may chu.");
                            if (j != playerid) racerOfRace[j] = -1;
                        }
                    }

                    race[rid][status_race] = waiting;
                    race[rid][owner_race] = -1;
                    race[rid][map_race] = map_ls;
                    race[rid][bet_race] = 0;
                    race[rid][step_race] = 0;

                    Iter_Clear(racer[rid]);
                    racercount[rid] = 0;
                    break;
                }
            }
        }

        racerOfRace[playerid] = -1;
    }
    return true;
}

forward onRaceReady(rid);
public onRaceReady(rid) {
    KillTimer(raceTimer[rid]);
    if (racercount[rid] == 0) {
        race[rid][status_race] = waiting;
        race[rid][owner_race] = -1;
        race[rid][map_race] = map_ls;
        race[rid][bet_race] = 0;
        race[rid][step_race] = 0;
        race[rid][finish_racer] = 0;
        Iter_Clear(vehicle_race[rid]);
        Iter_Clear(racer[rid]);
        racercount[rid] = 0;
        return true;
    }

    foreach(new i : Player) {
        if(racerOfRace[i] == rid){
            if (!IsPlayerInAnyVehicle(i)) {
                SendClientMessage(i, COLOR_RED, "Ban chua o tren phuong tien dua, vi the da bi moi ra khoi cuoc dua.");
                SetPlayerPos(i, DIADIEM_DUAXE);
                SetPlayerVirtualWorld(i, 0);
                SetPlayerInterior(i, 0);
                Iter_SafeRemove(racer[rid], i, i);
                isRacer[i] = false;
                racerOfRace[i] = -1;
            }

            if (GetPlayerState(i) != PLAYER_STATE_DRIVER) {
                SendClientMessage(i, COLOR_RED, "Ban chua dieu khien phuong tien dua, vi the da bi moi ra khoi cuoc dua.");
                SetPlayerPos(i, DIADIEM_DUAXE);
                SetPlayerVirtualWorld(i, 0);
                SetPlayerInterior(i, 0);
                Iter_SafeRemove(racer[rid], i, i);
                isRacer[i] = false;
                racerOfRace[i] = -1;
            }

            if (isRacer[i]) {
                switch(race[rid][map_race]) {
                    case map_ls: curPointRace[i] = 0;
                    case map_sf: curPointRace[i] = 9;
                    case map_lv: curPointRace[i] = 19;
                    case map_mb: curPointRace[i] = 26;
                }

                SetPlayerRaceCheckpoint(i, 0, checkpointRace[curPointRace[i]][0], checkpointRace[curPointRace[i]][1], checkpointRace[curPointRace[i]][2],
                checkpointRace[curPointRace[i]+1][0], checkpointRace[curPointRace[i]+1][1], checkpointRace[curPointRace[i]+1][2], 8.0);
            }
        }
    }

    race[rid][step_race] = 0;
    raceTimer[rid] = SetTimerEx("onRaceStart", 1000, true, "i", rid);
    return true;
}

forward onRaceStart(rid);
public onRaceStart(rid) {
    if (racercount[rid] == 0) {
        race[rid][status_race] = waiting;
        race[rid][owner_race] = -1;
        race[rid][map_race] = map_ls;
        race[rid][bet_race] = 0;
        race[rid][step_race] = 0;
        race[rid][finish_racer] = 0;

        Iter_Clear(vehicle_race[rid]);
        Iter_Clear(racer[rid]);
        racercount[rid] = 0;
        return true;
    }

    foreach(new i : Player) {
        if(racerOfRace[i] == rid){
            if (race[rid][step_race] < 3) {
                new string[6];
                format(string, sizeof string, "~w~%d", 3-race[rid][step_race]);
                GameTextForPlayer(i, string, 1000, 3);
                race[rid][step_race]++;
                return true;
            }

            /*foreach(new j : vehicle_race[rid]) {
                new engine, lights, alarm, doors, bonnet, boot, objective;
                GetVehicleParamsEx(j, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(j, 1, lights, alarm, doors, bonnet, boot, objective);
            }*/

            race[rid][status_race] = racing;

            GivePlayerCash(i, -race[rid][bet_race]);
            GameTextForPlayer(i, "~g~GO!", 1000, 3);
            TogglePlayerControllable(i, true);
            SendClientMessage(i, COLOR_GREEN, "Cuoc dua bat dau! Tien cuoc da bi tru.");
            KillTimer(raceTimer[rid]);
        }
    }
    return true;
}

stock getMapName(map) {
    new name[126];
    switch(map) {
        case map_ls: name = "Los Santos";
        case map_sf: name = "San Fierro";
        case map_lv: name = "Las Venturas";
        case map_mb: name = "Mountain Bike";
    }
    return name;
}

stock showConfigRace(playerid, rid) {
    new string[520];
    format(string, sizeof string, "Map (%s)\nSo tien cuoc: $%d\nNguoi choi tham gia\nBat dau", getMapName(race[rid][map_race]), race[rid][bet_race]);
    ShowPlayerDialog(playerid, DIALOG_RACE_MENU, DIALOG_STYLE_LIST, "Dua xe | Bang dieu chinh", string, "Thay doi", "Dong");
    return true;
}

stock finishRace(playerid, rid) {
    DisablePlayerRaceCheckpoint(playerid);

    new string[256];
    if (!race[rid][finish_racer]) {
        GivePlayerCash(playerid, floatround(race[rid][bet_race]*55/100));

        format(string, sizeof string, "Ban da gianh hang 1 trong cuoc dua, ban nhan duoc $%d", floatround(race[rid][bet_race]*55/100));
        SendClientMessage(playerid, COLOR_GREEN, string);
    } else if (race[rid][finish_racer] == 2) {
        GivePlayerCash(playerid, floatround(race[rid][bet_race]*30/100));

        format(string, sizeof string, "Ban da gianh hang 2 trong cuoc dua, ban nhan duoc $%d", floatround(race[rid][bet_race]*30/100));
        SendClientMessage(playerid, COLOR_GREEN, string);
    } else if (race[rid][finish_racer] == 3) {
        GivePlayerCash(playerid, floatround(race[rid][bet_race]*25/100));

        format(string, sizeof string, "Ban da gianh hang 3 trong cuoc dua, ban nhan duoc $%d", floatround(race[rid][bet_race]*25/100));
        SendClientMessage(playerid, COLOR_GREEN, string);

        foreach (new i : Player) {
            if(racerOfRace[i] == rid){
                SendClientMessage(playerid, COLOR_RED, "Cuoc dua se ket thuc sau 10 giay nua, vi tay dua gianh hang 3 da ve dich!");
            }
        }

        raceTimer[rid] = SetTimerEx("clearRace", 10000, false, "i", rid);
    }

    race[rid][finish_racer]++;
    new vehicleid = GetPlayerVehicleID(playerid);
    DestroyVehicle(vehicleid);
    //Iter_Remove(vehicle_race[rid], vehicleid);

    SetPlayerPos(playerid, DIADIEM_DUAXE);
    SetPlayerVirtualWorld(playerid, 0);
    SetPlayerInterior(playerid, 0);
    isRacer[playerid] = false;
    racerOfRace[playerid] = -1;
    curPointRace[playerid] = -1;

    //Iter_Remove(racer[rid], playerid);
    racercount[rid] --;

    /*foreach(new i : racer[rid]) {
        format(string, sizeof (string), "[TOP %d] Tay dua %s da gianh hang %d trong cuoc dua.", race[rid][finish_racer], GetPlayerNameEx(playerid), race[rid][finish_racer]);
        SendClientMessage(playerid, COLOR_YELLOW, string);
    }*/
    if (racercount[rid] == 0) {
        race[rid][status_race] = waiting;
        race[rid][owner_race] = -1;
        race[rid][map_race] = map_ls;
        race[rid][bet_race] = 0;
        race[rid][step_race] = 0;
        race[rid][finish_racer] = 0;
        Iter_Clear(vehicle_race[rid]);
        Iter_Clear(racer[rid]);
        racercount[rid] = 0;
        return true;
    }
    return true;
}

forward clearRace(rid);
public clearRace(rid) {
    KillTimer(raceTimer[rid]);

    foreach(new i : Player) {
        if(racerOfRace[i] == rid){
            SetPlayerPos(i, DIADIEM_DUAXE);
            SetPlayerVirtualWorld(i, 0);
            SetPlayerInterior(i, 0);
            isRacer[i] = false;
            racerOfRace[i] = -1;
            curPointRace[i] = -1;
            DisablePlayerRaceCheckpoint(i);
        }
    }

    for(new i = 0; i < racercount[rid]; i++) {
        DestroyVehicle(RacerVeh[rid][i]);
    }

    Iter_Clear(racer[rid]);
    racercount[rid] = 0;
    Iter_Clear(vehicle_race[rid]);

    race[rid][status_race] = waiting;
    race[rid][owner_race] = -1;
    race[rid][map_race] = map_ls;
    race[rid][bet_race] = 0;
    race[rid][step_race] = 0;
    race[rid][finish_racer] = 0;
    return true;
}