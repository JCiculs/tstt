 			/*  ---------------- Enable the Windows/Android Application ----------------- */
//#define SOCKET_ENABLED
			/*  ---------------- SERVER PLATFORM ---------------- */
//#define _WIN32
#define _LINUX
			/*  ---------------- DISABLE NPCs ----------------- */
#define	FOREACH_NO_BOTS
			/*  ---------------- PRAGMAS ----------------- */
#pragma dynamic 5500000
#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0
			/*  ---------------- NATIVES ----------------- */
native WP_Hash(buffer[], len, const str[]);
//native gpci(playerid, serial[], maxlen);
			/*  ---------------- SERVER DEFINES ----------------- */
#undef 			MAX_PLAYERS
#define 		MAX_PLAYERS					(500)
#define 		MAX_PING 					1200
#define			INVALID_SAMP_ID				65535
#define			WEB_SERVER					""
#define			SAMP_WEB					"samp.baocms.net"
#define			XP_RATE						25 // XP Rates for jobs
#define			XP_RATE_HOURLY				2 // XP Bounes per paycheck (LEVEL * XP_RATE * XP_RATE_HOURLY)
// #define         SCM                         SendClientMessage
			/*  ---------------- TIMERS ----------------- */
#define PRESSED(%0) \
(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define			TYPE_TPMATRUNTIMER 			1
#define			TYPE_TPDRUGRUNTIMER 		2
#define			TYPE_ARMSTIMER 				3
#define			TYPE_GIVEWEAPONTIMER 		4
#define			TYPE_HOSPITALTIMER 			5
#define			TYPE_SEXTIMER 				6
#define			TYPE_FLOODPROTECTION 		7
#define			TYPE_HEALTIMER 				8
#define 		TYPE_GUARDTIMER 			9
#define			TYPE_TPTRUCKRUNTIMER 		10
#define			TYPE_SHOPORDERTIMER 		11
#define 		TYPE_SELLMATSTIMER 			12
#define 		TYPE_TPPIZZARUNTIMER 		13
#define 		TYPE_PIZZATIMER 			14
#define 		TYPE_CRATETIMER 			15
#define         TYPE_DICETIMER              16
			/*  ---------------- MISC ----------------- */
#define 		RED_FLAG_OBJ 				1580
#define 		BLUE_FLAG_OBJ 				1579
#define 		HILL_OBJ 					1578
#define 		VEHICLE_RESPAWN 			7200
#define 		SPEEDGUN 					43
#define 		MAX_NOP_WARNINGS 			4
#define 		NEW_VULNERABLE 				(24)
#define 		TIME_TO_CLAIM 				(1)
#define 		TIME_TO_TAKEOVER 			(10)
#define 		MAX_FAMILY 					(17)
#define 		MAX_POINTS 					(8)
#define 		MAX_DMAPICONS 				(400)
#define 		MAX_DDOORS					(3000)
#define 		MAX_HOUSES 					(101)
#define 		MAX_OWNABLE_HOUSES 			(2)
#define 		MAX_GATES 					(4000)
#define 		MAX_EVENTPOINTS 			(50)
#define 		INVALID_HOUSE_ID			(-1)
#define			MAX_TURFS					(65)
#define			MAX_ARENAS					(10)
#define			MAX_MAILBOXES				(50)
#define 		MAX_3DLABELS 				(500)
#define 		MAX_SPEEDCAMERAS			(50)
#define 		MAX_PAYNSPRAYS				(20)
#define 		MAX_ARRESTPOINTS			(30)
#define 		MAX_IMPOUNDPOINTS			(20)
#define         NATION_SAN_ANDREAS		 	0
#define         NATION_TIERRA_ROBADA	 	1
#define			MAX_ZONE_NAME				28
#define 		MAX_MODS 					15
#define 		FREEZE_TIME					5000
#define 		CREDITS_AMOUNT_REFERRAL     100
#define 		MAX_PLAYERVEHICLES 			500
#define 		MAX_PLAYERTOYS 				200
#define 		MAX_GANG_VEHICLES 			16
#define 		INVALID_PLAYER_VEHICLE_ID 	0
#define 		CRATE_COST 					50000
#define 		MAX_REPORTS  				1000
#define 		INVALID_REPORT_ID 			-1
#define 		MAX_CALLS  					1000
#define 		INVALID_CALL_ID 			-1
#define 		WEAPON_HACKER_WARNINGS  	4
#define 		NOOB_SKIN      				1000
#define 		MAX_ITEMS 					(30)
#define 		RocketHeight 				50
#define 		TYPE_COUNTDOWN 				2000
#define 		TYPE_LAUNCH 				2001
#define 		TYPE_EXPLODE 				2002
#define 		MAX_FIREWORKS 				100
#define 		FireworkSpread 				30
#define 		REGULAR_MAIL    			0
#define 		PRIORITY_MAIL    			1
#define 		PREMIUM_MAIL    			2
#define 		GOVERNMENT_MAIL 			3
#define			MAX_RFLTEAMS				200
#define			MAX_GANGTAGS				150
//#define 		SHOPAUTOMATED
#define 		zombiemode
#define 		event_chancegambler

// strcpy - Simon / Y_LESS
/*#define strcpy(%0,%1,%2) \
    strcat((%0[0] = '\0', %0), %1, %2)*/

			/*  ---------------- FUNCTIONS ----------------- */
#define 		GetVehicleName(%0) VehicleName[GetVehicleModel(%0)-400]
#define 		GetPlayerCash(%0) PlayerInfo[%0][pCash]
#define 		GivePlayerCash(%0,%1) PlayerInfo[%0][pCash] += (%1)
#define 		GetPlayerMats(%0) PlayerInfo[%0][pMats]
#define 		GivePlayerMats(%0,%1) PlayerInfo[%0][pMats] += (%1)
#define 		ini_SetString(%0,%1,%2)			if(%2[0]) fwrite(%0, %1), fputchar(%0, '=', false) && fwrite(%0, %2) && fwrite(%0, "\r\n")
#define 		ini_SetInteger(%0,%1,%2,%3)     format(%1, sizeof(%1), "%s=%d\r\n", %2, %3) && fwrite(%0, %1)
#define 		ini_SetFloat(%0,%1,%2,%3)       format(%1, sizeof(%1), "%s=%f\r\n", %2, %3) && fwrite(%0, %1)
#define 		chrtoupper(%1) \
        			(((%1) > 0x60 && (%1) <= 0x7A) ? ((%1) ^ 0x20) : (%1))				

// strcpy - Simon / Y_LESS
/*#define strcpy(%0,%1,%2) \
    strcat((%0[0] = '\0', %0), %1, %2)*/
    
			/*  ---------------- DYNAMIC GROUP ----------------- */
// First-dimension array sizes - CRITICAL.
#define 		MAX_GROUPS 					20
#define 		MAX_GROUP_RANKS 			15
#define 		MAX_GROUP_DIVS 				10
#define 		MAX_GROUP_WEAPONS			16
#define			MAX_DYNAMIC_VEHICLES        700
#define         MAX_DV_OBJECTS          	2
#define         MAX_DV_MODS                 15
#define 		MAX_GROUP_LOCKERS           5
#define 		MAX_GROUP_JURISDICTIONS     10

#define			DYNAMIC_FAMILY_CLOTHES		1337

// Third and fourth-dimension sizes.
#define			GROUP_MAX_NAME_LEN			32
#define			GROUP_MAX_RANK_LEN			30
#define			GROUP_MAX_DIV_LEN			16
#define			GROUP_MAX_MOTD_LEN   		128

// General constants.
#define			MAX_GROUP_ALLEGIANCES		3
#define			MAX_GROUP_TYPES             15
#define         MAX_LOCKER_STOCK        	1500
#define         MAX_CRATES             		20
#define 		MAX_SPIKES 					20
#define 		MAX_CONES 					20
#define 		MAX_FLARES 					20
#define 		MAX_BARRICADES 				20
#define 		MAX_BARRELS 				20
#define         MAX_CAUTHANGLS				20
#define    		MAX_BANGGONLS 				30
#define         MAX_AUCTIONS                10
#define         MAX_PLANTS                  300
#define         MAX_BUSINESSSALES           100
#define 		INVALID_FAMILY_ID   		255
#define 		INVALID_GROUP_ID 			-1
#define 		INVALID_RANK     			255
#define 		INVALID_DIVISION       		-1

// Query thread IDs.
#define         GROUP_QUERY_LOAD			1
#define         GROUP_QUERY_INVITE			2
#define         GROUP_QUERY_ADDBAN			3
#define         GROUP_QUERY_UNBAN   		4
#define         GROUP_QUERY_UNCHECK   		5
#define         GROUP_QUERY_UNINVITE  		6
#define         GROUP_QUERY_LOCKERS     	7
#define         GROUP_QUERY_JURISDICTIONS   8

//Query thread IDs for Dynamic Vehicles
#define         GV_QUERY_LOAD               1
#define         GV_QUERY_SAVE               2

			/*  ---------------- BUSINESSES ----------------- */
                     /* ===[Ignore the tab space]=== */

#define 		MAX_BUSINESSES 						200
#define 		MAX_BUSINESS_NAME 					48
#define 		MAX_BUSINESS_DEALERSHIP_VEHICLES    10
#define 		MAX_BUSINESS_GAS_PUMPS 			    2
#define 		INVALID_BUSINESS_ID 				-1
#define 		INVALID_GAS_PUMP 					-1
#define 		INVALID_STORE_ITEM 					-1
#define 		BUSINESS_BASE_VW 					100000
#define 		BUSINESS_OPEN_COLOR 				0x22FF2299
#define 		BUSINESS_CLOSED_COLOR 				0xFF222299
#define 		BUSINESS_NAME_COLOR 				0xFFFFFF99
#define 		BUSINESS_PRICE_COLOR				0x33CCFF88
#define 		BUSINESS_TAX_PERCENT                10
#define 		BUSINESS_TYPE_GASSTATION 			1
#define 		BUSINESS_TYPE_CLOTHING 				2
#define 		BUSINESS_TYPE_RESTAURANT 			3
#define 		BUSINESS_TYPE_GUNSHOP 				4
#define 		BUSINESS_TYPE_NEWCARDEALERSHIP 		5
#define 		BUSINESS_TYPE_OLDCARDEALERSHIP 		6
#define 		BUSINESS_TYPE_MECHANIC 				7
#define 		BUSINESS_TYPE_STORE 				8
#define 		BUSINESS_TYPE_BAR					9
#define 		BUSINESS_TYPE_CLUB 					10
#define 		BUSINESS_TYPE_SEXSHOP 				11
#define 		BUSINESS_TYPE_GYM 					12
#define 		BUSINESS_ITEMS_COST 				1500
#define 		ITEM_CELLPHONE 						1
#define 		ITEM_PHONEBOOK 						2
#define 		ITEM_DICE 							3
#define 		ITEM_CONDOM 						4
#define 		ITEM_MUSICPLAYER 					5
#define 		ITEM_ROPE 							6
#define 		ITEM_CIGAR 							7
#define 		ITEM_SPRUNK 						8
#define 		ITEM_VEHICLELOCK 					9
#define 		ITEM_SPRAYCAN						10
#define 		ITEM_RADIO 							11
#define 		ITEM_CAMERA 						12
#define 		ITEM_LOTTERYTICKET 					13
#define 		ITEM_CHECKBOOK						14
#define 		ITEM_PAPERS 						15
#define 		ITEM_ILOCK                      	16
#define 		ITEM_ELOCK                      	17
#define 		ITEM_ALOCK                      	18
#define 		FUEL_PUMP_RATE 						0.1 // Gallons per second
#define 		BIZ_PENALTY 						0.2

// Objects
#define 		OBJ_POKER_TABLE 					19474

// GUI
#define 		GUI_POKER_TABLE						0

// Poker Misc
#define 		MAX_POKERTABLES 					100
#define 		MAX_POKERTABLEMISCOBJS				6
#define 		MAX_PLAYERPOKERUI					48
#define 		DRAWDISTANCE_POKER_TABLE 			150.0
#define 		DRAWDISTANCE_POKER_MISC 			50.0
#define 		CAMERA_POKER_INTERPOLATE_SPEED		5000 // ms (longer = slower)

			/*  ---------------- COLORS ----------------- */
    				/* ===[Ignore the tab space]=== */
#define CHECKPOINT_NONE 0
#define CHECKPOINT_HOME 12
#define CHECKPOINT_LOADTRUCK 97651
#define CHECKPOINT_RETURNTRUCK 97652
#define CHECKPOINT_HITMAN 123
#define CHECKPOINT_HITMAN2 124
#define CHECKPOINT_HITMAN3 125
#define CHECKPOINT_DELIVERY 126
#define COLOR_TWWHITE 0xFFFFFFAA
#define COLOR_TWYELLOW 0xFFFF00AA
#define COLOR_TWPINK 0xE75480AA
#define COLOR_TWRED 0xFF0000AA
#define COLOR_TWBROWN 0x654321AA
#define COLOR_TWGRAY 0x808080AA
#define COLOR_TWOLIVE 0x808000AA
#define COLOR_TWPURPLE 0x800080AA
#define COLOR_TWTAN 0xD2B48CAA
#define COLOR_TWAQUA 0x00FFFFAA
#define COLOR_TWORANGE 0xFF8C00AA
#define COLOR_TWAZURE 0x007FFFAA
#define COLOR_TWGREEN 0x008000AA
#define COLOR_TWBLUE 0x0000FFAA
#define COLOR_TWBLACK 0x000000AA
#define COLOR_ORANGE 0xFF8000FF
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_GRAD3 0xCBCCCEFF
#define COLOR_GRAD4 0xD8D8D8FF
#define COLOR_GRAD5 0xE3E3E3FF
#define COLOR_GRAD6 0xF0F0F0FF
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_REALRED 0xFF0606FF
#define COLOR_LIGHTRED 0xFF6347AA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_LIGHTGREEN 0x9ACD32AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_TAXI 0xFFFF9000
#define COLOR_VIP 0xC93CCE00
#define COLOR_FAMED 0x99FF0000
#define COLOR_DPC 0x0080FFFF
#define COLOR_YELLOW2 0xF5DEB3AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_FADE1 0xE6E6E6E6
#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5 0x6E6E6E6E
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_DBLUE 0x2641FEAA
#define COLOR_ALLDEPT 0xFF8282AA
#define COLOR_BLACK 0x000000AA
#define COLOR_NEWS 0xFFA500AA
#define COLOR_OOC 0xE0FFFFAA
#define COLOR_CYAN 0x40FFFFFF
#define PUBLICRADIO_COLOR 0x6DFB6DFF
#define TEAM_CYAN 1
#define TEAM_BLUE 2
#define TEAM_GREEN 3
#define TEAM_ORANGE 4
#define TEAM_COR 5
#define TEAM_BAR 6
#define TEAM_TAT 7
#define TEAM_CUN 8
#define TEAM_STR 9
#define TEAM_HIT 10
#define TEAM_ADMIN 11
#define PAINTBALL_TEAM_RED 0xFF000000
#define PAINTBALL_TEAM_BLUE 0x2641FE00
#define FIND_COLOR 0xB90000FF
#define TEAM_GREEN_COLOR 0xFFFFFFAA
#define TEAM_JOB_COLOR 0xFFB6C1AA
#define TEAM_HIT_COLOR 0xFFFFFF00
#define TEAM_BLUE_COLOR 0x2641FE00
#define TEAM_TAXI_COLOR 0xF2FF0000
#define COP_GREEN_COLOR 0x33AA33AA
#define TEAM_GROVE_COLOR 0x00D900C8
#define TEAM_AZTECAS_COLOR 0x01FCFFC8
#define TEAM_CYAN_COLOR 0xFF8282AA
#define TEAM_MED_COLOR 0xFF828200
#define TEAM_ORANGE_COLOR 0xFF800000
#define TEAM_APRISON_COLOR 0x9C791200
#define DEPTRADIO 0xFFD7004A
#define RADIO 0x8D8DFFFF
#define FRADIO 0xAA3333AA
#define COLOR_NEWBIE 0x7DAEFFFF
#define COLOR_COMBINEDCHAT 0x6CEFF0FF
#define COLOR_JOINHELPERCHAT 0xAAC0E4FF
#define COLOR_HELPERCHAT  0x0BBD5FEC8
#define COLOR_REPORT 0xFFFF91FF
#define COLOR_SHOP 0xE7E784FF
#define COLOR_TR 0x56B9B900
#define COLOR_BR 0xCD8500FF
#define SHITTY_JUDICIALSHITHOTCH 0xFF66CC00

			/*  ---------------- ELEVATOR ----------------- */
#define ELEVATOR_SPEED      (5.0)   // Movement speed of the elevator.
#define DOORS_SPEED         (4.0)   // Movement speed of the doors.
#define ELEVATOR_WAIT_TIME  (5000)  // Time in ms that the elevator will wait in each floor before continuing with the queue.
									// Be sure to give enough time for doors to open.
#define X_DOOR_CLOSED       (1786.627685)
#define X_DOOR_R_OPENED     (1785.027685)
#define X_DOOR_L_OPENED     (1788.227685)
#define GROUND_Z_COORD      (14.511476)
#define ELEVATOR_OFFSET     (0.059523)

#define ELEVATOR_STATE_IDLE     (0)
#define ELEVATOR_STATE_WAITING  (1)
#define ELEVATOR_STATE_MOVING   (2)
#define INVALID_FLOOR           (-1)

			/*  ---------------- mSelection ----------------- */
#define mS_TOTAL_ITEMS         	1000 // Max amount of items from all lists
#define mS_TOTAL_LISTS			20 // Max amount of lists
#define mS_TOTAL_ROT_ZOOM		100 // Max amount of items using extra information like zoom or rotations
#define mS_CUSTOM_MAX_ITEMS  	30000
#define mS_INVALID_LISTID		mS_TOTAL_LISTS
#define mS_CUSTOM_LISTID		(mS_TOTAL_LISTS+1)
#define mS_NEXT_TEXT   "Next"
#define mS_PREV_TEXT   "Prev"
#define mS_CANCEL_TEXT   "Cancel"
#define mS_SELECTION_ITEMS 		21
#define mS_ITEMS_PER_LINE  		7
#define mS_DIALOG_BASE_X   	75.0
#define mS_DIALOG_BASE_Y   	130.0
#define mS_DIALOG_WIDTH    	550.0
#define mS_DIALOG_HEIGHT   	180.0
#define mS_SPRITE_DIM_X    	60.0
#define mS_SPRITE_DIM_Y    	70.0
#define mS_LIST_START			0
#define mS_LIST_END				1
#define mS_ITEM_MODEL			0
#define mS_ITEM_ROT_ZOOM_ID 	1

			/*  ---------------- MySQL ----------------- */
#define 		NO_THREAD 						-1
#define 		NO_EXTRAID 						-1
#define 		LOADUSERDATA_THREAD 			1
#define 		SENDDATA_THREAD 				2
#define 		AUTH_THREAD 					3
#define 		LOGIN_THREAD 					4
#define 		REGISTER_THREAD 				5
#define 		ONLINE_THREAD 					6
#define 		LOADMOTDDATA_THREAD 			7
#define 		LOADPVEHPOS_THREAD 				8
#define 		CHECKPVEHPOS_THREAD 			9
#define 		MDC_THREAD 						10
#define 		LOADCRATE_THREAD 				11
#define 		IPBAN_THREAD 					12
#define 		LOADSALEDATA_THREAD 			13
#define 		LOADSHOPDATA_THREAD 			14
#define 		MAIN_REFERRAL_THREAD    		15
#define         REWARD_REFERRAL_THREAD          16
#define 		LOADPVEHICLE_THREAD				17
#define         OFFLINE_FAMED_THREAD            18
#define			BUG_LIST_THREAD					19
#define			LOADPTOYS_THREAD				21
#define			ADMINWHITELIST_THREAD			22
#define			LOADGIFTBOX_THREAD				23
#define			LOADCP_STORE					24
#define 		Flag_Query_Display  			1
#define 		Flag_Query_Offline  			2
#define 		Flag_Query_Count    			3
#define 		Skin_Query_Display   			1
#define 		Skin_Query_Count     			2
#define 		Skin_Query_ID	     			3
#define 		Skin_Query_Delete    			4
#define 		Skin_Query_Delete_ID 			5
#define 		TR_Citizen_Count   				1
#define 		Total_Count	       				2
#define 		CheckQueue  	   				1
#define 		UpdateQueue  	   				2
#define 		AppQueue	  	   				3
#define 		AddQueue	       				4
#define 		AcceptApp	  	   				1
#define 		DenyApp		  	   				2


#define			TYPE_THOIGIANCHET				16

// GivePlayerCashEx Types
#define			TYPE_BANK						1
#define			TYPE_ONHAND						2

//OnGangTagQueryFinish Threads
#define			LOAD_GANGTAGS					1
#define			SAVE_GANGTAG					2
// Boombox
#define			AUDIO_URL					(2580)
#define			AUDIO_URL_BOOM			    (2581)
#define			AUDIO_URL_LIST              (2582)
#define			AUDIO_URL_URL               (2583)
//Vut sung
#define 		MAX_DROP_ITEMS 					1000
//Khu an toan
#define 		MAX_SZ 							100 // So luong toi da cua Khu an toan

//ammo
#define LUONGDAN_BANDAU 	0
#define DIALOG_EMS                          (120)
// thong bao
#define         THONGBAOGPS					(5104)
#define         TIMELOADING               	3
#define 		DIALOG_GHEPXE       		(1503)
#define        	INVENTORY_DIALOG			(5139)
#define        	DIALOG_MEDIC_LIST			(5140)
#define         DIALOG_DOXE1                (300)
#define 		DIALOG_TOPMONEY 			(6001)
#define         DIALOG_DOXE2                (300) 
#define         DIALOG_DOXE3                (300) 
#define         DIALOG_SHOWDOXE             (300)
#define			DIALOG_GARAGE               (9876)
#define         DOXEPAINT                   (9869)
#define         DIALOG_TYPE_MAIN            (9868)
#define 		DIALOG_TYPE_PAINTJOBS 		(9867)
#define 		DIALOG_TYPE_COLORS      	(9866)
#define 		DIALOG_TYPE_EXHAUSTS    	(9865)
#define 		DIALOG_TYPE_FBUMPS       	(9864)
#define 		DIALOG_TYPE_RBUMPS     	  	(9863)
#define 		DIALOG_TYPE_ROOFS        	(9862)
#define 		DIALOG_TYPE_SPOILERS     	(9861)
#define 		DIALOG_TYPE_SIDESKIRTS   	(9860)
#define 		DIALOG_TYPE_BULLBARS    	(9859)
#define 		DIALOG_TYPE_WHEELS      	(9858)
#define 		DIALOG_TYPE_CSTEREO     	(9857)
#define 		DIALOG_TYPE_HYDRAULICS   	(9856)
#define 		DIALOG_TYPE_NITRO        	(9855)
#define 		DIALOG_TYPE_LIGHTS       	(9854)
#define 		DIALOG_TYPE_HOODS        	(9853)
#define 		DIALOG_TYPE_VENTS       	(9852)
#define         DIALOG_SOLID                (9851)
#define 		DIALOG_NEONTYPES            (9850)
#define 		DIALOG_SOLID                (9849)
#define 		DIALOG_SIMULTANEOUS         (9848)
#define 		DIALOG_ALTERNATING          (9847)
#define         DIALOG_TAKEOFFADMIN         (9846)
#define         DIALOG_TAKEOFFGARAGE        (9845)
#define         DIALOG_MUASKIN         		(5136)
#define         DIALOG_MYSKIN         		(5137)
#define  		G_LOCKER_AMMO 				(5138)
#define 						eshopservice						(8655)
#define 						aservicehouse						(8656)
#define 						aservicedoor						(8657)
#define 						aservicegate						(8658)
#define 						aservicegarage						(8659)
#define 						aservicein							(8660)
#define 						aserviceib							(8661)
#define 						aservicehouse1						(8662)
#define 						aservicedoor1						(8663)
#define 						aservicegate1						(8664)
#define 						aservicegarage1						(8665)
#define 						aservicein1							(8666)
#define 						aserviceib1							(8667)
#define 						checkorderhouse						(8668)
#define 						checkorderdoor						(8669)
#define 						checkordergate						(8670)
#define 						checkordergarage					(8671)
#define 						checkorderin						(8672)
#define 						checkorderib						(8673)
#define 						acheckservice						(8674)
#define 						acheckservicemsg					(8675)
#define 						acheckorder							(8676)
#define 						yn_es								(8677)
#define 						yn_es1								(8678)
#define 						aservicex							(8679)
#define 						ORDER 								200
//fix
#define 		FIXVEHICLES 				120	
#define iniOpen ini_openFile
#define iniClose ini_closeFile
#define iniGet ini_getString
#define iniGetInt ini_getInteger
#define iniGetFloat ini_getFloat
#define iniSet ini_setString
#define iniSetInt ini_setInteger
#define iniSetFloat ini_setFloat
#define iniRemoveKey ini_removeKey

//Help newbie
#define         DIALOG_BANDAN               (200)
#define         DIALOG_BALO                 (100)
#define         DIALOG_PAYCHECK				(5081)
#define			CHAOMUNGDENVOISERVER   		(5082)
#define			YEUCAUTROGIUPNEWBIE         (5083)
// Code tim viec lam
#define         TIMVIECLAM2                 (2584)
#define         TIMVIECLAM                  (5084)
#define         TIMDUONG                    (5085)
#define         TIMVIECLAM1                 (5104)

// Code Actor Xin viec
#define         DACOVIEC    				(5086)
#define         ACTOR_XINVIEC    			(5087)
#define         CHAPNHANCONGVIEC    		(5088)
#define         KHONGCHAPNHAN_CONGVIEC    	(5089)
#define         DIALOG_NGHIVIEC				(5104)

#define         TIMDUONG1                   (5105)
#define         DADENNOINHANVIECLAM    		(5090)

//Job
#define         WELCOMECENT    				(5093)

#define         DIALOG_ADMINCMDS    		(5094)

#define 		ACTOR_POT					(5095)
#define 		ACTOR_CRACK 				(5096)

#define 		ACTOR_DRUGSDEALER 			(5098)
#define 		ACTOR_ARMSDEALER 			(5099)
#define 		BANCANSA					(5100)
#define         DIALOG_CANSA                (6543)
#define 		BANMATUY					(5101)
#define 		MUAVUKHI					(5102)
#define			DIALOG_GIFTCODE				(5103)
#define         LISTNHAC                   	(5106)
#define         LISTNHAC1                   (5107)
#define         LISTNHAC2					(5108)
#define         DIALOG_DANGKY               (5109)
#define         LISTBOLERO              	(5110)
#define         LISTNHACTRE             	(5111)
#define         LISTCAILUONG            	(5112)
#define         LISTNHACREMIX            	(5113)



//dialog vehicles
#define        SHOWDIALOG_VEHICLE			(300)
#define        SHOWDIALOG_VEHICLE1			(5114)
#define        SHOWDIALOG_VEHICLE2			(5115)
#define        DIALOG_GIOITHIEU             (5116)
#define        DIALOG_GIOITHIEU1            (5117)
#define        DIALOG_GIOITHIEU2            (5118)
#define        PizzaGetPizza                (5119)
#define        DIALOG_DT                    (5120)
#define        DIALOG_DIENTHOAI				(5121)
#define        DIALOG_DEPLOY				(2122)
#define        GROUP_ZONE 					(5021)
#define 	   SHOP_NAPTIEN					(5022)
#define 	   CHECK_MDC					(5023)      			
#define        DIALOG_TROGIUP               (5024)
#define		   DIALOG_SUCKHOE				(5026)
#define 	   DIALOG_WORKTRADE 			(5027)
#define 	   DIALOG_WORKSELL 				(5031)
#define 	   DIALOG_WORKBUY				(5029)
#define		   TIMVIECLAM3					(5028)
#define        DIALOG_BANDAU				(5032)
#define	       MINER 						(5050)
#define        TIMDUONG2					(5033)
#define        TIMDUONG3					(5034)
#define        DIALOG_MUAMEDKIT             (5051)
#define        LENXESHOP                    (5052)
#define        THUXESHOP                    (5053)
#define        SENDVITRI                   	(5054)
#define        IDNGUOINHAN                 	(5055)
#define        SDTNGUOINHAN                	(5056)
#define        TINNHANGUI                  	(5057)
#define        DIALOG_NONE                  (5058)
#define        DIALOG_DANGNHAP              (5059)
#define        DIALOG_NGAYSINH              (5060)
#define        DIALOG_THANGSINH             (5061)
#define        DIALOG_NAMSINH               (5062)
#define        DIALOG_DANGNHAPEMAIL         (5063)
#define  		DIALOG_CHETAOSUNG			(5064)
#define  		DIALOG_CHETAOSUNG1			(5065)
#define DIALOG_BUYWEAPONS (5064)
#define DIALOG_MUASUNG     (5065)
#define CHETAODAN	      (5066)
#define DIALOG_MUAMAU       (5067)
//dialog cau hoi ho tro vien
#define         TRALOICAUHOI					263
#define         CAUHOINEWB						264
#define         THOIGIANSOCUU               	30// 60s	
#define         THOIGIANXIU                     30//60s
#define         THOIGIANMASK                    600//600s = 10p
#define        DIALOG_BANMEDKIT             (5067)
#define  DIALOG_XEMVITRI 		(5094)
#define   		DIALOG_CAR       (5080)
#define   DIALOG_CHECKLOGIN    (5092)
#define		DIALOG_CHECKLOGIN2 (5093)
#define		DIALOG_CITYHALL			(5091)
#define		DIALOG_TRUCKER_INFO 	(5095)
#define		DIALOG_TRUCKER_RENTCAR	(5096)	
#define		DIALOG_TRUCK_DELIVERY	(5097)	
#define		DIALOG_TRUCKCAR			(5098)	

        			
