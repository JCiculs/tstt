#define nx_VEH_HEALTH 998.0	// Car health is 999 when Sobeit is used. I changed it to 998.0 to prevent this.
enum VehicleSecurityData
{
	Float: VehicleHeath
	};
	new VehicleProcces[MAX_VEHICLES][VehicleSecurityData], bool: VehicleModsa[MAX_PLAYERS] = false, gnx_Pro_HasCB[6];
public OnGameModeInit()
{
	gnx_Pro_HasCB[0] = funcidx("nx_Pro_OnEnterExitModShop") != -1;
		gnx_Pro_HasCB[1] = funcidx("nx_Pro_OnPlayerConnect") != -1;
			gnx_Pro_HasCB[2] = funcidx("nx_Pro_OnPlayerDisconnect") != -1;
				gnx_Pro_HasCB[3] = funcidx("nx_Pro_OnPlayerUpdate") != -1;
					gnx_Pro_HasCB[4] = funcidx("nx_Pro_OnVehicleDamageStatusUpdate") != -1;
						gnx_Pro_HasCB[5] = funcidx("nx_Pro_OnVehicleSpawn") != -1;
							if (funcidx("nx_Pro_OnGameModeInit") != -1)
								{
										return CallLocalFunction("nx_Pro_OnGameModeInit", "");
											}
												return 1;
												}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
	#else
		#define _ALS_OnGameModeInit
		#endif
		#define OnGameModeInit nx_Pro_OnGameModeInit
		forward nx_Pro_OnGameModeInit();
public OnPlayerConnect(playerid)
{
    VehicleModsa[playerid] = false;
    	if (gnx_Pro_HasCB[1])
    		{
    				return CallLocalFunction("nx_Pro_OnPlayerConnect", "i",playerid);
    					}
    						return 1;
    						}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
	#else
		#define _ALS_OnPlayerConnect
		#endif
		#define OnPlayerConnect nx_Pro_OnPlayerConnect
		forward nx_Pro_OnPlayerConnect(playerid);
public OnPlayerDisconnect(playerid, reason)
{
    VehicleModsa[playerid] = false;
    	if (gnx_Pro_HasCB[2])
    		{
    				return CallLocalFunction("nx_Pro_OnPlayerDisconnect", "ii",playerid,  reason);
    					}
    						return 1;
    						}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
	#else
		#define _ALS_OnPlayerDisconnect
		#endif
		#define OnPlayerDisconnect nx_Pro_OnPlayerDisconnect
		forward nx_Pro_OnPlayerDisconnect(playerid,  reason);
public OnVehicleSpawn(vehicleid)
{
    anti_SetVehicleHealth(vehicleid, nx_VEH_HEALTH);
    	if (gnx_Pro_HasCB[5])
    		{
    				return CallLocalFunction("nx_Pro_OnVehicleSpawn", "i",vehicleid);
    					}
    						return 1;
    						}
#if defined _ALS_OnVehicleSpawn
	#undef OnVehicleSpawn
	#else
		#define _ALS_OnVehicleSpawn
		#endif
		#define OnVehicleSpawn nx_Pro_OnVehicleSpawn
		forward nx_Pro_OnVehicleSpawn(vehicleid);
public OnPlayerUpdate(playerid)
{
	if(GetPVarInt(playerid, "nxPro_CheckVehHealth") <= gettime())
		{
			    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			    	    {
			    	    			new Float: vHealthh, veh_idd = GetPlayerVehicleID(playerid);
			    	    						GetVehicleHealth(veh_idd, vHealthh);
			    	    									if(vHealthh != nx_VEH_HEALTH)
			    	    												{
			    	    																// https://pastebin.com/G81da7N1
			    	    																			    if(IsPlayerInRangeOfPoint(playerid, 10.0, 1025.05, -1024.23, 32.1))
			    	    																			    			    {
			    	    																			    			    			        anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        return 1;
			    	    																			    			    			        			        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, 487.68, -1740.87, 11.13))
			    	    																			    			    			        			        			    			    {
			    	    																			    			    			        			        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, -1420.73, 2583.37, 55.56))
			    	    																			    			    			        			        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, -1904.39, 284.97, 40.75))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, -2425.91, 1022.33, 50.10))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, 1975.60, 2162.16, 10.77))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, 2065.38, -1831.51, 13.25))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, -99.55, 1118.36, 19.44))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, 721.07, -455.94, 16.04))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    }else if(IsPlayerInRangeOfPoint(playerid, 10.0, 2393.74, 1493.01, 10.52))
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    {
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    					anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    }
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			}
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    						if(vHealthh > VehicleProcces[veh_idd][VehicleHeath] && !VehicleModsa[playerid])
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    									{
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    CallRemoteFunction("OnPlayerVehHealthHack", "d", playerid);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    				new ___ping = GetPlayerPing(playerid) + 150;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    								SetTimerEx("hackVeh_Kick", (___ping > 500 ? 500 : ___ping), false, "d", playerid);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    											}
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    													}
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    														}
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															SetPVarInt(playerid, "nxPro_CheckVehHealth", gettime() + 1);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 	if (gnx_Pro_HasCB[3])
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 		{
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 				return CallLocalFunction("nx_Pro_OnPlayerUpdate", "i",playerid);
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 					}
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 						return 1;
			    	    																			    			    			        			        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    			    								        			    												    															 						}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
	#else
		#define _ALS_OnPlayerUpdate
		#endif
		#define OnPlayerUpdate nx_Pro_OnPlayerUpdate
		forward nx_Pro_OnPlayerUpdate(playerid);
public OnEnterExitModShop(playerid, enterexit, interiorid)
{
    if(enterexit == 0)
        {
                if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                                	new veh_idd = GetPlayerVehicleID(playerid);
                                	        	anti_SetVehicleHealth(veh_idd, nx_VEH_HEALTH);
                                	        	        	VehicleModsa[playerid] = false;
                                	        	        			}
                                	        	        			    }
                                	        	        			        else if(enterexit == 1)
                                	        	        			            {
                                	        	        			                    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                                	        	        			                            {
                                	        	        			                                    	VehicleModsa[playerid] = true;
                                	        	        			                                    			}
#if defined _
