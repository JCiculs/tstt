#include<a_samp>
#include <YSI_Coding\y_hooks>

//#define BAICAO 444



new npc[3];


enum datacasino
{
	OBJECT_CSN,
	NUMBER_CSN,
	STATS_CSN,
}


new CSN[53][datacasino] = {
	{ -10030,	0},
	{ -10031,	1},
	{ -10031,	1},
	{ -10032,	1},
	{ -10032,	1},
	{ -10033,	2},
	{ -10033,	2},
	{ -10034,	2},
	{ -10034,	2},
	{ -10035,	3},
	{ -10035,	3},
	{ -10036,	3},
	{ -10036,	3},
	{ -10037,	4},
	{ -10037,	4},
	{ -10038,	4},
	{ -10038,	4},
	{ -10039,	5},
	{ -10039,	5},
	{ -10040,	5},
	{ -10040,	5},
	{ -10041,	6},
	{ -10041,	6},
	{ -10042,	6},
	{ -10042,	6},
	{ -10043,	7},
	{ -10043,	7},
	{ -10044,	7},
	{ -10044,	7},
	{ -10045,	8},
	{ -10045,	8},
	{ -10046,	8},
	{ -10046,	8},
	{ -10047,	9},
	{ -10047,	9},
	{ -10048,	9},
	{ -10048,	9},
	{ -10049,	0},
	{ -10049,	0},
	{ -10050,	0},
	{ -10050,	0},
	{ -10051,	10},
	{ -10051,	10},
	{ -10052,	10}, //43
	{ -10052,	10},
	{ -10053,	10}, // 45
	{ -10053,	10},
	{ -10054,	10},// 47
	{ -10054,	10},
	{ -10055,	10},// 49
	{ -10055,	10},
	{ -10056,	10},// 51
	{ -10056,	10}
	};

new Text3D: CASINO_BAICAO_TEXT_P[5];
new Text3D: CASINO_BAICAO_TEXT;
new CASINO_BAICAO_TIME;
new CASINO_BAICAO_OBJECT[18];
new CASINO_PLAYER[5];
new CASINO_MONEY[5];
new CASINO_DIEM[3];
new CASINO_PDIEM[5][3];


