#define HUNTING_STATE_DEAD
#define HUNTING_DROP_STATE_FINISH
#define HUNTING_DROP_STATE_START
#define HUNTING_DROP_STATE_INTERRUPT
#define MAX_HUNTING_ANIMALS
#define DIALOG_SELLMEAT 6544
new PlayerBar:PlayerProgressBar[MAX_PLAYERS][1];
new PlayerText:getdroptd[MAX_PLAYERS];
new Speacialmob;
new XeNongTrai[MAX_PLAYERS];
new Hunting[MAX_PLAYERS];
new VehicleObject[MAX_PLAYERS];
new bool:HaveXeNongTrai[MAX_PLAYERS];
new bool:HaveMob[MAX_PLAYERS];
new bool:HaveMeat[MAX_PLAYERS];


public OnPlayerStaminaOver(playerid) // stamina callback !
{
	//SetPlayerExhausted(playerid, true); // tired anim
	SendClientMessage(playerid,-1, "Ban sap het the luc , vui long nghi mot xiu hoac uong sua de co them the luc");
	return 1;
}






public OnPlayerTakeHuntDrop(playerid,mobid,drop){

if(drop){

       	  if(Speacialmob == mobid)
	  	 {
	     PlayerTextDrawShow(playerid, getdroptd[playerid]);
	     TogglePlayerControllable(playerid, 0);
	     ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1,1,1,0,0,0);
	  	 ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1,1,1,0,0,0);
      	 SendClientMessage(playerid,-1, "{FF0000}[HUNGTING SYSTEM]{FFFF00}: Ban dang lay mot thu gi do tu con vat!");
      	 SetPVarInt(playerid, "Speacialmobdroptime", 1);
      	 SetPVarInt(mobid, "mobrespawn", 1);
      	 SetTimerEx("Speacialmobdroptime", 5000, false, "i", playerid,mobid);
      	 SetTimerEx("mobrespawn", 5000, false, "i", mobid);
         }
		  else
		 {
	     PlayerTextDrawShow(playerid, getdroptd[playerid]);
	     TogglePlayerControllable(playerid, 0);
	     ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1,1,1,0,0,0);
         ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1,1,1,0,0,0);
   	     SendClientMessage(playerid,-1, "{FF0000}[HUNGTING SYSTEM]{FFFF00}: Ban dang lay mot thu gi do tu con vat!");
   	     SetPVarInt(playerid, "mobdroptime", 1);
         SetPVarInt(mobid, "mobrespawn", 1);
         SetTimerEx("mobdroptime", 5000, false, "i", playerid);
         SetTimerEx("mobrespawn", 5000, false, "i", mobid);
 		}
	  }
return 0; //set drop flag 0
}

public OnPlayerKillHuntAnimal(playerid,mobid){
     	new string[128];
        format(string, sizeof(string), "{FF0000}[HUNGTING SYSTEM] :{FFFF00} Ban da giet mot con nao do !");
    	SendClientMessage(playerid,-1, string);
	    return 1;
}

public OnPlayerApproachingAnimal(playerid,mobid,mob_state){

	//if(mob_state == HUNTING_STATE_DEAD){
 {
	  	  new string[128];
   		  format(string, sizeof(string), "{FF0000}[HUNGTING SYSTEM] :{FFFF00}Nhan Y de nhan phan thuong.");
		  SendClientMessage(playerid,-1, string);
	}

	return 1;
}

public OnPlayerExitApproachingAnimal(playerid,mobid,mob_state){

	return 1;
}

/*public OnAnimalTakeDamage(mobid,playerid,Float:amount,weaponid){
 	if (HaveXeNongTrai[playerid] == false)
 	{
        SendClientMessage(playerid,-1,"Ban can phai bat dau cong viec moi co the di san.");
        return 0;
 	}
	new Float:range = 5.0;
    if (Hunting::IsPlayerInRange(playerid,mobid,range)){
    new stringall[128];
    new Float:health;
    GetPlayerHealth(playerid,health);
    SetPlayerHealth(playerid,(health-10.0));
    format(stringall, sizeof(stringall), "{FF0000}[HUNGTING SYSTEM] {FFFF00}:Ban bi mot con dong vat nao do can ! - Vui long dung xa de khong bi can.");
    SendClientMessage(playerid,-1, stringall);
    }
   if(!(mobid == Speacialmob))
	 {
	  new value = random(10000);
	  if (value==1)
		      {
	 		  new Float:health = 100.0;
			  new stringall[128];
		      format(stringall, sizeof(stringall), "{FF0000}[HUNGTING SYSTEM] {FFFF00}: Con vat nao do da hoa thanh Goku  !");
	      	  SendClientMessageToAll(-1, stringall);
		      Hunting::SetHealth(mobid,health);
		      Speacialmob = mobid;
		      return 1;
		      }
	}
	new stringall[128];
	format(stringall, sizeof(stringall), "{FF0000}[HUNGTING SYSTEM] {FFFF00}:So mau cua con vat : %.02f.",(Hunting::GetHealth(mobid)-amount));
	SendClientMessage(playerid,-1, stringall);
	return 1;
}*/

