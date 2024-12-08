#include <a_samp>
#include <YSI_Coding\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & KEY_YES) && IsPlayerInRangeOfPoint(playerid, 7.0, 1413.9534,-1255.5422,14.6635))
    {
        MenuStore_AddItem(playerid, 1, 331, "Brass Knuckles", 100000, "", 200);
	    MenuStore_AddItem(playerid, 2, 336, "Baseball Bat", 150000, "");
        MenuStore_AddItem(playerid, 3, 335, "Knife", 150000, "");
	    MenuStore_AddItem(playerid, 4, 338, "Pool Cue", 130000, "");
	    MenuStore_AddItem(playerid, 5, 339, "Katana", 200000, "");
	    MenuStore_AddItem(playerid, 6, 324, "Silver Vibrator", 92000, "");
	    MenuStore_AddItem(playerid, 7, 347, "9mm", 400000, "");
	    MenuStore_AddItem(playerid, 8, 348, "Desert Eagle", 800000, "");
	    MenuStore_AddItem(playerid, 9, 349, "Shotgun", 1000000, "");
	    MenuStore_AddItem(playerid, 10, 351, "Combat Shotgun", 1200000, "");
	    MenuStore_AddItem(playerid, 11, 352, "Micro SMG", 200000, "");
	    MenuStore_AddItem(playerid, 12, 372, "Tec-9", 800000, "");
	    MenuStore_AddItem(playerid, 13, 365, "Spraycan", 20000, "");
	    MenuStore_AddItem(playerid, 14, 356, "M4", 1400000, "");
	    MenuStore_AddItem(playerid, 15, 355, "Ak-47", 1000000, "");
	    MenuStore_Show(playerid, Weapon_Shop, "Shop Weapons");
	}
	return 1;
}

Store:Weapon_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;
    if(GetPlayerMoney(playerid) < price)
        return ChatHoTro(playerid,255,"[!] Ban khong co du tien de mua trang bi nay",5000);
    if(amount == 1) {
        GivePlayerValidWeapon(playerid, GetWeaponIDFromModel(modelid), 99999);
    }
    else {
        GivePlayerValidWeapon(playerid, GetWeaponIDFromModel(modelid), amount);
    }

    new string[128];
    format(string, 128, "[SHOP GUN] : Ban da mua %dx %s", amount, itemname);
    SendClientMessage(playerid, -1, string);
    ChatHoTro(playerid,255,"[!] Ban Da Mua Vu Khi Thanh Cong",5000);
    //notification.show(playerid, "He Thong", "Ban da mua thanh cong vu khi", "!", BOXCOLOR_GREEN);

    PlayerInfo[playerid][pCash] -= price;
    return true;
}
stock GetWeaponIDFromModel(modelid)
{
    new idweapon;
    switch(modelid)
    {
        case 331: idweapon = 1; // Brass Knuckles
        case 333: idweapon = 2; // Golf Club
        case 334: idweapon = 3; // Nightstick
        case 335: idweapon = 4; // Knife
        case 336: idweapon = 5; // Baseball Bat
        case 337: idweapon = 6; // Shovel
        case 338: idweapon = 7; // Pool Cue
        case 339: idweapon = 8; // Katana
        case 341: idweapon = 9; // Chainsaw
        case 321: idweapon = 10; // Double-ended Dildo
        case 324: idweapon = 13; // Silver Vibrator
        case 325: idweapon = 14; // Flowers
        case 326: idweapon = 15; // Cane
        case 342: idweapon = 16; // Grenade
        case 343: idweapon = 17; // Tear Gas
        case 344: idweapon = 18; // Molotov Cocktail
        case 346: idweapon = 22; // 9mm
        case 347: idweapon = 23; // Silenced 9mm
        case 348: idweapon = 24; // Desert Eagle
        case 349: idweapon = 25; // Shotgun
        case 350: idweapon = 26; // Sawnoff
        case 351: idweapon = 27; // Combat Shotgun
        case 352: idweapon = 28; // Micro SMG/Uzi
        case 353: idweapon = 29; // MP5
        case 355: idweapon = 30; // AK-47
        case 356: idweapon = 31; // M4
        case 372: idweapon = 32; // Tec-9
        case 357: idweapon = 33; // Country Rifle
        case 358: idweapon = 34; // Sniper Rifle
        case 359: idweapon = 35; // RPG
        case 360: idweapon = 36; // HS Rocket
        case 361: idweapon = 37; // Flamethrower
        case 362: idweapon = 38; // Minigun
        case 363: idweapon = 39;// Satchel Charge + Detonator
        case 365: idweapon = 41; // Spraycan
        case 366: idweapon = 42; // Fire Extinguisher
        case 367: idweapon = 43; // Camera
    }
    return idweapon;
}
