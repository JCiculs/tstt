#include <a_samp>
#include <YSI_Coding\y_hooks>
new Ob_TapLaiXe;
new Ob_TapLaiXe2;
new Tap_Lai_Xe = -1;
new Tap_Lai_Xe2 = -1;
new TLXStart = 1;
new TLXStart2 = 1;
new Float:TapLaiPos[][3] = {
    {-2111.5295,-401.9695,35.4283},
	{-2092.8237,-382.6812,35.4241},
	{-2026.5256,-384.9483,35.4283},
	{-1988.0200,-402.1871,35.4317},
	{-2083.1584,-393.7417,35.4283},
	{-2081.2058,-425.2340,35.4285},
	{-1978.2037,-420.4083,35.4283},
	{-2031.5313,-428.7687,35.4283},
	{-1980.1979,-440.9575,35.4282},
	{-2109.0864,-442.0747,35.4281},
	{-2109.6448,-418.0004,35.4284},
	{-2116.2708,-470.7283,35.4354},
	{-2094.4009,-451.8620,35.4283},
	{-1989.6909,-458.3189,35.4354},
	{-1970.9958,-474.3043,35.4282},
	{-1982.0050,-495.2150,35.4282},
	{-1998.8529,-495.4138,35.4282},
	{-1998.8816,-466.4046,35.4319},
	{-1969.1895,-453.9355,35.4282},
	{-2003.8827,-460.6538,35.4354},
	{-2015.8827,-468.7448,35.4280},
	{-2068.0776,-467.9387,35.4333},
	{-2034.1328,-504.5405,35.4282},
	{-2110.3977,-498.1733,35.4295},
	{-2117.4707,-469.8804,35.4353},
	{-2135.1084,-408.9929,35.4343},
	{-2146.6167,-379.8990,35.4285},
	{-2175.9880,-378.6992,35.4303},
	{-2164.9856,-378.5410,35.4300},
	{-2190.4712,-408.3683,35.4286},
	{-2199.6377,-399.2657,35.4350},
	{-2151.6887,-379.7557,35.4283},
	{-2141.3669,-379.7199,35.4281},
	{-2125.1316,-414.7347,35.4282}
	};
new VaCham_LaiXe = 0;
new VaCham_LaiXe2 = 0;

hook OnPlayerConnect(playerid)
{
	//tap lai xe
	RemoveBuildingForPlayer(playerid, 10954, -2051.5391, -444.1563, 53.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 10955, -2051.5391, -444.1563, 53.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 11049, -2051.5391, -444.1563, 53.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 3852, -1972.8359, -543.1172, 35.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 11396, -2051.5391, -444.1797, 43.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 11397, -2051.5391, -444.1563, 53.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2220.4844, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2210.5313, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2200.5781, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2190.6250, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2180.6719, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2170.7188, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2160.7656, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 11395, -2155.2031, -401.6172, 42.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1342, -2151.8438, -435.5625, 35.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2150.8125, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1340, -2146.5156, -424.7734, 35.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2140.8594, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -2130.9063, -387.5547, 34.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2118.9688, -423.6484, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2118.6172, -422.4141, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2097.2734, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1340, -2094.2344, -396.4609, 35.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2092.0859, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2063.2734, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2005.6484, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2034.4609, -490.0547, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2068.5625, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2039.8516, -398.3359, 34.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1340, -2036.3203, -396.7578, 35.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 955, -2011.1406, -398.3359, 34.7266, 0.25);
	return 1;
}

