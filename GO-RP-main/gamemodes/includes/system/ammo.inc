#include <YSI_Coding\y_hooks>
const
        DIALOG_CRAFT_AMMO = 9220;

new const Max_Ammo[5] = {200, 100, 1000, 1000, 50};

stock GetAmmoName(ammoid)
{
    new szResult[128];
    switch(ammoid)
    {
        case 0: szResult = "Pistol";
        case 1: szResult = "Shotgun";
        case 2: szResult = "Tieu lien";
        case 3: szResult = "Automatic rifle";
        case 4: szResult = "Sniper";
    }
    return szResult;
}

stock IsPlayerMaxAmmo(playerid, ammoid, amount)
{
    return ((PlayerInfo[playerid][pAmmo][ammoid] + amount) > Max_Ammo[ammoid]);
}

CMD:xemdan(playerid, const params[])
{
    new szDialog[64 + 64 * 2];
    format(szDialog, sizeof(szDialog), "{FFFFFF}Loai dan\tSo luong\n\
    Dan Pistol\t{D26D32}%s vien{FFFFFF}\n\
    Dan Shotgun\t{D26D32}%s vien{FFFFFF}\n\
    Dan tieu lien\t{D26D32}%s vien{FFFFFF}\n\
    Dan Automatic rifle\t{D26D32}%s vien{FFFFFF}\n\
    Dan Sniper\t{D26D32}%s vien", 
    number_format(PlayerInfo[playerid][pAmmo][0]),
    number_format(PlayerInfo[playerid][pAmmo][1]),
    number_format(PlayerInfo[playerid][pAmmo][2]),
    number_format(PlayerInfo[playerid][pAmmo][3]),
    number_format(PlayerInfo[playerid][pAmmo][4]));

    ShowPlayerDialog(playerid, DIALOG_NOTHING, DIALOG_STYLE_TABLIST_HEADERS, "> Tui dan cua ban", szDialog, "Dong", "");
    return 1;
}

CMD:chetaodancocaiconcac(playerid, const params[])
{
    if(HungerPlayerInfo[playerid][hgInEvent] != 0) return SendClientMessage(playerid, COLOR_GREY, "   Ban khong the lam dieu nay khi dang trong su kien Hunger Games!");
    if(GetPVarInt(playerid, "IsInArena") >= 0) {
        SendClientMessage(playerid,COLOR_GREY,"   Ban khong the lam dieu nay khi dang trong arena!");
        return 1;
    }
    if(GetPVarInt( playerid, "EventToken") != 0)
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang trong su kien.");
        return 1;
    }
    if(WatchingTV[playerid] != 0) {
        SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang xem TV!");
        return 1;
    }
    if (PlayerInfo[playerid][pJailTime] > 0) {
        SendClientMessage(playerid,COLOR_GREY,"   Ban khong the dua sung khi dang trong tu!");
        return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the lam dieu nay bay gio.");
    if(PlayerInfo[playerid][pHospital] > 0) {
        SendClientMessage(playerid, COLOR_GREY, "Ban khong the tao vu khi khi dang o benh vien.");
        return 1;
    }

    new type;
    if(sscanf(params, "d", type))  
    {
        SendClientMessage(playerid, COLOR_GREY, "SU DUNG: /chetaodan [loai dan]");
        SendClientMessage(playerid, -1, "Loai dan: (1) Pistol - (2) Shotgun - (3) Tieu lien - (4) Automatic rifle - (5) Sniper");
        return 1;
    }

    switch(type)
    {
        case 1: 
        {
            ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{D26D32}Loai dan: Pistol\nYeu cau: 10 vat lieu/1 vien dan\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
            SetPVarInt(playerid, "Craft_Ammo", 1);
            SetPVarInt(playerid, "Ammo_Price", 10);
        }
        case 2:
        {
            ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{D26D32}Loai dan: Shotgun\nYeu cau: 10 vat lieu/1 vien dan\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
            SetPVarInt(playerid, "Craft_Ammo", 2);
            SetPVarInt(playerid, "Ammo_Price", 10);
        }
        case 3:
        {
            ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{D26D32}Loai dan: Tieu lien\nYeu cau: 10 vat lieu/1 vien dan\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
            SetPVarInt(playerid, "Craft_Ammo", 3);
            SetPVarInt(playerid, "Ammo_Price", 10);
        }
        case 4:
        {
            ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{D26D32}Loai dan: Automatic rifle\nYeu cau: 10 vat lieu/1 vien dan\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
            SetPVarInt(playerid, "Craft_Ammo", 4);
            SetPVarInt(playerid, "Ammo_Price", 10);
        }
        case 5:
        {
            ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{D26D32}Loai dan: Sniper\nYeu cau: 10 vat lieu/1 vien dan\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
            SetPVarInt(playerid, "Craft_Ammo", 5);
            SetPVarInt(playerid, "Ammo_Price", 10);
        }
        default: SendClientMessage(playerid, COLOR_GRAD1, "Loai dan khong hop le.");
    }
    return 1;
}

