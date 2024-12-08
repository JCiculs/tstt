#include <YSI_Coding\y_hooks>

	//-------------------------------------------------------------------
	//					Project create by #nDP 						   //
	//					Fb.com/nguyenduyphuong.com  			       //
	//					Copyright by nDP" 							   //
	//-------------------------------------------------------------------

//____________________________________________________________________________//

enum eWeapon {
	weapon_name[128],
	weapon_idgun,
	weapon_vatlieu,
	weapon_tinhtrang,
};

new const dWeaponInfo[][eWeapon] = {
    //{"Brass Knuckles"		,             1,             1000,             1},
    //{"Golf Club"			,             2,             1000,             0},
    //{"Nite Stick"			,             3,             1000,             1},
    //{"Knife"				,             4,             300,             1},
    {"Baseball Bat"			,             5,             300,             0},
    //{"Shovel"				,             6,             1000,             1},
    //{"Pool Cue"				,             7,             1000,             1},
    {"Katana"				,             8,             400,             0},
    //{"Chainsaw"				,             9,             1000,             1},
    //{"Purple Dildo	"		,             10,            1000,             1},
    {"Dildo"				,             11,            300,             0},
    //{"Vibrator"				,             12,            1000,             1},
    //{"Silver Vibrator"		,             13,            1000,             0},
    //{"Flowers"				,             14,            1000,             1},
    {"Cane"					,             15,            400,             1},
    {"Colt 45"				,             22,            1500,             1},
    {"Silenced Pistol"		,             23,            1700,             0},
    //{"Desert Eagle"			,             24,            5400,             1},
    {"Shotgun"				,             25,            3000,             0},
    //{"Combat Shotgun"		,             27,            1000,             1},
    {"UZI"					,             28,            6000,             1},
    //{"MP5"					,             29,            1000,             1},
    {"TEC9"					,             32,            6000,             0}
    //{"AK-47"				,             30,            1000,             1},
    //{"M4a1"					,             31,            1000,             1},
    //{"Rifle"				,             33,            1000,             1}
    //{"Sniper Rifle"			,             34,            1000,             1}
};


timer Weapon_Craft[30000](playerid, i)
{
	if(GetPVarInt(playerid, "WeaponCraft_Time") < 60)
	{
		new Float:pos[3];
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		if(pos[0] != GetPVarFloat(playerid, "WeaponCraft_Pos"))
		{
			DeletePVar(playerid, "WeaponCraft_Time");
			DeletePVar(playerid, "WeaponCraft_Pos");
			SendClientMessage(playerid, COLOR_GRAD1, "Ban da that bai che tao vi di chuyen.");
			return 1;
		}
		defer Weapon_Craft(playerid, i);
		SetPVarInt(playerid, "WeaponCraft_Time", GetPVarInt(playerid, "WeaponCraft_Time") + 1);
		return 1;
	}

	if(dWeaponInfo[i][weapon_idgun] >= 22) GivePlayerValidWeapon( playerid, dWeaponInfo[i][weapon_idgun] , 1);
	else GivePlayerValidWeapon( playerid, dWeaponInfo[i][weapon_idgun] , 60000);

	SendClientMessage(playerid, -1, "Ban da che tao thanh cong vu khi %s.", dWeaponInfo[i][weapon_name]);

	PlayerInfo[playerid][pMats] -= dWeaponInfo[i][weapon_vatlieu];

	DeletePVar(playerid, "WeaponCraft_Time");
	DeletePVar(playerid, "WeaponCraft_Pos");
	ClearAnimations(playerid);
	return 1;
}
CMD:createweaponsmm1(playerid, params[]) 
{
	if(PlayerInfo[playerid][pConnectHours] < 2) return SendClientMessage(playerid, COLOR_GRAD2, "Ban dang bi han che vu khi, ban khong the che tao!");
	new string[648];
	new tinhtrang[56];
	for(new i = 0; i < sizeof(dWeaponInfo); i++) 
	{
		if(dWeaponInfo[i][weapon_name] == 1) tinhtrang = "Bao tri";
		else tinhtrang = "San sang";
		format(string, sizeof(string), "%s%d\t{FFFFFF}%s\t%s vat lieu\t%s\n", string, i + 1, dWeaponInfo[i][weapon_name], number_format(dWeaponInfo[i][weapon_vatlieu]), tinhtrang);
	}

	new str_traodoi[1208];
	format(str_traodoi, sizeof(str_traodoi), "STT\tTen vu khi\tNguyen lieu che tao\tTinh trang\n%s", string);
	ShowPlayerDialog(playerid, DIALOG_CHETAOSUNG, DIALOG_STYLE_TABLIST_HEADERS, "Dieu chinh bang ve", str_traodoi, "Lua chon", "Huy bo");
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if(dialogid == DIALOG_CHETAOSUNG && response == 1) {
		if(PlayerInfo[playerid][pMats] == 0) {
			SendClientMessage(playerid, -1, "Ban hien tai khong co vat lieu nao het.");
			return 1;
		}
		for(new i = 0; i < sizeof(dWeaponInfo); i++) {
			if(listitem == i) {
				SetPVarInt(playerid, "creatWeaponID", i);
				new string[560];
				format(string, sizeof(string), "{FFFFFF}Ban co dong y che tao vu khi {FFFF66}%s{FFFFFF} hay khong?, yeu cau tieu ton {FF0000}%s vat lieu{FFFFFF}", dWeaponInfo[i][weapon_name], number_format(dWeaponInfo[i][weapon_vatlieu]));
				ShowPlayerDialog(playerid, DIALOG_CHETAOSUNG1, DIALOG_STYLE_MSGBOX, "Che tao vu khi", string, "Che tao", "Huy bo");
				return 1;
			}
		}
	}

	if(dialogid == DIALOG_CHETAOSUNG1 && response == 1) {
		new i = GetPVarInt(playerid, "creatWeaponID"), Float:pos[3];
		if(PlayerInfo[playerid][pMats] < dWeaponInfo[i][weapon_vatlieu]) {
			SendClientMessage(playerid, -1, "Nguyen lieu can che tao cua ban hien tai khong du.");
			return 1;
		}	
		SendClientMessage(playerid, -1, "[!] Vui long khong di chuyen.");
		GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
		SetPVarFloat(playerid, "WeaponCraft_Pos", pos[0]);
		defer Weapon_Craft(playerid, i);
		CreateLoading(playerid, "Dang che tao...", 30000);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, false, false, false, 0);
		return 1;
	}
	return 1;
}