public OnHuntAnimalRespawn(mobid){
      return 1;
}

public OnAnimalScareStateChanged(mobid,playerid,isscared){

	return 1;
}

forward Speacialmobdroptime(playerid);

public Speacialmobdroptime(playerid)
{
 TogglePlayerControllable(playerid, 1);
 DeletePVar(playerid, "Speacialmobdroptime");
 new string[128];
 new stringall[128];
 new name[MAX_PLAYER_NAME + 1];
 format(string, sizeof(string), "{FF0000}[HUNGTING SYSTEM] :{FFFF00} Ban da giet duoc BOSS");
 SendClientMessage(playerid,-1, string);
 GetPlayerName(playerid, name, sizeof name);
 format(stringall, sizeof(stringall), "{FF0000}[HUNGTING SYSTEM] {FFFF00}: Nguoi choi %s da giet duoc BOSS !", name);
 SendClientMessageToAll(-1, stringall);
 HaveMob[playerid] = true;
SetPlayerAttachedObject(playerid, 1, 19833, 1,  -0.190999, 0.406000, -0.323999,  -108.799995, 144.900039, -126.699966,  0.898999, 0.985000, 0.952000); // 265
 ApplyAnimation(playerid, "carry", "crry_prtial", 4.1,1,1,0,0,0);
 PlayerTextDrawDestroy(playerid, getdroptd[playerid]);
 SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
 TogglePlayerControllable(playerid, 1);
 return 1;
}


forward mobdroptime(playerid);

public mobdroptime(playerid)
{
   	TogglePlayerControllable(playerid, 1);
   	DeletePVar(playerid, "mobdroptime");
	new string[128];
    PlayerTextDrawDestroy(playerid, getdroptd[playerid]);
    HaveMob[playerid] = true;
    SetPlayerAttachedObject(playerid, 1, 19833, 1,  -0.190999, 0.406000, -0.323999,  -108.799995, 144.900039, -126.699966,  0.898999, 0.985000, 0.952000); // 265
 	ApplyAnimation(playerid, "carry", "crry_prtial", 4.1,1,1,0,0,0);
 	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
 	TogglePlayerControllable(playerid, 1);
	return 1;
}

forward mobrespawn(mobid);

public mobrespawn(mobid)
{
DeletePVar(mobid, "mobrespawn");
//Hunting::Respawn(mobid);
return 1;
}


/*CMD:respawnall(playerid)
{
  for(new mobid = 1; mobid < MAX_HUNTING_ANIMALS; mobid++)
  {
  	if(Hunting::IsValid(mobid))
	  {
		 new stringall[128];
   		 format(stringall, sizeof(stringall), "{FF0000}[HUNGTING SYSTEM] {FFFF00}:Respawn %d.",mobid);
		 SendClientMessage(playerid,-1, stringall);
   		 Hunting::Respawn(mobid);
	  }
   }
return 1;
}


CMD:makeboss(playerid, params[])
{
    new string[128], mobid;
    if(sscanf(params, "d", mobid)) {
        SendClientMessage(playerid,-1, "{FF0000}[HUNGTING SYSTEM] {FFFF00}: /makeboss [MOBID]");
        return 1;
        }
  		if(Hunting::IsValid(mobid)){
            new Float:health = 100.0;
		    format(string, sizeof(string), "{FF0000}[HUNGTING SYSTEM] {FFFF00}: Con vat nao do da hoa thanh Goku  !");
	      	SendClientMessageToAll(-1, string);
            Hunting::SetHealth(mobid,health);
		    Speacialmob = mobid;
		    return 1;
  		  }
  		     else
		  {
		    new sstring[128];
    		format(sstring, sizeof(sstring), "{FF0000}[HUNGTING SYSTEM] {FFFF00}:INVALID MOB ID.");
        	SendClientMessage(playerid, -1, sstring);
        	return 1;
          }
}*/

CMD:sellmeat(playerid, params[])
{
   if(IsAtActorMeat(playerid))
   {
	new string[128];
	format(string, sizeof(string),"Hien tai bang dang co %d thit \n        Ban muon ban bao nhieu thit ?.",PlayerInfo[playerid][Meat]);
    ShowPlayerDialog(playerid, DIALOG_SELLMEAT, DIALOG_STYLE_INPUT,"Ban Thit", string, "Ban", "Thoat");
    return 1;
   }
   else
   {
      SendClientMessage(playerid, -1, "[Meat] Ban khong o noi ban thit");
      return 1;
   }
}