stock CHECKCASINO(a,b,c)
{
	new d = a + b + c;
	if(d < 10)
	{
	    return d;
	}
	else if(d == 30)
	{
	    return d;
	}
	else if(d == 0 || d == 10 || d == 20)
	{
	    return 0;
	}
	else if(d > 10 && d < 20)
	{
	    d = d - 10;
	    return d;
	}
	else if(d > 20 && d < 30)
	{
	    d = d - 20;
	    return d;
	}
	return 0;
}
stock GetCSN()
{
	new f = random(52)+1;
    if(CSN[f][STATS_CSN] == 1)
    {
        return GetCSN();
    }
    if(CSN[f][STATS_CSN] == 0)
    {
        CSN[f][STATS_CSN] = 1;
    	return f;
    }
	return 0;
}
stock updatecasino()
{
	new string[128],Float:x, Float:y, Float:z;
	if(CASINO_BAICAO_TIME < 80)
	{
		CASINO_BAICAO_TIME++;
		if(CASINO_BAICAO_TIME == 80)
		{
		    CASINO_BAICAO_TIME = 0;
		    CASINO_DIEM[0] = 0;
	        CASINO_DIEM[1] = 0;
	        CASINO_DIEM[2] = 0;
            for(new i; i < 5; i++)
            {
                CASINO_MONEY[i] = 0;
                CASINO_PLAYER[i] = 0;
                CASINO_PDIEM[i][0] = 0;
                CASINO_PDIEM[i][1] = 0;
                CASINO_PDIEM[i][2] = 0;
                UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT_P[i], 0xFFFFFFFF, "---");
			}
		    for(new a; a < 15; a++)
	        {
	        	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[a], E_STREAMER_MODEL_ID, -10030);
	        	GetDynamicObjectPos(CASINO_BAICAO_OBJECT[a], x, y, z);
	        	if(z == 4621.645019)
	        	{
	        	    SetDynamicObjectPos(CASINO_BAICAO_OBJECT[a], x, y, z-100);
	        	}
	        }
	        for(new i; i < 53; i++)
	        {
	            CSN[i][STATS_CSN] = 0;
	        }
		}
	}
	if(CASINO_BAICAO_TIME > 0 && CASINO_BAICAO_TIME <= 20)
	{
	    format(string,128,"Nha Cai\nMoi Dat Cuoc [ %d giay ]\n$%s", 20-CASINO_BAICAO_TIME,number_format(Businesses[6][bSafeBalance]));
	    UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT, 0xFFFFFFFF, string);
	}
	if(CASINO_BAICAO_TIME > 20 && CASINO_BAICAO_TIME <= 25)
	{
	    format(string,128,"Nha Cai\nChia Bai [ %d giay ]\n$%s", 25-CASINO_BAICAO_TIME,number_format(Businesses[6][bSafeBalance]));
	    UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT, 0xFFFFFFFF, string);
	    if(CASINO_BAICAO_TIME == 25)
		{
	        if(CASINO_PLAYER[0] != 0 || CASINO_PLAYER[1] != 0 || CASINO_PLAYER[2] != 0 || CASINO_PLAYER[3] != 0)
	        {
	            GetDynamicObjectPos(CASINO_BAICAO_OBJECT[0], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[0], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[1], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[1], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[2], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[2], x, y, 4621.645019);
	        }
            if(CASINO_PLAYER[0] != 0)
            {
                GetDynamicObjectPos(CASINO_BAICAO_OBJECT[3], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[3], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[4], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[4], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[5], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[5], x, y, 4621.645019);
            }
            if(CASINO_PLAYER[1] != 0)
            {
                GetDynamicObjectPos(CASINO_BAICAO_OBJECT[6], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[6], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[7], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[7], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[8], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[8], x, y, 4621.645019);
            }
            if(CASINO_PLAYER[2] != 0)
            {
                GetDynamicObjectPos(CASINO_BAICAO_OBJECT[9], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[9], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[10], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[10], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[11], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[11], x, y, 4621.645019);
            }
            if(CASINO_PLAYER[3] != 0)
            {
                GetDynamicObjectPos(CASINO_BAICAO_OBJECT[12], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[12], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[13], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[13], x, y, 4621.645019);
		        GetDynamicObjectPos(CASINO_BAICAO_OBJECT[14], x, y, z);
		        SetDynamicObjectPos(CASINO_BAICAO_OBJECT[14], x, y, 4621.645019);
            }
	    }
	}
	if(CASINO_BAICAO_TIME > 25 && CASINO_BAICAO_TIME <= 70)
	{
	    format(string,128,"Nha Cai\nXem Bai [ %d giay ]\n$%s", 70-CASINO_BAICAO_TIME,number_format(Businesses[6][bSafeBalance]));
	    UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT, 0xFFFFFFFF, string);
	    if(CASINO_PLAYER[0] != 0 || CASINO_PLAYER[1] != 0 || CASINO_PLAYER[2] != 0 || CASINO_PLAYER[3] != 0)
	    {
		    if(CASINO_BAICAO_TIME == 30)
		    {
		        CASINO_DIEM[0] = GetCSN();
		        Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[0], E_STREAMER_MODEL_ID, CSN[CASINO_DIEM[0]][OBJECT_CSN]);
		        CASINO_DIEM[0] = CSN[CASINO_DIEM[0]][NUMBER_CSN];
		    }
		    if(CASINO_BAICAO_TIME == 32)
		    {
		        CASINO_DIEM[1] = GetCSN();
		        Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[1], E_STREAMER_MODEL_ID, CSN[CASINO_DIEM[1]][OBJECT_CSN]);
		        CASINO_DIEM[1] = CSN[CASINO_DIEM[1]][NUMBER_CSN];
		    }
		    if(CASINO_BAICAO_TIME == 34)
		    {
		        CASINO_DIEM[2] = GetCSN();
		        Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[2], E_STREAMER_MODEL_ID, CSN[CASINO_DIEM[2]][OBJECT_CSN]);
		        CASINO_DIEM[2] = CSN[CASINO_DIEM[2]][NUMBER_CSN];
		    }
		}
	    for(new i; i < 4; i++)
	    {
	        if(CASINO_PLAYER[i] != 0)
	        {
	            switch(i)
	            {
	                case 0:
	                {
	                    if(CASINO_BAICAO_TIME == 34)
	                    {
                            CASINO_PDIEM[0][0] = GetCSN();
                    		Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[3], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[0][0]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 41)
	                    {
	                        CASINO_PDIEM[0][1] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[4], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[0][1]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 46)
	                    {
                        	CASINO_PDIEM[0][2] = GetCSN();
                    		Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[5], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[0][2]][OBJECT_CSN]);
	                    }
	                }
	                case 1:
	                {
	                    if(CASINO_BAICAO_TIME == 34)
	                    {
	                        CASINO_PDIEM[1][0] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[6], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[1][0]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 41)
	                    {
	                        CASINO_PDIEM[1][1] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[7], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[1][1]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 46)
	                    {
	                        CASINO_PDIEM[1][2] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[8], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[1][2]][OBJECT_CSN]);
	                    }
	                }
	                case 2:
	                {
	                    if(CASINO_BAICAO_TIME == 34)
	                    {
	                        CASINO_PDIEM[2][0] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[9], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[2][0]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 41)
	                    {
	                        CASINO_PDIEM[2][1] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[10], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[2][1]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 46)
	                    {
	                        CASINO_PDIEM[2][2] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[11], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[2][2]][OBJECT_CSN]);
	                    }
	                }
	                case 3:
	                {
	                    if(CASINO_BAICAO_TIME == 34)
	                    {
	                        CASINO_PDIEM[3][0] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[12], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[3][0]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 41)
	                    {
	                        CASINO_PDIEM[3][1] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[13], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[3][1]][OBJECT_CSN]);
	                    }
	                    if(CASINO_BAICAO_TIME == 46)
	                    {
	                        CASINO_PDIEM[3][2] = GetCSN();
	                    	Streamer_SetIntData(STREAMER_TYPE_OBJECT, CASINO_BAICAO_OBJECT[14], E_STREAMER_MODEL_ID, CSN[CASINO_PDIEM[3][2]][OBJECT_CSN]);
	                    }
	                }
	            }
	        }
	    }
	}
	if(CASINO_BAICAO_TIME > 71 && CASINO_BAICAO_TIME <= 79)
	{
	    new e = CHECKCASINO(CASINO_DIEM[0], CASINO_DIEM[1], CASINO_DIEM[2]);
	    if(CASINO_BAICAO_TIME == 72)
	    {
	        for(new i; i < 4; i++)
		    {
		        if(CASINO_PLAYER[i] != 0)
		        {
		            new a = CSN[CASINO_PDIEM[i][0]][NUMBER_CSN];
		            new b = CSN[CASINO_PDIEM[i][1]][NUMBER_CSN];
		            new c = CSN[CASINO_PDIEM[i][2]][NUMBER_CSN];
		            new d = CHECKCASINO(a,b,c);
		            if(d > e)
		            {
						foreach(new playerid: Player)
						{
						    if(CASINO_PLAYER[i] == GetPlayerSQLId(playerid))
						    {
								new tienthue = (CASINO_MONEY[i]/100)*5, tientra = CASINO_MONEY[i]*2;
						        PlayerInfo[playerid][pCash] += tientra - tienthue;
						        Businesses[6][bSafeBalance] -= tientra - tienthue;
						        format(string,128,"{7289DA}Ban thang van bai nay vi diem cua ban cao hon nha cai va ban nhan duoc $%d.",tientra-tienthue);
						        SendClientMessageEx(playerid,-1,string);
						        format(string,128,"%s thang van bai nay vi duoc %d diem va nha cai duoc %d diem va ho nhan duoc $%d.",GetPlayerNameEx(playerid),d,e,tientra-tienthue);
						        Log("logs/choi3cao.log", string);
						    }
						}
		            }
		            if(d == e)
		            {
		                foreach(new playerid: Player)
						{
						    if(CASINO_PLAYER[i] == GetPlayerSQLId(playerid))
						    {
						        PlayerInfo[playerid][pCash] += CASINO_MONEY[i];
						        Businesses[6][bSafeBalance] -= CASINO_MONEY[i];
						        format(string,128,"{7289DA}Ban hoa van bai nay vi diem cua ban bang voi nha cai va ban duoc tra lai $%d.",CASINO_MONEY[i]);
						        SendClientMessageEx(playerid,-1,string);
						        format(string,128,"%s hoa van bai nay vi diem cua ho bang voi nha cai %d diem va ho duoc tra lai $%d.",GetPlayerNameEx(playerid),e,CASINO_MONEY[i]);
						        Log("logs/choi3cao.log", string);
						    }
						}
		            }
		            if(d < e)
		            {
						foreach(new playerid: Player)
						{
						    if(CASINO_PLAYER[i] == GetPlayerSQLId(playerid))
						    {
						        SendClientMessageEx(playerid,-1,"{7289DA}Ban da thua van bai nay vi diem cua ban thap hon nha cai.");
						        format(string,128,"%s da thua van bai nay vi ho duoc %d diem va nha cai duoc %d diem.",GetPlayerNameEx(playerid),d,e);
						        Log("logs/choi3cao.log", string);
						    }
						}
					}
		            if(d == 30)
		            {
		                format(string,128,"3 cao",d);
		            }
		            else
		            {
		            	format(string,128,"%d nut",d);
		            }
		            UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT_P[i], 0xFFFFFFFF, string);
		        }
		    }
	    }
	    format(string,128,"Nha Cai\nTinh Diem [ %d giay ]\n%d nut", 79-CASINO_BAICAO_TIME,e);
	    UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT, 0xFFFFFFFF, string);
	    format(string,128,"Nha Cai duoc %d nut",e);
        Log("logs/choi3cao.log", string);
	}
}


