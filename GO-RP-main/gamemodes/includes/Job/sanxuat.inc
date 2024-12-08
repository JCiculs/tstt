#include <a_samp>
#include <YSI_Coding\y_hooks>
new sanxuat;
new sanxuat1;
new sanxuat2;
new sanxuat3;
#define DIALOG_SHOPSUNG	(5030)
hook OnGameModeInit()
{
    sanxuat = CreatePickup(347, 1, 2378.7815,-644.0325,127.3260-1);
    sanxuat1 = CreatePickup(347, 1, 2374.1990,-644.6326,127.4275,-1);
    sanxuat2 = CreatePickup(348, 1, 2370.4121,-645.2681,127.5735,-1);
    sanxuat3 = CreatePickup(2035, 1, 2363.0828,-652.5670,127.8897,-1);

    CreateDynamic3DTextLabel("{ff2731}Khu vuc san xuat", COLOR_YELLOW, 2378.7815,-644.0325,127.3260, 10);
    CreateDynamic3DTextLabel("{ff2731}Khu vuc san xuat 2", COLOR_YELLOW, 2374.1990,-644.6326,127.4275, 10);
    CreateDynamic3DTextLabel("{ff2731}Khu vuc san xuat 3", COLOR_YELLOW, 2370.4121,-645.2681,127.5735, 10);
    CreateDynamic3DTextLabel("{ff2731}Khu vuc san xuat 4", COLOR_YELLOW, 2363.0828,-652.5670,127.8897, 10);

    CreateDynamicPickup(2035, 1, 1093.0507,2090.8723,15.3504,-1);
    CreateDynamic3DTextLabel("{ff2731}/shopvukhi", COLOR_YELLOW, 312.1817,-166.1400,999.6010, 10);

}
CMD:shopvukhi(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 312.1817,-166.1400,999.6010))
    {
        new str[128];
        format(str, sizeof(str), "{e72401}Vu khi\t{10ce73}So Dan\tGia\n9mm\t%d\t2000$\nShotgun\t%d\t5000$",shopsung,shopsung);
        ShowPlayerDialog(playerid, DIALOG_SHOPSUNG, DIALOG_STYLE_TABLIST_HEADERS, "Cua hang", str, "{89310b}Mua","{FFFFFF}Huy");
    }
    else SendClientMessage(playerid, COLOR_GREY, "Ban khong o cua hang");
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_SHOPSUNG && response)
    {
        switch(listitem)
        {
            case 0:
            {
                if(PlayerInfo[playerid][pGpvk] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban chua co giay phep vu khi");
                if(shopsung < 0) return SendClientMessage(playerid, COLOR_GREY, "Shop hien tai chua co hang");
                if(PlayerInfo[playerid][pCash] < 2000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien");
                GivePlayerValidWeapon(playerid, 22, 1);
                shopsung --;
                PlayerInfo[playerid][pCash] -= 2000;
                SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua mot khau sung (9mm) voi gia 2000$");
            }
            case 1:
            {
                if(PlayerInfo[playerid][pGpvk] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban chua co giay phep vu khi");
                if(shopsung < 1) return SendClientMessage(playerid, COLOR_GREY, "Shop hien tai chua co hang");
                if(PlayerInfo[playerid][pCash] < 3500) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien");
                GivePlayerValidWeapon(playerid, 25, 1);
                PlayerInfo[playerid][pCash] -= 3500;
                shopsung --;
                SendClientMessage(playerid, COLOR_YELLOW, "Ban da mua mot khau sung (Shotgun) voi gia 5000$");
            }
        }
    }
    return 1;
}
forward OnPlayerSanXuat(playerid);
public OnPlayerSanXuat(playerid)
{
    if(GetPVarInt(playerid, "DANGSANXUAT") == 1)
    {
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, -1);
        SendClientMessage(playerid, COLOR_YELLOW, "Ban da rap xong 1/4 hay den khau tiep theo");
        SetPVarInt(playerid, "DANGSANXUAT", 1);
    }
    else if(GetPVarInt(playerid, "DANGSANXUAT") == 2)
    {
        ClearAnimations(playerid);
        SetPVarInt(playerid, "DANGSANXUAT", 2);
        TogglePlayerControllable(playerid, -1);
        SendClientMessage(playerid, COLOR_YELLOW, "Ban da rap xong 2/4 hay den khau tiep theo");
    }
    else if(GetPVarInt(playerid, "DANGSANXUAT") == 3)
    {
        ClearAnimations(playerid);
        SetPVarInt(playerid, "DANGSANXUAT", 3);
        TogglePlayerControllable(playerid, -1);
        SendClientMessage(playerid, COLOR_YELLOW, "Ban da rap xong 3/4 hay den khau tiep theo");
    }
    else if(GetPVarInt(playerid, "DANGSANXUAT") == 4)
    {
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, -1);
        SendClientMessage(playerid, COLOR_YELLOW, "Ban da rap xong 4/4");
        SendClientMessage(playerid, -1, "{ff2731}[Jobs]{FFFFF} Hay dem no xuong kho");
        SetPlayerCheckpoint(playerid, 2351.2639,-647.2317,128.0547, 3.0);
        SetPVarInt(playerid, "DANGSANXUAT", 5);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(GetPVarInt(playerid, "DANGSANXUAT") == 5)
    {
        if(IsPlayerInRangeOfPoint(playerid, 5.0, 2351.2639,-647.2317,128.0547))
        DisableCheckPoint(playerid);
        DeletePVar(playerid, "DANGSANXUAT");
        khosung ++;
        PlayerInfo[playerid][pCash] += 20;
        ClearAnimations(playerid);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        SendClientMessage(playerid, COLOR_GREY, "Nhan duoc so tien 20 tu viec lap rap");
        switch(random(2))
        {
            case 0:
            {
                PlayerInfo[playerid][pGo] ++;
                SendClientMessage(playerid, -1, "{ff2731}[Jobs]{FFFFFF} Nhan them duoc 1 go tu viec lap rap");
            }
            case 1:
            {
                PlayerInfo[playerid][pSat] ++;
                SendClientMessage(playerid, -1, "{ff2731}[Jobs]{FFFFFF} Nhan them 1 sat tu viec lap rap");
            }
        }
    }
    return 1;
}
hook OnPlayerPickUpPickup(playerid, pickupid)
{
    if(pickupid == sanxuat)
    {
        if(PlayerInfo[playerid][pJob] != 24 && PlayerInfo[playerid][pJob2] != 24) return SendClientMessage(playerid, -1, "Ban chua nhan cong viec");
        if(GetPVarInt(playerid, "DANGSANXUAT") == 0) 
        {
            TogglePlayerControllable(playerid, 0);
            SetPVarInt(playerid, "DANGSANXUAT", 1);
            ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
            SetTimerEx("OnPlayerSanXuat", 7000, 0,"i",playerid);
        }
        return 1;
    }
    if(pickupid == sanxuat1)
    {
        if(GetPVarInt(playerid, "DANGSANXUAT") == 1)
        {
            SetPVarInt(playerid, "DANGSANXUAT", 2);
            TogglePlayerControllable(playerid, 0);
            SetTimerEx("OnPlayerSanXuat", 10000, 0,"i",playerid);
            ApplyAnimation(playerid, "BAR", "Barserve_bottle", 4.0, 0, 0, 0, 0, 0, 1);  
        }
        return 1;       
    }
    if(pickupid == sanxuat2)
    {
        if(GetPVarInt(playerid, "DANGSANXUAT") == 2)
        {
            SetPVarInt(playerid, "DANGSANXUAT", 3);
            TogglePlayerControllable(playerid, 0);  
            SetTimerEx("OnPlayerSanXuat", 10000, 0,"i",playerid);
            ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0, 1);
        }
    }
    if(pickupid == sanxuat3)
    {
        if(GetPVarInt(playerid, "DANGSANXUAT") == 3)
        {
            TogglePlayerControllable(playerid, 0);
            SetPVarInt(playerid, "DANGSANXUAT", 4);
            SetTimerEx("OnPlayerSanXuat", 3000, 0,"i",playerid); 
            ApplyAnimation(playerid,"BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0, 1); 
        }
  
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    DeletePVar(playerid, "DANGSANXUAT");
    return 1;
}
