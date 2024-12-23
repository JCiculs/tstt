//=========Includes=====
////////////////////////|
    #include <a_samp> //|
    #include <zcmd>   //|
////////////////////////|
//======================

//==================Defines===============
#define COLOR_BLACK             0x000000AA
#define red                     0xFF0000AA
#define COLOR_YELLOW            0xFFFF00AA
#define COLOR_LIGHTBLUE         0x33CCFFAA
#define COLOR_BLUE              0x0000BBAA
#define krobj                   322
#define knobj                   354
//========================================
new ckrtasa[MAX_OBJECTS];
new cknbola[MAX_OBJECTS];

public OnFilterScriptInit()
{
    print("\n--------------------------------------");
    print(" Blog Code SAMP      ");
    print("--------------------------------------\n");
/////////////////////////////////////////////////////////
    ckrtasa[1] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[2] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[3] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[4] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[5] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[6] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[7] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[8] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[9] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[10] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[11] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[12] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[13] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[14] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[15] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[16] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[17] = CreateObject(krobj,0,0,-1000,0,0,0,100);
    ckrtasa[18] = CreateObject(krobj,0,0,-1000,0,0,0,100);
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
    cknbola[1] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[2] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[3] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[4] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[5] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[6] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[7] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[8] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[9] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[10] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[11] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[12] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[13] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[14] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[15] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[16] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[17] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    cknbola[18] = CreateObject(knobj,0,0,-1000,0,0,0,100);
    return 1;
}

public OnFilterScriptExit()
{
    print("\n--------------------------------------");
    print(" Blog Code SAMP    ");
    print("--------------------------------------\n");

    return 1;
}

//==============Enums===
enum pInfo
{
    usesuperc,
}
enum v_info
{
  superc,
  vhealth=1001,
};
//======================

//==============NEWS============
new
    kratstimer[MAX_PLAYERS],
    VehicleInfo[MAX_VEHICLES][v_info],
    kratsremove[MAX_PLAYERS],
    godc[MAX_PLAYERS],
    expv[MAX_PLAYERS],
    Float:BX,
    Float:BY,
    Float:BZ,
    PlayerInfo[MAX_PLAYERS][pInfo],
    krtasa[MAX_OBJECTS],
    ch7al;
//==============================

//================Forwards======
forward Firekrats(playerid);
forward godcar(playerid);
forward removekrtas(playerid);
forward explodevk(playerid);
//==============================
crkrtasa(playerid)
{
    new Float:ox, Float:oy, Float:oz, Float:a;
    GetPlayerPos(playerid, ox, oy, oz);
    GetPlayerFacingAngle(playerid, a);
    SetPlayerHealth(playerid, 200);
    ox += (0 * floatsin(-a, degrees));//ch7al b3ida
    oy += (0 * floatcos(-a, degrees));//ch7al b3ida
    if(ch7al >= 18) return ch7al = 0;
    ch7al +=1;
    SetObjectPos(ckrtasa[ch7al],ox,oy,oz);
    movekrtasa(playerid);
    return 1;
}

knbola(playerid)
{
    new Float:ox, Float:oy, Float:oz, Float:a;
    GetPlayerPos(playerid, ox, oy, oz);
    GetPlayerFacingAngle(playerid, a);
    SetPlayerHealth(playerid, 200);
    ox += (0 * floatsin(-a, degrees));//ch7al b3ida
    oy += (0 * floatcos(-a, degrees));//ch7al b3ida
    if(ch7al >= 18) return ch7al = 0;
    ch7al +=1;
    SetObjectPos(cknbola[ch7al],ox,oy,oz);
    moveknbola(playerid);
    return 1;
}
movekrtasa(playerid)
{
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    GetXYInFrontOfPlayer(playerid, px, py, 100000);//,dist
    MoveObject(ckrtasa[ch7al],px,py,pz,100);//,speed
}
moveknbola(playerid)
{
    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);
    GetXYInFrontOfPlayer(playerid, px, py, 100000);//,dist
    MoveObject(cknbola[ch7al],px,py,pz,50);//,speed
}
//============Publics===========
public explodevk(playerid)
{
   for(new v; v < MAX_VEHICLES; v ++)
    {
///////////News///////////////
        new Float:X,
            Float:Y,
            Float:Z,
            Float:KX,
            Float:KY,
            Float:KZ;
//////////////////////////////
        GetObjectPos(cknbola[ch7al], KX, KY, KZ);
        GetObjectPos(ckrtasa[ch7al], X, Y, Z);
        if(GetVehicleDistanceFromPoint(v,X,Y,Z) <= 4.0 && VehicleInfo[v][superc] == 0 )
        {
        SetVehicleHealth(v,0);
        if(PlayerInfo[v][usesuperc] == 0) SetPlayerHealth(v,0);
        }
        if(GetVehicleDistanceFromPoint(v,KX,KY,KZ) <= 4.0 && VehicleInfo[v][superc] == 0 )
        {
        SetVehicleHealth(v,0);
        if(PlayerInfo[v][usesuperc] == 0) SetPlayerHealth(v,0);
        }
    }
}