hook OnGameModeInit()
{
	new object_world = 1, object_int = 11;

	npc[0] = CreateActor(172,1819.9634,1803.7677,4621.5566,267.7665); // casino bai cao
	SetActorVirtualWorld(npc[0],1);

    CASINO_BAICAO_TEXT = CreateDynamic3DTextLabel("{FFE500}Nha�Cai",0xFF0000FF, 1819.9634,1803.7677,4621.5566, 10.0); //casino bai cao

    CASINO_BAICAO_TEXT_P[0] = CreateDynamic3DTextLabel("{FFE500}Player 1",0xFF0000FF, 1821.1123,1801.8193,4621.5566, 10.0);// 1
    CASINO_BAICAO_TEXT_P[1] = CreateDynamic3DTextLabel("{FFE500}Player 2",0xFF0000FF, 1822.4373,1803.1630,4621.5566, 10.0);// 2
    CASINO_BAICAO_TEXT_P[2] = CreateDynamic3DTextLabel("{FFE500}Player 3",0xFF0000FF, 1822.4365,1804.2002,4621.5566, 10.0);// 3
    CASINO_BAICAO_TEXT_P[3] = CreateDynamic3DTextLabel("{FFE500}Player 4",0xFF0000FF, 1821.1978,1805.6066,4621.5566, 10.0);// 4


	CASINO_BAICAO_OBJECT[3] = CreateDynamicObject(-10030, 1821.032348, 1802.532592, 4621.645019-100, -89.999992, 89.999992, 89.999992, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[4] = CreateDynamicObject(-10030, 1821.202514, 1802.532592, 4621.645019-100, -89.999992, 89.999992, 89.999992, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[5] = CreateDynamicObject(-10030, 1821.372680, 1802.532592, 4621.645019-100, -89.999992, 89.999992, 89.999992, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[12] = CreateDynamicObject(-10030, 1821.032348, 1804.904174, 4621.645019-100, -89.999992, 90.000000, 89.999969, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[13] = CreateDynamicObject(-10030, 1821.202514, 1804.904174, 4621.645019-100, -89.999992, 90.000000, 89.999969, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[14] = CreateDynamicObject(-10030, 1821.372680, 1804.904174, 4621.645019-100, -89.999992, 90.000000, 89.999969, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[9] = CreateDynamicObject(-10030, 1821.773071, 1803.973266, 4621.645019-100, -89.999992, 25.528831, 115.528717, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[10] = CreateDynamicObject(-10030, 1821.773071, 1804.143432, 4621.645019-100, -89.999992, 25.528831, 115.528717, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[11] = CreateDynamicObject(-10030, 1821.773071, 1804.313598, 4621.645019-100, -89.999992, 25.528831, 115.528717, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[6] = CreateDynamicObject(-10030, 1821.773071, 1803.052612, 4621.645019-100, -89.999992, 13.368575, 103.368438, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[7] = CreateDynamicObject(-10030, 1821.773071, 1803.222778, 4621.645019-100, -89.999992, 13.368575, 103.368438, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[8] = CreateDynamicObject(-10030, 1821.773071, 1803.392944, 4621.645019-100, -89.999992, 13.368575, 103.368438, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[0] = CreateDynamicObject(-10030, 1820.651977, 1803.503051, 4621.645019-100, -89.999992, 6.774112, 96.773956, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[1] = CreateDynamicObject(-10030, 1820.651977, 1803.673217, 4621.645019-100, -89.999992, 6.774112, 96.773956, object_world, object_int, -1);
	CASINO_BAICAO_OBJECT[2] = CreateDynamicObject(-10030, 1820.651977, 1803.843383, 4621.645019-100, -89.999992, 6.774112, 96.773956, object_world, object_int, -1);



	return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_YES)
    {
		new string[1024];
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1819.9634,1803.7677,4621.5566))
		{
		    if(CASINO_BAICAO_TIME >= 0 && CASINO_BAICAO_TIME < 60)
		    {
		        format(string,1024,"10$\n20$\n30$\n40$\n50$\n100$\n200$\n300$\n400$\n500$\n1000$");
		        ShowPlayerDialog(playerid, 2704, DIALOG_STYLE_LIST,"Chon So Tien Cuoc", string, "{ae0202}Chon","{FFFFFF}Huy");
		        return 1;
		    }
		}
	}
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2704) // casino baicao
	{
	    if(response)
	    {
	        if(Businesses[6][bSafeBalance] <= 0)
		    {
		        SendClientMessageEx(playerid,-1,"Nha Cai Da Het Tien");
				return 1;
		    }
	        if(CASINO_BAICAO_TIME > 0 && CASINO_BAICAO_TIME <= 20)
	        {
	            new money,string[128];
	            switch(listitem)
	            {
	                case 0: money = 10;
	                case 1: money = 20;
	                case 2: money = 30;
	                case 3: money = 40;
	                case 4: money = 50;
	                case 5: money = 100;
	                case 6: money = 200;
	                case 7: money = 300;
	                case 8: money = 400;
	                case 9: money = 500;
	                case 10: money = 1000;
	            }
	            if(PlayerInfo[playerid][pCash] < money)
	            {
	                return SendClientMessageEx(playerid,-1,"ban khong du tien de dat cuoc");
	            }
				for(new i; i < 4; i++)
				{
				    if(CASINO_PLAYER[i] == GetPlayerSQLId(playerid))
				    {
				        return SendClientMessageEx(playerid,-1,"Ban Chi Co The Dat Duoc 1 Tu");
				    }
				    if(CASINO_PLAYER[i] == 0)
				    {
				        CASINO_PLAYER[i] = GetPlayerSQLId(playerid);
				        CASINO_MONEY[i] = money;
				        PlayerInfo[playerid][pCash] -= money;
				        format(string,128,"{7289DA}Ban da dat cuoc %d$ cho van Bai Cao",money);
				        SendClientMessageEx(playerid,-1,string);
				        format(string,128,"%s\n%d$",GetPlayerNameEx(playerid),money);
				        UpdateDynamic3DTextLabelText(CASINO_BAICAO_TEXT_P[i], 0xFFFFFFFF, string);
				        Businesses[6][bSafeBalance] += money;
				        format(string,128,"%s da dat cuoc %d$ cho van Bai Cao",GetPlayerNameEx(playerid),money);
				        Log("logs/choi3cao.log", string);
				        return 1;
				    }
				}
	        }
	        else { SendClientMessageEx(playerid,-1,"Qua Cham, Vui Long Doi Van Ke Tiep"); }
	    }
	}
	return 1;
}

task thoigiancasino[1000]()
{
	updatecasino();
	return 1;
}

task thoigianbaicao[1200000]()
{
    SaveBusiness(6);
    return 1;
}
