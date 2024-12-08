#include <YSI_Coding\y_hooks>
#include <a_samp>


#define MAX_STONES 52
#define INVALID_STONE -1 // Khong dung vao day
#define MAX_SLOT_STONE 3 // Khong dung vao day
#define DIALOG_KHAITHAC 2222
#define GIATIEN 10
#define DAODAZZ 1


enum e_dd_data {
	dd_Stone, // Object ID
	Text3D:dd_Name, // Label cay
	dd_Attacked_Player, // Nguoi so huu

	Float:dd_Cro[3], // Vi Tri
}
enum char_dd_data {
	PlayerTime_daoda,
	Player_Attack_Stone,
	Player_Stone_Count,
	// Object & Vehicle
	//Player_Object_Slot[MAX_SLOT_Stone], // Object Attachment
	Player_Object_DYNS[MAX_SLOT_STONE], // Object duoi dat
	Player_Vehicle_MINER,
}


new Player_Item[MAX_PLAYERS];
new MinerOwner[MAX_PLAYERS][char_dd_data];
new char_daoda[MAX_PLAYERS][char_dd_data];
new daoda[MAX_STONES][e_dd_data];
new Stone_Obj[MAX_VEHICLES][6];
new Stone_SoLuong[MAX_VEHICLES];
new dalayxeminer[MAX_PLAYERS];
new Model_Da[52];
new Object_Da[52];
new Mysql_Da[52];
//new Model_Object[100];
new Time_Da[MAX_PLAYERS];
new Time_Da2[MAX_PLAYERS];
//new HeThongDa;
new TV_Da[1];
new OW_Da[1];
new button_da[1];
new Float:Stone_Default[MAX_STONES][] = {
{1002.8427, -2092.6501, 13.1442, 248.3492},
{999.3416, -2091.1345, 13.1022, 158.3491},
{1002.8427, -2092.6501, 13.1442, 248.3492},
{1004.2427, -2089.9788, 13.1738, 338.3491},
{1006.0668, -2093.6282, 13.1845, 158.3491},
{1004.4243, -2097.4795, 13.1469, 158.3491},
{1008.1909, -2099.2273, 13.1916, 248.3492},
{1009.9755, -2094.9702, 13.2327, 338.3491},
{1005.5684, -2105.7207, 13.1304, 158.3491},
{1002.2046, -2104.3535, 13.0859, 68.3490},
{998.7990, -2108.4148, 13.0859, 158.3491},
{994.8350, -2112.0601, 13.0938, 158.3491},
{999.0627, -2113.4409, 13.0938, 272.0583},
{1002.9310, -2118.0188, 13.0938, 227.0582},
{997.4175, -2122.3943, 13.0938, 147.4868},
{991.9551, -2123.7083, 13.0938, 103.0975},
{985.8388, -2125.2886, 13.0938, 134.8489},
{980.4903, -2126.9480, 13.0938, 144.1445},
{975.9963, -2124.7983, 13.0938, 61.5282},
{973.7583, -2129.9729, 13.0938, 163.8847},
{979.2015, -2132.4695, 13.0938, 246.8144},
{984.1576, -2134.5393, 13.0938, 247.1277},
{990.0954, -2136.8069, 13.0938, 249.5300},
{995.8942, -2138.2942, 13.0938, 254.6478},
{992.2435, -2141.4734, 13.0938, 128.9999},
{986.6105, -2138.9465, 13.0938, 65.1838},
{980.5412, -2135.3479, 13.0938, 58.8126},
{978.5710, -2133.7622, 13.0938, 55.2848},
{974.6432, -2131.0400, 13.0938, 55.2848},
{970.8681, -2128.4243, 13.0938, 55.2848},
{968.3079, -2130.7224, 13.0938, 161.1924},
{969.9593, -2135.8030, 13.0938, 206.7306},
{973.7835, -2139.9404, 13.0938, 222.6063},
{977.8552, -2143.6526, 13.0938, 222.6063},
{974.3801, -2147.9507, 13.0938, 141.8699},
{969.4255, -2149.0818, 13.0938, 103.8518},
{963.7714, -2149.9734, 13.0938, 99.6740},
{963.1533, -2154.3872, 13.0859, 215.9217},
{969.2222, -2155.4836, 13.0859, 265.1155},
{970.0771, -2166.1260, 16.1276, 175.5014},
{964.5762, -2169.2307, 15.8096, 120.9809},
{966.3925, -2167.1721, 15.7104, 313.8915},
{971.4516, -2161.0244, 15.3524, 319.5316},
{974.6710, -2162.8687, 14.0141, 224.4863},
{979.5109, -2156.0828, 14.1690, 324.5450},
{978.9097, -2150.0327, 14.1397, 7.6809},
{983.3524, -2151.8022, 15.8266, 239.3175},
{986.4408, -2156.1907, 15.9594, 213.7284},
{991.0569, -2157.7373, 15.3092, 266.0555},
{987.9765, -2161.2815, 13.5086, 155.9774},
{980.5336, -2165.5376, 13.0938, 119.0197},
{980.2500, -2161.6924, 13.0938, 354.4163}
};
new Float:poschoda[5][3] = {
	{-0.3, -2.0, 0.0},
	{-0.4, -1.0, 0.0},
	{0.4, -0.8, 0.0},
	{0.4, -1.9, 0.0},
	{0.0, -1.4, 0.6}
};

new Float:Pos_Da[5][3] = {
	{ 2134.8826,-2259.6121,14.7857},
	{ 2152.3960,-2242.5620,17.8323},
	{ 2152.3960,-2242.5620,16.0438},
	{ 2168.5693,-2260.0630,18.7234},
	{ 2168.6401,-2260.0437,13.0254}
};