IsAtActorMeat(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 5, -1828.6298, 5.0596, 15.2217))
	{ return true; }
	return false;
}




forward RespawnCarNongTrai(vehicleid);

public RespawnCarNongTrai(vehicleid)
{
   	SetVehicleToRespawn(vehicleid);
   	DeletePVar(vehicleid, "RespawnCarNongTrai");
}

forward Xulibotime(playerid);

public Xulibotime(playerid)
{
	new string[128];
    new sua = random(3);
    new thit = 1+random(3);
    new dabo = random(2);
	format(string, sizeof(string), "Ban nhan duoc %d sua bo , %d thit bo , %d da bo!",sua,thit,dabo);
    SendClientMessage(playerid,-1, string);
    PlayerInfo[playerid][Meat] += thit;
	PlayerInfo[playerid][Milk] += sua;
	PlayerInfo[playerid][DaBo] += dabo;
   	TogglePlayerControllable(playerid, 1);
   	DeletePVar(playerid, "Xulibotime");
    HaveXeNongTrai[playerid] = false;
}


/*CMD:uongsua(playerid)
{
	if(PlayerInfo[playerid][Milk] >= 1)
	{
    	ApplyAnimation(playerid, "VENDING", "VEND_DRINK_P", 4.1,0,0,0,0,0);
        SetPlayerStamina(playerid, 500);
        SetPlayerProgressBarValue(playerid, PlayerProgressBar[playerid][0],500);
        PlayerInfo[playerid][Milk] -= 1;
    	return 1;
 	} else return SendClientMessage(playerid,-1, "Ban khong co sua de uong");
}*/

/*CMD:theluc(playerid)
{
	   new string[128];
       format(string, sizeof(string), "the luc cua ban la : %d.",GetPlayerStamina(playerid));
	   SendClientMessage(playerid,-1, string);	// Get the player's current stamina.
	   return 1;
}*/

CMD:balo(playerid)
{
new string[9999];
format(string, sizeof(string), "Do Vat\tSo Luong {FFFFFF} \n{654321}Da Bo{FFFFFF}\t%d\nSua Bo\t%d \n{00ffff}Thit Bo{FFFFFF}\t%d\nThit Nuong\t%d\n -----------------------------------------\nVi tri nuong thit",PlayerInfo[playerid][DaBo],PlayerInfo[playerid][Milk],PlayerInfo[playerid][Meat],PlayerInfo[playerid][ThitNuong]);
ShowPlayerDialog(playerid, BALO,  DIALOG_STYLE_TABLIST_HEADERS, "BALO", string, "OK", "");
return 1;
}


CMD:nauan(playerid)
{
	 if(IsPlayerInRangeOfPoint(playerid, 5,   -2629.7324,556.4124,13.6094))
	 {
 	    if (PlayerInfo[playerid][Meat] >= 3)
 	    {
 	     	TogglePlayerControllable(playerid, 0);
	     	ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1,1,1,0,0,0);
   	     	SetPVarInt(playerid, "NauAnTime", 1);
         	SetTimerEx("NauAnTime", 20000, false, "i", playerid);
 	    } else return SendClientMessage(playerid,-1, "Ban khong du thit de nuong ,ban can co 3 mieng thit!");
    } else return SendClientMessage(playerid,-1, "Ban o cho nau an!");
    return 1;
}


forward NauAnTime(playerid);


public NauAnTime(playerid)
{
   	TogglePlayerControllable(playerid, 1);
   	DeletePVar(playerid, "NauAnTime");
    SendClientMessage(playerid,-1, "Ban da nhan duoc 1 thit nuong");
    SendClientMessage(playerid,COLOR_GREY, "NOTE: Ban co the ban thit nuong hoac an thit nuong.");
	PlayerInfo[playerid][Meat] -= 3;
	PlayerInfo[playerid][ThitNuong] += 1;
 	TogglePlayerControllable(playerid, 1);
	return 1;
}


CMD:anthitnuong(playerid)
{
	if (PlayerInfo[playerid][ThitNuong] < 1) return SendClientMessage(playerid,-1, "Ban khong co du thit nuong de an!");
	PlayerInfo[playerid][ThitNuong] -= 1;
	
	PlayerInfo[playerid][pHunger] +=70;
	
	ApplyAnimation(playerid, "FOOD", "EAT_CHICKEN", 4.1,0,0,0,0,0);
	if (PlayerInfo[playerid][pHunger] > 100) PlayerInfo[playerid][pHunger] = 100;
	return 1;
}
// fix tien

// bam dialog uong sua

// CreateObject(19831, -2598.66309, 614.24780, 14.62134,   0.00000, 0.00000, 89.59497);


