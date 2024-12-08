#include <a_samp>
#include <YSI_Coding\y_hooks>
#define         LAYHANG_BOCVAC                  1

hook OnGameModeInit()
{
	CreatePickup(1239, 1, 1810.0367,-2062.7646,13.5557,-1);
	CreateDynamic3DTextLabel("{03FF02}Lo hang Boc Vac \n 'ALT' De Bat Dau Cong Viec Boc Vac.",COLOR_YELLOW,1810.0367,-2062.7646,13.5557+0.5,5.0);
  //  Create3DTextLabel("{03FF02}Lo hang Boc Vac 2 'ALT' De Bat Dau Cong Viec Boc Vac", 0x008080FF, 1810.0367, -2062.7646, 13.5557, 0, 0);
//    CreateDynamic3DTextLabel("{03FF02}Lo hang Boc Vac 2 'ALT' De Bat Dau Cong Viec Boc Vac",COLOR_WHITE,1810.0367,-2062.7646,13.5557, 10);
  //CreateDynamic3DTextLabel("{03FF02}Lo Hang Boc Vac 1 'ALT' De Bat Dau Cong Viec Boc Vac",COLOR_WHITE,2054.3484,13.5549,262.3929, 15);
   // CreateDynamic3DTextLabel("{03FF02}Lo hang Boc Vac 1 'ALT' De Bat Dau Cong Viec Boc Vac",COLOR_WHITE,2054.3484,13.5549,262.3929, 15);

}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_WALK)
	{
		cmd_bocvaczz(playerid);
		if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1810.0367,-2062.7646,13.5557)) return 1;
	}
    return 1;
}

enum Giao_Bocvac
{
	Float:Bocvac_X,
	Float:Bocvac_Y,
	Float:Bocvac_Z
}

new cpbocvac[8][Giao_Bocvac] = {
	{1766.9581,-2049.3574,13.8320},
	{1767.5044,-2032.1205,13.7533},
	{1751.3384,-2056.0659,13.8685},
	{1723.2784,-2030.2709,20.7097},
	{1707.9225,-2030.3352,20.7097},
	{1714.9885,-2063.0715,20.7193},
	{1722.2362,-2063.2419,20.6478},
	{1728.2373,-2062.4023,20.6792}
};
//new Timebocvac[MAX_PLAYERS];
new bochang[MAX_PLAYERS];
CMD:bocvaczz(playerid)
{
    // check dieu kien co o vi tri chi dinh khong neu khong phai thi no se bao tra ve
    if(truckerdonhang[playerid] == 1)
    {    
        SendClientMessage(playerid, COLOR_GREY, "Ban dang giao trucker khong the lam");
        return 1;
    }
    if(bochang[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang cam thung hang tren tay, khong the lay them");
    //if(thunghang < 99999999) return SendClientMessage(playerid, -1, "Hang chua ve toi");
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1810.0367,-2062.7646,13.5557)) return 1; //SendClientMessage(playerid, -1, "Ban khong o khu vuc boc hang");
    //if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2054.3484,13.5549,262.3929)) return SendClientMessage(playerid, -1, "Ban khong o khu vuc boc hang");
    if(bochang[playerid] == 0)
    {
        thunghang --;
        bochang[playerid] = 1;
        ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 1, 0, 0, 0, 0);
      	LoaderStarting(playerid, LAYHANG_BOCVAC, "Dang Lay Hang Boc Vac", 0.5,  LAYHANG_BOCVAC*10000);
        // await task_ms (11000);
        SetTimerEx("LayHangBocVac", 11000, false, "d", playerid);
    }
    else
    {
        for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++) // kiem tra dieu kien player co dang su dung object khong neu co se tu dong tat
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        }
        ClearAnimations(playerid);
        DisableCheckPoint(playerid);
        bochang[playerid] = 0;
        SendClientMessage(playerid, -1, "Ban dang cam thung hang roi nhap cau lenh mot lan nua de thao tac lai");
    }
    return 1;
}
forward LayHangBocVac(playerid);
public LayHangBocVac(playerid)
{
    TogglePlayerControllable(playerid, true); // Freeze nguoi choi lai.
    ClearAnimations(playerid);
    SetPlayerAttachedObject(playerid, 0, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0); // set boejct
    new rand = random(sizeof(cpbocvac));
    SetPlayerCheckpoint(playerid,cpbocvac[rand][Bocvac_X],cpbocvac[rand][Bocvac_Y],cpbocvac[rand][Bocvac_Z],3.0);
    //SetPlayerCheckpoint(playerid, 1255.3741,-1238.5441,17.9285,5.0);
    TogglePlayerControllable(playerid, 1);
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
    SendClientMessage(playerid, -1, "Ban da lay hang hay lai de len cac thung hang");
}
hook OnPlayerConnect(playerid)
{
    if(bochang[playerid] == 1)
    {
        bochang[playerid] = 0;
        for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++) // kiem tra dieu kien player co dang su dung object khong neu co se tu dong tat
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        }
    }
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(bochang[playerid] == 1)
    {
        //if(IsPlayerInRangeOfPoint(playerid, 5.0, 1255.3741,-1238.5441,17.9285))
        //if(IsPlayerInRangeOfPoint(playerid, 3.0,  cpbocvac))
        //{
        for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++) // kiem tra dieu kien player co dang su dung object khong neu co se tu dong tat
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
        } 
        ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.0999, 1, 0, 0, 0, 0);
        await task_ms(1000);           
        DisableCheckPoint(playerid);
        new bocvacrd = Random(150, 300);
        new str[128];
        GivePlayerCash(playerid,bocvacrd);
        //PlayerInfo[playerid][pCash] += 20;
        bochang[playerid] = 0;
        format(str,sizeof(str),"Ban duoc tra $%d sau khi lam giao thung hang",bocvacrd);
        SendClientMessageEx(playerid,COLOR_GRAD2,str);
        //SendClientMessage(playerid, -1, "Ban boc hang dua vao kho va nhan duoc so tien la 20$");
        ClearAnimations(playerid);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
        //}
    }
    return 1;
}
