#include <a_samp>
#include <YSI_Coding\y_hooks>

if(strcmp(cmd, "/store", true) == 0)
{
    MenuStore_AddItem(playerid, 1, 342, "Granade", 500, "Throw to explode.", 200);
    MenuStore_AddItem(playerid, 2, 344, "Molotov", 500, "Throw to set fire to something.", 200);
    MenuStore_AddItem(playerid, 3, 346, "9mm Pistol", 500, "Pistol with low firepower.");
    MenuStore_AddItem(playerid, 4, 347, "Silenced 9mm", 500, "Pistol with low firepower.");
    MenuStore_AddItem(playerid, 5, 348, "Desert Eagle", 500, "Pistol with high firepower.");
    MenuStore_AddItem(playerid, 6, 349, "Shotgun", 500, "Normal Shotgun.");
    MenuStore_AddItem(playerid, 7, 350, "Sawnoff Shotgun", 500, "Powerfull Shotgun.");
    MenuStore_AddItem(playerid, 8, 351, "Combat Shotgun", 500, "Powerfull Shotgun.");
    MenuStore_AddItem(playerid, 9, 352, "Micro SMG", 500, "Two-handed machine gun.");
    MenuStore_AddItem(playerid, 10, 353, "MP5", 500, "Machine gun.");
    MenuStore_AddItem(playerid, 11, 355, "AK-47", 500, "Powerfull Rifle.");
    MenuStore_AddItem(playerid, 12, 356, "M4", 500, "Powerfull Rifle.");
    MenuStore_AddItem(playerid, 13, 372, "Tec-9", 500, "Powerfull machine gun.");
    MenuStore_AddItem(playerid, 14, 357, "Country Rifle", 500, "Normal Rifle.");
    MenuStore_AddItem(playerid, 15, 358, "Sniper Rifle", 500, "Powerfull Rifle.");
    MenuStore_Show(playerid, Weapon_Shop, "Shop Weapons");
    return 1;
}
Store:Weapon_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;
    if(GetPlayerMoney(playerid) < price)
        return SendClientMessage(playerid, -1, "You don't have enough money.");
    if(amount == 1) {
        GivePlayerWeapon(playerid, GetWeaponIDFromModel(modelid), 200);
    }
    else {
        GivePlayerWeapon(playerid, GetWeaponIDFromModel(modelid), amount);
    }

    new string[128];
    format(string, 128, "You bought %dx %s", amount, itemname);
    SendClientMessage(playerid, -1, string);

    GivePlayerMoney(playerid, -price);
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