/*==========================================*/
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_CRAFT_AMMO)
    {
        if(!response)
            return DeletePVar(playerid, "Craft_Ammo");

        new 
            amount = strval(inputtext),
            ammo = GetPVarInt(playerid, "Craft_Ammo") - 1,
            price = GetPVarInt(playerid, "Ammo_Price");

        if(amount < 1)
            return ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{BC2929}Loi: So luong khong duoc nho hon 1.\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
        if((amount * price) > PlayerInfo[playerid][pMats])
            return ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", "{BC2929}Loi: Ban khong co du vat lieu de che tao.\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", "Xong", "Huy");
  //      if(IsPlayerMaxAmmo(playerid, ammo, amount))   
//            return ShowPlayerDialog(playerid, DIALOG_CRAFT_AMMO, DIALOG_STYLE_INPUT, "> Che tao dan", ("{BC2929}Loi: Ban chi co the che tao duoc %d vien dan.\n\n{FFFFFF}Vui long nhap so dan ban muon che tao duoi day:", Max_Ammo[ammo] - PlayerInfo[playerid][pAmmo][ammo]), "Xong", "Huy");

        PlayerInfo[playerid][pMats] -= amount * price;
        PlayerInfo[playerid][pAmmo][ammo] += amount;
        SendClientMessage(playerid, -1, "Ban da che tao thanh cong {BC2929}%d{FFFFFF} vien dan voi {BC2929}%s{FFFFFF} vat lieu. (Loai: %s)", amount, number_format(amount * price), GetAmmoName(ammo));
        SetPlayerWeapons(playerid);

        DeletePVar(playerid, "Craft_Ammo");
        DeletePVar(playerid, "Ammo_Price");

        if(amount >= 30)
        {
            if(PlayerInfo[playerid][pDonateRank] == 2 || PlayerInfo[playerid][pDonateRank] == 3)
            {
                PlayerInfo[playerid][pArmsSkill] += 2;
            }
            else if(DoubleXP) {
                SendClientMessage(playerid, COLOR_YELLOW, "Ban da duoc 2 diem ky nang chet tao vu khi thay vi 1. (Double XP Active)");
                PlayerInfo[playerid][pArmsSkill] += 2;
                PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE * 2;
            }
            else if(PlayerInfo[playerid][pDoubleEXP] > 0 && PlayerInfo[playerid][pDonateRank] < 2 && !DoubleXP)
            {
                SendClientMessage(playerid, COLOR_YELLOW, "Ban da duoc 2 diem ky nang chet tao vu khi thay vi 1. Ban con %d gio con lai nhan doi EXP token.", PlayerInfo[playerid][pDoubleEXP]);
                PlayerInfo[playerid][pArmsSkill] += 2;
                PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE * 2;
            }
            else
            {
                PlayerInfo[playerid][pArmsSkill]++;
                PlayerInfo[playerid][pXP] += PlayerInfo[playerid][pLevel] * XP_RATE;
            }

            if(PlayerInfo[playerid][pArmsSkill] == 50)
            { SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang che tao vu khi cua ban dat cap do 2, se co them nhieu loai vu khi de ban."); }
            else if(PlayerInfo[playerid][pArmsSkill] == 100)
            { SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang che tao vu khi cua ban dat cap do 3, se co them nhieu loai vu khi de ban."); }
            else if(PlayerInfo[playerid][pArmsSkill] == 200)
            { SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang che tao vu khi cua ban dat cap do 4, se co them nhieu loai vu khi de ban."); }
            else if(PlayerInfo[playerid][pArmsSkill] == 400)
            { SendClientMessage(playerid, COLOR_YELLOW, "* Ky nang che tao vu khi cua ban dat cap do 5, se co them nhieu loai vu khi de ban."); }
        }
    }
    return 1;
}