
const 
        DIALOG_HAWK = 2006,
        HAWK_BUY_SEED = 2007;

enum e_HAWK
{
    hActor,
    Float:hPosX,
    Float:hPosY,
    Float:hPosZ,
    Float:hPosA,
    Text3D:hText,
    hMats,
};

new HawkInfo[e_HAWK];

new Float:HawkLocation[][4] =
{
    {2756.6333, -2023.4628, 13.5547, 274.3674},
    {820.3307,  -2022.5229, 12.8672, 269.0825},
    {-48.4759,  -1132.6855, 1.0781,  161.1512},
    {1112.5381, -1189.6981, 18.2247, 179.2389},
    {541.6903,  -1366.1879, 15.7090, 14.7816},
    {402.4516,  -1873.3271, 7.8359,  186.4280},
    {-80.2906,  -1579.2603, 2.6107,  53.8451},
    {-384.0107, -1152.5500, 69.4946, 268.8540},
    {208.0577,  -234.7018,  1.7786,  348.7522},
    {750.0901,  352.1031,   20.3887, 229.5616},
    {1458.6393, 364.1288,   19.0978, 74.2302},
    {1933.6328, 1076.9608,  10.8203, 348.9816},
    {2297.6997, 1486.5844,  23.6250, 252.2270},
    {2843.5896, 1334.3304,  11.3906, 2.5383}
};

forward HawkSet();
public HawkSet()
{
    if(IsValidDynamicActor(HawkInfo[hActor]))
        DestroyDynamicActor(HawkInfo[hActor]);
    if(IsValidDynamic3DTextLabel(HawkInfo[hText]))
        DestroyDynamic3DTextLabel(HawkInfo[hText]);
    new 
        iRandom = random(sizeof(HawkLocation)),
        MapZone:zoneid = GetMapZoneAtPoint3D(HawkLocation[iRandom][0], HawkLocation[iRandom][1], HawkLocation[iRandom][2]),
        ZoneName[MAX_MAP_ZONE_NAME];

    HawkInfo[hActor] = CreateDynamicActor(261, 
                        HawkLocation[iRandom][0], HawkLocation[iRandom][1], HawkLocation[iRandom][2], HawkLocation[iRandom][3], 
                        .worldid = -1, .interiorid = -1);
    HawkInfo[hText] = CreateDynamic3DTextLabel("Mysterious Man\n{FFFFFF}L-ALT", 
                                                0x6B6B6BFF, 
                                                HawkLocation[iRandom][0], HawkLocation[iRandom][1], HawkLocation[iRandom][2]+0.4, 
                                                7.0);

    HawkInfo[hPosX] = HawkLocation[iRandom][0];
    HawkInfo[hPosY] = HawkLocation[iRandom][1];
    HawkInfo[hPosZ] = HawkLocation[iRandom][2];
    HawkInfo[hPosA] = HawkLocation[iRandom][3];
    HawkInfo[hMats] = 10;

    GetMapZoneName(zoneid, ZoneName);
    SendClientMessageToAll(0x2774E7FF, sprintf("[HOT NEWS] {FFFFFF}Hien tai {6B6B6B}Mysterious Man{FFFFFF} dang o khu vuc {E79429}%s{FFFFFF}, hay nhanh chong tim anh ta.", ZoneName));

    printf("Mysterious Man (respawn) (X: %0.1f Y: %0.1f Z: %0.1f)", HawkInfo[hPosX], HawkInfo[hPosY], HawkInfo[hPosZ]);
    SetTimer("HawkSet", 60000 * 40, false);
    return 1;
}

/*=========================================================*/
#include <YSI\YSI_Coding\y_hooks>
hook OnGameModeInit()
{
    HawkSet();
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_WALK))
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, HawkInfo[hPosX], HawkInfo[hPosY], HawkInfo[hPosZ]))
        {
            ShowPlayerDialog(playerid, DIALOG_HAWK, DIALOG_STYLE_TABLIST_HEADERS, "Mysterious Man", "{FFFFFF}Vat pham\tGia\n\
            Mat na\t{FF2424}$130,000{FFFFFF}\n\
            Hat giong can sa\t{FF2424}$700{FFFFFF}\n\
            Vat lieu\t{FF2424}$19,800/60 goi{FFFFFF}", "Mua", "Huy");
        }
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_HAWK && response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(GetPlayerCash(playerid) < 130000)
                    return SendClientMessage(playerid, COLOR_GRAD2, "Ban khong du tien de mua vat pham nay.");
                if(PlayerInfo[playerid][pMatna] != 0)
                    return SendClientMessage(playerid, COLOR_GRAD2, "Ban da co mot chiec mat na.");

                GivePlayerCash(playerid, -130000);
                PlayerInfo[playerid][pMatna] = 1;
                SendClientMessage(playerid, -1, "Ban da mua mot chiec mat na tu {6B6B6B}Mysterious Man{FFFFFF}.");
            }
            case 1:
            {
                ShowPlayerDialog(playerid, HAWK_BUY_SEED, DIALOG_STYLE_INPUT, "Mysterious Man", "Nhap so luong hat giong ban muon mua (Don gia: $700/1 hat):", "Mua", "Huy");
            }
            case 2:
            {
                if(HawkInfo[hMats] == 0)
                    return SendClientMessage(playerid, COLOR_GRAD1, "Mysterious Man khong con goi vat lieu nao de ban.");
                if(GetPlayerCash(playerid) < 19800)
                    return SendClientMessage(playerid, COLOR_GRAD1, "Ban khong du tien de thuc hien.");

                SendClientMessage(playerid, -1, "Ban da mua {D29E2D}60 goi{FFFFFF} vat lieu voi gia {FF2424}$19,800{FFFFFF}.");
                PlayerInfo[playerid][pMats] += 25 * 60;
                GivePlayerCash(playerid, -19800);
                HawkInfo[hMats]--;
            }
        }
    }
    else if(dialogid == HAWK_BUY_SEED && response)
    {
        new 
			amount = strval(inputtext), cost = 700, str[128], total_cost;
		
		total_cost = cost * amount;
		if(amount <= 0 || total_cost <= 0)
			return ShowPlayerDialog(playerid, HAWK_BUY_SEED, DIALOG_STYLE_INPUT, "Mysterious Man", "{FFFFFF}Nhap lai so luong:", "Mua", "Huy");

		if(GetPlayerMoney(playerid) >= total_cost)
		{
			format(str, sizeof(str), "Ban da mua {789258}%d{ffffff} hat giong voi gia {789258}$%d{ffffff}.", amount, total_cost);
			GivePlayerMoney(playerid, -total_cost);
			PlayerInfo[playerid][pMarijunaSeed] += amount;
		}
		else format(str, sizeof(str), "Ban khong du {789258}$%d{ffffff} de mua {789258}%d{ffffff} hat giong.", total_cost, amount);

		SendClientMessage(playerid, -1, str);
    }
    return 1;
}

CMD:gotomm(playerid, const params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 8)
    {
        SetPlayerPos(playerid, HawkInfo[hPosX], HawkInfo[hPosY], HawkInfo[hPosZ]);
    }
    return 1;
}