new giaruby,giavang,giakimcuong;
new Text3D:Text3DMiner[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{

	// remove khu che da

	RemoveBuildingForPlayer(playerid, 3633, 2142.909, -2256.340, 13.929, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2140.379, -2254.100, 13.929, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2144.300, -2258.149, 13.929, 0.250);
	RemoveBuildingForPlayer(playerid, 3631, 2142.300, -2255.899, 12.875, 0.250);
	RemoveBuildingForPlayer(playerid, 3631, 2149.139, -2266.909, 12.875, 0.250);
	RemoveBuildingForPlayer(playerid, 5269, 2146.379, -2248.800, 14.617, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2150.280, -2250.850, 12.765, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2150.659, -2251.550, 12.765, 0.250);
	RemoveBuildingForPlayer(playerid, 5262, 2152.709, -2256.780, 15.210, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2149.810, -2253.370, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2150.699, -2252.909, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2158.010, -2257.270, 16.218, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2153.770, -2253.090, 14.203, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2154.510, -2254.479, 14.210, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2158.050, -2250.510, 15.812, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2158.570, -2251.020, 15.812, 0.250);
	RemoveBuildingForPlayer(playerid, 5261, 2152.260, -2239.459, 14.500, 0.250);
	RemoveBuildingForPlayer(playerid, 5132, 2163.290, -2251.610, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 3577, 2160.560, -2234.800, 14.562, 0.250);
	RemoveBuildingForPlayer(playerid, 3577, 2160.580, -2234.820, 13.023, 0.250);
	RemoveBuildingForPlayer(playerid, 5259, 2168.840, -2246.780, 13.937, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2167.169, -2257.129, 16.406, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2167.659, -2256.780, 14.671, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2167.659, -2256.780, 13.710, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2167.659, -2256.780, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 3577, 2170.080, -2257.659, 16.039, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2168.830, -2257.520, 17.250, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2169.350, -2258.070, 17.242, 0.250);
	RemoveBuildingForPlayer(playerid, 3632, 2167.800, -2257.350, 16.382, 0.250);
	RemoveBuildingForPlayer(playerid, 3631, 2163.379, -2262.689, 16.351, 0.250);
	RemoveBuildingForPlayer(playerid, 3631, 2161.850, -2264.090, 16.351, 0.250);
	RemoveBuildingForPlayer(playerid, 3627, 2169.120, -2276.590, 15.906, 0.250);
	RemoveBuildingForPlayer(playerid, 3686, 2169.120, -2276.590, 15.906, 0.250);
	RemoveBuildingForPlayer(playerid, 5260, 2161.340, -2264.909, 14.015, 0.250);
	RemoveBuildingForPlayer(playerid, 3578, 2165.070, -2288.969, 13.257, 0.250);


	char_daoda[playerid][Player_Stone_Count] = 0;
	char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;
	char_daoda[playerid][Player_Vehicle_MINER] = INVALID_VEHICLE_ID;
	MinerOwner[playerid][Player_Vehicle_MINER] = INVALID_VEHICLE_ID;
	for(new i = 0 ; i < 3 ; i ++) {
		//if(IsValidObject(char_daoda[playerid][Player_Object_DYNS][i])) DestroyObject(char_daoda[playerid][Player_Object_DYNS][i]);
		char_daoda[playerid][Player_Object_DYNS][i] = INVALID_OBJECT_ID;
	}

	return 1;
}


hook OnGameModeInit()
{
	giaruby = Random(50, 190);
	giavang = Random(200, 380);
	giakimcuong = Random(4128, 5120);
	new i = 0;
	LOOP:(i,MAX_STONES) {
		CreateStone(i);
	}

	//CreateActor(228,1102.7328,-1462.5632,15.7969,266.8667);
	//CreateDynamic3DTextLabel("Nguoi thu mua da quy",COLOR_YELLOW,1102.7328,-1462.5632,15.79692+0.5,4.0);

	CreateActor(228,1218.2343,-1655.2817,11.9512,268.1003);
	CreateDynamic3DTextLabel("{D7DF01}Thu mua da quy\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de tuong tac\nJohnny Dang",COLOR_YELLOW,1218.2343,-1655.2817,11.9512+1.5,10.0);

	CreateActor(16, 2284.5396,-2211.0012,13.5469,224.5612); // npc khoangsan
	CreateDynamic3DTextLabel("{6699CC}MINER\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de nhan viec\nCarlos",COLOR_YELLOW,2284.5396,-2211.0012,13.5469+1.5,10.0);// Pizza (LS)

	// dao da
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-29 23:24:57" by "co_rich"
		Created by "co_rich"
		Spawn Position: 2892.768066, -32.673805, 3575.008789
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	new tmpobjid, object_world = 1, object_int = 1;
	tmpobjid = CreateDynamicObject(17031, 2882.894775, -50.131996, 3574.008789, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(19340, 2925.303710, -5.387168, 3570.258789, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2883.863281, -9.282748, 3573.197998, 0.000000, 0.000000, -27.499956, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2899.365722, -67.931991, 3573.047851, 0.000000, 0.000000, 270.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17030, 2905.476074, -49.088581, 3604.410400, 0.000000, 180.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17030, 2898.491699, -36.778591, 3604.410400, 0.000000, 180.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2921.663818, -50.131996, 3572.967773, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2925.468505, -50.131996, 3584.540283, 0.000000, -47.300006, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2925.998046, 2.287356, 3574.008789, 0.000000, 0.000000, -108.899902, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2918.258544, -20.324096, 3605.630859, 0.000000, 180.000000, 10.400064, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2907.176513, -70.742256, 3582.571533, 0.000000, -27.400003, 270.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2926.605712, -15.562750, 3574.008789, 0.000000, 21.700008, -162.899887, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(896, 2888.677978, -57.315097, 3582.939941, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2883.863281, -9.282748, 3573.197998, 0.000000, 0.000000, -27.499956, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2895.034423, -5.245863, 3600.210693, 0.000000, 91.599929, -27.499956, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(17031, 2883.767578, -26.888944, 3600.210693, 0.000000, 91.599929, -27.499956, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1358, 2907.473632, -9.423447, 3575.227050, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(5820, 2893.457519, -33.087711, 3575.565429, 0.000000, 0.000000, 180.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2672, 2903.924560, -40.494907, 3574.299072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2672, 2903.924560, -40.494907, 3574.299072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2672, 2903.924560, -38.394920, 3574.299072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2672, 2903.924560, -38.394920, 3574.299072, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(880, 2904.081298, -21.403703, 3572.737548, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(3867, 2905.075683, -58.697612, 3577.780029, 0.000000, 0.000000, 360.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(906, 2904.927001, -35.558887, 3572.277343, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(880, 2898.307373, -27.004777, 3573.288085, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(3864, 2914.795166, -31.481868, 3579.919921, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(880, 2907.165527, -54.294311, 3573.478271, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(8874, 2910.015380, -34.924091, 3581.220214, 4.799998, -8.699997, -97.299942, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2674, 2899.585937, -51.971023, 3574.048828, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2674, 2909.828613, -45.061016, 3574.048828, 0.000000, 0.000000, 48.199996, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(2674, 2906.030273, -37.546817, 3574.048828, 0.000000, 0.000000, 48.199996, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1391, 2906.542480, -44.045970, 3585.922851, 0.000000, 89.899986, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(3864, 2905.889892, -13.583084, 3579.919921, 0.000007, 0.000015, 89.999946, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(8874, 2909.332275, -18.362869, 3581.220214, 4.799981, -8.699992, -7.299924, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(19277, 2892.218750, -24.374698, 3584.334472, 0.000000, 0.000000, 68.100013, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1391, 2896.210937, -21.901245, 3581.888916, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(906, 2912.402587, -41.399005, 3573.919921, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(19862, 2892.633789, -33.846969, 3576.291015, 14.100009, 0.000000, -12.500018, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(906, 2914.009033, -38.075233, 3573.468261, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(906, 2912.606689, -15.260576, 3573.698486, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1391, 2919.014892, -26.158559, 3597.679199, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(943, 2903.490234, -47.763999, 3574.739501, 0.000000, 0.800000, -12.500000, object_world, object_int, -1);


	// che da
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-09 22:26:19" by "Co_Rich"
		Created by "cowf_Richs"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	//new worldd = -1, intt = -1;
	tmpobjid = CreateObject(16309, 2146.292968, -2248.603515, 13.529109, 0.000000, -4.599998, 43.900066);
	tmpobjid = CreateObject(16446, 2168.124267, -2259.274414, 10.990663, 0.000004, 0.000004, 45.799953);
	tmpobjid = CreateObject(19903, 2171.576171, -2258.324951, 12.303720, 0.000000, 0.000000, 45.000000);
	tmpobjid = CreateObject(16309, 2163.017333, -2254.303466, 14.772995, 0.000000, -4.599998, 313.900054);
	tmpobjid = CreateObject(3930, 2168.729003, -2259.689697, 13.662446, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2166.547363, -2260.310302, 13.772445, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2166.577636, -2258.968994, 13.702445, 0.000000, 0.000000, 0.000000);
	//tmpobjid = CreateObject(19786, 2170.077636, -2257.462402, 14.113784, 0.000000, 0.000000, 135.000000);
	tmpobjid = CreateObject(3930, 2169.629394, -2258.608642, 14.132452, 0.000000, 0.000000, 25.000000);
	tmpobjid = CreateObject(3930, 2168.538330, -2260.496582, 13.783026, -56.299995, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2167.767578, -2257.507080, 14.132452, 0.000000, 0.000000, 40.600002);
	tmpobjid = CreateObject(3930, 2167.106933, -2258.387939, 13.772446, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.407714, -2257.727294, 13.362437, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.998291, -2259.158691, 14.132452, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.998291, -2259.158691, 14.132452, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2169.739013, -2259.158691, 14.492452, 0.000000, 0.000000, 99.699996);
	tmpobjid = CreateObject(3930, 2169.628906, -2258.848388, 13.222436, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2167.777099, -2260.559570, 13.282438, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2167.817626, -2261.259277, 13.422442, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.288085, -2260.548828, 13.222436, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.798583, -2260.278564, 13.222436, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3930, 2168.647705, -2259.358642, 13.222436, 0.000000, 0.000000, -64.300010);
	tmpobjid = CreateObject(3930, 2166.602539, -2259.742919, 13.222436, 0.000000, 0.000000, -64.300010);
	tmpobjid = CreateObject(3930, 2166.847167, -2260.248535, 13.222436, 0.000000, 0.000000, -123.600021);
	tmpobjid = CreateObject(3930, 2168.059814, -2258.425292, 13.222436, 0.000000, 0.000000, -173.599990);
	tmpobjid = CreateObject(3930, 2168.172607, -2259.429199, 13.222436, 0.000000, 0.000000, -173.599990);
	tmpobjid = CreateObject(3930, 2169.540039, -2259.319091, 13.222436, 0.000000, 0.000000, 114.099914);
	tmpobjid = CreateObject(3930, 2167.484619, -2259.669677, 13.222436, 0.000000, 0.000000, 114.099914);
	tmpobjid = CreateObject(3930, 2167.201660, -2259.040527, 13.222436, -50.000007, 0.000000, 114.099914);
	tmpobjid = CreateObject(3930, 2166.112792, -2259.329345, 13.792128, -50.000007, 0.000000, 114.099914);
	tmpobjid = CreateObject(3930, 2168.988281, -2258.498046, 13.112430, 0.000000, 0.000000, -61.400005);
	tmpobjid = CreateObject(19305, 2169.446289, -2256.653808, 13.703557, 0.000000, 0.000000, 135.000);

	TV_Da[0] = CreateDynamicObject(19786, 2170.077636, -2257.462402, 14.113784, 0.000000, 0.000000, 135.000000);
	SetDynamicObjectMaterialText(TV_Da[0], 0, " ", 80, "Arial", 60, 1, 0xff040404, 0xddd6d6, 1);
	SetDynamicObjectMaterialText(TV_Da[0], 1, "GO:RP", 80, "Arial", 30, 1, 0xFF6C78D8, 0xFF070A27, 1);
	OW_Da[0] = -1;
	button_da[0] = CreateButton(2169.446289, -2256.653808,13.703557,135.000);

	// exterior dao da

	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-29 22:56:32" by "co_rich"
		Created by "co_rich"
		Spawn Position: 998.623962, -2150.691406, 13.093750
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(3406, 1005.532531, -2146.335937, 18.253761, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(3406, 1004.195312, -2159.047607, 28.973367, 0.000000, 4.099999, 117.500022);
	tmpobjid = CreateObject(18250, 1011.365295, -2161.812744, 17.493738, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(18248, 993.881469, -2170.026367, 19.963743, 0.000000, 0.000000, 151.999969);
	tmpobjid = CreateObject(18248, 984.505676, -2152.857666, 19.923742, 0.000000, 0.000000, 331.999969);
	tmpobjid = CreateObject(19455, 1002.248229, -2162.122070, 13.593750, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(896, 983.084228, -2154.594726, 7.955938, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(896, 968.894042, -2168.277343, 7.955938, 0.000000, 0.000000, 90.000000);

	//cho den
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-31 18:00:37" by "Co_Rich"
		Created by "Co_Rich"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	//new tmpobjid, object_world = -1, object_int = -1;
	tmpobjid = CreateObject(19370, 2793.722167, -1419.161621, 16.170009, 0.000000, 0.000000, 90.000000, 300.00);
	SetObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(19313, 2792.267578, -1414.022094, 23.725988, 0.000000, 0.000015, 0.000000, 300.00);
	tmpobjid = CreateObject(19313, 2806.446777, -1414.022094, 23.725988, 0.000000, 0.000015, 0.000000, 300.00);
	tmpobjid = CreateObject(19313, 2820.546875, -1413.982055, 23.725988, 0.000000, 0.000007, 0.000000, 300.00);
	tmpobjid = CreateObject(17039, 2791.227050, -1414.766601, 13.220004, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19313, 2778.135742, -1420.502685, 23.725988, 0.000000, 0.000007, 0.000000, 300.00);
	tmpobjid = CreateObject(19313, 2785.191406, -1417.301513, 19.975955, 0.000000, -89.999984, 90.000007, 300.00);
	tmpobjid = CreateObject(2047, 2785.615722, -1417.742431, 16.840003, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(11724, 2796.541015, -1415.984619, 15.760005, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(11725, 2796.330078, -1415.982177, 15.620008, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(19926, 2795.035644, -1415.985351, 15.250000, 0.000015, 0.000007, -0.000015, 300.00);
	tmpobjid = CreateObject(1271, 2795.906494, -1418.656250, 15.589997, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1271, 2796.517089, -1418.065795, 15.589997, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1271, 2796.457031, -1418.656250, 16.260004, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1348, 2797.668212, -1418.411376, 15.960003, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(1348, 2797.668212, -1416.740600, 15.960003, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(1492, 2790.600830, -1419.188964, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1348, 2797.876220, -1415.282714, 15.960003, 0.000000, 0.000000, -0.899989, 300.00);
	tmpobjid = CreateObject(1431, 2799.976074, -1415.229614, 15.770007, 0.000000, 0.000000, -6.200007, 300.00);
	tmpobjid = CreateObject(2482, 2793.804687, -1418.968383, 15.219996, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(2567, 2803.719238, -1415.957275, 17.170001, 0.000000, 0.000000, 180.000000, 300.00);
	tmpobjid = CreateObject(358, 2793.318359, -1418.980224, 16.601102, 0.000000, 11.899999, 0.000000, 300.00);
	tmpobjid = CreateObject(358, 2793.318359, -1418.840087, 16.601102, 0.000000, 11.899999, 0.000000, 300.00);
	tmpobjid = CreateObject(358, 2793.898681, -1418.699951, 16.601211, 0.000000, 11.899999, 180.000000, 300.00);
	tmpobjid = CreateObject(356, 2793.380126, -1418.913330, 16.340007, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(356, 2793.380126, -1418.753173, 16.340007, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(356, 2793.420166, -1418.593017, 16.340007, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1421, 2800.154541, -1416.855834, 15.970008, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(355, 2793.458496, -1418.786132, 17.250587, -85.499893, 16.200002, 0.000000, 300.00);
	tmpobjid = CreateObject(1421, 2799.136474, -1418.509155, 15.970008, 0.000000, 0.000000, -40.999996, 300.00);
	tmpobjid = CreateObject(1421, 2799.136474, -1418.509155, 15.970008, 0.000000, 0.000000, -40.999996, 300.00);
	tmpobjid = CreateObject(346, 2795.053222, -1415.667236, 16.209390, -84.100028, 250.199859, 82.099822, 300.00);
	tmpobjid = CreateObject(346, 2795.114746, -1415.960205, 16.198930, -84.100028, 250.199859, 82.099822, 300.00);
	tmpobjid = CreateObject(346, 2795.328613, -1415.611816, 16.202207, -84.100028, 250.199859, 82.099822, 300.00);
	tmpobjid = CreateObject(349, 2794.683105, -1415.969726, 16.185136, -0.000007, 14.100004, -89.999946, 300.00);
	tmpobjid = CreateObject(2468, 2800.348876, -1417.799316, 15.220000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(349, 2794.752929, -1415.969726, 16.185136, -0.000007, 14.100004, -89.999946, 300.00);
	tmpobjid = CreateObject(2468, 2799.611083, -1417.699829, 15.099989, 0.000000, 0.000000, -66.000015, 300.00);
	tmpobjid = CreateObject(351, 2796.799316, -1415.066894, 16.890020, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(3796, 2808.029541, -1416.614379, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2694, 2800.699462, -1417.628784, 15.360002, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2694, 2800.699462, -1418.399291, 15.360002, 0.000000, 0.000000, -31.299991, 300.00);
	tmpobjid = CreateObject(2694, 2800.732177, -1417.670043, 15.630003, 0.000000, 0.000000, -31.299991, 300.00);
	tmpobjid = CreateObject(1812, 2786.173339, -1417.282104, 15.229999, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1828, 2791.274169, -1417.066894, 15.250000, 0.000000, 0.000000, 90.000000, 300.00);
	tmpobjid = CreateObject(1279, 2802.669433, -1417.503784, 15.250000, 0.000000, 0.000000, -83.299987, 300.00);
	tmpobjid = CreateObject(1736, 2792.735351, -1415.136596, 18.810022, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1279, 2801.837890, -1417.254516, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2040, 2795.170166, -1415.246582, 16.280017, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(1279, 2801.718261, -1417.855102, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2040, 2795.170166, -1415.246582, 16.500022, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(1778, 2790.041503, -1418.600219, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2237, 2788.181884, -1414.942382, 16.329990, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1514, 2795.143554, -1416.750000, 16.410015, -0.000007, 0.000015, -89.999946, 300.00);
	tmpobjid = CreateObject(2061, 2805.286865, -1416.959350, 15.549994, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2061, 2805.737304, -1416.988403, 15.549994, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2589, 2791.517822, -1415.354858, 20.692012, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2061, 2805.737304, -1416.988403, 15.549994, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2674, 2802.852539, -1418.972656, 15.270001, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(18665, 2803.304931, -1424.687377, 17.229995, 0.000000, 0.000000, 270.000000, 300.00);
	tmpobjid = CreateObject(2061, 2787.972167, -1414.934936, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19590, 2805.029541, -1417.395385, 15.261875, 0.000000, 266.200012, 360.000000, 300.00);
	tmpobjid = CreateObject(1575, 2786.058593, -1416.614624, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2786.963623, -1418.802368, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2674, 2798.779296, -1419.092651, 15.290012, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1575, 2786.058593, -1416.034301, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(1575, 2786.058593, -1415.493896, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2788.073974, -1418.802368, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2787.743652, -1418.802368, 15.480005, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2787.743652, -1418.371948, 15.300001, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2786.602783, -1418.371948, 15.300001, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(2060, 2786.602783, -1418.602172, 15.470003, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19572, 2804.287109, -1417.270751, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19572, 2803.566406, -1417.941162, 15.250000, 0.000000, 0.000000, 0.000000, 300.00);
	tmpobjid = CreateObject(19572, 2804.247070, -1417.941162, 15.250000, 0.000000, 0.000000, -12.399999, 300.00);
	tmpobjid = CreateObject(19878, 2801.116699, -1419.349731, 15.320001, 0.000000, 0.000000, 0.000000, 300.00);

    for(new a= 0; a < 30; a++)
	{
	    Object_Da[a] = CreateDynamicObject(3930, 1500.0, -2000.0, -600.0, 0.000000, 0.000000, 60.000000, .streamdistance = 300);
	    Model_Da[a] = 0;
	}

	return 1;
}



hook OnPlayerDisconnect(playerid, reason)
{
    new a = GetPVarInt(playerid,"kl_sat");
    new c = GetPVarInt(playerid,"kl_ruby");
    new e = GetPVarInt(playerid,"kl_vang");
    new f = GetPVarInt(playerid,"kl_kimcuong");
	if(a > 0)
	{
		PlayerInfo[playerid][pSat] += a;
		DeletePVar(playerid,"kl_sat");
	}
	if(c > 0)
	{
		PlayerInfo[playerid][pRuby] += c;
		DeletePVar(playerid,"kl_ruby");
	}
	if(e > 0)
	{
		PlayerInfo[playerid][pVang] += e;
		DeletePVar(playerid,"kl_vang");
	}
	if(f > 0)
	{
		PlayerInfo[playerid][pKimCuong] += f;
		DeletePVar(playerid,"kl_kimcuong");
	}
  	if(a > 0 || c > 0 || e > 0 || f > 0)
  	{
  		new string[128];
  		format(string,128,"%s da thu thap luc out sv : +Sat: %d, +Ruby: %d, +Vang: %d, +Kim Cuong: %d", GetPlayerNameEx(playerid),a, c, e, f);
  		Log("logs/layda.log", string);
    }
	if(Player_Item[playerid] == 3930)
	{
		Player_Item[playerid] = 0;
	}
	if(OW_Da[0] == playerid)
	{
	    OW_Da[0] = -1;
	}
    Time_Da[playerid] = 0;
    Time_Da2[playerid] = 0;
	if(char_daoda[playerid][Player_Attack_Stone] != INVALID_STONE) {
		SetStoneAttacked(char_daoda[playerid][Player_Attack_Stone],INVALID_PLAYER_ID);
		daoda[char_daoda[playerid][Player_Attack_Stone]][dd_Attacked_Player] = INVALID_PLAYER_ID;
		KillTimer(char_daoda[playerid][PlayerTime_daoda]);
	}
	/*if(char_daoda[playerid][Player_Stone_Count] > 0) {
		for(new i = 0; i < char_daoda[playerid][Player_Stone_Count]; i ++) {
			if(IsValidObject(char_daoda[playerid][Player_Object_DYNS][i])) {
				DestroyObject(char_daoda[playerid][Player_Object_DYNS][i]);
			}n
		}
	}*/
	RemovePlayerAttachedObject(playerid, 9);
	if(MinerOwner[playerid][Player_Vehicle_MINER] != INVALID_VEHICLE_ID)
	{
	    Delete3DTextLabel(Text3DMiner[playerid]);
	    DestroyDynamic3DTextLabel(Text3DMiner[playerid]);
		new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
		new soluong = Stone_SoLuong[xecuatoi]-1;
		while(soluong >= 0)
		{
	        DestroyDynamicObject(Stone_Obj[xecuatoi][soluong]);
	        Stone_Obj[xecuatoi][soluong] = CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
	        Stone_SoLuong[xecuatoi]--;
			soluong--;
		}
		dalayxeminer[playerid] = 0;
		Stone_SoLuong[MinerOwner[playerid][Player_Vehicle_MINER]] = 0;
		DestroyVehicle(MinerOwner[playerid][Player_Vehicle_MINER]);
		//DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
		Delete3DTextLabel(Text3DMiner[playerid]);
		DestroyDynamic3DTextLabel(Text3DMiner[playerid]);
		//Stone_SoLuong[MinerOwner[playerid][Player_Vehicle_MINER]] = 0;
		MinerOwner[playerid][Player_Vehicle_MINER] = INVALID_VEHICLE_ID;
	}

	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2735)
	{
		if(response)
		{
			if(listitem == 0)
			{
				ShowPlayerDialog(playerid,2737,DIALOG_STYLE_INPUT,"Ban ruby","Hay nhap so luong ban muon ban vao","Ban","Huy");
			}
			if(listitem == 1)
			{
				ShowPlayerDialog(playerid,2738,DIALOG_STYLE_INPUT,"Ban vang","Hay nhap so luong ban muon ban vao","Ban","Huy");
			}
			if(listitem == 2)
			{
				ShowPlayerDialog(playerid,2739,DIALOG_STYLE_INPUT,"Ban kim cuong","Hay nhap so luong ban muon ban vao","Ban","Huy");
			}
		}
	}
	if(dialogid == 2737)
	{
		if(!response) return 1;
		if(strval(inputtext) >= 1)
		{
			new soluong = strval(inputtext);
			new str[128];
			if(PlayerInfo[playerid][pRuby] >= soluong)
			{
				PlayerInfo[playerid][pRuby] -= soluong;
				PlayerInfo[playerid][pCash] += soluong*giaruby;
				format(str,sizeof(str),"Ban da ban thanh cong %d Ruby voi gia %d",soluong,soluong*giaruby);
				ChatHoTro(playerid,255,str,5000);
				format(str,sizeof(str),"%s da ban thanh cong %d Ruby voi gia %d",GetPlayerNameEx(playerid),soluong,soluong*giaruby);
				Log("logs/banda.log", str);
			}
			else return ChatHoTro(playerid,255,"Ban khong du so luong da quy de ban",5000);
		}
		else return ChatHoTro(playerid,255,"So luong phai lon hon 1",5000);
	}
	if(dialogid == 2738)
	{
		if(!response) return 1;
		if(strval(inputtext) >= 1)
		{
			new soluong = strval(inputtext);
			new str[128];
			if(PlayerInfo[playerid][pVang] >= soluong)
			{
				PlayerInfo[playerid][pVang] -= soluong;
				PlayerInfo[playerid][pCash] += soluong*giavang;
				format(str,sizeof(str),"Ban da ban thanh cong %d Vang voi gia %d",soluong,soluong*giavang);
				ChatHoTro(playerid,255,str,5000);
				format(str,sizeof(str),"%s da ban thanh cong %d Vang voi gia %d",GetPlayerNameEx(playerid),soluong,soluong*giavang);
				Log("logs/banda.log", str);
			}
			else return ChatHoTro(playerid,255,"Ban khong du so luong da quy de ban",5000);
		}
		else return ChatHoTro(playerid,255,"So luong phai lon hon 1",5000);
	}
	if(dialogid == 2739)
	{
		if(!response) return 1;
		if(strval(inputtext) >= 1)
		{
			new soluong = strval(inputtext);
			new str[128];
			if(PlayerInfo[playerid][pKimCuong] >= soluong)
			{
				PlayerInfo[playerid][pKimCuong] -= soluong;
				PlayerInfo[playerid][pCash] += soluong*giakimcuong;
				format(str,sizeof(str),"Ban da ban thanh cong %d Kim cuong voi gia %d",soluong,soluong*giakimcuong);
				ChatHoTro(playerid,255,str,5000);
				format(str,sizeof(str),"%s da ban thanh cong %d Kim cuong voi gia %d",GetPlayerNameEx(playerid),soluong,soluong*giakimcuong);
				Log("logs/banda.log", str);
			}
			else return ChatHoTro(playerid,255,"Ban khong du so luong da quy de ban",5000);
		}
		else return ChatHoTro(playerid,255,"So luong phai lon hon 1",5000);
	}
	if(dialogid == 2727)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pSat] >= 20 && PlayerInfo[playerid][pRuby] >=2)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(5)] = 5;
	                GivePlayerValidWeapon(playerid, 5, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay gay bong chay!");
	                PlayerInfo[playerid][pSat] -= 20;
	                PlayerInfo[playerid][pRuby] -= 2;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pSat] >= 30 && PlayerInfo[playerid][pRuby] >=3)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(6)] = 6;
	                GivePlayerValidWeapon(playerid, 6, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay xeng!");
	                PlayerInfo[playerid][pSat] -= 30;
	                PlayerInfo[playerid][pRuby] -= 3;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pSat] >= 30 && PlayerInfo[playerid][pRuby] >=3)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(7)] = 7;
	                GivePlayerValidWeapon(playerid, 7, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay gay danh bida!");
	                PlayerInfo[playerid][pSat] -= 30;
	                PlayerInfo[playerid][pRuby] -= 3;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pSat] >= 15 && PlayerInfo[playerid][pRuby] >=2)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(14)] = 14;
	                GivePlayerValidWeapon(playerid, 14, 60000);
	                PlayerInfo[playerid][pSat] -= 15;
	                PlayerInfo[playerid][pRuby] -= 2;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 4)
			{
				if(PlayerInfo[playerid][pSat] >= 30 && PlayerInfo[playerid][pRuby] >=3)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(15)] = 15;
	                GivePlayerValidWeapon(playerid, 15, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot bo hoa hong!");
	                PlayerInfo[playerid][pSat] -= 30;
	                PlayerInfo[playerid][pRuby] -= 3;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 5)
			{
				if(PlayerInfo[playerid][pSat] >= 100 && PlayerInfo[playerid][pRuby] >=10)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(8)] = 8;
	                GivePlayerValidWeapon(playerid, 8, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay kiem kata cuc ben!");
	                PlayerInfo[playerid][pSat] -= 100;
	                PlayerInfo[playerid][pRuby] -= 10;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			return 1;
		}
	}
	if(dialogid == 2728)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pSat] >= 100 && PlayerInfo[playerid][pRuby] >= 10)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(23)] = 23;
	                GivePlayerValidWeapon(playerid, 23, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung SdPistol!");
	                PlayerInfo[playerid][pSat] -= 100;
	                PlayerInfo[playerid][pRuby] -= 10;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pSat] >= 300 && PlayerInfo[playerid][pRuby] >= 50 && PlayerInfo[playerid][pVang] >= 2)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(24)] = 24;
	                GivePlayerValidWeapon(playerid, 24, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Deagle Eagle!");
	                PlayerInfo[playerid][pSat] -= 300;
	                PlayerInfo[playerid][pRuby] -= 50;
	                PlayerInfo[playerid][pVang] -= 2;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pSat] >= 200 && PlayerInfo[playerid][pRuby] >= 30 && PlayerInfo[playerid][pVang] >= 1)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(25)] = 25;
	                GivePlayerValidWeapon(playerid, 25, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Shotgun!");
	                PlayerInfo[playerid][pSat] -= 200;
	                PlayerInfo[playerid][pRuby] -= 30;
	                PlayerInfo[playerid][pVang] -= 1;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pSat] >= 300 && PlayerInfo[playerid][pRuby] >= 50 && PlayerInfo[playerid][pVang] >= 2)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(29)] = 29;
	                GivePlayerValidWeapon(playerid, 29, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung MP5!");
	                PlayerInfo[playerid][pSat] -= 300;
	                PlayerInfo[playerid][pRuby] -= 50;
	                PlayerInfo[playerid][pVang] -= 2;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 4)
			{
				if(PlayerInfo[playerid][pSat] >= 250 && PlayerInfo[playerid][pRuby] >= 30 && PlayerInfo[playerid][pVang] >= 2)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(32)] = 32;
	                GivePlayerValidWeapon(playerid, 32, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Tec9!");
	                PlayerInfo[playerid][pSat] -= 250;
	                PlayerInfo[playerid][pRuby] -= 30;
	                PlayerInfo[playerid][pVang] -= 2;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 5)
			{
				if(PlayerInfo[playerid][pSat] >= 500 && PlayerInfo[playerid][pRuby] >= 100 && PlayerInfo[playerid][pVang] >= 5)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(33)] = 33;
	                GivePlayerValidWeapon(playerid, 33, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Rifle!");
	                PlayerInfo[playerid][pSat] -= 500;
	                PlayerInfo[playerid][pRuby] -= 100;
	                PlayerInfo[playerid][pVang] -= 5;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
		}
	}
	if(dialogid == 2729)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pSat] >= 800 && PlayerInfo[playerid][pRuby] >= 300 && PlayerInfo[playerid][pVang] >= 5)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(30)] = 30;
	                GivePlayerValidWeapon(playerid, 30, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung AK-47!");
	                PlayerInfo[playerid][pSat] -= 800;
	                PlayerInfo[playerid][pRuby] -= 300;
	                PlayerInfo[playerid][pVang] -= 5;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pSat] >= 1000 && PlayerInfo[playerid][pRuby] >= 500 && PlayerInfo[playerid][pVang] >= 10 && PlayerInfo[playerid][pKimCuong] >= 1)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(31)] = 31;
	                GivePlayerValidWeapon(playerid, 31, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung M4!");
	                PlayerInfo[playerid][pSat] -= 1000;
	                PlayerInfo[playerid][pRuby] -= 500;
	                PlayerInfo[playerid][pVang] -= 10;
	                PlayerInfo[playerid][pKimCuong] -= 1;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pSat] >= 1200 && PlayerInfo[playerid][pRuby] >= 600 && PlayerInfo[playerid][pVang] >= 12 && PlayerInfo[playerid][pKimCuong] >= 1)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(27)] = 27;
	                GivePlayerValidWeapon(playerid, 27, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Spas12!");
	                PlayerInfo[playerid][pSat] -= 1200;
	                PlayerInfo[playerid][pRuby] -= 600;
	                PlayerInfo[playerid][pVang] -= 12;
	                PlayerInfo[playerid][pKimCuong] -= 1;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pSat] >= 2000 && PlayerInfo[playerid][pRuby] >= 1000 && PlayerInfo[playerid][pVang] >= 20 && PlayerInfo[playerid][pKimCuong] >= 1)
				{
	                PlayerInfo[playerid][pAGuns][GetWeaponSlot(34)] = 34;
	                GivePlayerValidWeapon(playerid, 34, 60000);
	                SendClientMessageEx(playerid,-1,"Ban da nhan duoc mot cay sung Sniper Rifle!");
	                PlayerInfo[playerid][pSat] -= 2000;
	                PlayerInfo[playerid][pRuby] -= 1000;
	                PlayerInfo[playerid][pVang] -= 20;
	                PlayerInfo[playerid][pKimCuong] -= 1;
	                return 1;
				}
				else return SendClientMessageEx(playerid,-1,"Ban khong du khoang san de che bien!");
			}
		}
	}
	if(dialogid == 2730)
	{
	    new string[200];
		if(response)
		{
			if(listitem == 0)
			{
				format(string, sizeof(string), "Trao Doi Vat Pham\tLa can sa\tPot\tCrack\nVat Pham: 10 Bich Pot\t300\t0\t0\nVat Pham: 10 Bich Crack\t200\t10\t0\nVat Pham: 4,000 Tien Ban\t500\t0\t0\nVat Pham: 1 Hat Giong\t100\t0\t0");
				return ShowPlayerDialog(playerid,2731,DIALOG_STYLE_TABLIST_HEADERS,"Trao Doi Vat Pham",string,"Trao Doi","Huy bo");
			}
			return 1;
		}
	}
	if(dialogid == 2731)
	{
	    if(response)
	    {
            if(listitem == 0)
			{
				if(PlayerInfo[playerid][pCansap] >= 300)
				{
                    PlayerInfo[playerid][pPot] += 10;
	                SendClientMessageEx(playerid,-1,"[Trao Doi] Ban da trao doi thanh cong vat pham 10 bich Pot!");
	                PlayerInfo[playerid][pCansap] -= 300;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du la can sa de trao doi!");
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pCansap] >= 200 && PlayerInfo[playerid][pPot] >=10)
				{
				    PlayerInfo[playerid][pCrack] += 10;
	                SendClientMessageEx(playerid,-1,"[Trao Doi]Ban da trao doi thanh cong vat pham 10 bich Crack!");
	                PlayerInfo[playerid][pCansap] -= 200;
	                PlayerInfo[playerid][pPot] -= 10;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du nguyen lieu de trao doi Crack!");
			}
			if(listitem == 2)
			{
				if(PlayerInfo[playerid][pCansap] >= 500)
				{
				    PlayerInfo[playerid][pTienBan] += 4000;
	                SendClientMessageEx(playerid,-1,"[Trao Doi]Ban da trao doi thanh cong vat pham 4,000$ Tien Ban!");
	                PlayerInfo[playerid][pCansap] -= 500;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du nguyen lieu de trao doi Tien Ban!");
			}
			if(listitem == 3)
			{
				if(PlayerInfo[playerid][pCansap] >= 100)
				{
				    PlayerInfo[playerid][pHatGiong] += 1;
	                SendClientMessageEx(playerid,-1,"[Trao Doi]Ban da trao doi thanh cong vat pham 1 Hat Giong!");
	                PlayerInfo[playerid][pCansap] -= 100;
	                return 1;
				}
				else SendClientMessageEx(playerid,-1,"Ban khong du nguyen lieu de trao doi hat giong!");
			}
			return 1;
		}
	}
	if(dialogid == DIALOG_KHAITHAC)
    {
        if(response)
        {
            if(listitem == 0)
            {
				ShowPlayerDialog(playerid, CHAPNHANCONGVIEC, DIALOG_STYLE_MSGBOX, "Cong viec", "Ban co chac chan rang muon nhan cong viec nay hay khong", "Co", "Khong");
		        return cmd_xinviec(playerid, "");
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pJob] == 22 || PlayerInfo[playerid][pJob2] == 22)
				{
					if(dalayxeminer[playerid] == 1)
						return SendClientMessage(playerid,COLOR_GREY,"[{6699CC}MINER{FFFFFF}]: Ban da thue mot chiec xe miner,vui long lai npc de cat xe");
					new lights,alarm,bonnet,objective;
					MinerOwner[playerid][Player_Vehicle_MINER] = CreateVehicle(422,2276.127,-2202.502,13.540, -1, -1, -1, 0);
//					new str[1280];
					//format(str,sizeof(str),"{6699CC}Miner{FFFFFF}\nPhuong tien cua {6699CC}%s.", GetPlayerNameEx(playerid));
					//Text3DMiner[playerid] = CreateDynamic3DTextLabel(str, 0xFFFFFFAA, 0, 0, 0.3, 30, .attachedvehicle = MinerOwner[playerid][Player_Vehicle_MINER]);
					dalayxeminer[playerid] = 1;
					SendClientMessageEx(playerid, -1,"{6699CC}MINER{FFFFFF}: Ban da lay mot xe miner");
					PutPlayerInVehicle(playerid, MinerOwner[playerid][Player_Vehicle_MINER], 0);
					SetVehicleParamsEx(MinerOwner[playerid][Player_Vehicle_MINER],VEHICLE_PARAMS_OFF,lights,alarm,0,bonnet,0,objective);
					SendClientMessage(playerid, -1, "{6699CC}MINER{FFFFFF}: Neu het xang hay /bomxangminer de bom xang cho phuong tien cua minh nhe");
					new vehicleid = GetPlayerVehicleID(playerid);
					Vehicle_ResetData(vehicleid);
					VehicleFuel[vehicleid] += 1000.0;
					SetPlayerCheckpoint(playerid,998.397339,-2161.573486,13.093750,2.0);
	                CP[playerid] = 1;
	                timduong[playerid] = 1;
					PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
					SendClientMessageEx(playerid,-1,"{6699CC}MINER{FFFFFF}: Hay di theo cham do tren ban do de den noi lam viec");
					return 1;
			}
			return SendClientMessageEx(playerid,-1,"Ban khong phai nguoi Miner.");
        	}
        	if(listitem == 2)
			{
					if(MinerOwner[playerid][Player_Vehicle_MINER] != INVALID_VEHICLE_ID)
					{
						new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
						new soluong = Stone_SoLuong[xecuatoi]-1;
						while(soluong >= 0)
						{
					        DestroyDynamicObject(Stone_Obj[xecuatoi][soluong]);
					        Stone_Obj[xecuatoi][soluong] = CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
					        Stone_SoLuong[xecuatoi]--;
							soluong--;
						}
						DestroyDynamic3DTextLabel(Text3DMiner[playerid]);
						Player_Item[playerid] = 0;
						SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
						RemovePlayerAttachedObject(playerid, 9);
						dalayxeminer[playerid] = 0;
						Stone_SoLuong[MinerOwner[playerid][Player_Vehicle_MINER]] = 0;
						DestroyVehicle(MinerOwner[playerid][Player_Vehicle_MINER]);
						MinerOwner[playerid][Player_Vehicle_MINER] = INVALID_VEHICLE_ID;
						SendClientMessageEx(playerid,COLOR_WHITE,"{6699CC}MINER{FFFFFF}: Ban da tra xe Miner");
					}
				else return SendClientMessageEx(playerid,COLOR_YELLOW,"{6699CC}MINER{FFFFFF}: Ban khong co xe Miner nao.");
			}
        }
    }
	return 1;
}


/* ========= Functions ========= */
forward CreateStone(i_Stone);
forward OnPlayerCompleteDaoda(playerid, iStone);
/* ===== Public Func ===== */
public CreateStone(i_Stone) {

	new modelid = 3929;
	daoda[i_Stone][dd_Attacked_Player] = INVALID_PLAYER_ID;

	SetStonePostion(i_Stone, Stone_Default[i_Stone][0], Stone_Default[i_Stone][1], Stone_Default[i_Stone][2]);
	daoda[i_Stone][dd_Stone] = CreateObject(modelid, Stone_Default[i_Stone][0], Stone_Default[i_Stone][1], Stone_Default[i_Stone][2], 0,0,0);
	return 1;
}
public OnPlayerCompleteDaoda(playerid, iStone) {

	if(IsPlayerInRangeOfPoint(playerid, 2.5, daoda[iStone][dd_Cro][0],daoda[iStone][dd_Cro][1],daoda[iStone][dd_Cro][2])) {
		GetFrogKidPos(playerid);
		TogglePlayerControllable(playerid, 1);
		//RemovePlayerAttachedObject(playerid, 9);
		SetStoneAttacked(iStone, INVALID_PLAYER_ID);
		char_daoda[playerid][Player_Attack_Stone] = INVALID_STONE;


		SetStonePostion(iStone, -1,-1,-1);

		DestroyObject(daoda[iStone][dd_Stone]);



		SetTimerEx("CreateStone", 60000*20, 0, "d", iStone); // Respawn da

		Player_Item[playerid] = 3930;

		RemovePlayerAttachedObject(playerid, 1);
		SetPlayerAttachedObject(playerid, 9, 3930, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
		ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 1, 0, 0, 0, 0);
		// await task_ms(1500);
		SetTimerEx("DaoDaXong", 1500, false, "d", playerid);
	}
	return 1;
}
forward DaoDaXong(playerid);
public DaoDaXong(playerid)
{
	ClearAnimations(playerid);
	PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
	char_daoda[playerid][Player_Stone_Count]++;
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
}
/* ===== Plain Func ===== */
SetStonePostion(i_Stone, Float:X,Float:Y,Float:Z) {
	daoda[i_Stone][dd_Cro][0] = X;
	daoda[i_Stone][dd_Cro][1] = Y;
	daoda[i_Stone][dd_Cro][2] = Z;
	return 1;
}
SetStoneAttacked(i_Stone, i = INVALID_PLAYER_ID) {
	daoda[i_Stone][dd_Attacked_Player] = i;
	return 1;
}

/* ===== Stock Func ===== */
stock IsPlayerRangeStone(playerid, Float:range) {
	new i = 0;
	LOOP:(i, MAX_STONES) {
		if(IsPlayerInRangeOfPoint(playerid, range, daoda[i][dd_Cro][0],daoda[i][dd_Cro][1],daoda[i][dd_Cro][2])) {
			return i; // tra ve object neu co cay ke ben
		}
	}
	return INVALID_STONE;
}
stock CheckPlayerdd_Invalid(playerid) {
	new i = 0;
	LOOP:(i, 99) {
		if(char_daoda[playerid][Player_Object_DYNS][i] == INVALID_OBJECT_ID) {
			return i;
		}
	}
	return -1;
}


stock UpdateDa()
{
    new string[1024],stime[64];
    foreach(new playerid: Player)
	{
	    if(gPlayerLogged{playerid} != 0)
	    {
	        if(PlayerInfo[playerid][pKhoangSan] == 0)
	        {
	            Time_Da[playerid] = 0;
	        }
	        if(PlayerInfo[playerid][pKhoangSan] > 0 && Time_Da[playerid] < 30)
	        {
	            Time_Da[playerid]++;
	            //HeThongDa = 1;
	        }
	        if(PlayerInfo[playerid][pKhoangSan] > 0 && Time_Da[playerid] == 30)
			{
                PlayerInfo[playerid][pKhoangSan]--;
                PlayerInfo[playerid][pKhoangSans] += 20;
                Time_Da[playerid] = 0;
	        }
	        if(PlayerInfo[playerid][pKhoangSans] == 0)
	        {
	            Time_Da2[playerid] = 0;
	        }
	        if(PlayerInfo[playerid][pKhoangSans] > 0 && Time_Da2[playerid] < 6)
	        {
	            Time_Da2[playerid]++;
	            //HeThongDa = 1;
	        }
	        if(PlayerInfo[playerid][pKhoangSans] > 0 && Time_Da2[playerid] == 6)
			{
                PlayerInfo[playerid][pKhoangSans]--;
                new a = GetPVarInt(playerid,"kl_sat");
                new c = GetPVarInt(playerid,"kl_ruby");
                new e = GetPVarInt(playerid,"kl_vang");
                new f = GetPVarInt(playerid,"kl_kimcuong");
				switch(random(100))
				{
					case 0..30:{}
					case 41..70:		SetPVarInt(playerid,"kl_sat",a+1);
					case 71..75:
					{
					    switch(random(10))
					    {
							case 5:	SetPVarInt(playerid,"kl_vang",e+1);
							default:
							{

							}
				        }
				    }
				    case 76..80:
				    {
				        switch(random(300))
					    {
							case 234:	SetPVarInt(playerid,"kl_kimcuong",f+1);
							default:
							{

							}
				        }
				    }
					case 81..95:		SetPVarInt(playerid,"kl_ruby",c+1);
				}
                Time_Da2[playerid] = 0;
	        }
	    }
	}
	if(OW_Da[0] == -1)
	{
	    SetDynamicObjectMaterialText(TV_Da[0], 1, "GO-RP.NET", 80, "Arial", 30, 1, 0xFF6C78D8, 0xFF070A27, 1);
	}
    if(OW_Da[0] != -1)
	{
	    for(new i = Time_Da[OW_Da[0]]; i < 30; i++)
	    {
	    	format(stime,64,"%s_",stime);
	    }
	    new a = GetPVarInt(OW_Da[0],"kl_sat");
        new c = GetPVarInt(OW_Da[0],"kl_ruby");
        new e = GetPVarInt(OW_Da[0],"kl_vang");
        new f = GetPVarInt(OW_Da[0],"kl_kimcuong");
		format(string,1024,"{FFFFFF}%s ( KS %d / KSV %d )\n{D9364E}%s\n{96b48f}Sat: %d, {D9364E}Ruby: %d, {fff400}Vang: %d, {00ffdf}Kim Cuong: %d",GetPlayerNameEx(OW_Da[0]),PlayerInfo[OW_Da[0]][pKhoangSan],PlayerInfo[OW_Da[0]][pKhoangSans],stime,a,c,e,f);
		SetDynamicObjectMaterialText(TV_Da[0], 1, string, 80, "Arial", 11, 1, 0xFF6C78D8, 0xFF070A27, 1);
	}
    for(new i; i < 30; i++)
	{
	    new Float: x, Float: y, Float: z;
	    GetDynamicObjectPos(Object_Da[i], x, y, z);
	    if(Model_Da[i] == 1)
	    {
	        SetDynamicObjectPos(Object_Da[i], Pos_Da[0][0], Pos_Da[0][1], Pos_Da[0][2]);
	        MoveDynamicObject(Object_Da[i], Pos_Da[1][0], Pos_Da[1][1], Pos_Da[1][2], 5);
	        Model_Da[i] = 2;
	    }
	    else if(Model_Da[i] == 2 && x == 2152.3960)
		{
	        MoveDynamicObject(Object_Da[i], Pos_Da[2][0], Pos_Da[2][1], Pos_Da[2][2], 5);
	        Model_Da[i] = 3;
	    }
	    else if(Model_Da[i] == 3 && x == 2152.3960)
		{
	        MoveDynamicObject(Object_Da[i], Pos_Da[3][0], Pos_Da[3][1], Pos_Da[3][2], 5);
	        Model_Da[i] = 4;
	    }
	    else if(Model_Da[i] == 4 &&  x == 2168.5693)
	    {
		    foreach(new playerid: Player)
			{
				if(Mysql_Da[i] == GetPlayerSQLId(playerid))
				{
				    PlayerInfo[playerid][pKhoangSan]++;
				}
			}
	        MoveDynamicObject(Object_Da[i], Pos_Da[4][0], Pos_Da[4][1], Pos_Da[4][2], 5);
	        Model_Da[i] = 0;
	    }
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1218.2343,-1655.2817,11.9512))
		{
			new str[300];
			format(str,sizeof(str),"Da quy\tSo luong\tGia thi truong\nRuby\t%d\t$%d\nVang\t%d\t$%d\nKim cuong\t%d\t$%d",
									PlayerInfo[playerid][pRuby],giaruby,PlayerInfo[playerid][pVang],giavang,PlayerInfo[playerid][pKimCuong],giakimcuong);
			ShowPlayerDialog(playerid,2735,DIALOG_STYLE_TABLIST_HEADERS,"Thu mua da quy",str,"Chon","Huy");
		}
	}
    if(newkeys == KEY_YES)
	{
    	if(OW_Da[0] != playerid)
    	{
		    if(!IsPlayerInAnyVehicle(playerid) && IsPlayerInRangeOfPoint(playerid, 1.0,2169.446289, -2256.653808,13.703557))
		    {
	    		SendClientMessageEx(playerid,-1,"Ban da bat man hinh len!");
		    	ApplyAnimation(playerid,"POLICE", "CopTraf_Stop", 4.0, 0, 0, 0, 0, 2000, 1);
				OW_Da[0] = playerid;
			}
		}
	    else if(OW_Da[0] == playerid)
	    {
		    if(!IsPlayerInAnyVehicle(playerid) && IsPlayerInRangeOfPoint(playerid, 3.0,2171.5085,-2255.1133,13.3037))
		    {
		        new string[128];
		        new a = GetPVarInt(playerid,"kl_sat");
	            new c = GetPVarInt(playerid,"kl_ruby");
	            new e = GetPVarInt(playerid,"kl_vang");
	            new f = GetPVarInt(playerid,"kl_kimcuong");
	            format(string,128,"{FFFFFF}+Sat: %d, +Ruby: %d, +Vang: %d, +Kim Cuong: %d", a, c, e, f);
				//new s;
				if(a > 0)
				{
			    	PlayerInfo[playerid][pSat] += a;
			    	DeletePVar(playerid,"kl_sat");
				}
				if(c > 0)
				{
					PlayerInfo[playerid][pRuby] += c;
			    	DeletePVar(playerid,"kl_ruby");
				}
			  	if(e > 0)
				{
			    	PlayerInfo[playerid][pVang] += e;
			    	DeletePVar(playerid,"kl_vang");
			  	}
			  	if(f > 0)
				{
			    	PlayerInfo[playerid][pKimCuong] += f;
			    	DeletePVar(playerid,"kl_kimcuong");
			  	}
			  	if(a > 0 || c > 0 || e > 0 || f > 0)
			  	{
			  		SendClientMessageEx(playerid,-1,string);
			  		format(string,128,"%s da thu thap: +Sat: %d, +Ruby: %d, +Vang: %d, +Kim Cuong: %d", GetPlayerNameEx(playerid),a, c, e, f);
			  		Log("logs/layda.log", string);
			    }
			}
		}
	}

	if(newkeys & KEY_YES)
	{
		new closestcar = GetClosestCar(playerid);
		if(Player_Item[playerid] == 3930)
		{
			if(GetVehicleModel(closestcar) == 422)
			{
				if(closestcar == MinerOwner[playerid][Player_Vehicle_MINER])
				{
					new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
					//SendClientMessage(playerid,-1,"Thanh cong");
					new soluong = Stone_SoLuong[closestcar];
				    new Float:Pos[3],Float:posplayer[3];
				    GetVehiclePos(xecuatoi, Pos[0], Pos[1], Pos[2]);
				    GetPlayerPos(playerid,posplayer[0],posplayer[1],posplayer[2]);
				    //SendClientMessage(playerid, -1,"%d",closestcar);
				    if(IsPlayerInRangeOfPoint(playerid, 3.0, Pos[0], Pos[1], Pos[2]))
					{
						//SendClientMessage(playerid,-1,"Den day roi.");
				        if(Stone_SoLuong[closestcar] < 5)
				        {
					        if(soluong == 5) return 1;
					        //Angle = Angle2D(posplayer, Pos);
						    //SetPlayerFacingAngle(playerid, Angle);
				            RemovePlayerAttachedObject(playerid, 9);
				            ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
				            Stone_Obj[xecuatoi][soluong] = CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
				            AttachDynamicObjectToVehicle(Stone_Obj[xecuatoi][soluong], xecuatoi, poschoda[soluong][0], poschoda[soluong][1], poschoda[soluong][2], 0.0, 0.0, 0.0);
					        new virtual = GetPlayerVirtualWorld(playerid);
					        SetVehicleVirtualWorld(xecuatoi, virtual+1);
					        SetVehicleVirtualWorld(xecuatoi, virtual);
							Stone_SoLuong[xecuatoi]++;
					    	Player_Item[playerid] = 0;
					    	await task_ms(1000);

					    	ClearAnimations(playerid);
					    	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
						}
						else SendClientMessage(playerid,-1,"{6699CC}MINER{FFFFFF}: Da cua ban da day xe");
					}
				}
				else return SendClientMessageEx(playerid,-1,"Day khong phai xe cua ban.");
			}
		}
		else if(Player_Item[playerid] == 0 && PlayerInfo[playerid][pJob] == 22 || Player_Item[playerid] == 0 && PlayerInfo[playerid][pJob2] == 22)
		{
			if(IsPlayerInRangeOfPoint(playerid,150.0,981.8808,-2140.5085,13.0938))
			{
				new soluong = Stone_SoLuong[MinerOwner[playerid][Player_Vehicle_MINER]];
				new iStone = IsPlayerRangeStone(playerid, 1.7);
				if(soluong >= 5) return SendClientMessageEx(playerid,-1, "{6699CC}MINER{FFFFFF}: Xe cua ban da day, hay dem nhung cuc da di che bien");
				if(iStone == INVALID_STONE) { // Khong dung gan cay nao
					//SendClientMessage(playerid, -1, "[{ccccff}Dao da{ffffff}]: Ban khong dung gan cuc da nao!");
				}
				if(Player_Item[playerid] == 3930)
				{
					return SendClientMessage(playerid, -1, "{6699CC}MINER{FFFFFF}: Ban phai chat da len xe moi co the dao tiep!");
				}
				else { // Da xac nhan duoc cay
					if(daoda[iStone][dd_Attacked_Player] != INVALID_PLAYER_ID) { // Kiem tra cay da bi tan cong chua
						// '!=' Thuoc da co nguoi tan cong
						new name[32],string[128];
						GetPlayerName(daoda[iStone][dd_Attacked_Player], name, 32); // Lay ten cua nguoi so huu
						format(string, 128, "{6699CC}MINER{FFFFFF}: Da nay dang bi %s khai thac", name);
						SendClientMessage(playerid, -1, string);
					}
					else { // Else thuoc cay chua co nguoi so huu
						if(char_daoda[playerid][Player_Attack_Stone] != INVALID_STONE) { // Kiem tra nguoi choi co so huu cay nao khong
							// '!=' Thuoc dang tan cong
							SendClientMessage(playerid, -1, "{6699CC}MINER{FFFFFF}: Ban dang dao mot cuc da khac!");
						}
						else { // Nguoi choi khong cua cay
							if(IsPlayerInAnyVehicle(playerid)) { // Tren xe khong duoc chat
								SendClientMessage(playerid, -1, "{6699CC}MINER{FFFFFF}: Ban phai xuong xe de dao da!");
							}
							else { // Bat dau cua cay, da thoa mang dieu kien
								SetStoneAttacked(iStone, playerid); // Set cay da co nguoi cua
								char_daoda[playerid][Player_Attack_Stone] = iStone; // Luu tru bien

								for(new i=0; i<MAX_PLAYER_ATTACHED_OBJECTS; i++)
								{
									if(IsPlayerAttachedObjectSlotUsed(playerid, i)) RemovePlayerAttachedObject(playerid, i);
								}
								SetPlayerArmedWeapon(playerid, 0);
								ClearAnimations(playerid);
								TogglePlayerControllable(playerid, 0);
								//SetPlayerAttachedObject(playerid, 9, 341, 6);
								//SetPlayerAttachedObject(playerid, 1, 2237, 6, 0.443999, 0.060999, -0.007999, -128.6, 173.7, -85.5, 1.0, 1.0, 1.0);

								char_daoda[playerid][PlayerTime_daoda] = SetTimerEx("OnPlayerCompleteDaoda", DAODAZZ*10000, 0, "dd", playerid, iStone);
								SetPlayerAttachedObject(playerid, 1, 2237, 6,0.086999,-0.063999,0.000000,0.000000,-160.799942,0.000000,1.000000,1.000000,1.000000);
								ApplyAnimation(playerid, "SWORD", "sword_4", 4.0999, 1, 0, 0, 0, 0);
								LoaderStarting(playerid, DAODAZZ, "Dang Dao Da...", 0.5,  DAODAZZ*10000);
							//	printf("DEBUG: Tree%d", iStone);
							}
						}
					}
				}
			}
		}
	}
	if(newkeys & KEY_WALK)
	{
		cmd_chebien(playerid);
	}
	if(newkeys & KEY_WALK)
	{
		// cmd_chebien(playerid);
		cmd_laydazz(playerid);
	}
 	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 2284.5396,-2211.0012,13.5469))
		{
			return ShowPlayerDialog(playerid, DIALOG_KHAITHAC, DIALOG_STYLE_LIST, "> Miner", "Xin viec\nLay xe\nTra xe", "Chon","Huy");
		}
 	}
	return 1;
}

CMD:laydazz(playerid)
{
	new closestcar = GetClosestCar(playerid);
	new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
	new Float:Pos[3],Float:posplayer[3];
	GetVehiclePos(xecuatoi, Pos[0], Pos[1], Pos[2]);
	GetPlayerPos(playerid,posplayer[0],posplayer[1],posplayer[2]);
	if(IsPlayerInRangeOfPoint(playerid, 3.0, Pos[0], Pos[1], Pos[2]))
	{
		if(closestcar == xecuatoi)
		{
			new soluong = Stone_SoLuong[xecuatoi]-1;
			if(soluong >= 0)
			{
	            if(Player_Item[playerid] != 3930)
	            {
				    //Angle = Angle2D(posplayer, Pos);
				    //SetPlayerFacingAngle(playerid, Angle);
			        ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, 0, 1, 1, 1, 0, 1);
			        SetPlayerAttachedObject(playerid, 9, 3930, 6, 0.23, 0.053, -0.10, 69.2, -171.5, -12.3, 1.013, 0.946, 0.791, 0, 0);
			        DestroyDynamicObject(Stone_Obj[xecuatoi][soluong]);
			        new virtual = GetPlayerVirtualWorld(playerid);
			        //SetVehicleVirtualWorld(xecuatoi, virtual+1);
			        SetVehicleVirtualWorld(xecuatoi, virtual);
			        Stone_Obj[xecuatoi][soluong] = CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
			        Stone_SoLuong[xecuatoi]--;
			        Player_Item[playerid] = 3930;
			        ChatHoTro(playerid,255,"Dang lay da tren xe...",5000);

			        await task_ms(1000);
			        ClearAnimations(playerid);
			        TogglePlayerControllable(playerid, 1);
			        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
				}
			}
	 	}
	}
	return 1;
}

CMD:duakhoangsan(playerid,params[])
{
	new ks[32],giveplayerid,string[128],soluong;
	if(sscanf(params, "us[32]d", giveplayerid, ks, soluong))
	{
		SendClientMessageEx(playerid,COLOR_GREY,"Su dung: /duakhoangsan [player] [ten khoang san] [so luong]");
		SendClientMessageEx(playerid,COLOR_GREY,"sat, ruby, vang, kimcuong");
		return 1;
	}
    if(IsPlayerConnected(giveplayerid)) {
        if(giveplayerid != INVALID_PLAYER_ID)
        {
        	if(soluong < 1) return SendClientMessageEx(playerid,-1,"Khong duoc khong duoc!");
        	if(strcmp(ks, "sat", true) == 0)
        	{
        		if(PlayerInfo[playerid][pSat] >= soluong)
        		{
	        		PlayerInfo[playerid][pSat] -= soluong;
	        		PlayerInfo[giveplayerid][pSat] += soluong;
					format(string, sizeof(string), "Ban da nhan duoc %d Sat tu %s.", soluong, GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
					new ip[32], ipex[32];
					GetPlayerIp(playerid, ip, sizeof(ip));
					GetPlayerIp(giveplayerid, ipex, sizeof(ipex));
					format(string, sizeof(string), "%s(IP:%s) da cho %s (IP:%s) %d Sat.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(giveplayerid), ipex, number_format(soluong));
					Log("logs/pay.log", string);
					format(string, sizeof(string), "Ban da cho %s %d Sat(s).", GetPlayerNameEx(giveplayerid), soluong);
					SendClientMessageEx(playerid, COLOR_GRAD2, string);
					format(string, sizeof(string), "* %s da cho %s mot so luong Sat.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    	    	}
    	    	else return SendClientMessageEx(playerid,-1,"Ban khong du so luong.");
        	}
        	if(strcmp(ks, "ruby", true) == 0)
        	{
        		if(PlayerInfo[playerid][pRuby] >= soluong)
        		{
	        		PlayerInfo[playerid][pRuby] -= soluong;
	        		PlayerInfo[giveplayerid][pRuby] += soluong;
					format(string, sizeof(string), "Ban da nhan duoc %d Ruby tu %s.", soluong, GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
					new ip[32], ipex[32];
					GetPlayerIp(playerid, ip, sizeof(ip));
					GetPlayerIp(giveplayerid, ipex, sizeof(ipex));
					format(string, sizeof(string), "%s(IP:%s) da cho %s (IP:%s) %d Ruby.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(giveplayerid), ipex, number_format(soluong));
					Log("logs/pay.log", string);
					format(string, sizeof(string), "Ban da cho %s %d Ruby(s).", GetPlayerNameEx(giveplayerid), soluong);
					SendClientMessageEx(playerid, COLOR_GRAD2, string);
					format(string, sizeof(string), "* %s da cho %s mot so luong Ruby.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        		}
        		else return SendClientMessageEx(playerid,-1,"Ban khong du so luong.");
        	}
        	if(strcmp(ks, "vang", true) == 0)
        	{
        		if(PlayerInfo[playerid][pVang] >= soluong)
        		{
	        		PlayerInfo[playerid][pVang] -= soluong;
	        		PlayerInfo[giveplayerid][pVang] += soluong;
					format(string, sizeof(string), "Ban da nhan duoc %d Vang tu %s.", soluong, GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
					new ip[32], ipex[32];
					GetPlayerIp(playerid, ip, sizeof(ip));
					GetPlayerIp(giveplayerid, ipex, sizeof(ipex));
					format(string, sizeof(string), "%s(IP:%s) da cho %s (IP:%s) %d Vang.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(giveplayerid), ipex, number_format(soluong));
					Log("logs/pay.log", string);
					format(string, sizeof(string), "Ban da cho %s %d Vang(s).", GetPlayerNameEx(giveplayerid), soluong);
					SendClientMessageEx(playerid, COLOR_GRAD2, string);
					format(string, sizeof(string), "* %s da cho %s mot so luong Vang.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        		}
        		else return SendClientMessageEx(playerid,-1,"Ban khong du so luong.");
        	}
        	if(strcmp(ks, "kimcuong", true) == 0)
        	{
        		if(PlayerInfo[playerid][pKimCuong] >= soluong)
        		{
	        		PlayerInfo[playerid][pKimCuong] -= soluong;
	        		PlayerInfo[giveplayerid][pKimCuong] += soluong;
					format(string, sizeof(string), "Ban da nhan duoc %d Kim cuong tu %s.", soluong, GetPlayerNameEx(playerid));
					SendClientMessageEx(giveplayerid, COLOR_GRAD2, string);
					new ip[32], ipex[32];
					GetPlayerIp(playerid, ip, sizeof(ip));
					GetPlayerIp(giveplayerid, ipex, sizeof(ipex));
					format(string, sizeof(string), "%s(IP:%s) da cho %s (IP:%s) %d Kim cuong.", GetPlayerNameEx(playerid), ip, GetPlayerNameEx(giveplayerid), ipex, number_format(soluong));
					Log("logs/pay.log", string);
					format(string, sizeof(string), "Ban da cho %s %d Kim cuong(s).", GetPlayerNameEx(giveplayerid), soluong);
					SendClientMessageEx(playerid, COLOR_GRAD2, string);
					format(string, sizeof(string), "* %s da cho %s mot so luong Kim cuong.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
      			}
      			else return SendClientMessageEx(playerid,-1,"Ban khong du so luong.");
        	}
        }
        else return SendClientMessageEx(playerid,-1,"Nguoi choi do khong ton tai!");
    }

	return 1;
}

CMD:traxeminerzxzxzx(playerid,params[])
{
	if(MinerOwner[playerid][Player_Vehicle_MINER] != INVALID_VEHICLE_ID)
	{
		new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
		new soluong = Stone_SoLuong[xecuatoi]-1;
		while(soluong >= 0)
		{
	        DestroyDynamicObject(Stone_Obj[xecuatoi][soluong]);
	        Stone_Obj[xecuatoi][soluong] = CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
	        Stone_SoLuong[xecuatoi]--;
			soluong--;
		}
		DestroyDynamic3DTextLabel(Text3DMiner[playerid]);
		Player_Item[playerid] = 0;
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(playerid, 9);
		dalayxeminer[playerid] = 0;
		Stone_SoLuong[MinerOwner[playerid][Player_Vehicle_MINER]] = 0;
		DestroyVehicle(MinerOwner[playerid][Player_Vehicle_MINER]);
		MinerOwner[playerid][Player_Vehicle_MINER] = INVALID_VEHICLE_ID;
		SendClientMessageEx(playerid,COLOR_LIGHTRED,"Ban da tra xe Miner");
	}
	else return SendClientMessageEx(playerid,COLOR_YELLOW,"Ban khong co xe Miner nao.");
	return 1;
}

CMD:checkkhoangsan(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /checkkhoangsan [player]");
		if(IsPlayerConnected(giveplayerid))
		{
			new string[128];
			format(string, 128, "So Luong Sat: %d", PlayerInfo[giveplayerid][pSat]);
			SendClientMessage(playerid, -1, string);
			format(string, 128, "So Luong Vang: %d", PlayerInfo[giveplayerid][pVang]);
			SendClientMessage(playerid, -1, string);
			format(string, 128, "So Luong Ruby: %d", PlayerInfo[giveplayerid][pRuby]);
			SendClientMessage(playerid, -1, string);
			format(string, 128, "So Luong Kim Cuong: %d", PlayerInfo[giveplayerid][pKimCuong]);
			SendClientMessage(playerid, -1, string);
		    return 1;
		}
		else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
	}
	else SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	return 1;
}

CMD:khoangsan(playerid,params[])
{
	new string[128];
	format(string, 128, "So Luong Sat: %d", PlayerInfo[playerid][pSat]);
	SendClientMessage(playerid, -1, string);
	format(string, 128, "So Luong Vang: %d", PlayerInfo[playerid][pVang]);
	SendClientMessage(playerid, -1, string);
	format(string, 128, "So Luong Ruby: %d", PlayerInfo[playerid][pRuby]);
	SendClientMessage(playerid, -1, string);
	format(string, 128, "So Luong Kim Cuong: %d", PlayerInfo[playerid][pKimCuong]);
	SendClientMessage(playerid, -1, string);
	return 1;
}


CMD:chebien(playerid)
{
	new Float:posplayer[3],Float:pos[3];
	new closestcar = GetClosestCar(playerid);
	GetVehiclePos(closestcar, pos[0], pos[1], pos[2]);
	GetPlayerPos(playerid,posplayer[0],posplayer[1],posplayer[2]);
	if(Player_Item[playerid] == 3930 && !IsPlayerInRangeOfPoint(playerid, 2.0, pos[0], pos[1], pos[2]))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 4.0, 2133.9241,-2261.0215,14.7771))
	    {
	        RemovePlayerAttachedObject(playerid, 9);
			ApplyAnimation(playerid,"CARRY", "putdwn", 4.1, 0, 1, 1, 1, 0, 1);
			Player_Item[playerid] = 0;
			ChatHoTro(playerid,255,"Dang dua da vao may che bien...",5000);

			for(new i; i < 30; i++)
			{
			    if(Model_Da[i] == 0)
			    {
			    	await task_ms(1000);
					ClearAnimations(playerid);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			        Model_Da[i] = 1;
			        Mysql_Da[i] = GetPlayerSQLId(playerid);
			        return 1;
			    }
			}
	    }
	}
	return 1;
}
/*
CMD:bomxangminer(playerid,params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(MinerOwner[playerid][Player_Vehicle_MINER] == vehicleid)
		{
			VehicleFuel[vehicleid] = VehicleFuel[vehicleid] + 100.0;
			if(VehicleFuel[vehicleid] > 100.0) VehicleFuel[vehicleid] = 100.0;
			SendClientMessage(playerid, -1, "Ban da bom xang cho phuong tien cua ban");
		}
		else return SendClientMessage(playerid, -1, "Ban khong so huu phuong tien nao");
	}
	SendClientMessage(playerid, COLOR_GREY,"Ban can den cay xang de do xang!");
	return 1;
}	
*/
CMD:vutda(playerid,params[])
{
	if(Player_Item[playerid] == 3930)
	{
		RemovePlayerAttachedObject(playerid, 9);
		ApplyAnimation(playerid,"CARRY", "putdwn", 4.1, 0, 1, 1, 1, 0, 1);
		Player_Item[playerid] = 0;
		await task_ms(1000);
		ClearAnimations(playerid);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
	}
	else return SendClientMessageEx(playerid,-1,"Ban khong cam cuc da nao");
	return 1;
}
CMD:lockxeminer(playerid,params)
{
	//new closetcar = GetClosestCar(playerid);
	new Float:vpos[3];
	if(MinerOwner[playerid][Player_Vehicle_MINER] == INVALID_VEHICLE_ID) return ChatHoTro(playerid,255,"Ban khong co xe miner!",5000);
	new xecuatoi = MinerOwner[playerid][Player_Vehicle_MINER];
	GetVehiclePos(xecuatoi,vpos[0],vpos[1],vpos[2]);
	if(IsPlayerInRangeOfPoint(playerid,5.0,vpos[0],vpos[1],vpos[2]))
	{
		new engine,lights,alarm,doors,bonnet,boot,objective;
		GetVehicleParamsEx(xecuatoi,engine,lights,alarm,doors,bonnet,boot,objective);
		if(doors == VEHICLE_PARAMS_ON)
		{
			vehicle_unlock_doors(xecuatoi);
			ChatHoTro(playerid,255,"Ban da ~r~mo ~w~khoa xe cua ban",5000);
			SetVehicleVirtualWorld(xecuatoi,GetPlayerVirtualWorld(playerid));
		}
		else{
			vehicle_lock_doors(xecuatoi);
			ChatHoTro(playerid,255,"Ban da ~r~dong ~w~khoa xe cua ban",5000);
			SetVehicleVirtualWorld(xecuatoi,GetPlayerVirtualWorld(playerid));
		}
	}
	//else ChatHoTro(playerid,255,"Ban khong o gan chiec xe cua ban",5000);
	return 1;
}
/*CMD:vutda(playerid,params[])
{
	new Float:pos[3];
	if(Player_Item[playerid] == 3930)
	{
		GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
		RemovePlayerAttachedObject(playerid, 9);
		ApplyAnimation(playerid,"CARRY", "putdwn", 4.1, 0, 1, 1, 1, 0, 1);
		Player_Item[playerid] = 0;
		CreateDynamicObject(3930,0.0, -500.0, -500, 0.0, 0.0, 0.0);
	}
}*/

task UpdateKs[1000]()
{
	UpdateDa();
	return 1;
}

task Updategiadaquy[60000*60]()
{
	giaruby = Random(50,100);
	giavang = Random(200,300);
	giakimcuong = Random(13000,15000);
	SendClientMessageToAllEx(-1,"{CD853F}[THI TRUONG DA QUY]{FFFFFF}: Gia da quy da duoc thay doi!");
}