hook OnGameModeInit()
{
 	CreateActor(16,-2116.3279,-414.3270,35.3359,72.5258);// th  bang lai xe
 	CreateDynamic3DTextLabel("{D7DF01}Thi bang lai\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de bat dau\nGiam Thi",COLOR_YELLOW,-2116.3279,-414.3270,35.3359+1.5,10.0);
 	Ob_TapLaiXe = CreateDynamicObject(3077, -2118.14, -400.58, 34.31, 0.0, 0.0, 90.0);
 	Ob_TapLaiXe2 = CreateDynamicObject(3077, -2118.14, -400.58+5, 34.31, 0.0, 0.0, 90.0);
	new text[7];
	text[0] = CreateDynamicObject(19313, -2139.787353, -371.029205, 53.099403, 0.000000, 0.000000, -0.799999);
	SetDynamicObjectMaterialText(text[0], 0," ", 80, "Arial", 80, 1, 0xd8152f00, 1, 1);
	SetDynamicObjectMaterialText(text[0], 1," ", 80, "Arial", 80, 1, 0xfff92600, 1, 1);
	text[1] = CreateDynamicObject(19313, -2147.136474, -370.926239, 53.099403, 0.000000, 0.000000, -0.799999);
	SetDynamicObjectMaterialText(text[1], 0," ", 80, "Arial", 80, 1, 0xd8152f00, 1, 1);
	SetDynamicObjectMaterialText(text[1], 1," ", 80, "Arial", 80, 1, 0xfff92600, 1, 1);
	text[2] = CreateDynamicObject(8292, -2143.916308, -370.771527, 53.241878, 0.000000, 0.000000, 53.900039);
	SetDynamicObjectMaterialText(text[2], 0,"So Giao Thong Van Tai", 110, "Arial", 50, 1, -16730675, 0xffFFFF9F, 1);
	CreateDynamicObject(8041, -2125.585449, -376.336517, 40.065036, 0.000000, 0.000000, 89.999992);
	text[3] = CreateDynamicObject(7313, -2126.637207, -374.903411, 41.219886, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterialText(text[3], 0,"Tap Lai Xe", 80, "Arial", 50, 1, 0xffcc0d0d, 0xffFFFF9F, 1);
	text[4] = CreateDynamicObject(11435, -2116.130126, -402.507415, 38.898536, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(text[4], 2,"Khu Tap 1", 50, "Arial", 30, 1, 0xffcc0d0d, 0xffFFFF9F, 1);
	text[5] = CreateDynamicObject(11435, -2116.160888, -465.610839, 38.867401, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(text[5], 2,"Khu Tap 2", 50, "Arial", 30, 1, 0xffcc0d0d, 0xffFFFF9F, 1);
	text[6] = CreateDynamicObject(11435, -2135.245361, -414.586486, 38.935916, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterialText(text[6], 2,"Khu Tap 3", 50, "Arial", 30, 1, 0xffcc0d0d, 0xffFFFF9F, 1);

	//khu 2 3
	CreateDynamicObject(1237, -2095.077148, -456.825714, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2095.077148, -455.085754, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2074.746337, -450.195800, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2074.746337, -451.645812, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2053.952148, -450.075866, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2053.952148, -457.575805, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2034.658447, -453.885864, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2033.557983, -453.885864, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2014.717407, -453.885864, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2015.037719, -455.145874, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2015.037719, -456.445831, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2015.037719, -457.515899, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.833740, -381.314331, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1980.703857, -470.035644, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -389.754333, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1985.824462, -470.035644, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -398.224212, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1986.114746, -474.335754, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -477.934143, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1986.114746, -478.055725, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -469.544189, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1986.114746, -481.835601, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -461.104217, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -452.694091, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1980.642211, -481.835601, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -444.244171, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1980.642211, -478.325561, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -435.794433, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -1980.642211, -474.335540, 34.281845, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -427.384490, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2134.803710, -418.964508, 35.410438, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19966, -2151.598876, -377.066894, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2143.932373, -380.000244, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19966, -2146.529541, -376.897003, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19966, -2141.408935, -376.897003, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2151.554687, -376.927825, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2146.502685, -377.378143, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2141.321777, -377.378143, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2141.321777, -382.788269, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2146.652099, -382.788269, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2151.742431, -382.738342, 34.340969, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2149.385742, -380.000244, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19425, -2162.434326, -378.478332, 34.340969, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19425, -2172.687011, -378.668365, 34.340969, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19425, -2197.320312, -401.300323, 34.330966, 0.000000, 0.000000, 43.099990);
	CreateDynamicObject(19425, -2167.615478, -378.668365, 34.340969, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19425, -2177.983154, -378.668365, 34.340969, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(19966, -2165.198730, -376.916931, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19966, -2170.441406, -376.916931, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19966, -2175.744140, -376.916931, 34.315979, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2178.787841, -380.210327, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2178.787841, -378.050415, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2161.647949, -378.050415, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(1237, -2161.647949, -379.520324, 34.231613, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2202.756591, -399.560119, 35.105144, 0.000000, 0.000000, 133.399917);
	CreateDynamicObject(979, -2195.604248, -407.123931, 35.105144, 0.000000, 0.000000, 133.399917);
	CreateDynamicObject(979, -2188.761962, -414.360595, 35.105144, 0.000000, 0.000000, 133.399917);
	CreateDynamicObject(19425, -2201.736328, -396.583312, 34.330966, 0.000000, 0.000000, 43.099990);
	CreateDynamicObject(19425, -2193.034667, -405.878479, 34.330966, 0.000000, 0.000000, 43.099990);
	CreateDynamicObject(19425, -2188.789550, -410.412933, 34.330966, 0.000000, 0.000000, 43.099990);
	CreateDynamicObject(1237, -2203.171875, -396.703033, 34.231613, 0.000000, 0.000000, 41.700012);
	CreateDynamicObject(1237, -2201.929199, -395.301330, 34.231613, 0.000000, 0.000000, 41.700012);
	CreateDynamicObject(1237, -2187.461425, -410.591461, 34.231613, 0.000000, 0.000000, 41.700012);
	CreateDynamicObject(1237, -2188.537597, -411.549468, 34.231613, 0.000000, 0.000000, 41.700012);




	CreateDynamicObject(2909, -2116.647460, -461.185882, 35.407417, 0.000000, 0.000000, 0.000000);//khu 2
	CreateDynamicObject(2909, -2116.647460, -452.725769, 35.407417, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.647460, -496.489868, 35.407417, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.647460, -487.860107, 35.407417, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.647460, -479.390014, 35.407417, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2104.868896, -463.090148, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2104.868896, -472.510040, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2104.868896, -481.829956, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2104.868896, -491.199859, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2102.550537, -499.820312, 35.150054, 0.000000, 0.000000, 120.299995);
	CreateDynamicObject(979, -2097.408203, -507.675872, 35.150054, 0.000000, 0.000000, 126.199943);
	CreateDynamicObject(979, -2091.043945, -514.326171, 35.150054, 0.000000, 0.000000, 141.400009);
	CreateDynamicObject(979, -2083.706298, -520.184753, 35.150054, 0.000000, 0.000000, 141.400009);
	CreateDynamicObject(979, -2076.361328, -526.049499, 35.150054, 0.000000, 0.000000, 141.400009);
	CreateDynamicObject(979, -2068.337646, -530.416687, 35.150054, 0.000000, 0.000000, 161.400054);
	CreateDynamicObject(979, -2059.432861, -532.605895, 35.150054, 0.000000, 0.000000, 170.800033);
	CreateDynamicObject(979, -2100.318847, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2090.079589, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2080.139404, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2070.110351, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2060.319580, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2050.320556, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2040.100585, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2030.119750, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2019.790039, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2009.550415, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1999.270385, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1979.880126, -458.540130, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1965.343261, -454.278442, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1965.343261, -464.318328, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1965.343261, -474.208435, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1965.343261, -484.168548, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1965.343261, -494.348602, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1965.343261, -505.208526, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -1970.171752, -449.710174, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1970.320800, -458.529968, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1970.519287, -479.189941, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1970.449707, -500.099884, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1979.989135, -500.099884, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1989.527832, -500.099884, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -1999.026977, -500.099884, 35.150054, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(979, -2003.361816, -495.443206, 35.150054, 0.000000, 0.000000, 89.099983);
	CreateDynamicObject(979, -2003.213378, -485.994537, 35.150054, 0.000000, 0.000000, 89.099983);
	CreateDynamicObject(979, -2003.066650, -476.685821, 35.150054, 0.000000, 0.000000, 89.099983);
	CreateDynamicObject(979, -2002.920288, -467.357086, 35.150054, 0.000000, 0.000000, 89.099983);
	CreateDynamicObject(979, -1975.286621, -474.371978, 35.150054, 0.000000, 0.000000, 89.099983);
	CreateDynamicObject(979, -1979.905883, -490.458679, 35.150054, 0.000000, 0.000000, -0.600005);
	CreateDynamicObject(979, -1998.517456, -490.380523, 35.150054, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(979, -1998.517456, -462.740661, 35.150054, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(979, -1993.937255, -467.382659, 35.150054, 0.000000, 0.000000, -90.199989);
	CreateDynamicObject(979, -1993.969726, -476.762542, 35.150054, 0.000000, 0.000000, -90.199989);
	CreateDynamicObject(979, -1984.782226, -494.874755, 35.150054, 0.000000, 0.000000, -90.199989);
	CreateDynamicObject(979, -2008.787353, -462.730651, 35.150054, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(979, -2018.947143, -462.730651, 35.150054, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(979, -2029.496459, -462.730651, 35.150054, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(979, -2044.928222, -463.650421, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2045.028930, -473.510284, 35.150054, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2040.709106, -475.301330, 35.150054, 0.000000, 0.000000, -143.299972);
	CreateDynamicObject(979, -2032.746948, -470.252075, 35.150054, 0.000000, 0.000000, -153.399993);
	CreateDynamicObject(979, -2020.288452, -463.790313, 35.150054, 0.000000, 0.000000, 166.999954);
	CreateDynamicObject(979, -2023.997558, -469.378112, 35.150054, 0.000000, 0.000000, 164.799926);
	CreateDynamicObject(979, -2015.099853, -472.482269, 35.150054, 0.000000, 0.000000, 156.299758);
	CreateDynamicObject(979, -2011.554565, -466.870452, 35.150054, 0.000000, 0.000000, 154.899719);
	CreateDynamicObject(979, -2005.392700, -472.728454, 35.150054, 0.000000, 0.000000, 120.799781);
	CreateDynamicObject(979, -2009.796020, -479.089721, 35.150054, 0.000000, 0.000000, 102.399818);
	CreateDynamicObject(979, -2005.081787, -489.450592, 35.150054, 0.000000, 0.000000, 64.999824);
	CreateDynamicObject(979, -2010.511108, -496.469543, 35.150054, 0.000000, 0.000000, 38.999851);
	CreateDynamicObject(979, -2011.316528, -487.326812, 35.150054, 0.000000, 0.000000, 58.799850);
	CreateDynamicObject(979, -2017.829223, -493.440704, 35.150054, 0.000000, 0.000000, 27.199861);
	CreateDynamicObject(979, -2018.638793, -500.646850, 35.150054, 0.000000, 0.000000, 14.699861);
	CreateDynamicObject(979, -2027.734008, -501.902435, 35.150054, 0.000000, 0.000000, 0.499860);
	CreateDynamicObject(979, -2036.609985, -500.090057, 35.150054, 0.000000, 0.000000, -20.900138);
	CreateDynamicObject(979, -2044.806640, -495.459991, 35.150054, 0.000000, 0.000000, -40.500137);
	CreateDynamicObject(979, -2051.022949, -488.572998, 35.150054, 0.000000, 0.000000, -55.100124);
	CreateDynamicObject(979, -2057.273193, -481.534973, 35.150054, 0.000000, 0.000000, -42.600131);
	CreateDynamicObject(979, -2026.672485, -495.270355, 35.150054, 0.000000, 0.000000, -3.400125);
	CreateDynamicObject(979, -2035.629150, -493.207550, 35.150054, 0.000000, 0.000000, -23.300104);
	CreateDynamicObject(979, -2043.628173, -488.367675, 35.150054, 0.000000, 0.000000, -39.100101);
	CreateDynamicObject(979, -2050.236816, -481.768737, 35.150054, 0.000000, 0.000000, -48.900077);
	CreateDynamicObject(979, -2056.375488, -474.677215, 35.150054, 0.000000, 0.000000, -50.000064);
	CreateDynamicObject(979, -2063.162109, -468.034515, 35.150054, 0.000000, 0.000000, -40.800067);
	CreateDynamicObject(979, -2070.533935, -462.842620, 35.150054, 0.000000, 0.000000, -29.400066);
	CreateDynamicObject(979, -2079.327148, -460.521514, 35.150054, 0.000000, 0.000000, -1.600061);
	CreateDynamicObject(979, -2064.068603, -475.069000, 35.150054, 0.000000, 0.000000, -45.300033);
	CreateDynamicObject(979, -2070.890869, -468.629058, 35.150054, 0.000000, 0.000000, -41.000057);
	CreateDynamicObject(979, -2078.889648, -465.164031, 35.150054, 0.000000, 0.000000, -5.800046);
	CreateDynamicObject(979, -2088.016845, -462.176361, 35.150054, 0.000000, 0.000000, 22.099960);
	CreateDynamicObject(979, -2095.768798, -467.264862, 35.150054, 0.000000, 0.000000, 45.599967);
	CreateDynamicObject(979, -2101.715820, -474.868865, 35.150054, 0.000000, 0.000000, 59.899955);
	CreateDynamicObject(979, -2087.702148, -466.761688, 35.150054, 0.000000, 0.000000, 25.699945);
	CreateDynamicObject(979, -2094.7024, -472.3685, 35.1501, 0.000000, 0.000000, 51.899921);
	CreateDynamicObject(979, -2098.312744, -480.633636, 35.150054, 0.000000, 0.000000, 81.799919);
	CreateDynamicObject(979, -2098.005615, -489.780181, 35.150054, 0.000000, 0.000000, 101.399948);
	CreateDynamicObject(979, -2095.234863, -498.698181, 35.150054, 0.000000, 0.000000, 114.999954);
	CreateDynamicObject(979, -2090.197753, -506.403442, 35.150054, 0.000000, 0.000000, 129.899963);
	CreateDynamicObject(979, -2083.548583, -512.891540, 35.150054, 0.000000, 0.000000, 141.099960);
	CreateDynamicObject(979, -2076.217041, -518.806884, 35.150054, 0.000000, 0.000000, 141.099960);
	CreateDynamicObject(979, -2068.318359, -523.567443, 35.150001, 0.000000, 0.000000, 157.200012);
	CreateDynamicObject(979, -2059.516601, -526.516479, 35.150001, 0.000000, 0.000000, 164.700073);
	CreateDynamicObject(979, -2050.390136, -531.646301, 35.150001, 0.000000, 0.000000, -158.499847);
	CreateDynamicObject(979, -2042.509765, -526.698059, 35.150001, 0.000000, 0.000000, -140.899841);
	CreateDynamicObject(979, -2037.799072, -519.316345, 35.150001, 0.000000, 0.000000, -103.099838);
	CreateDynamicObject(979, -2036.557128, -510.566528, 35.099964, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(979, -2050.928466, -525.705932, 35.099964, 0.000000, 0.000000, 30.699979);
	CreateDynamicObject(979, -2044.493408, -519.229003, 35.099964, 0.000000, 0.000000, 57.399959);
	CreateDynamicObject(979, -2041.734619, -510.618286, 35.099964, 0.000000, 0.000000, 87.999908);



	CreateDynamicObject(2909, -2116.600585, -381.316986, 35.400817, 0.000000, 0.000000, 0.000000);//khu 1
	CreateDynamicObject(2909, -2116.610595, -389.706634, 35.400817, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.630615, -398.126617, 35.400817, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.630615, -419.166656, 35.400817, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2099.803710, -386.245635, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3437, -2103.740966, -380.710266, 34.084297, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2088.835693, -386.245635, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2077.764892, -386.245635, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2066.525390, -386.245635, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2054.192626, -387.971496, 35.076293, 0.000000, 0.000000, -14.099990);
	CreateDynamicObject(3578, -2042.884887, -390.812072, 35.076293, 0.000000, 0.000000, -14.099990);
	CreateDynamicObject(3578, -2031.154663, -393.316650, 35.076293, 0.000000, 0.000000, -9.599986);
	CreateDynamicObject(3578, -2018.884887, -394.015838, 35.076293, 0.000000, 0.000000, 3.800013);
	CreateDynamicObject(3578, -2006.790527, -393.212432, 35.076293, 0.000000, 0.000000, 3.800013);
	CreateDynamicObject(3578, -1994.228027, -392.378051, 35.076293, 0.000000, 0.000000, 3.800013);
	CreateDynamicObject(3578, -1976.927001, -386.827087, 35.076293, 0.000000, 0.000000, -89.400016);
	CreateDynamicObject(3578, -1976.805175, -398.536224, 35.076293, 0.000000, 0.000000, -89.400016);
	CreateDynamicObject(3578, -1976.690551, -409.545654, 35.076293, 0.000000, 0.000000, -89.400016);
	CreateDynamicObject(3578, -1983.199951, -414.346069, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -1995.403076, -414.985687, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2006.118774, -415.547210, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2017.612792, -416.149658, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2029.307006, -416.762390, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2041.330200, -417.392608, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3437, -2081.609375, -380.710266, 34.104286, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(3437, -2062.489501, -380.710266, 34.114295, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19952, -1989.409912, -381.840454, 34.231494, 0.000000, 0.000000, -87.399978);
	CreateDynamicObject(19987, -2095.761718, -385.235931, 34.292175, 0.000000, 0.000000, -94.700012);
	CreateDynamicObject(1427, -2092.276855, -379.418548, 34.851501, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1427, -2092.276855, -377.368560, 34.851501, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1427, -2073.637207, -380.988250, 34.851501, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1427, -2073.637207, -383.058227, 34.851501, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(1427, -2054.411376, -381.218322, 34.851501, 0.000000, 0.000000, 75.299972);
	CreateDynamicObject(1427, -2052.099365, -381.824829, 34.851501, 0.000000, 0.000000, 75.299972);
	CreateDynamicObject(1427, -2048.511474, -382.766326, 34.851501, 0.000000, 0.000000, 75.299972);
	CreateDynamicObject(1427, -2024.949584, -388.947723, 34.851501, 0.000000, 0.000000, 99.099960);
	CreateDynamicObject(1427, -2024.674438, -390.665893, 34.851501, 0.000000, 0.000000, 99.099960);
	CreateDynamicObject(1427, -2024.408447, -392.324737, 34.851501, 0.000000, 0.000000, 99.099960);
	CreateDynamicObject(3578, -2018.285766, -403.688262, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2029.080932, -404.253967, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2039.816894, -404.816436, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2050.382568, -405.370269, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2060.984863, -405.926269, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2053.491943, -418.163391, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2065.171142, -418.772674, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2075.656494, -419.322204, 35.076293, 0.000000, 0.000000, 2.999984);
	CreateDynamicObject(3578, -2065.869384, -406.109222, 35.076293, 0.000000, 0.000000, -93.300025);
	CreateDynamicObject(3578, -2081.840087, -414.714691, 35.076293, 0.000000, 0.000000, -85.800025);
	CreateDynamicObject(3578, -2082.693359, -403.096282, 35.076293, 0.000000, 0.000000, -85.800025);
	CreateDynamicObject(983, -2066.235107, -397.808135, 35.185943, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(983, -2066.235107, -391.408233, 35.185943, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(983, -2066.235107, -389.848815, 35.185943, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19948, -2012.797485, -403.235961, 34.375640, 0.000000, 0.000000, 90.300033);
	CreateDynamicObject(3578, -2104.493164, -393.105834, 35.076293, 0.000000, 0.000000, -89.200050);
	CreateDynamicObject(3578, -2104.329589, -404.754791, 35.076293, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(3578, -2104.329589, -416.364868, 35.076293, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(3578, -2104.329589, -427.634674, 35.076293, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(3578, -2097.819091, -431.904663, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2086.339355, -431.954650, 35.076293, 0.000000, 0.000000, 4.899999);
	CreateDynamicObject(3578, -2074.990722, -430.831359, 35.076293, 0.000000, 0.000000, 7.899997);
	CreateDynamicObject(3578, -2063.956542, -429.300476, 35.076293, 0.000000, 0.000000, 7.899997);
	CreateDynamicObject(3578, -2053.085449, -427.661041, 35.076293, 0.000000, 0.000000, 10.999996);
	CreateDynamicObject(3578, -2042.468994, -424.680328, 35.076293, 0.000000, 0.000000, 12.799998);
	CreateDynamicObject(3578, -2031.298339, -423.461761, 35.076293, 0.000000, 0.000000, 3.299993);
	CreateDynamicObject(3578, -2020.329956, -422.135528, 35.076293, 0.000000, 0.000000, 3.299998);
	CreateDynamicObject(3578, -2009.058593, -421.485565, 35.076293, 0.000000, 0.000000, 3.299998);
	CreateDynamicObject(3578, -1997.897338, -420.841979, 35.076293, 0.000000, 0.000000, 3.299998);
	CreateDynamicObject(3578, -1986.355834, -420.609069, 35.076293, 0.000000, 0.000000, 1.599998);
	CreateDynamicObject(3578, -1981.233520, -427.048675, 35.076293, 0.000000, 0.000000, 5.599997);
	CreateDynamicObject(3578, -1974.370239, -420.439697, 35.076293, 0.000000, 0.000000, 87.899971);
	CreateDynamicObject(3578, -1992.729003, -428.175872, 35.076293, 0.000000, 0.000000, 5.599997);
	CreateDynamicObject(3578, -2004.385131, -428.609283, 35.076293, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2016.216552, -428.459442, 35.076293, 0.000000, 0.000000, -1.199999);
	CreateDynamicObject(3578, -2029.265625, -432.082427, 35.086277, 0.000000, 0.000000, -21.500026);
	CreateDynamicObject(3578, -2019.244628, -434.301116, 35.076290, 0.000000, 0.000000, -2.700029);
	CreateDynamicObject(3578, -1985.378662, -447.561676, 35.066307, 0.000000, 0.000000, 89.799919);
	CreateDynamicObject(3578, -2038.646362, -428.029205, 35.076290, 0.000000, 0.000000, -25.400012);
	CreateDynamicObject(3578, -2042.422607, -443.402557, 35.066307, 0.000000, 0.000000, 89.799919);
	CreateDynamicObject(3578, -2069.681884, -434.447509, 35.066307, 0.000000, 0.000000, 89.799919);
	CreateDynamicObject(3578, -2094.152343, -448.276214, 35.076293, 0.000000, 0.000000, 0.500005);
	CreateDynamicObject(3578, -2104.329589, -434.114776, 35.076293, 0.000000, 0.000000, 270.000000);
	CreateDynamicObject(19953, -2088.091308, -430.785125, 34.245929, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(19953, -2091.922363, -430.785125, 34.245929, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(19953, -2096.133056, -430.785125, 34.245929, 0.000000, 0.000000, 180.000000);
	CreateDynamicObject(19959, -2064.524902, -411.191192, 34.285938, 0.000000, 0.000000, 100.099998);
	CreateDynamicObject(19951, -2078.266845, -388.769989, 34.000000, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19951, -2072.906738, -388.910034, 34.000000, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19951, -2101.533203, -391.742828, 34.000000, 0.000000, 0.000000, 87.399993);
	CreateDynamicObject(19951, -2101.719970, -395.848663, 34.000000, 0.000000, 0.000000, 87.399993);
	CreateDynamicObject(3578, -2007.457763, -434.856933, 35.076290, 0.000000, 0.000000, -2.700029);
	CreateDynamicObject(3578, -1995.676757, -434.492156, 35.076290, 0.000000, 0.000000, 4.899970);
	CreateDynamicObject(3578, -1985.145141, -433.589263, 35.076290, 0.000000, 0.000000, 4.899970);
	CreateDynamicObject(3578, -1974.276611, -432.714508, 35.076290, 0.000000, 0.000000, -86.300048);
	CreateDynamicObject(3578, -1973.842041, -443.940002, 35.076290, 0.000000, 0.000000, -86.300048);
	CreateDynamicObject(3578, -1980.009277, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -1990.589111, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2001.999023, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2013.458984, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2025.278442, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2036.508300, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2048.437988, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2059.978271, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2071.298583, -448.393707, 35.076290, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(3578, -2087.747314, -444.084564, 35.016342, 0.000000, 0.000000, 89.799919);
	CreateDynamicObject(3578, -2082.335693, -448.317993, 35.066307, 0.000000, 0.000000, 178.799880);
	CreateDynamicObject(3578, -2024.562866, -427.875396, 35.076290, 0.000000, 0.000000, -4.500018);
	CreateDynamicObject(3578, -2103.841064, -448.144592, 35.076293, 0.000000, 0.000000, -1.100001);
	CreateDynamicObject(3578, -2111.260253, -448.002197, 35.076293, 0.000000, 0.000000, -1.100001);
	CreateDynamicObject(2909, -2116.641357, -427.622985, 35.415927, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.641357, -436.062988, 35.415927, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2909, -2116.641357, -444.303009, 35.415927, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.664306, -408.739990, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.664306, -404.710052, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.664306, -400.270141, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.904541, -397.440277, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.904541, -393.610290, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.904541, -388.540252, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.624267, -411.900299, 35.509590, 90.000000, 0.000000, 0.000000);
	CreateDynamicObject(19130, -2104.644287, -416.260375, 35.509590, 90.000000, 0.000000, 0.000000);
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(Tap_Lai_Xe == playerid)
	{
	    Tap_Lai_Xe = -1;
     	VaCham_LaiXe = 0;
     	TLXStart = 1;
        //GameTextForPlayer(playerid,"~r~fail", 5000, 6);
        DisablePlayerCheckpoint(playerid);
        //SetDynamicObjectMaterialText(Ob_TapLaiXe, 0, "diem tap lai xe", 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
	}
	if(Tap_Lai_Xe2 == playerid)
	{
	    Tap_Lai_Xe2 = -1;
     	VaCham_LaiXe2 = 0;
     	TLXStart2 = 1;
        //GameTextForPlayer(playerid,"~r~fail", 5000, 6);
        DisablePlayerCheckpoint(playerid);
        //SetDynamicObjectMaterialText(Ob_TapLaiXe, 0, "diem tap lai xe", 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
	}
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(vehicleid == Xe_Tap_Lai[0])
	{
	    new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+1.3);
		PlayerPlaySound(playerid, 1130, slx, sly, slz+0.5);
		RemovePlayerFromVehicle(playerid);
		ChatHoTro(playerid,255,"ban khong the len xe nay",3000);
	    return 1;
	}
	if(vehicleid == Xe_Tap_Lai[1])
	{
	    new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+1.3);
		PlayerPlaySound(playerid, 1130, slx, sly, slz+0.5);
		RemovePlayerFromVehicle(playerid);
		ChatHoTro(playerid,255,"ban khong the len xe nay",3000);
	    return 1;
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2750)
	{
	    if(response)
	    {
	    	if(PlayerInfo[playerid][pCash] < 200) return ChatHoTro(playerid,255,"Ban khong du tien de thi bang lai",5000);
	        if(Tap_Lai_Xe != -1) return ChatHoTro(playerid,255,"hien tai da co nguoi dang tap lai~n~ vui long  doi....",5000);
	        PlayerInfo[playerid][pCash] -= 200;
	       	ChatHoTro(playerid,255,"Ban da bat dau vao ki thi bang lai",5000);
            Tap_Lai_Xe = playerid;
            PutPlayerInVehicle(playerid, Xe_Tap_Lai[0], 0);
            CP[playerid] = 303004;
            VaCham_LaiXe = 0;
            TLXStart = 1;
            SetPlayerCheckpoint(playerid,-2111.5295,-401.9695,35.4283,2.0);
	    }
	}
	if(dialogid == 2751)
	{
	    if(response)
	    {
	    	if(PlayerInfo[playerid][pCash] < 200) return ChatHoTro(playerid,255,"Ban khong du tien de thi bang lai",5000);
	        if(Tap_Lai_Xe2 != -1) return ChatHoTro(playerid,255,"hien tai da co nguoi dang tap lai~n~ vui long  doi....",5000);
	        PlayerInfo[playerid][pCash] -= 200;
	       	ChatHoTro(playerid,255,"Ban da bat dau vao ki thi bang lai",5000);
            Tap_Lai_Xe2 = playerid;
            PutPlayerInVehicle(playerid, Xe_Tap_Lai[1], 0);
            CP[playerid] = 303005;
            VaCham_LaiXe2 = 0;
            TLXStart2 = 1;
            SetPlayerCheckpoint(playerid,-2111.5295,-401.9695,35.4283,2.0);
	    }
	}
	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_DRIVER)
	{
	    if(Tap_Lai_Xe == playerid)
	    {
         	Tap_Lai_Xe = -1;
         	VaCham_LaiXe = 0;
         	TLXStart = 1;
	        //GameTextForPlayer(playerid,"~r~fail", 5000, 6);
	        DisablePlayerCheckpoint(playerid);
	        //SetDynamicObjectMaterialText(Ob_TapLaiXe, 0, "diem tap lai xe", 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
	    }

	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
	    if(Tap_Lai_Xe2 == playerid)
	    {
         	Tap_Lai_Xe2 = -1;
         	VaCham_LaiXe2 = 0;
         	TLXStart2 = 1;
	        //GameTextForPlayer(playerid,"~r~fail", 5000, 6);
	        DisablePlayerCheckpoint(playerid);
	        //SetDynamicObjectMaterialText(Ob_TapLaiXe, 0, "diem tap lai xe", 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
	    }

	}
	return 1;
}

stock ThiBangLai_VehDamage(vehicleid, playerid)
{
	if(Tap_Lai_Xe == playerid)
	{
	    RepairVehicle(vehicleid);
	    GameTextForPlayer(playerid,"~r~loi va cham", 3000, 6);
	    VaCham_LaiXe += 1;
	    SetVehicleHealthEx(vehicleid, 999.0);
		return 1;
	}
	if(Tap_Lai_Xe2 == playerid)
	{
	    RepairVehicle(vehicleid);
	    GameTextForPlayer(playerid,"~r~loi va cham", 3000, 6);
	    VaCham_LaiXe2 += 1;
	    SetVehicleHealthEx(vehicleid, 999.0);
		return 1;
	}
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
   	if(CP[playerid] == 303004)// tap lai xe
 	{
 	    DisablePlayerCheckpoint(playerid);
 	    if(TLXStart == sizeof(TapLaiPos))
		{
		    new string[128];
		    if(VaCham_LaiXe < 3)
		    {
		        format(string,128,"%s\nloi va cham %d/3\nChuc Mung",GetPlayerNameEx(playerid),VaCham_LaiXe);
		    	PlayerInfo[playerid][pCarLic] = 1;
		    	ChatHoTro(playerid,255,"chuc mung ban thi bang lai xe thanh cong",5000);
		    }
		    if(VaCham_LaiXe >= 3)
		    {
		        format(string,128,"%s\nloi va cham %d/3\nThi Lai",GetPlayerNameEx(playerid),VaCham_LaiXe);
		        PlayerInfo[playerid][pCarLic] = 0;
		    }
		    SetDynamicObjectMaterialText(Ob_TapLaiXe, 0, string, 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
		    CP[playerid] = 0;
		    TLXStart = 1;
		    VaCham_LaiXe = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(Xe_Tap_Lai[0]);
		}
        if(TLXStart < sizeof(TapLaiPos))
        {
            SetPlayerCheckpoint(playerid,TapLaiPos[TLXStart][0],TapLaiPos[TLXStart][1],TapLaiPos[TLXStart][2],2.0);
            TLXStart++;
        }
		return 1;
 	}
   	if(CP[playerid] == 303005)// tap lai xe 2
 	{
 	    DisablePlayerCheckpoint(playerid);
 	    if(TLXStart2 == sizeof(TapLaiPos))
		{
		    new string[128];
		    if(VaCham_LaiXe2 < 3)
		    {
		        format(string,128,"%s\nloi va cham %d/3\nChuc Mung",GetPlayerNameEx(playerid),VaCham_LaiXe2);
		    	PlayerInfo[playerid][pCarLic] = 1;
		    	ChatHoTro(playerid,255,"chuc mung ban thi bang lai xe thanh cong",5000);
		    }
		    if(VaCham_LaiXe2 >= 3)
		    {
		        format(string,128,"%s\nloi va cham %d/3\nThi Lai",GetPlayerNameEx(playerid),VaCham_LaiXe2);
		        PlayerInfo[playerid][pCarLic] = 0;
		    }
		    SetDynamicObjectMaterialText(Ob_TapLaiXe2, 0, string, 80, "Arial", 20, 1, 0xff000000, 0xddd6d6, 1);
		    CP[playerid] = 0;
		    TLXStart2 = 1;
		    VaCham_LaiXe2 = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(Xe_Tap_Lai[1]);
		}
        if(TLXStart2 < sizeof(TapLaiPos))
        {
            SetPlayerCheckpoint(playerid,TapLaiPos[TLXStart2][0],TapLaiPos[TLXStart2][1],TapLaiPos[TLXStart2][2],2.0);
            TLXStart2++;
        }
		return 1;
 	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid,5.0,-2116.3279,-414.3270,35.3359))
		{
			if(Tap_Lai_Xe == -1)
		    {
		    	return ShowPlayerDialog(playerid, 2750, DIALOG_STYLE_MSGBOX, "Airport Ground Worker","Ban co muon thi bang lai xe tai day khong\nGia thi la 200$", "muon", "khong");
			}
			else if(Tap_Lai_Xe2 == -1)
			{
				return ShowPlayerDialog(playerid, 2751, DIALOG_STYLE_MSGBOX, "Airport Ground Worker","Ban co muon thi bang lai xe tai day khong\nGia thi la 200$", "muon", "khong");
			}
			else
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Airport Ground Worker","Hien tai dang co nguoi dang tap lai xe\nvui long doi...", "oke", "");
			}
		}
	}
	return 1;
}

stock SetVehicleHealthEx(vehicleid, Float: health)
{
	if(health == 1000)
	{
	    health = 999;
	}
 	SetVehicleHealth(vehicleid, health);
}