//========================================================
public Firekrats(playerid)
{
    new KEYS, UD, LR; GetPlayerKeys( playerid, KEYS, UD, LR );
    new Float:PX, Float:PY, Float:PZ; GetPlayerPos( playerid, PX, PY, PZ );
    if(IsPlayerInAnyVehicle(playerid)){
    if(KEYS == KEY_FIRE)
    {
     SoundForAll(1135,PX,PY,PZ);
     crkrtasa(playerid);
     KillTimer(kratsremove[playerid]),kratsremove[playerid] = SetTimerEx("removekrtas",1000,1,"d",playerid);
    }
    if(KEYS == KEY_FIRE && LR == KEY_RIGHT)
    {
     SoundForAll(1135,PX,PY,PZ);
     crkrtasa(playerid);
     KillTimer(kratsremove[playerid]),kratsremove[playerid] = SetTimerEx("removekrtas",1000,1,"d",playerid);
    }
    if(KEYS == KEY_FIRE && LR == KEY_LEFT)
    {
     SoundForAll(1135,PX,PY,PZ);
     crkrtasa(playerid);
     KillTimer(kratsremove[playerid]),kratsremove[playerid] = SetTimerEx("removekrtas",1000,1,"d",playerid);
    }
    } else cmd_supercoff(playerid,"");
    return true;
}
//==============================================================================

public godcar(playerid)
{
/////////////////////////////////////////////////
   SetVehicleHealth(GetPlayerVehicleID(playerid),100000);
   RepairVehicle(GetPlayerVehicleID(playerid));
/////////////////////////////////////////////////
   return true;
}

//==============================================================================
public removekrtas(playerid)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
    if(ch7al <= 0) return ch7al = 0,KillTimer(kratsremove[playerid]);
    DestroyObject(krtasa[i]);
    ch7al =0;
    }
    return true;
}
//===============================================================================

public OnPlayerConnect(playerid)
{
            kratstimer[playerid] = SetTimerEx("Firekrats",66,1,"d",playerid),KillTimer(kratstimer[playerid]);
            expv[playerid] = SetTimerEx("explodevk",1,1,"d",playerid),KillTimer(expv[playerid]);
            return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    PlayerInfo[playerid][usesuperc] = 0;
    KillTimer(expv[playerid]);
    KillTimer(godc[playerid]);
    KillTimer(kratstimer[playerid]);
    return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[playerid][usesuperc] = 0;
    KillTimer(expv[playerid]);
    KillTimer(godc[playerid]);
    KillTimer(kratstimer[playerid]);
    return 1;
}

