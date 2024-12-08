public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if (hittype == BULLET_HIT_TYPE_PLAYER)
    {
        new
            Float:fOriginX, Float:fOriginY, Float:fOriginZ,
            Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ;

        GetPlayerLastShotVectors(playerid, fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
        new Float:BulletDistanceForHit = GetPlayerDistanceFromPoint(hitid, fHitPosX, fHitPosY, fHitPosZ);
        if (BulletDistanceForHit == 0 && (weaponid > 21 && weaponid != 35 && weaponid != 42 && weaponid < 47))
        {
            return 0; //It prevents the bullet from reaching the target player.
        }
    }
}