//================CMDS==========================================================
CMD:supercoff(playerid, params[])
{
    KillTimer(expv[playerid]);
    KillTimer(godc[playerid]);
    KillTimer(kratstimer[playerid]);
    PlayerInfo[playerid][usesuperc] = 0,DestroyVehicle(GetPlayerVehicleID(playerid));
    return 1;
}
CMD:supercon(playerid,params[]) {
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,red,"Error: You already have a vehicle");
        else
        {
            new Float:X,Float:Y,Float:Z,Float:Angle,LVehicleIDt; GetPlayerPos(playerid,X,Y,Z); GetPlayerFacingAngle(playerid,Angle);
            LVehicleIDt = CreateVehicle(475,X,Y,Z,Angle,-1,-1,10000);
            VehicleInfo[LVehicleIDt][superc] = 1;
            PutPlayerInVehicle(playerid,LVehicleIDt,0);
////////////////////////////////////////////////////////////////////////////////////////
            PlayerInfo[playerid][usesuperc] = 1,PlayerInfo[playerid][usesuperc] = 1;
            KillTimer(kratstimer[playerid]),kratstimer[playerid] = SetTimerEx("Firekrats",66,1,"d",playerid);
            KillTimer(kratstimer[playerid]),kratstimer[playerid] = SetTimerEx("Firekrats",66,1,"d",playerid);
            KillTimer(godc[playerid]),godc[playerid] = SetTimerEx("godcar",50,1,"d",playerid);
            KillTimer(expv[playerid]),expv[playerid] = SetTimerEx("explodevk",1,1,"d",playerid);
//////////////////////////////////////////////////////////////////////////////////////////
            SetPVarInt(playerid,"xsabobj1",CreateObject(1004,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj2",CreateObject(1001,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj3",CreateObject(1001,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj4",CreateObject(1001,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj7",CreateObject(1142,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj8",CreateObject(1142,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj9",CreateObject(1170,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj10",CreateObject(1149,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj11",CreateObject(1146,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj12",CreateObject(1146,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj13",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj14",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj15",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj16",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj17",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj18",CreateObject(360,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj19",CreateObject(362,0,0,-1000,0,0,0,100));
            SetPVarInt(playerid,"xsabobj20",CreateObject(362,0,0,-1000,0,0,0,100));
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj1"), GetPlayerVehicleID(playerid), -0.000000,0.000000,0.654999,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj2"), GetPlayerVehicleID(playerid), -0.045000,-2.700001,0.084999,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj3"), GetPlayerVehicleID(playerid), -0.050000,-2.700001,0.154999,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj4"), GetPlayerVehicleID(playerid), -0.050000,-2.700001,0.204999,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj7"), GetPlayerVehicleID(playerid), -0.300000,1.255000,0.270000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj8"), GetPlayerVehicleID(playerid), 0.309999,1.255000,0.270000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj9"), GetPlayerVehicleID(playerid), 1.060000,1.750000,-0.210000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj10"), GetPlayerVehicleID(playerid), 1.055000,-2.025000,-0.180000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj11"), GetPlayerVehicleID(playerid),-1.909998,0.934999,0.000000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj12"), GetPlayerVehicleID(playerid),1.899998,0.929999,0.000000,0.000000,0.000000,0.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj13"), GetPlayerVehicleID(playerid),2.845017,1.404998,-0.069999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj14"), GetPlayerVehicleID(playerid),2.290004,1.404998,-0.074999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj15"), GetPlayerVehicleID(playerid),1.589998,1.404998,-0.074999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj16"), GetPlayerVehicleID(playerid),-1.504998,1.404998,-0.074999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj17"), GetPlayerVehicleID(playerid),-2.205003,1.404998,-0.074999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj18"), GetPlayerVehicleID(playerid),-2.810016,1.404998,-0.074999,0.000000,0.000000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj19"), GetPlayerVehicleID(playerid),-0.394999,2.250004,0.135000,0.000000,30.500000,90.000000);
            AttachObjectToVehicle(GetPVarInt(playerid,"xsabobj20"), GetPlayerVehicleID(playerid),0.354999,2.285004,0.135000,0.000000,30.500000,90.000000);
            AddVehicleComponent(GetPlayerVehicleID(playerid), 1079);
            ChangeVehicleColor(GetPlayerVehicleID(playerid),0,0);
            PlayerPlaySound(playerid,1133,0.0,0.0,0.0); ChangeVehiclePaintjob(LVehicleIDt,0);
            SetVehicleVirtualWorld(LVehicleIDt, GetPlayerVirtualWorld(playerid));
            LinkVehicleToInterior(LVehicleIDt, GetPlayerInterior(playerid));
        }
    return 1;
}
//==============================================================================
public OnPlayerExitVehicle(playerid, vehicleid)
{
        if(PlayerInfo[playerid][usesuperc] ==1)
        {
            DestroyObject(GetPVarInt(playerid,"xsabobj1")),DestroyObject(GetPVarInt(playerid,"xsabobj2")),DestroyObject(GetPVarInt(playerid,"xsabobj3")),DestroyObject(GetPVarInt(playerid,"xsabobj4")),DestroyObject(GetPVarInt(playerid,"xsabobj7")),DestroyObject(GetPVarInt(playerid,"xsabobj8")),DestroyObject(GetPVarInt(playerid,"xsabobj9")),DestroyObject(GetPVarInt(playerid,"xsabobj10"));
            DestroyObject(GetPVarInt(playerid,"xsabobj11")),DestroyObject(GetPVarInt(playerid,"xsabobj12")),DestroyObject(GetPVarInt(playerid,"xsabobj13")),DestroyObject(GetPVarInt(playerid,"xsabobj14")),DestroyObject(GetPVarInt(playerid,"xsabobj15")),DestroyObject(GetPVarInt(playerid,"xsabobj16")),DestroyObject(GetPVarInt(playerid,"xsabobj17")),DestroyObject(GetPVarInt(playerid,"xsabobj18")),DestroyObject(GetPVarInt(playerid,"xsabobj19")),DestroyObject(GetPVarInt(playerid,"xsabobj20"));
            DestroyObject(GetPVarInt(playerid,"xsabobj1")),DestroyObject(GetPVarInt(playerid,"xsabobj2")),DestroyObject(GetPVarInt(playerid,"xsabobj3")),DestroyObject(GetPVarInt(playerid,"xsabobj4")),DestroyObject(GetPVarInt(playerid,"xsabobj7")),DestroyObject(GetPVarInt(playerid,"xsabobj8")),DestroyObject(GetPVarInt(playerid,"xsabobj9")),DestroyObject(GetPVarInt(playerid,"xsabobj10"));
            DestroyObject(GetPVarInt(playerid,"xsabobj11")),DestroyObject(GetPVarInt(playerid,"xsabobj12")),DestroyObject(GetPVarInt(playerid,"xsabobj13")),DestroyObject(GetPVarInt(playerid,"xsabobj14")),DestroyObject(GetPVarInt(playerid,"xsabobj15")),DestroyObject(GetPVarInt(playerid,"xsabobj16")),DestroyObject(GetPVarInt(playerid,"xsabobj17")),DestroyObject(GetPVarInt(playerid,"xsabobj18")),DestroyObject(GetPVarInt(playerid,"xsabobj19")),DestroyObject(GetPVarInt(playerid,"xsabobj20"));
            DestroyVehicle(vehicleid);
            KillTimer(godc[playerid]);
            KillTimer(kratstimer[playerid]);
            cmd_supercoff(playerid,"");
        }
        return 1;
}
//====================================================================//
forward SoundForAll(soundid,Float:X,Float:Y,Float:Z);
public SoundForAll(soundid,Float:X,Float:Y,Float:Z)
{
    for(new i = 0; i < MAX_OBJECTS; i++)
    {
        if(IsPlayerConnected(i) == 1) PlayerPlaySound(i,soundid,Float:X,Float:Y,Float:Z);
    }
    return 1;
}
//===================================================================//
GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
        new Float:a;
        GetPlayerPos(playerid, x, y, a);
        GetPlayerFacingAngle(playerid, a);
        if (GetPlayerVehicleID(playerid))
        {
            GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
        }
        x += (distance * floatsin(-a, degrees));
        y += (distance * floatcos(-a, degrees));
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_CROUCH)
     {
        if(PlayerInfo[playerid][usesuperc] == 1) {
            if(IsPlayerInAnyVehicle(playerid))
            {
                new Float:PX, Float:PY, Float:PZ; GetPlayerPos( playerid, PX, PY, PZ );
                SoundForAll(1148,PX,PY,PZ);
                GetObjectPos(GetPVarInt(playerid,"xsabobj17"),BX,BY,BZ);
                knbola(playerid);
            }
        }
    }
}
