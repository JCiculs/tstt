
#include <a_samp>
#include <YSI_Coding\y_hooks>
// #include "./includes/Main/streamer.pwn"

new const Float:zone_hosp_arr[][] = {
	{1067.0, -1390.5, 1253.0, -1286.5}

};
hook OnPlayerConnect(playerid)
{


	RemoveBuildingForPlayer(playerid, 1776, -33.8750, -186.7656, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -32.4453, -186.6953, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1775, -35.7266, -140.2266, 1003.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 2779, -35.7344, -91.6016, 1002.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 956, 1634.1487,-2238.2810,13.5077, 20.0); //Snack vender @ LS Airport
    RemoveBuildingForPlayer(playerid, 956, 2480.9885,-1958.5117,13.5831, 20.0); //Snack vender @ Sushi Shop in Willowfield
    RemoveBuildingForPlayer(playerid, 955, 1729.7935,-1944.0087,13.5682, 20.0); //Sprunk machine @ Unity Station
    RemoveBuildingForPlayer(playerid, 955, 2060.1099,-1898.4543,13.5538, 20.0); //Sprunk machine opposite Tony's Liqour in Willowfield
    RemoveBuildingForPlayer(playerid, 955, 2325.8708,-1645.9584,14.8270, 20.0); //Sprunk machine @ Ten Green Bottles
    RemoveBuildingForPlayer(playerid, 955, 1153.9130,-1460.8893,15.7969, 20.0); //Sprunk machine @ Market
    RemoveBuildingForPlayer(playerid, 955,1788.3965,-1369.2336,15.7578, 20.0); //Sprunk machine in Downtown Los Santos
    RemoveBuildingForPlayer(playerid, 955, 2352.9939,-1357.1105,24.3984, 20.0); //Sprunk machine @ Liquour shop in East Los Santos
    RemoveBuildingForPlayer(playerid, 1775, 2224.3235,-1153.0692,1025.7969, 20.0); //Sprunk machine @ Jefferson Motel
    RemoveBuildingForPlayer(playerid, 956, 2140.2566,-1161.7568,23.9922, 20.0); //Snack machine @ pick'n'go market in Jefferson
    RemoveBuildingForPlayer(playerid, 956, 2154.1199,-1015.7635,62.8840, 20.0); //Snach machine @ Carniceria El Pueblo in Las Colinas
    RemoveBuildingForPlayer(playerid, 956, 662.5665,-551.4142,16.3359, 20.0); //Snack vender at Dillimore Gas Station
    RemoveBuildingForPlayer(playerid, 955, 200.2010,-107.6401,1.5513, 20.0); //Sprunk machine @ Blueberry Safe House
    RemoveBuildingForPlayer(playerid, 956, 2271.4666,-77.2104,26.5824, 20.0); //Snack machine @ Palomino Creek Library
    RemoveBuildingForPlayer(playerid, 955, 1278.5421,372.1057,19.5547, 20.0); //Sprunk machine @ Papercuts in Montgomery
    RemoveBuildingForPlayer(playerid, 955, 1929.5527,-1772.3136,13.5469, 20.0); //Sprunk machine @ Idlewood Gas Station
    //San Fierro
    RemoveBuildingForPlayer(playerid, 1302, -2419.5835,984.4185,45.2969, 20.0); //Soda machine 1 @ Juniper Hollow Gas Station
    RemoveBuildingForPlayer(playerid, 1209, -2419.5835,984.4185,45.2969, 20.0); //Soda machine 2 @ Juniper Hollow Gas Station
    RemoveBuildingForPlayer(playerid, 956, -2229.2075,287.2937,35.3203, 20.0); //Snack vender @ King's Car Park
    RemoveBuildingForPlayer(playerid, 955, -1349.3947,493.1277,11.1953, 20.0); //Sprunk machine @ SF Aircraft Carrier
    RemoveBuildingForPlayer(playerid, 956, -1349.3947,493.1277,11.1953, 20.0); //Snack vender @ SF Aircraft Carrier
    RemoveBuildingForPlayer(playerid, 955, -1981.6029,142.7232,27.6875, 20.0); //Sprunk machine @ Cranberry Station
    RemoveBuildingForPlayer(playerid, 955, -2119.6245,-422.9411,35.5313, 20.0); //Sprunk machine 1/2 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2097.3696,-397.5220,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2068.5593,-397.5223,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2039.8802,-397.5214,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2011.1403,-397.5225,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2005.7861,-490.8688,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2034.5267,-490.8681,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2063.1875,-490.8687,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    RemoveBuildingForPlayer(playerid, 955, -2091.9780,-490.8684,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
    //Las Venturas
    RemoveBuildingForPlayer(playerid, 956, -1455.1298,2592.4138,55.8359, 20.0); //Snack vender @ El Quebrados GONE
    RemoveBuildingForPlayer(playerid, 955, -252.9574,2598.9048,62.8582, 20.0); //Sprunk machine @ Las Payasadas GONE
    RemoveBuildingForPlayer(playerid, 956, -252.9574,2598.9048,62.8582, 20.0); //Snack vender @ Las Payasadas GONE
    RemoveBuildingForPlayer(playerid, 956, 1398.7617,2223.3606,11.0234, 20.0); //Snack vender @ Redsands West GONE
    RemoveBuildingForPlayer(playerid, 955, -862.9229,1537.4246,22.5870, 20.0); //Sprunk machine @ The Smokin' Beef Grill in Las Barrancas GONE
    RemoveBuildingForPlayer(playerid, 955, -14.6146,1176.1738,19.5634, 20.0); //Sprunk machine @ Fort Carson GONE
    RemoveBuildingForPlayer(playerid, 956, -75.2839,1227.5978,19.7360, 20.0); //Snack vender @ Fort Carson GONE
    RemoveBuildingForPlayer(playerid, 955, 1519.3328,1055.2075,10.8203, 20.0); //Sprunk machine @ LVA Freight Department GONE
    RemoveBuildingForPlayer(playerid, 956, 1659.5096,1722.1096,10.8281, 20.0); //Snack vender near Binco @ LV Airport GONE
    RemoveBuildingForPlayer(playerid, 955, 2086.5872,2071.4958,11.0579, 20.0); //Sprunk machine @ Sex Shop on The Strip
    RemoveBuildingForPlayer(playerid, 955, 2319.9001,2532.0376,10.8203, 20.0); //Sprunk machine @ Pizza co by Julius Thruway (North)
    RemoveBuildingForPlayer(playerid, 955, 2503.2061,1244.5095,10.8203, 20.0); //Sprunk machine @ Club in the Camels Toe
    RemoveBuildingForPlayer(playerid, 956, 2845.9919,1294.2975,11.3906, 20.0); //Snack vender @ Linden Station
    //Interiors: 24/7 and Clubs
    RemoveBuildingForPlayer(playerid, 1775, 496.0843,-23.5310,1000.6797, 20.0); //Sprunk machine 1 @ Club in Camels Toe
    RemoveBuildingForPlayer(playerid, 1775, 501.1219,-2.1968,1000.6797, 20.0); //Sprunk machine 2 @ Club in Camels Toe
    RemoveBuildingForPlayer(playerid, 1776, 501.1219,-2.1968,1000.6797, 20.0); //Snack vender @ Club in Camels Toe
    RemoveBuildingForPlayer(playerid, 1775, -19.2299,-57.0460,1003.5469, 20.0); //Sprunk machine @ Roboi's type 24/7 stores
    RemoveBuildingForPlayer(playerid, 1776, -35.9012,-57.1345,1003.5469, 20.0); //Snack vender @ Roboi's type 24/7 stores
    RemoveBuildingForPlayer(playerid, 1775, -17.0036,-90.9709,1003.5469, 20.0); //Sprunk machine @ Other 24/7 stores
    RemoveBuildingForPlayer(playerid, 1776, -17.0036,-90.9709,1003.5469, 20.0); //Snach vender @ Others 24/7 stores
	//remove khu thuong mai


	//---------------
	/*RemoveBuildingForPlayer(playerid, 1531, 1799.130, -1708.770, 14.101, 0.250);
	RemoveBuildingForPlayer(playerid, 4018, 1791.800, -1716.979, 12.523, 0.250);
	RemoveBuildingForPlayer(playerid, 4075, 1791.800, -1716.979, 12.523, 0.250);*/

	//remove khu van hoa 2
	/*RemoveBuildingForPlayer(playerid, 3584, 2282.989, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3695, 2282.989, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 669, 2254.729, -1827.439, 12.562, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2273.699, -1810.030, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2268.189, -1810.030, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1807.329, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2249.870, -1815.410, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1801.869, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1796.449, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1791.000, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1780.979, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1775.510, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2265.300, -1770.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2234.479, -1817.930, 12.093, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2230.409, -1815.150, 11.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2267.810, -1767.270, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2273.340, -1767.339, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2258.340, -1804.739, 12.093, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2259.949, -1796.069, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2275.389, -1820.729, 12.093, 0.250);
	RemoveBuildingForPlayer(playerid, 645, 2259.270, -1773.239, 11.125, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2293.629, -1760.619, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 645, 2285.760, -1762.130, 12.289, 0.250);
	RemoveBuildingForPlayer(playerid, 17886, 2264.040, -1789.260, 20.773, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2297.899, -1793.819, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2271.649, -1772.400, 8.351, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2297.149, -1775.880, 8.351, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2297.379, -1798.540, 8.351, 0.250);
	RemoveBuildingForPlayer(playerid, 3584, 2239.929, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3695, 2239.929, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2232.520, -1766.050, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2228.669, -1767.270, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1770.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1775.510, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1780.979, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1791.000, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1796.449, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1801.869, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2226.159, -1807.329, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2229.050, -1810.030, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 3584, 2314.820, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3695, 2314.820, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1791.000, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1796.449, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1801.869, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1807.329, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2305.060, -1810.030, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1780.979, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1775.510, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 645, 2399.979, -1815.989, 11.890, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2302.169, -1770.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2304.780, -1767.380, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 3584, 2387.820, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3695, 2387.820, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3584, 2352.719, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 3695, 2352.719, -1790.699, 17.007, 0.250);
	RemoveBuildingForPlayer(playerid, 17887, 2343.610, -1784.510, 20.312, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2376.989, -1813.930, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1811.380, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1805.930, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1800.469, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1795.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1789.599, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1780.979, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1775.510, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2376.620, -1767.270, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2374.100, -1770.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 645, 2387.020, -1763.640, 12.179, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2403.290, -1741.739, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2364.250, -1742.119, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 2398.580, -1782.770, 10.703, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2367.649, -1780.770, 11.046, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2367.649, -1802.800, 8.359, 0.250);
	RemoveBuildingForPlayer(playerid, 645, 2332.830, -1817.709, 12.117, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2341.760, -1817.729, 8.359, 0.250);
	RemoveBuildingForPlayer(playerid, 1307, 2322.649, -1815.410, 12.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2341.760, -1810.030, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1807.329, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1801.869, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1796.449, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1791.000, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1780.979, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1775.510, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2338.870, -1770.050, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 2349.620, -1763.339, 11.632, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2341.379, -1767.270, 13.156, 0.250);
	RemoveBuildingForPlayer(playerid, 669, 2329.189, -1765.520, 12.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2334.709, -1785.060, 12.093, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2335.649, -1796.630, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 2378.340, -1818.729, 8.359, 0.250);*/
	RemoveBuildingForPlayer(playerid, 17520, 2497.770, -1762.390, 15.625, 0.250);
	RemoveBuildingForPlayer(playerid, 17756, 2497.770, -1762.390, 15.625, 0.250);

	//removekhuvanhoa
		//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	/*RemoveBuildingForPlayer(playerid, 1522, 2068.159, -1780.609, 12.539, 0.250);
	RemoveBuildingForPlayer(playerid, 1522, 2070.209, -1794.589, 12.523, 0.250);
	RemoveBuildingForPlayer(playerid, 5521, 2049.580, -1781.680, 18.328, 0.250);
	RemoveBuildingForPlayer(playerid, 5526, 2049.580, -1781.680, 18.328, 0.250);
	RemoveBuildingForPlayer(playerid, 1259, 2030.930, -1763.160, 28.578, 0.250);
	RemoveBuildingForPlayer(playerid, 1268, 2030.930, -1763.160, 28.578, 0.250);
	RemoveBuildingForPlayer(playerid, 1259, 2066.810, -1791.790, 21.976, 0.250);
	RemoveBuildingForPlayer(playerid, 1268, 2066.810, -1791.790, 21.976, 0.250);
	RemoveBuildingForPlayer(playerid, 1216, 2068.939, -1767.839, 13.210, 0.250);
	RemoveBuildingForPlayer(playerid, 5522, 2048.719, -1776.479, 18.648, 0.250);
	RemoveBuildingForPlayer(playerid, 1216, 2069.000, -1766.660, 13.210, 0.250);
	RemoveBuildingForPlayer(playerid, 1308, 2071.830, -1762.310, 12.703, 0.250);
	RemoveBuildingForPlayer(playerid, 5628, 2025.380, -1773.949, 16.679, 0.250);
	RemoveBuildingForPlayer(playerid, 5524, 2025.380, -1773.949, 16.679, 0.250);
	RemoveBuildingForPlayer(playerid, 1267, 2062.030, -1826.640, 19.992, 0.250);
	RemoveBuildingForPlayer(playerid, 1261, 2062.030, -1826.640, 19.992, 0.250);
	RemoveBuildingForPlayer(playerid, 5532, 2056.979, -1830.520, 20.601, 0.250);
	RemoveBuildingForPlayer(playerid, 5527, 2056.979, -1830.520, 20.601, 0.250);
	RemoveBuildingForPlayer(playerid, 5422, 2071.479, -1831.420, 14.562, 0.250);
	RemoveBuildingForPlayer(playerid, 5417, 2029.500, -1819.270, 14.335, 0.250);
	RemoveBuildingForPlayer(playerid, 5525, 2029.500, -1819.270, 14.335, 0.250);
	RemoveBuildingForPlayer(playerid, 5411, 2021.660, -1810.729, 18.601, 0.250);
	RemoveBuildingForPlayer(playerid, 5523, 2021.660, -1810.729, 18.601, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2102.659, -1791.329, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.850, -1793.979, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.860, -1799.420, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.850, -1813.910, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2099.860, -1819.359, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1408, 2102.600, -1822.079, 13.117, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2114.719, -1785.180, 16.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2102.060, -1793.140, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.689, -1795.910, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2101.629, -1798.170, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.959, -1800.560, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2104.020, -1812.420, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2103.409, -1817.300, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2102.129, -1819.949, 12.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1432, 2101.989, -1814.709, 12.570, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2041.359, -1807.949, 16.406, 0.250);
	RemoveBuildingForPlayer(playerid, 1524, 2034.400, -1801.670, 14.546, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1974.209, -1808.140, 16.406, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1972.989, -1811.449, 15.585, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2013.270, -1816.430, 16.382, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 2070.209, -1812.880, 15.601, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 2080.939, -1800.949, 15.617, 0.250);*/


	return 1;
}
hook OnGameModeInit()
{

	for(new i = 0; i < 1; i ++) {
		hospzone[i] = CreateDynamicRectangle
		(
			zone_hosp_arr[i][0],
			zone_hosp_arr[i][1],
			zone_hosp_arr[i][2],
			zone_hosp_arr[i][3]
		);
	}
	new tmpobjid;

   /*===== Map Parkour by Cadell =====*/
    /*CreateDynamicObject(3437,2320.3000488,1055.0999756,9.6000004,89.2094421,251.5642090,108.4374695); //object(ballypllr01_lvs) (1)
    CreateDynamicObject(3437,2318.5000000,1055.0996094,9.6000004,89.2089844,251.5539551,108.4350586); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2324.8999023,1055.0999756,9.6000004,89.2089844,251.5594482,108.4350586); //object(ballypllr01_lvs) (3)
    CreateDynamicObject(3437,2323.0000000,1055.0999756,9.6000004,89.2089844,251.5594482,108.6850586); //object(ballypllr01_lvs) (4)
    CreateDynamicObject(3437,2321.5000000,1055.0999756,9.6000004,89.2089844,251.5539551,108.6822510); //object(ballypllr01_lvs) (5)
    CreateDynamicObject(718,2325.0000000,1048.1999512,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (1)
    CreateDynamicObject(718,2325.1000977,1062.0000000,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (2)
    CreateDynamicObject(718,2321.6999512,1048.0999756,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (3)
    CreateDynamicObject(718,2318.6000977,1048.0999756,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (4)
    CreateDynamicObject(718,2321.8000488,1062.0999756,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (5)
    CreateDynamicObject(718,2318.6999512,1062.1999512,9.8000002,0.0000000,0.0000000,0.0000000); //object(vgs_palm04) (6)
    CreateDynamicObject(3437,2317.1999512,1055.0000000,9.5000000,66.7491455,90.5826416,270.1032715); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2315.1999512,1054.9000244,9.8999996,66.7474365,90.5822754,270.0988770); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2312.8999023,1054.5999756,10.6000004,66.7474365,90.5822754,270.0988770); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2310.6000977,1054.5999756,11.8000002,54.7479553,90.3540039,270.2991943); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2308.6999512,1054.6999512,13.3999996,48.7450256,90.2833252,270.3502808); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2307.1999512,1055.4000244,15.1000004,48.7408447,90.2801514,270.3460693); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2305.6000977,1059.0000000,16.6000004,48.7408447,90.2801514,270.3460693); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(3437,2303.6000977,1061.3000488,17.8999996,48.7408447,90.2801514,270.3460693); //object(ballypllr01_lvs) (2)
    CreateDynamicObject(1684,2303.8000488,1073.9000244,15.0000000,0.0000000,0.0000000,332.0000000); //object(portakabin) (1)
    CreateDynamicObject(1638,2313.0000000,1075.9000244,15.1000004,0.0000000,0.0000000,352.0000000); //object(od_pat_hut) (1)
    CreateDynamicObject(1638,2309.6000977,1081.5000000,15.1000004,0.0000000,0.0000000,351.9964600); //object(od_pat_hut) (2)
    CreateDynamicObject(1638,2312.5000000,1088.6999512,15.1000004,0.0000000,0.0000000,351.9964600); //object(od_pat_hut) (3)
    CreateDynamicObject(1638,2305.6999512,1092.6999512,15.1000004,0.0000000,0.0000000,351.9964600); //object(od_pat_hut) (4)
    CreateDynamicObject(18367,2304.5000000,1098.3000488,16.7999992,0.0000000,0.0000000,136.0000000); //object(cw2_bikelog) (1)
    CreateDynamicObject(18367,2315.6999512,1108.9000244,16.7999992,0.0000000,0.0000000,273.9997559); //object(cw2_bikelog) (2)
    CreateDynamicObject(18367,2291.1000977,1107.5000000,16.7999992,0.0000000,0.0000000,117.9990234); //object(cw2_bikelog) (3)
    CreateDynamicObject(13645,2303.6999512,1119.0999756,18.6000004,0.0000000,0.0000000,52.0000000); //object(kickramp06) (1)
    CreateDynamicObject(13645,2296.6999512,1118.3000488,18.6000004,0.0000000,0.0000000,51.9982910); //object(kickramp06) (2)
    CreateDynamicObject(13645,2289.5000000,1117.0999756,18.6000004,0.0000000,0.0000000,51.9982910); //object(kickramp06) (3)
    CreateDynamicObject(13645,2289.8999023,1123.8000488,18.6000004,0.0000000,0.0000000,51.9982910); //object(kickramp06) (4)
    CreateDynamicObject(13645,2291.0000000,1131.1999512,18.6000004,0.0000000,0.0000000,51.9982910); //object(kickramp06) (5)
    CreateDynamicObject(16337,2285.3000488,1135.4000244,16.2000008,0.0000000,0.0000000,324.0000000); //object(des_cranecontrol) (1)
    CreateDynamicObject(16337,2282.3000488,1131.8000488,16.2000008,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (2)
    CreateDynamicObject(16337,2277.6999512,1135.1999512,16.2000008,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (3)
    CreateDynamicObject(16337,2274.8999023,1131.5999756,16.2000008,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (4)
    CreateDynamicObject(16337,2272.1999512,1127.8000488,16.2000008,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (5)
    CreateDynamicObject(16337,2267.8000488,1130.9000244,17.5000000,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (6)
    CreateDynamicObject(16337,2263.1000977,1133.3000488,19.1000004,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (7)
    CreateDynamicObject(16337,2257.8999023,1136.3000488,20.6000004,0.0000000,0.0000000,323.9978027); //object(des_cranecontrol) (8)
    CreateDynamicObject(16337,2259.0000000,1130.5000000,22.1000004,0.0000000,0.0000000,327.9978027); //object(des_cranecontrol) (9)
    CreateDynamicObject(16337,2264.0000000,1128.3000488,23.8999996,0.0000000,0.0000000,327.9968262); //object(des_cranecontrol) (10)
    CreateDynamicObject(14416,2248.8000488,1091.8000488,32.5000000,0.0000000,0.0000000,162.0000000); //object(carter-stairs07) (1)
    CreateDynamicObject(14416,2247.1000977,1086.5000000,36.2000008,0.0000000,0.0000000,161.9989014); //object(carter-stairs07) (2)
    CreateDynamicObject(16502,2238.5000000,1087.0999756,37.2999992,1.9648743,10.7563782,163.6268311); //object(cn2_jetty1) (1)
    CreateDynamicObject(13649,2220.1999512,1096.3000488,37.9000015,0.0000000,0.0000000,2.0000000); //object(ramplandpad01) (1)
    CreateDynamicObject(13649,2204.3000488,1089.5000000,37.9000015,0.0000000,0.0000000,1.9995117); //object(ramplandpad01) (2)
    CreateDynamicObject(13649,2199.1000977,1097.6999512,40.7000008,0.0000000,0.0000000,1.9995117); //object(ramplandpad01) (3)
    CreateDynamicObject(13649,2192.8999023,1101.8000488,44.2000008,0.0000000,0.0000000,1.9995117); //object(ramplandpad01) (4)
    CreateDynamicObject(13649,2197.6999512,1111.0000000,44.5000000,0.0000000,0.0000000,1.9995117); //object(ramplandpad01) (5)
    CreateDynamicObject(3414,2207.1999512,1120.5999756,43.2000008,0.0000000,0.0000000,141.7500000); //object(ce_oldhut1) (1)
    CreateDynamicObject(3612,2222.8999023,1127.9000244,36.0000000,0.0000000,0.0000000,324.0000000); //object(hillhouse12_la) (1)
    CreateDynamicObject(2932,2239.6000977,1131.8000488,49.5000000,0.0000000,0.0000000,318.0000000); //object(kmb_container_blue) (1)
    CreateDynamicObject(2934,2247.5000000,1125.4000244,47.7000008,0.0000000,0.0000000,358.0000000); //object(kmb_container_red) (1)
    CreateDynamicObject(2935,2245.6999512,1114.0000000,49.2999992,0.0000000,0.0000000,310.0000000); //object(kmb_container_yel) (1)
    CreateDynamicObject(2932,2255.8999023,1110.0000000,48.2999992,0.0000000,0.0000000,317.9992676); //object(kmb_container_blue) (2)
    CreateDynamicObject(2934,2265.6992188,1110.0000000,47.7000008,0.0000000,0.0000000,355.9899902); //object(kmb_container_red) (2)
    CreateDynamicObject(2935,2277.3999023,1120.5000000,47.5999985,0.0000000,0.0000000,333.9957275); //object(kmb_container_yel) (2)
    CreateDynamicObject(3571,2283.8000488,1123.9000244,50.7999992,0.0000000,0.0000000,308.0000000); //object(lasdkrt3) (1)
    CreateDynamicObject(3571,2287.6999512,1113.0999756,51.7999992,0.0000000,0.0000000,273.9962158); //object(lasdkrt3) (2)
    CreateDynamicObject(3571,2283.6000977,1103.0999756,53.0999985,0.0000000,0.0000000,239.9935303); //object(lasdkrt3) (3)
    CreateDynamicObject(3571,2276.1999512,1100.3000488,55.0999985,0.0000000,0.0000000,199.9908447); //object(lasdkrt3) (4)
    CreateDynamicObject(3571,2266.6999512,1102.4000244,57.0999985,0.0000000,0.0000000,141.9896240); //object(lasdkrt3) (5)
    CreateDynamicObject(3571,2261.8000488,1111.0999756,59.2000008,0.0000000,0.0000000,99.9873047); //object(lasdkrt3) (6)
    CreateDynamicObject(3571,2263.3999023,1120.8000488,60.5000000,0.0000000,0.0000000,55.9865723); //object(lasdkrt3) (7)
    CreateDynamicObject(3571,2266.5000000,1119.0999756,62.5000000,0.0000000,0.0000000,53.9863281); //object(lasdkrt3) (8)
    CreateDynamicObject(3571,2269.5000000,1117.3000488,64.8000031,0.0000000,0.0000000,53.9813232); //object(lasdkrt3) (9)
    CreateDynamicObject(16073,2267.1999512,1088.5999756,65.0000000,0.0000000,0.0000000,300.7500000); //object(des_quarrybelt03) (1)
    CreateDynamicObject(1985,2274.6000977,1109.0000000,71.5999985,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (1)
    CreateDynamicObject(1985,2273.8999023,1108.0999756,71.4000015,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (2)
    CreateDynamicObject(1985,2273.6999512,1106.5000000,71.1999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (3)
    CreateDynamicObject(1985,2272.8999023,1105.3000488,71.0000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (4)
    CreateDynamicObject(1985,2272.6000977,1103.3000488,70.6999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (5)
    CreateDynamicObject(1985,2271.6999512,1102.0999756,70.5000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (6)
    CreateDynamicObject(1985,2271.6999512,1100.1999512,70.1999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (7)
    CreateDynamicObject(1985,2271.0000000,1099.1999512,69.8000031,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (8)
    CreateDynamicObject(1985,2270.6999512,1097.5999756,69.6999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (9)
    CreateDynamicObject(1985,2269.6999512,1096.3000488,69.5999985,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (10)
    CreateDynamicObject(1985,2269.6000977,1094.5000000,69.0000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (11)
    CreateDynamicObject(1985,2268.5000000,1092.8000488,68.6999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (12)
    CreateDynamicObject(1985,2267.8999023,1090.1999512,68.4000015,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (13)
    CreateDynamicObject(1985,2266.8000488,1088.3000488,68.1999969,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (14)
    CreateDynamicObject(1985,2266.3000488,1085.5999756,67.5000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (15)
    CreateDynamicObject(1985,2265.0000000,1083.3000488,67.0000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (16)
    CreateDynamicObject(1985,2264.8000488,1080.9000244,66.5000000,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (17)
    CreateDynamicObject(1985,2263.5000000,1079.4000244,66.3000031,0.0000000,0.0000000,0.0000000); //object(punchbagnu) (18)
    CreateDynamicObject(13637,2251.0000000,1053.4000244,61.0999985,0.0000000,0.0000000,195.0000000); //object(tuberamp) (1)
    CreateDynamicObject(13637,2244.0000000,1039.5000000,61.0999985,0.0000000,0.0000000,24.7463379); //object(tuberamp) (2)
    CreateDynamicObject(13637,2234.1999512,1027.9000244,61.0999985,0.0000000,0.0000000,128.7412109); //object(tuberamp) (3)
    CreateDynamicObject(13637,2219.3999023,1031.1999512,57.0999985,0.0000000,0.0000000,118.7377930); //object(tuberamp) (4)
    CreateDynamicObject(13637,2205.1000977,1036.1999512,53.0999985,0.0000000,0.0000000,46.7347412); //object(tuberamp) (5)
    CreateDynamicObject(13637,2210.6999512,1046.5999756,48.7999992,0.0000000,0.0000000,344.7303467); //object(tuberamp) (6)
    CreateDynamicObject(13637,2225.3999023,1051.1999512,48.7999992,0.0000000,0.0000000,140.7290039); //object(tuberamp) (7)
    CreateDynamicObject(974,2235.8000488,1047.0000000,48.0999985,0.0000000,0.0000000,336.0000000); //object(tall_fence) (1)
    CreateDynamicObject(974,2238.1000977,1046.0000000,48.0999985,0.0000000,0.0000000,335.9948730); //object(tall_fence) (2)
    CreateDynamicObject(16337,2254.3000488,1039.0999756,44.9000015,0.0000000,0.0000000,0.0000000); //object(des_cranecontrol) (12)
    CreateDynamicObject(16337,2259.1000977,1040.3000488,44.5000000,0.0000000,0.0000000,0.0000000); //object(des_cranecontrol) (13)
    CreateDynamicObject(16337,2264.3000488,1042.9000244,43.5000000,0.0000000,0.0000000,0.0000000); //object(des_cranecontrol) (14)
    CreateDynamicObject(3578,2276.1000977,1040.5999756,43.5000000,0.0000000,0.0000000,302.0000000); //object(dockbarr1_la) (1)
    CreateDynamicObject(3578,2276.8000488,1035.1999512,43.5000000,0.0000000,0.0000000,309.7476807); //object(dockbarr1_la) (2)
    CreateDynamicObject(3578,2285.3999023,1033.1999512,43.5000000,0.0000000,0.0000000,39.7449951); //object(dockbarr1_la) (3)
    CreateDynamicObject(1380,2289.1999512,1043.8000488,35.5999985,0.0000000,0.0000000,0.0000000); //object(magnocrane_01) (1)
    CreateDynamicObject(3578,2276.3999023,1034.8000488,43.5000000,0.0000000,0.0000000,309.7430420); //object(dockbarr1_la) (4)
    CreateDynamicObject(3578,2285.0000000,1033.5999756,43.5000000,0.0000000,0.0000000,39.7430420); //object(dockbarr1_la) (5)
    CreateDynamicObject(3578,2276.6000977,1040.9000244,43.5000000,0.0000000,0.0000000,301.9976807); //object(dockbarr1_la) (6)
    CreateDynamicObject(17050,2296.8000488,1038.0000000,26.3999996,8.3001709,46.6314697,319.3066406); //object(cw_silo02) (1)
    CreateDynamicObject(17050,2307.8000488,1024.4000244,32.4000015,8.3001709,46.6314697,261.3066406); //object(cw_silo02) (2)
    CreateDynamicObject(17050,2300.0000000,1006.4000244,39.4000015,8.3001709,46.6314697,207.3043213); //object(cw_silo02) (3)
    CreateDynamicObject(2935,2277.8999023,1121.5999756,48.5000000,0.0000000,0.0000000,333.9953613); //object(kmb_container_yel) (3)
    CreateDynamicObject(3631,2278.3999023,999.2999878,55.5999985,0.0000000,0.0000000,24.0000000); //object(oilcrat_las) (1)
    CreateDynamicObject(3631,2272.1000977,992.7999878,58.5999985,0.0000000,0.0000000,45.9996338); //object(oilcrat_las) (2)
    CreateDynamicObject(3631,2268.1000977,993.7000122,61.9000015,0.0000000,0.0000000,7.9942627); //object(oilcrat_las) (3)
    CreateDynamicObject(3631,2254.1000977,991.2000122,63.2000008,0.0000000,0.0000000,27.9925537); //object(oilcrat_las) (4)
    CreateDynamicObject(18367,2251.6000977,989.9000244,63.4000015,346.0000000,0.0000000,296.0000000); //object(cw2_bikelog) (4)
    CreateDynamicObject(18367,2225.6000977,981.2999878,72.4000015,345.9979248,0.0000000,115.9991455); //object(cw2_bikelog) (6)
    CreateDynamicObject(3406,2249.3999023,1001.5000000,83.4000015,56.0000000,180.0000000,180.0000000); //object(cxref_woodjetty) (1)
    CreateDynamicObject(3406,2260.6000977,1005.0999756,84.9000015,55.9973145,179.9945068,131.9945068); //object(cxref_woodjetty) (2)
    CreateDynamicObject(3406,2271.1999512,1012.0000000,84.9000015,55.9918213,179.9945068,119.9897461); //object(cxref_woodjetty) (3)
    CreateDynamicObject(3406,2283.8000488,1018.2999878,84.9000015,55.9863281,179.9945068,163.9871826); //object(cxref_woodjetty) (4)
    CreateDynamicObject(974,2298.6999512,1031.8000488,82.1999969,0.0000000,0.0000000,60.0000000); //object(tall_fence) (3)
    CreateDynamicObject(974,2301.8999023,1037.4000244,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (4)
    CreateDynamicObject(974,2305.0000000,1042.9000244,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (5)
    CreateDynamicObject(974,2308.1999512,1048.5000000,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (6)
    CreateDynamicObject(974,2311.5000000,1054.1999512,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (7)
    CreateDynamicObject(974,2314.6999512,1059.9000244,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (8)
    CreateDynamicObject(974,2318.0000000,1065.5999756,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (9)
    CreateDynamicObject(974,2321.3000488,1071.3000488,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (10)
    CreateDynamicObject(974,2324.6000977,1076.9000244,82.1999969,0.0000000,0.0000000,59.9963379); //object(tall_fence) (11)
    CreateDynamicObject(16337,2323.1999512,1086.6999512,84.9000015,0.0000000,0.0000000,292.0000000); //object(des_cranecontrol) (11)
    CreateDynamicObject(16337,2325.3999023,1091.9000244,87.9000015,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (15)
    CreateDynamicObject(16337,2320.6000977,1094.8000488,90.8000031,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (16)
    CreateDynamicObject(16337,2319.6999512,1107.8000488,90.8000031,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (17)
    CreateDynamicObject(16337,2311.6000977,1116.8000488,90.8000031,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (18)
    CreateDynamicObject(16337,2311.1999512,1127.9000244,90.8000031,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (19)
    CreateDynamicObject(16337,2310.3999023,1130.8000488,88.4000015,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (20)
    CreateDynamicObject(16337,2309.6999512,1133.6999512,85.9000015,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (21)
    CreateDynamicObject(16337,2308.8000488,1135.9000244,83.0999985,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (22)
    CreateDynamicObject(17067,2256.0000000,1161.3000488,80.4000015,0.0000000,0.0000000,328.2500000); //object(cw2_logcabins) (1)
    CreateDynamicObject(3502,2217.5000000,1145.9000244,84.8000031,0.0000000,0.0000000,288.0000000); //object(vgsn_con_tube) (1)
    CreateDynamicObject(3502,2209.8999023,1143.4000244,86.0999985,344.0000000,0.0000000,287.9956055); //object(vgsn_con_tube) (2)
    CreateDynamicObject(5153,2204.3000488,1135.5000000,85.5000000,0.0000000,0.0000000,286.0000000); //object(stuntramp7_las2) (1)
    CreateDynamicObject(5153,2206.3000488,1129.5000000,85.3000031,0.0000000,24.7500000,285.9960938); //object(stuntramp7_las2) (3)
    CreateDynamicObject(5153,2211.0000000,1127.5999756,85.3000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (4)
    CreateDynamicObject(5153,2215.3999023,1125.4000244,85.3000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (5)
    CreateDynamicObject(5153,2219.3999023,1121.8000488,83.8000031,0.0000000,54.7467041,299.9960938); //object(stuntramp7_las2) (7)
    CreateDynamicObject(5153,2224.5000000,1118.8000488,81.0999985,0.0000000,54.7448730,299.9926758); //object(stuntramp7_las2) (8)
    CreateDynamicObject(5153,2223.3999023,1114.0000000,78.5999985,0.0000000,54.7448730,299.9926758); //object(stuntramp7_las2) (9)
    CreateDynamicObject(5153,2225.1000977,1110.5000000,75.8000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (10)
    CreateDynamicObject(5153,2222.1999512,1106.6999512,75.8000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (11)
    CreateDynamicObject(5153,2227.3000488,1102.9000244,75.8000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (12)
    CreateDynamicObject(5153,2225.1999512,1097.1999512,75.8000031,0.0000000,24.7467041,285.9960938); //object(stuntramp7_las2) (13)
    CreateDynamicObject(3631,2228.1000977,1089.3000488,73.0000000,0.0000000,0.0000000,105.9942627); //object(oilcrat_las) (5)
    CreateDynamicObject(3631,2234.6999512,1082.5000000,74.5000000,0.0000000,0.0000000,137.9906006); //object(oilcrat_las) (6)
    CreateDynamicObject(3631,2238.1000977,1074.4000244,77.8000031,0.0000000,0.0000000,119.9883118); //object(oilcrat_las) (7)
    CreateDynamicObject(3631,2248.3000488,1072.3000488,79.0999985,0.0000000,0.0000000,159.9871826); //object(oilcrat_las) (8)
    CreateDynamicObject(3631,2257.0000000,1072.8000488,82.4000015,0.0000000,0.0000000,201.9829102); //object(oilcrat_las) (9)
    CreateDynamicObject(3631,2263.8000488,1072.8000488,85.9000015,0.0000000,0.0000000,167.9781494); //object(oilcrat_las) (10)
    CreateDynamicObject(3631,2272.6000977,1067.6999512,88.4000015,0.0000000,0.0000000,145.9754639); //object(oilcrat_las) (11)
    CreateDynamicObject(3631,2279.1000977,1058.6999512,89.9000015,0.0000000,0.0000000,111.9753418); //object(oilcrat_las) (12)
    CreateDynamicObject(3631,2284.6000977,1052.1999512,89.9000015,0.0000000,36.0000000,135.9726562); //object(oilcrat_las) (14)
    CreateDynamicObject(3631,2288.8000488,1048.1999512,94.0999985,0.0000000,35.9967041,135.9723206); //object(oilcrat_las) (15)
    CreateDynamicObject(3631,2292.8999023,1044.3000488,98.1999969,0.0000000,35.9967041,135.9723206); //object(oilcrat_las) (16)
    CreateDynamicObject(16337,2310.6999512,1142.6999512,83.0999985,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (23)
    CreateDynamicObject(16337,2309.3000488,1148.3000488,83.0999985,0.0000000,0.0000000,291.9946289); //object(des_cranecontrol) (24)
    CreateDynamicObject(12990,2294.6000977,1164.5000000,83.0000000,0.0000000,0.0000000,50.0000000); //object(sw_jetty) (1)
    CreateDynamicObject(897,2301.6000977,1038.4000244,99.8000031,0.0000000,0.0000000,54.0000000); //object(searock01) (1)
    CreateDynamicObject(897,2313.3999023,1044.0000000,96.5999985,0.0000000,0.0000000,53.9978027); //object(searock01) (2)
    CreateDynamicObject(897,2326.8000488,1043.5000000,97.5999985,0.0000000,0.0000000,103.9978027); //object(searock01) (3)
    CreateDynamicObject(897,2335.8000488,1032.4000244,97.5999985,10.0000000,0.0000000,103.9965820); //object(searock01) (4)
    CreateDynamicObject(897,2344.6999512,1020.9000244,95.4000015,2.4070740,283.7955933,39.7029114); //object(searock01) (5)
    CreateDynamicObject(897,2355.3000488,1019.2000122,100.1999969,8.2213440,26.2905273,337.0727539); //object(searock01) (6)
    CreateDynamicObject(897,2368.1999512,1010.4000244,100.1999969,332.8939514,262.6782837,54.2185974); //object(searock01) (7)
    CreateDynamicObject(897,2382.1999512,1017.4000244,96.6999969,332.8912354,262.6776123,54.2175293); //object(searock01) (8)
    CreateDynamicObject(897,2391.6000977,1009.7000122,96.6999969,332.8912354,262.6776123,54.2175293); //object(searock01) (9)
    CreateDynamicObject(897,2405.8000488,1008.0000000,93.8000031,332.8912354,262.6776123,54.2175293); //object(searock01) (10)
    CreateDynamicObject(897,2418.1000977,1001.4000244,93.8000031,284.5285950,196.1125793,21.5885925); //object(searock01) (11)
    CreateDynamicObject(897,2428.0000000,1011.0000000,90.8000031,313.8596497,105.0105896,236.3656616); //object(searock01) (12)
    CreateDynamicObject(897,2440.1000977,1006.2999878,88.8000031,1.9407654,89.5169067,177.9512939); //object(searock01) (13)
    CreateDynamicObject(897,2452.5000000,998.0000000,88.8000031,57.1733093,67.2770386,238.4400635); //object(searock01) (14)
    CreateDynamicObject(897,2462.8999023,1004.0999756,85.3000031,21.1053467,83.6481323,263.1223450); //object(searock01) (15)
    CreateDynamicObject(897,2474.8999023,1008.5000000,79.3000031,21.1047363,83.6444092,263.1170654); //object(searock01) (16)
    CreateDynamicObject(897,2490.1000977,1012.7000122,79.3000031,68.8577271,42.1267700,239.7794342); //object(searock01) (17)
    CreateDynamicObject(897,2494.5000000,1026.0999756,75.5999985,63.0297852,304.3119202,302.4775696); //object(searock01) (18)
    CreateDynamicObject(897,2500.0000000,1036.5000000,70.5999985,24.9203491,277.6589661,350.2164307); //object(searock01) (19)
    CreateDynamicObject(897,2508.3000488,1046.4000244,65.5999985,24.9170227,277.6574707,350.2111511); //object(searock01) (20)
    CreateDynamicObject(897,2509.6999512,1062.8000488,59.0999985,340.8044434,264.2760620,306.9366455); //object(searock01) (21)
    CreateDynamicObject(971,2510.1999512,1056.1999512,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (1)
    CreateDynamicObject(971,2501.1992188,1056.2998047,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (2)
    CreateDynamicObject(971,2492.3994141,1056.2998047,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (3)
    CreateDynamicObject(971,2483.5996094,1056.3994141,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (4)
    CreateDynamicObject(971,2477.0000000,1059.5000000,60.0999985,0.0000000,0.0000000,304.0000000); //object(subwaygate) (5)
    CreateDynamicObject(897,2508.6000977,1054.5000000,56.5999985,308.9467773,249.2242126,263.8996887); //object(searock01) (22)
    CreateDynamicObject(897,2497.6000977,1052.4000244,54.9000015,292.4780273,133.8574219,114.0270996); //object(searock01) (23)
    CreateDynamicObject(971,2483.8999023,1060.0000000,63.9000015,89.7497559,180.0000000,180.0000000); //object(subwaygate) (6)
    CreateDynamicObject(971,2480.1000977,1061.4000244,63.9000015,89.7473145,179.9945068,213.9916992); //object(subwaygate) (7)
    CreateDynamicObject(971,2492.8000488,1059.8000488,63.9000015,89.7473145,179.9945068,179.9945068); //object(subwaygate) (8)
    CreateDynamicObject(971,2501.6999512,1059.8000488,63.9000015,89.7473145,179.9945068,179.9945068); //object(subwaygate) (9)
    CreateDynamicObject(1457,2480.3000488,1060.1999512,58.2000008,0.0000000,0.0000000,94.5000000); //object(dyn_outhouse_2) (1)
    CreateDynamicObject(3534,2482.8999023,1057.5999756,57.7999992,0.0000000,0.0000000,0.0000000); //object(trdlamp01) (1)
    CreateDynamicObject(3534,2486.6999512,1057.5999756,57.7999992,0.0000000,0.0000000,0.0000000); //object(trdlamp01) (2)
    CreateDynamicObject(3534,2490.3999023,1057.5000000,57.7999992,0.0000000,0.0000000,0.0000000); //object(trdlamp01) (3)
    CreateDynamicObject(3534,2494.1999512,1057.4000244,57.7999992,0.0000000,0.0000000,0.0000000); //object(trdlamp01) (4)
    CreateDynamicObject(971,2500.6000977,1063.0000000,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (2)
    CreateDynamicObject(971,2491.6999512,1063.0999756,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (3)
    CreateDynamicObject(971,2482.8000488,1063.0999756,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (4)
    CreateDynamicObject(971,2478.8000488,1063.0999756,60.0999985,0.0000000,0.0000000,0.0000000); //object(subwaygate) (4)*/


	// khu thuong mai
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1658.985107, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1226.989379, -1649.941772, 10.879981, 0.000000, 90.000030, 0.199999, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "wood02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1660.586181, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1216.569213, -1660.925170, 10.879981, 0.000000, 90.000030, 0.699998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "wood02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1216.488647, -1649.978271, 10.879981, 0.000000, 90.000030, 0.199999, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "wood02S", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1651.202636, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1227.068847, -1660.796997, 10.879981, 0.000000, 90.000030, 0.699998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "wood02S", 0x00000000);
	tmpobjid = CreateDynamicObject(1491, 1232.197998, -1656.604248, 13.442126, -0.000022, 1260.000000, -89.799995, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.164794, -1653.333129, 14.225918, -89.999992, 450.000000, 89.999961, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.174804, -1656.833007, 14.225918, -89.999992, 89.737525, 90.037460, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1657.383911, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(1842, 1216.559204, -1646.607666, 11.405917, 0.000029, 0.000000, 89.899917, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19063, "xmasorbs", "foil2-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1225.330688, -1660.390502, 11.945914, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.184204, -1652.803100, 12.685612, 0.000000, -0.099968, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19090, 1218.121459, -1657.698974, 11.850769, -7.100026, -57.599945, -80.399894, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1228.252807, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_castironwalk", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1228.082641, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1227.912475, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "LASLACMA93", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1227.742309, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sunsetammu2", 0x00000000);
	tmpobjid = CreateDynamicObject(2411, 1226.794677, -1660.383544, 11.705933, 0.000000, 360.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(2402, 1224.120849, -1660.431518, 11.705925, 0.000000, 360.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18062, "ab_sfammuitems01", "ammu_ammo", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1232.187622, -1658.352172, 13.866913, -0.000029, 90.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19941, 1225.685668, -1650.305175, 11.779377, -0.000024, 0.000014, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19941, 1225.828125, -1650.248413, 11.789378, -0.000024, -0.599982, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1227.572143, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4552, "ammu_lan2", "sunsetammu2", 0x00000000);
	tmpobjid = CreateDynamicObject(2710, 1228.442993, -1660.414550, 11.875922, 0.000000, 720.000000, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_castironwalk", 0x00000000);
	tmpobjid = CreateDynamicObject(19941, 1225.678344, -1650.165405, 11.803065, -0.000024, -18.199993, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19941, 1225.754760, -1650.283935, 11.825114, 0.000014, -4.099968, 32.299999, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19941, 1225.610961, -1650.209228, 11.803065, -0.000024, -18.199993, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1227.531860, -1665.658813, 12.819987, -0.000029, 540.000000, -89.999839, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1217.910888, -1665.658813, 12.819987, -0.000029, 540.000000, -89.999839, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1215.501342, -1660.800415, 13.600001, 0.000000, 540.000000, 179.999740, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1215.501342, -1649.979003, 13.560000, 0.000000, 540.000000, 179.999740, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1227.421752, -1645.067260, 12.819987, -0.000029, 540.000000, -89.999839, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1217.789672, -1645.067260, 12.819987, -0.000029, 540.000000, -89.999839, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1215.506103, -1655.439453, 14.144150, 0.000000, 179.999847, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1215.506103, -1655.439453, 10.644137, 0.000000, 179.999847, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1227.068847, -1660.796997, 15.270009, 0.000000, 90.000030, 0.699998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14420, "dr_gsbits", "mp_apt1_frame1", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1216.569213, -1660.925170, 15.269989, 0.000000, 90.000030, 0.699998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14420, "dr_gsbits", "mp_apt1_frame1", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1216.488647, -1649.978271, 15.269974, 0.000000, 90.000030, 0.199999, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14420, "dr_gsbits", "mp_apt1_frame1", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1216.514526, -1655.435791, 15.265297, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1220.015136, -1655.423583, 15.265269, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1223.515747, -1655.411132, 15.265307, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1227.016967, -1655.399658, 15.265307, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1230.498535, -1655.387817, 15.265320, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1226.989257, -1649.771606, 15.260020, 0.000000, 90.000030, 0.199999, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14420, "dr_gsbits", "mp_apt1_frame1", 0x00000000);
	tmpobjid = CreateDynamicObject(2767, 1223.877075, -1650.282226, 11.775935, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1225.610961, -1660.390258, 11.955910, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1225.540893, -1660.390258, 11.955910, -83.599899, 177.599746, 178.799606, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil3-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1224.470458, -1660.390014, 11.965907, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1224.200317, -1660.389770, 11.975899, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil5-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1224.399780, -1660.390014, 11.965907, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19775, 1224.289672, -1660.390014, 11.965907, -88.599876, 179.998764, 179.998626, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(2767, 1223.316528, -1650.282226, 11.775935, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(2767, 1222.756103, -1650.282226, 11.775935, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(2767, 1224.907470, -1650.282226, 11.775935, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1232.187622, -1652.172363, 13.866913, -0.000029, 90.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(2727, 1215.545898, -1655.434936, 13.524025, 89.099945, 270.997985, -179.997955, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(1883, 1218.945800, -1646.120971, 10.935919, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 19063, "xmasorbs", "foil4-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(11705, 1218.653930, -1657.027954, 11.875926, -0.000017, 1080.000000, -130.699905, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(1853, 1219.072021, -1653.977050, 11.906868, 0.000012, 0.000034, 23.600004, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3128, "bball_hpx", "wire2", 0x00000000);
	tmpobjid = CreateDynamicObject(2266, 1219.520385, -1653.802246, 11.916901, 0.000028, -0.000011, 112.099143, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(2266, 1218.614135, -1654.162109, 11.906914, -0.000019, 1080.000000, -67.300758, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19808, 1218.643188, -1654.173461, 11.906949, -0.000024, -2.000072, -58.800567, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19076, "xmastree1", "goldplate", 0x00000000);
	tmpobjid = CreateDynamicObject(19874, 1218.837402, -1654.465576, 11.882843, 1.299926, -0.300024, -165.300048, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 5397, "barrio1_lae", "wshbrsh1las", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1221.424438, -1645.067749, 13.396904, 0.000000, 450.000000, -0.300013, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1223.755615, -1645.079345, 13.396904, 0.000000, 450.000000, -0.300013, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(2767, 1219.346435, -1663.156005, 11.406624, -0.200163, 179.999984, -141.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "red", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1215.637695, -1653.012817, 13.266903, -0.000029, 540.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1215.637695, -1657.814331, 13.266903, -0.000029, 180.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1662.187255, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19425, 1229.406372, -1655.402221, 15.172503, 0.300002, 179.999938, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19425, 1226.114257, -1655.402221, 15.172503, 0.300002, 179.999938, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19425, 1222.823608, -1655.402221, 15.172503, 0.300002, 179.999938, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19425, 1219.542358, -1655.402221, 15.172503, 0.300002, 179.999938, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19425, 1217.792724, -1655.402221, 15.182503, 0.300002, 179.999938, -179.999847, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19063, "xmasorbs", "foil1-128x128", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1227.527465, -1645.098999, 13.926903, 0.000000, -179.699676, -0.300013, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1227.520996, -1645.098999, 12.756920, 0.000000, -179.699676, -0.300013, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1215.637695, -1650.651855, 13.266903, -0.000029, 540.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19786, 1215.637695, -1660.174438, 13.266903, -0.000029, 540.000000, -89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 1564, "ab_jetlite", "CJ_BULLETBRASS", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1230.488281, -1655.427368, 10.875275, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "carp01S", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1226.986694, -1655.439697, 10.875275, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "carp01S", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1223.495483, -1655.450683, 10.875275, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "carp01S", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1219.994873, -1655.463134, 10.875275, 0.000000, 90.000030, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "carp01S", 0x00000000);
	tmpobjid = CreateDynamicObject(1491, 1232.172607, -1653.625122, 10.932110, -0.000022, 360.000000, -90.200050, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4830, "airport2", "sanairtex3", 0x00000000);
	tmpobjid = CreateDynamicObject(2206, 1217.581420, -1652.775878, 10.951212, -0.000019, 0.000019, -44.899772, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(2206, 1218.888671, -1656.888427, 10.951212, -0.000019, -0.000019, -134.899902, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1219.490356, -1655.482299, 11.081210, 89.999992, 90.000015, -89.999961, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 6869, "vegastemp1", "vgnbarbtex1_256", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1215.485839, -1655.479003, 10.644131, 0.000000, 179.999847, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4604, "buildblk555", "gm_labuld5_b", 0x00000000);
	tmpobjid = CreateDynamicObject(2266, 1219.500122, -1653.841796, 11.916895, 0.000028, -0.000011, 112.099143, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3899, "hospital2", "black", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 3899, "hospital2", "black", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1216.584228, -1655.374755, 10.865262, 0.000000, 90.000015, 0.199998, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "carp01S", 0x00000000);
	tmpobjid = CreateDynamicObject(2206, 1219.059936, -1654.543701, 10.961213, -0.000019, 0.000019, -89.999786, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14629, "ab_chande", "ab_goldpipe", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1663.788330, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.197998, -1664.818481, 12.705709, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1649.591674, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1647.990722, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1646.390258, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.187988, -1645.959838, 12.705639, 0.000000, -0.399967, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "policeshieldgls", 0x00000000);
	tmpobjid = CreateDynamicObject(19452, 1232.310546, -1660.751220, 16.181777, 0.000000, 0.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "brick008", 0x00000000);
	tmpobjid = CreateDynamicObject(19452, 1232.310546, -1649.889160, 16.181777, 0.000000, 0.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "brick008", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 1232.309204, -1655.395019, 16.183139, 0.000000, 0.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "brick008", 0x00000000);
	tmpobjid = CreateDynamicObject(7313, 1232.595214, -1655.148559, 14.472105, 0.000029, 0.000000, 89.999908, -1, -1, -1, .streamdistance = 100.00);
	SetObjectMaterialText(tmpobjid, "{ff9900} Diamonds Store", 0, 70, "Ariel", 30, 1, 0x00000003, 0x00000003, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(11726, 1223.546386, -1648.219848, 15.071242, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2784, 1225.910644, -1660.413085, 12.265934, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(11726, 1228.798583, -1662.413696, 15.071242, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2784, 1225.910644, -1650.285400, 12.265934, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(11726, 1228.698486, -1648.200439, 15.071242, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(11726, 1223.546386, -1662.463989, 15.071242, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1953, 1228.975708, -1650.253051, 11.781235, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19941, 1229.208251, -1660.446044, 11.779377, -0.000024, 0.000014, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2125, 1229.165405, -1660.454223, 11.465907, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19941, 1229.275878, -1660.401855, 11.779377, -0.000024, 0.000014, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2411, 1222.672485, -1660.553466, 11.915938, 0.000000, 0.000037, 0.500105, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2411, 1223.382812, -1660.546997, 11.915938, 0.000000, 0.000037, 0.500105, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(3628, 1225.496582, -1654.039916, 17.986871, 0.000000, 0.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19941, 1229.183227, -1660.462280, 11.819378, -0.000024, 0.000014, -56.899955, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19806, 1217.575439, -1655.438232, 14.781245, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2010, 1231.893066, -1658.252319, 10.955918, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18962, 1223.382690, -1660.488159, 12.325928, 0.000000, 270.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19097, 1222.661743, -1660.490356, 12.325922, 0.000000, 270.000000, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18956, 1226.787231, -1660.487548, 12.067934, 4.199965, 14.400012, -71.299949, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19138, 1222.799926, -1650.183837, 11.805920, -0.000029, 0.000003, -79.899909, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19139, 1223.204467, -1650.222900, 11.805926, -0.200028, 0.000006, -78.499908, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19025, 1223.593994, -1650.211669, 11.815918, -0.000029, 0.000009, -72.499969, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19017, 1224.011352, -1650.217041, 11.805930, -0.000029, 0.000003, -79.199905, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1956, 1228.260253, -1650.227416, 11.785927, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1956, 1227.449462, -1650.227416, 11.785927, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(4732, 1221.846557, -1665.563842, 12.455849, -0.000017, 0.000024, -34.700008, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19825, 1222.606323, -1645.182250, 13.411227, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1723, 1220.757324, -1665.062133, 10.959383, 0.000000, -0.000029, -179.799942, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19804, 1218.859130, -1654.453735, 11.824625, 0.000007, 0.000029, 16.099996, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1714, 1217.696655, -1655.643798, 10.921212, 0.000029, -0.000009, 107.599884, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1827, 1219.388671, -1663.168823, 10.960083, 0.099992, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1723, 1217.371215, -1663.775756, 10.959383, 0.000029, 0.000000, 89.299827, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(1829, 1216.329101, -1655.227416, 11.407954, 0.000029, 0.000000, 89.799842, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(2002, 1222.041015, -1665.073364, 10.961338, 0.000000, -0.000029, -178.899810, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(632, 1217.346191, -1664.714843, 11.375926, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1222.804931, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1223.445068, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1223.155273, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1223.775390, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1224.135742, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1224.505859, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1224.876220, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1226.837768, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1227.298217, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1227.728637, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1228.149047, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1228.569458, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1229.019897, -1650.285766, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1229.020141, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1228.629760, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1228.189331, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1227.708862, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1227.238403, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1226.748046, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1222.537231, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1222.957641, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1223.348022, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1223.748413, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1224.138793, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1224.559082, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18641, 1225.029418, -1660.418212, 12.945923, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18014, 1231.738647, -1662.257324, 11.403468, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(18014, 1231.658569, -1648.545654, 11.403468, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);
	tmpobjid = CreateDynamicObject(19617, 1225.393066, -1645.153320, 12.671214, 0.000000, 0.000029, 0.000000, -1, -1, -1, .streamdistance = 100.00);


	
	// khu pho van hoa 2
	/*tmpobjid = CreateObject(3313, 2352.017333, -1810.067871, 15.427032, 0.000000, 0.000000, 180.000000);
	SetObjectMaterial(tmpobjid, 3, 17079, "cuntwland", "stones256", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(19377, 2252.016357, -1811.482299, 15.058594, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(772, 2231.696777, -1834.407226, 12.384106, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19377, 2262.429443, -1811.482299, 15.058594, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2247.276611, -1806.752319, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19377, 2237.682617, -1806.752319, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(772, 2241.157958, -1834.407226, 12.384106, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3443, 2328.426757, -1775.477539, 15.338792, 0.000000, 0.000000, 360.000000);
	tmpobjid = CreateObject(19375, 2248.303955, -1830.879028, 9.630089, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(1290, 2313.018554, -1759.560302, 15.821951, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(3307, 2314.229980, -1805.906372, 12.555891, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(3446, 2388.672607, -1769.263916, 15.994935, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19377, 2267.111572, -1806.705932, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(3483, 2386.823486, -1808.150390, 19.416894, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(836, 2330.536865, -1788.130371, 13.658268, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(772, 2250.998535, -1833.526733, 12.384106, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(886, 2303.090576, -1821.172851, 12.456868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(708, 2323.521972, -1816.357910, 12.586875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(772, 2256.962890, -1833.026489, 12.384106, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3425, 2313.839355, -1763.123168, 23.765552, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19377, 2276.743896, -1806.710571, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19376, 2396.043212, -1787.355102, 12.556875, 0.000000, 90.000000, 0.000000);
	tmpobjid = CreateObject(19376, 2385.544189, -1787.355102, 12.556875, 0.000000, 90.000000, 0.000000);
	tmpobjid = CreateObject(3496, 2402.195556, -1787.202026, 12.642811, 0.000000, 0.000000, 450.000000);
	tmpobjid = CreateObject(1232, 2375.756347, -1783.567871, 15.126889, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19869, 2375.475585, -1789.543701, 12.546875, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19869, 2375.475585, -1781.224365, 12.546875, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19869, 2377.858886, -1793.446655, 12.546875, 0.000000, 0.000000, 153.200103);
	tmpobjid = CreateObject(19868, 2403.246582, -1781.152587, 13.236870, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2403.259765, -1792.227539, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19868, 2403.246582, -1786.442749, 13.236870, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19868, 2403.246582, -1791.692626, 13.236870, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(1368, 2383.244628, -1779.192871, 13.222813, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1368, 2386.374511, -1779.192871, 13.222813, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1368, 2394.245361, -1779.192871, 13.222813, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1368, 2397.006591, -1779.192871, 13.222813, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2737, 2390.283203, -1778.559692, 14.066880, 0.000000, 1.699998, 0.000000);
	tmpobjid = CreateObject(1568, 2260.072021, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(869, 2359.562011, -1799.362060, 13.136878, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3496, 2379.455322, -1787.202026, 12.642811, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(1232, 2388.315917, -1778.726440, 15.126889, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19433, 2369.996582, -1793.016357, 13.246877, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19273, 2370.280517, -1792.940795, 14.256884, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(650, 2361.696533, -1814.283935, 13.082710, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1446, 2365.473388, -1759.295776, 13.332148, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1446, 2360.744140, -1759.295776, 13.332148, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1446, 2377.152343, -1759.295776, 13.332148, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(733, 2361.965576, -1784.067138, 12.436865, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19377, 2232.530029, -1776.078247, 8.622453, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(18766, 2261.319335, -1766.806274, 10.867550, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18766, 2245.912109, -1781.225952, 10.867550, 0.000023, -0.000029, 179.694671);
	tmpobjid = CreateObject(18766, 2236.997558, -1760.452270, 10.867550, 0.000023, -0.000029, 179.694671);
	tmpobjid = CreateObject(18766, 2232.508056, -1775.921020, 10.867550, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18766, 2255.860839, -1781.297485, 10.867550, 0.000023, -0.000029, 179.694671);
	tmpobjid = CreateObject(18766, 2256.844726, -1760.524536, 10.867550, 0.000023, -0.000029, 179.694671);
	tmpobjid = CreateObject(18766, 2246.961669, -1760.483764, 10.867550, 0.000023, -0.000029, 179.694671);
	tmpobjid = CreateObject(18980, 2261.327392, -1761.444702, 0.859152, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18766, 2261.335693, -1776.809448, 10.867550, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18766, 2232.505615, -1765.924682, 10.867550, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2246.217773, -1781.272094, 8.622452, 0.000029, 0.000022, 90.059883);
	tmpobjid = CreateObject(18980, 2232.541015, -1770.948120, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2232.528076, -1781.197143, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2261.305908, -1771.128784, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2261.305908, -1781.231079, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2240.477539, -1781.204956, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2261.367431, -1776.495971, 8.622453, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19377, 2236.919677, -1760.533325, 8.622453, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2261.293945, -1760.567260, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2246.257080, -1760.494506, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2255.828369, -1781.273071, 8.622453, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2256.138916, -1760.536987, 8.622453, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2246.515380, -1760.540649, 8.622453, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(18980, 2232.532470, -1760.804565, 1.752514, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19377, 2261.371826, -1765.848754, 8.622453, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19377, 2232.500244, -1766.111694, 8.622453, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19466, 2249.942871, -1766.023803, 13.918152, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19466, 2246.515625, -1767.746459, 16.539552, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19466, 2249.889892, -1770.591430, 13.918152, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19466, 2246.731689, -1770.715698, 16.617511, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19466, 2242.733398, -1767.741577, 16.539552, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(1432, 2252.673095, -1766.472045, 12.722052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(3850, 2241.794189, -1763.881958, 15.752653, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(3850, 2249.866943, -1771.922485, 15.752653, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(3850, 2249.852783, -1768.652221, 15.752653, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(3850, 2240.178466, -1766.236450, 15.752653, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(3850, 2248.196533, -1763.885864, 15.752653, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(3850, 2244.816650, -1763.883666, 15.752653, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(3850, 2249.860351, -1765.453002, 15.752653, 0.000022, -0.000029, 179.999725);
	tmpobjid = CreateObject(19603, 2257.808349, -1772.895874, 13.226692, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(19603, 2257.786376, -1777.850952, 13.222520, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(1569, 2246.663085, -1775.738159, 12.566851, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(870, 2256.694091, -1768.015014, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(870, 2256.863037, -1762.795776, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(870, 2256.764160, -1765.273803, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(870, 2259.014648, -1768.062622, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(870, 2259.107666, -1765.321899, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(870, 2259.230224, -1762.844360, 13.135931, 0.000029, 0.000023, 89.593811);
	tmpobjid = CreateObject(808, 2258.491943, -1767.723266, 14.166691, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(808, 2258.088134, -1763.391967, 14.166691, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(1255, 2253.325927, -1773.299682, 13.196051, -0.000022, 0.000029, 0.000037);
	tmpobjid = CreateObject(1255, 2253.358154, -1777.793823, 13.196051, -0.000022, 0.000029, 0.000037);
	tmpobjid = CreateObject(1255, 2253.335937, -1775.592163, 13.196051, -0.000022, 0.000029, 0.000037);
	tmpobjid = CreateObject(19126, 2260.010986, -1770.950805, 13.687651, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2240.440673, -1781.244262, 14.610052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2232.627197, -1781.253784, 14.610052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2232.518554, -1760.781372, 14.610052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2261.260009, -1760.545776, 14.610052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2261.355957, -1781.264282, 14.610052, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2260.198486, -1779.985961, 13.687651, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2255.478759, -1779.926147, 13.687651, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2250.223388, -1764.146118, 13.081631, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2255.385498, -1771.035034, 13.687651, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19126, 2250.286865, -1773.240112, 13.081631, 0.000029, 0.000022, 89.999877);
	tmpobjid = CreateObject(19831, 2252.428222, -1761.636352, 12.613451, -0.000022, 0.000029, 0.000037);
	tmpobjid = CreateObject(19377, 2281.510986, -1811.480590, 15.942583, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2276.678466, -1816.228393, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19377, 2267.188476, -1816.210571, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19377, 2247.294433, -1816.281860, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19377, 2237.682617, -1816.228393, 15.942583, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19377, 2232.894531, -1811.477172, 15.942583, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2276.306884, -1811.424682, 21.127786, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2265.843994, -1811.419067, 21.127786, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2255.364257, -1811.433227, 21.127786, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2244.904052, -1811.447387, 21.127786, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19377, 2238.059326, -1811.471801, 21.125787, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19460, 2246.437744, -1806.679809, 14.553293, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2238.677734, -1806.681762, 14.553293, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2239.725097, -1806.698364, 19.058282, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2267.890625, -1806.670532, 18.210283, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2275.893554, -1806.672485, 18.210283, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2237.926269, -1816.275512, 19.058282, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2246.450683, -1816.300903, 19.058282, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2274.611572, -1816.286254, 19.058282, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2274.391357, -1816.290161, 14.450296, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19460, 2281.541992, -1811.482055, 18.210283, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2267.671142, -1800.633911, 9.632065, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2277.309082, -1800.633911, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2282.742431, -1800.643432, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2288.323242, -1807.088500, 9.632088, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2288.323242, -1816.647583, 9.632088, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2288.323242, -1826.206420, 9.632088, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2282.072753, -1830.865600, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2272.434814, -1830.865600, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2262.796875, -1830.865600, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2253.158935, -1830.865600, 9.632088, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(772, 2263.683837, -1832.375854, 12.384106, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19375, 2238.674072, -1830.879028, 9.630089, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2233.904296, -1826.128295, 9.630089, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2233.882812, -1816.534545, 9.630089, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19375, 2245.891845, -1800.739379, 9.632065, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2236.341796, -1800.755737, 9.632065, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19375, 2234.494384, -1800.700317, 9.630089, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2281.517089, -1811.467407, 8.309914, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2276.270507, -1816.239379, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2267.210449, -1816.219848, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2262.364013, -1811.441528, 8.309891, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2252.053466, -1811.492309, 8.309891, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2247.303710, -1806.718383, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2237.701171, -1806.735961, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2232.846679, -1811.458618, 8.309891, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2237.710937, -1816.315063, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2247.327880, -1816.284301, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2267.104736, -1806.699829, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19378, 2276.723876, -1806.671508, 8.309891, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(19439, 2262.407714, -1811.404907, 15.309090, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19439, 2262.407714, -1811.404907, 18.807085, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19439, 2252.045654, -1811.404907, 18.807085, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19439, 2252.045654, -1811.404907, 15.309090, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19376, 2257.209716, -1811.437133, 20.336587, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(19459, 2246.937011, -1805.500122, 17.382387, 0.000007, 89.999992, 89.999908);
	tmpobjid = CreateObject(19459, 2238.032958, -1805.500122, 17.382387, 0.000007, 89.999992, 89.999908);
	tmpobjid = CreateObject(19459, 2267.640869, -1816.424438, 17.270387, -0.000007, 90.000007, -90.000007);
	tmpobjid = CreateObject(19459, 2276.230224, -1816.423706, 17.270387, -0.000007, 90.000007, -90.000007);
	tmpobjid = CreateObject(19372, 2279.776367, -1829.735961, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2276.276367, -1829.735961, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2272.776367, -1829.735961, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2269.307861, -1829.743286, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2279.776367, -1826.515747, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2279.776367, -1823.323852, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2279.776367, -1820.131958, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2279.776367, -1817.695922, 13.402915, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2267.078857, -1826.566528, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2267.065185, -1829.714233, 13.406913, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2267.059570, -1823.372680, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2267.072998, -1820.193969, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19372, 2267.085205, -1817.014770, 13.404914, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19380, 2273.939208, -1814.172973, 13.396012, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(19379, 2278.086425, -1823.482788, 8.222413, 0.000007, 0.000022, -0.000136);
	tmpobjid = CreateObject(19379, 2273.578125, -1828.159790, 8.222413, 0.000022, -0.000007, 89.999862);
	tmpobjid = CreateObject(19379, 2268.763427, -1823.713989, 8.222413, 0.000007, 0.000022, -0.000136);
	tmpobjid = CreateObject(19379, 2273.383544, -1818.933471, 8.222413, 0.000022, -0.000007, 89.999862);
	tmpobjid = CreateObject(19379, 2272.707031, -1823.385620, 9.257415, 0.000007, 90.000022, -0.000136);
	tmpobjid = CreateObject(18762, 2259.820800, -1807.013793, 20.632883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.820800, -1807.013793, 20.632883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.420654, -1807.015747, 20.632883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2259.820800, -1815.887817, 20.632883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.820800, -1815.889770, 20.634880, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.420654, -1815.887817, 20.632883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2259.820800, -1815.887817, 19.645883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.820800, -1815.889770, 19.645883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.420654, -1815.887817, 19.645883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.820800, -1807.013793, 19.645883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2254.420654, -1807.015747, 19.647882, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18762, 2259.820800, -1807.013793, 19.645883, 0.000007, 90.000007, -0.000136);
	tmpobjid = CreateObject(18770, 2251.443115, -1801.489868, -83.138938, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(18770, 2262.062500, -1801.458862, -83.138900, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(18770, 2287.581054, -1801.438598, -83.138900, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(18770, 2287.834716, -1830.144653, -83.138900, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(18770, 2230.053710, -1801.535034, -83.138938, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2265.434570, -1826.107666, 8.229913, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2265.434570, -1816.478515, 8.229913, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2281.435791, -1826.029296, 8.229913, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19378, 2281.435791, -1816.429687, 8.229913, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(19603, 2271.282226, -1825.624145, 13.222532, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(19603, 2276.271972, -1825.651000, 13.222532, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(19603, 2276.300048, -1820.651245, 13.222531, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(19603, 2271.311523, -1820.623657, 13.222534, 0.000029, 0.000023, 89.693817);
	tmpobjid = CreateObject(19377, 2245.578125, -1781.271606, 8.623454, 0.000029, 0.000022, 90.059883);
	tmpobjid = CreateObject(3466, 2275.324218, -1774.759155, 15.076870, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(777, 2254.119384, -1786.318359, 12.446872, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(970, 2235.343994, -1803.873168, 17.922182, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2239.417968, -1803.873168, 17.922182, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2243.491943, -1803.873168, 17.922182, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2247.565917, -1803.873168, 17.922182, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2249.666748, -1803.885375, 17.922182, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2251.699707, -1805.967895, 17.922182, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2233.269775, -1805.967895, 17.922182, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(10575, 2237.882568, -1816.363647, 14.437494, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(10575, 2247.696533, -1816.345825, 14.437494, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2264.958496, -1818.153930, 17.799882, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2269.074462, -1818.153930, 17.799882, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2273.162597, -1818.153930, 17.799882, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2277.222412, -1818.153930, 17.799882, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2278.889648, -1818.134887, 17.799882, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2280.956542, -1816.074584, 17.799882, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2262.939453, -1816.059448, 17.799882, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(1569, 2262.392089, -1816.261108, 12.544191, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1569, 2265.345458, -1816.289184, 12.544191, -0.000007, -0.000007, 179.999862);
	tmpobjid = CreateObject(1569, 2266.214355, -1816.253540, 17.332185, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1569, 2247.666748, -1806.669555, 17.332185, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(3639, 2352.655273, -1770.210937, 16.685615, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3307, 2305.351318, -1771.147338, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(714, 2293.672607, -1787.860961, 11.726870, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1568, 2279.102294, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1215, 2265.374267, -1826.518676, 13.102295, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1215, 2265.317871, -1820.687133, 13.102295, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(970, 2281.547607, -1828.705444, 13.043892, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2281.547607, -1824.585571, 13.043892, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2281.547607, -1820.505493, 13.043892, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(970, 2281.547607, -1816.385375, 13.043892, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(1223, 2251.614746, -1801.015747, 13.944391, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(1223, 2261.925048, -1801.049438, 13.944391, 0.000007, -0.000007, 89.999908);
	tmpobjid = CreateObject(1223, 2251.833740, -1808.488891, 12.500618, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1223, 2251.778076, -1814.206665, 12.500597, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1223, 2262.569091, -1808.578247, 12.500597, -0.000007, -0.000007, 179.999862);
	tmpobjid = CreateObject(1223, 2262.527343, -1814.553833, 12.500597, -0.000007, -0.000007, 179.999862);
	tmpobjid = CreateObject(641, 2253.270019, -1830.181274, 9.995996, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(641, 2245.313964, -1830.181274, 9.995996, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(641, 2236.422119, -1830.181274, 9.995996, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1826.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1824.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1822.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1820.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1818.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1816.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1814.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1812.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1810.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1808.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1806.659790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2284.690429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2282.190429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2279.690429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2277.190429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2274.690429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2272.190429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2269.690429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2267.190429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(869, 2265.190429, -1804.159790, 12.823288, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2229.740234, -1818.095336, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2231.790527, -1817.917602, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2230.822265, -1820.080444, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2231.866943, -1822.025024, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2231.984375, -1824.070922, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2232.083007, -1819.631469, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2232.213378, -1825.861694, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(673, 2232.064697, -1827.577270, 2.157175, 0.000007, 0.000007, -0.000136);
	tmpobjid = CreateObject(1568, 2299.259765, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1568, 2319.080322, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1568, 2337.578857, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1568, 2355.499511, -1793.926391, 12.546875, 0.000000, 0.000000, 0.000000);*/
	tmpobjid = CreateObject(8417, 2497.485351, -1761.177734, 12.546875, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(8417, 2458.540527, -1761.177734, 12.566872, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(3607, 2478.344970, -1756.238647, 18.550794, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(14608, 2494.602050, -1758.568725, 13.924700, 0.000000, 0.000000, -131.999984);
	tmpobjid = CreateObject(19866, 2505.250976, -1742.424560, 12.554680, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19866, 2510.223144, -1742.424560, 12.554680, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19866, 2515.225097, -1742.424560, 12.554680, 0.000000, 0.000000, 90.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1744.933959, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1749.915771, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1754.898193, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1759.889038, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1769.892089, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2517.626464, -1764.890991, 12.554680, 0.000000, 0.000000, 180.000000);
	tmpobjid = CreateObject(19866, 2515.236328, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2510.244628, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2505.271972, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2500.299804, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2495.326904, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2490.344726, -1772.472656, 12.554680, 0.000000, 0.000000, 270.000000);
	tmpobjid = CreateObject(19866, 2487.943115, -1770.063354, 12.554680, 0.000000, 0.000000, 360.000000);
	/*tmpobjid = CreateObject(11244, 1825.191406, -1477.082275, 24.707435, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19462, 2224.544677, -1784.473510, 18.577522, 0.000007, -0.000029, 179.999771);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19462, 2224.545654, -1786.742797, 18.577522, 0.000007, -0.000029, 179.999771);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1783.555786, 17.613416, 0.000007, -0.000050, 179.999633);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1788.286376, 17.613416, 0.000007, -0.000050, 179.999633);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.405029, -1791.083374, 17.258529, -24.799982, -0.000033, 179.999771);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1787.315551, 18.053422, 0.000007, -0.000050, 179.999633);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.405029, -1787.319213, 17.334903, -24.799982, -0.000033, 179.999771);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.405029, -1789.046508, 17.925569, -3.599975, -0.000050, 179.999633);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19087, 2224.454833, -1780.056518, 19.793468, 0.000029, 0.000007, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19087, 2224.454833, -1791.046752, 19.793468, 0.000029, 0.000007, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1780.075073, 19.783470, 0.000029, 90.000007, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1783.695922, 19.783470, 0.000029, 90.000007, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1783.665893, 17.343408, 0.000050, 90.000007, 89.999809);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1780.075073, 17.333461, 0.000029, 90.000007, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1792.806152, 17.613416, 0.000007, -0.000050, 179.999633);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	tmpobjid = CreateObject(19377, 2256.229248, -1765.573364, 12.525852, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2244.891845, -1763.820678, 10.062749, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2237.043945, -1776.055541, 12.528853, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2256.240966, -1776.016723, 12.530854, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2240.182373, -1772.606079, 12.655351, 0.000022, -0.000029, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2245.052001, -1773.412963, 12.655351, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19454, 2241.829833, -1777.411254, 13.102552, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19454, 2244.965332, -1777.417846, 13.102552, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(18980, 2240.561035, -1764.222778, 5.524013, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2240.539550, -1777.254272, 5.462055, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.434326, -1773.177368, 5.415954, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(19377, 2237.064697, -1765.570678, 12.525852, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19454, 2241.866699, -1768.630004, 15.234352, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19454, 2248.141357, -1768.631958, 15.230352, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19454, 2244.681884, -1768.626831, 15.232351, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19377, 2244.941162, -1767.876342, 12.655351, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(18766, 2242.526855, -1768.697631, 18.374584, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2242.543701, -1772.766723, 18.374584, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2260.257080, -1775.367309, 10.871010, 0.000029, 0.000022, 90.104980);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18766, 2245.096923, -1768.695434, 18.375583, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.435791, -1767.868286, 5.422152, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.432373, -1764.222045, 5.403055, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2247.101318, -1777.265502, 5.462055, 0.000029, 0.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2247.444824, -1768.718383, 18.374584, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.650878, -1765.569702, 12.527853, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.655273, -1776.034057, 12.526850, 0.000029, 90.000022, 89.999877);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18766, 2245.114013, -1772.764770, 18.373584, 89.999992, 173.226013, -83.225975);
	SetObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2255.453857, -1775.388305, 10.859520, 0.000029, 0.000022, 90.104980);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18762, 2257.797851, -1779.874145, 12.864749, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18762, 2257.866699, -1770.853393, 12.865751, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19454, 2249.772705, -1768.713256, 13.458150, 0.000022, -0.000029, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.607666, -1772.655883, 12.655351, 0.000022, -0.000029, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19449, 2256.702148, -1765.572387, 12.599351, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateObject(19449, 2259.057617, -1765.548706, 12.644351, 0.000022, 89.999969, 179.999725);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(19866, 2225.156494, -1780.493774, 14.757519, 89.999992, 353.225982, -83.225975);
	tmpobjid = CreateObject(19866, 2225.156494, -1790.733276, 14.757519, 89.999992, 353.225982, -83.225975);
	tmpobjid = CreateObject(19462, 2224.544677, -1784.473510, 18.577522, 0.000007, -0.000029, 179.999771);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19462, 2224.545654, -1786.742797, 18.577522, 0.000007, -0.000029, 179.999771);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1783.555786, 17.613416, 0.000007, -0.000051, 179.999633);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} KHU PHO", 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2224.442626, -1788.286376, 17.613416, 0.000007, -0.000051, 179.999633);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} VAN HOA", 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2224.405029, -1791.083374, 17.258529, -24.799982, -0.000033, 179.999771);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} /", 130, "Arial", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2224.442626, -1787.315551, 18.053422, 0.000007, -0.000051, 179.999633);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} ^", 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2224.405029, -1787.319213, 17.334903, -24.799982, -0.000033, 179.999771);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} /", 130, "Arial", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 2224.405029, -1789.046508, 17.925569, -3.599975, -0.000051, 179.999633);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} u", 130, "Symbol", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19087, 2224.454833, -1780.056518, 19.793468, 0.000029, 0.000007, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19087, 2224.454833, -1791.046752, 19.793468, 0.000029, 0.000007, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1780.075073, 19.783470, 0.000029, 90.000007, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1783.695922, 19.783470, 0.000029, 90.000007, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1783.665893, 17.343408, 0.000051, 90.000007, 89.999809);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2224.468994, -1780.075073, 17.333461, 0.000029, 90.000007, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19482, 2224.442626, -1792.806152, 17.613416, 0.000007, -0.000051, 179.999633);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} 2", 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19377, 2256.229248, -1765.573364, 12.525852, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2244.891845, -1763.820678, 10.062750, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2237.043945, -1776.055541, 12.528853, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2256.240966, -1776.016723, 12.530854, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2240.182373, -1772.606079, 12.655352, 0.000022, -0.000029, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2245.052001, -1773.412963, 12.655352, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19454, 2241.829833, -1777.411254, 13.102552, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19454, 2244.965332, -1777.417846, 13.102552, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(18980, 2240.561035, -1764.222778, 5.524014, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2240.539550, -1777.254272, 5.462055, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.434326, -1773.177368, 5.415954, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(19377, 2237.064697, -1765.570678, 12.525852, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19454, 2241.866699, -1768.630004, 15.234352, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19454, 2248.141357, -1768.631958, 15.230352, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19454, 2244.681884, -1768.626831, 15.232351, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "gun_floor2", 0x00000000);
	tmpobjid = CreateObject(19377, 2244.941162, -1767.876342, 12.655352, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(18766, 2242.526855, -1768.697631, 18.374584, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2242.543701, -1772.766723, 18.374584, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2260.257080, -1775.367309, 10.871011, 0.000029, 0.000022, 90.104980);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18766, 2245.096923, -1768.695434, 18.375583, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.435791, -1767.868286, 5.422152, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2249.432373, -1764.222045, 5.403055, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18980, 2247.101318, -1777.265502, 5.462055, 0.000029, 0.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2247.444824, -1768.718383, 18.374584, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.650878, -1765.569702, 12.527853, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.655273, -1776.034057, 12.526851, 0.000029, 90.000022, 89.999877);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18766, 2245.114013, -1772.764770, 18.373584, 89.999992, 173.226013, -83.225975);
	SetDynamicObjectMaterial(tmpobjid, 0, 3900, "station", "rustd64", 0x00000000);
	tmpobjid = CreateObject(18766, 2255.453857, -1775.388305, 10.859521, 0.000029, 0.000022, 90.104980);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18762, 2257.797851, -1779.874145, 12.864750, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(18762, 2257.866699, -1770.853393, 12.865751, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 7088, "casinoshops1", "fakestone1_LA", 0x00000000);
	tmpobjid = CreateObject(19454, 2249.772705, -1768.713256, 13.458151, 0.000022, -0.000029, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19377, 2246.607666, -1772.655883, 12.655352, 0.000022, -0.000029, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampwhite", 0x00000000);
	tmpobjid = CreateObject(19449, 2256.702148, -1765.572387, 12.599352, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateObject(19449, 2259.057617, -1765.548706, 12.644351, 0.000022, 89.999969, 179.999725);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(19866, 2225.156494, -1780.493774, 14.757520, 89.999992, 353.225982, -83.225975);
	tmpobjid = CreateObject(19866, 2225.156494, -1790.733276, 14.757520, 89.999992, 353.225982, -83.225975);*/

	
	
	
	//khusuaxe
//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
/*
	Exported on "2021-07-16 16:29:49" by "Thuandeptrai"
	Created by "co_Rich"
	Spawn Position: 1795.955200, -1724.890502, 13.546875
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	// new object_world = -1, object_int = -1;
	
	new worldvip = 1, intvip = 1;

	tmpobjid = CreateDynamicObject(19482, 2533.458251, 2295.381835, 908.722778, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} GTAVN VIP", 120, "Arial", 30, 0, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(16150, 2529.757324, 2299.059814, 907.865295, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(11729, 2537.966308, 2300.034667, 907.873107, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(11729, 2537.966308, 2299.424072, 907.873107, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(11729, 2537.966308, 2298.873779, 907.873107, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(11729, 2537.966308, 2298.313232, 907.873107, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(19860, 2525.848144, 2292.805664, 909.126281, 0.000000, 0.000000, 90.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(942, 2529.326171, 2303.794677, 908.728881, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(638, 2526.510986, 2296.367431, 908.513122, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(638, 2526.510986, 2299.728515, 908.513122, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(19608, 2529.539550, 2288.056152, 907.672912, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(19609, 2527.620361, 2287.753662, 908.466857, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(2748, 2535.701660, 2293.181152, 908.403320, 0.000000, 0.000000, 180.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(2748, 2534.180175, 2297.885498, 908.403320, 0.000000, 0.000000, 450.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(19806, 2530.000244, 2296.883056, 910.722900, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(11689, 2532.479492, 2299.109375, 907.873107, 0.000000, 0.000000, 270.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(956, 2533.069091, 2294.791015, 908.253479, 0.000000, 0.000000, 270.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(18885, 2533.018066, 2293.307861, 909.023071, 0.000000, 0.000000, 270.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(1778, 2525.966796, 2292.239990, 907.865295, 0.000000, 0.000000, 90.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(1828, 2529.298583, 2298.032958, 907.873107, 0.000000, 0.000000, 90.000000, worldvip, intvip, -1);
	tmpobjid = CreateDynamicObject(2267, 2536.048095, 2300.231689, 909.503601, 0.000000, 0.000000, 0.000000, worldvip, intvip, -1);

	
	
	/*tmpobjid = CreateDynamicObject(19377, 1796.268310, -1717.402709, 12.510605, 0.000000, 90.000007, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.267944, -1717.402709, 12.540606, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1764.767822, -1717.402709, 12.550606, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1785.768188, -1698.249877, 12.550606, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1785.768188, -1707.879394, 12.550606, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.267944, -1707.879394, 12.550606, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1764.767822, -1707.769287, 12.550606, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1796.268310, -1707.872436, 12.510605, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1796.929565, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1795.019531, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1793.109497, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1791.199462, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1789.289428, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1787.379394, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1785.469360, -1712.284423, 12.672773, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19866, 1793.836547, -1719.742797, 19.406106, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1795.221679, -1712.305908, 14.697283, 89.999992, 154.471221, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1795.435791, -1712.100830, 14.698281, 89.999992, 244.471206, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1795.650146, -1712.305908, 14.697283, 89.999992, 329.523193, -59.523265, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1795.436035, -1712.510986, 14.698281, 89.999992, 419.523193, -59.523265, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1796.725341, -1712.173217, 15.552777, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1795.405151, -1712.273315, 14.992777, 0.000014, 89.999984, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1792.580322, -1712.305908, 14.697283, 89.999992, 154.471237, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1792.794433, -1712.100830, 14.698281, 89.999992, 244.471221, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1793.008789, -1712.305908, 14.697283, 89.999992, 332.065734, -62.065807, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1792.794677, -1712.510986, 14.698281, 89.999992, 422.065734, -62.065807, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1794.083984, -1712.283325, 15.552777, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1792.763793, -1712.273315, 14.992777, 0.000020, 89.999984, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1789.928833, -1712.305908, 14.697283, 89.999992, 154.471267, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1790.142944, -1712.100830, 14.698281, 89.999992, 244.471252, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1790.357299, -1712.305908, 14.697283, 89.999992, 333.883239, -63.883281, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1790.143188, -1712.510986, 14.698281, 89.999992, 423.883239, -63.883281, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1791.432495, -1712.283325, 15.552777, 0.000014, 0.000036, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1790.112304, -1712.273315, 14.992777, 0.000036, 89.999984, 179.999771, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1787.297851, -1712.305908, 14.697283, 89.999992, 154.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1787.511962, -1712.100830, 14.698281, 89.999992, 244.471267, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1787.726318, -1712.305908, 14.697283, 89.999992, 334.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1787.512207, -1712.510986, 14.698281, 89.999992, 424.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1788.801513, -1712.283325, 15.552777, 0.000014, 0.000044, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1787.481323, -1712.273315, 14.992777, 0.000044, 89.999984, 179.999740, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.667236, -1712.305908, 14.697283, 89.999992, 154.471298, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.881347, -1712.100830, 14.698281, 89.999992, 244.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1785.095703, -1712.305908, 14.697283, 89.999992, 334.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.881591, -1712.510986, 14.698281, 89.999992, 424.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1786.170898, -1712.283325, 15.552777, 0.000014, 0.000051, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1784.850708, -1712.273315, 14.992777, 0.000051, 89.999984, 179.999725, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1796.929565, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1795.019531, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19866, 1788.837280, -1719.742797, 19.406106, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1793.109497, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1791.199462, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1789.289428, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1787.379394, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1785.469360, -1712.794921, 15.752790, 0.000014, 90.000007, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(1523, 1798.629394, -1712.298461, 12.642777, -0.000014, 0.000022, 0.000014, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "gg_end_lod_3", 0x00000000);
	tmpobjid = CreateDynamicObject(19817, 1768.763427, -1707.337036, 11.326538, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1801.059448, -1713.465454, 15.762789, 0.000014, 89.999977, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1800.807373, -1714.376708, 15.622767, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1800.806518, -1712.057006, 14.992765, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19392, 1799.419433, -1712.453369, 14.422772, 0.000007, 0.000014, 89.999870, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "easykerb", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.165039, -1712.285644, 14.168778, 89.999992, 871.041198, -61.041183, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.165039, -1712.285644, 12.168778, 89.999992, 871.041198, -61.041183, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1798.635253, -1712.285644, 14.168778, 89.999992, 871.041198, -61.041183, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1798.635253, -1712.285644, 12.168778, 89.999992, 871.041198, -61.041183, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1799.563232, -1712.287109, 15.176770, 0.000014, 0.000020, 89.999809, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19392, 1799.419433, -1712.133056, 14.422772, 0.000007, 0.000014, 89.999870, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "easykerb", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1797.825317, -1712.285644, 14.638779, 89.999992, 871.041198, -61.041183, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1800.820068, -1713.463500, 12.672773, 0.000020, -0.000007, 179.999786, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1800.806518, -1713.388061, 15.682771, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1800.820068, -1716.594970, 12.672773, 0.000027, -0.000007, 179.999755, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1800.830078, -1714.684936, 12.672773, 0.000027, -0.000007, 179.999755, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19817, 1768.763427, -1715.868041, 11.326538, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1801.059448, -1715.375976, 15.762789, 0.000014, 89.999977, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1801.049438, -1717.276855, 15.762789, 0.000014, 89.999977, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1801.059448, -1718.506958, 15.762789, 0.000020, 89.999977, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1800.820068, -1718.505004, 12.672773, 0.000027, -0.000007, 179.999755, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1800.806518, -1718.429565, 15.682770, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1800.806518, -1716.947265, 14.992765, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1785.507446, -1713.395385, 15.762789, 0.000027, 89.999977, 179.999786, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1784.875366, -1714.376708, 15.622767, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1784.874511, -1712.057006, 14.992765, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1784.888061, -1713.463500, 12.672773, 0.000027, -0.000007, 179.999755, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1784.874511, -1713.388061, 15.682771, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19392, 1784.724365, -1715.965698, 14.422772, -0.000036, 0.000000, 0.000029, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "easykerb", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1716.711303, 14.168778, 89.999992, 782.791015, -62.791049, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1716.711303, 12.168778, 89.999992, 782.791015, -62.791049, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1715.181518, 14.168778, 89.999992, 782.791015, -62.791049, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1715.181518, 12.168778, 89.999992, 782.791015, -62.791049, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.890625, -1716.109497, 15.176770, -0.000029, 0.000007, -0.000029, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19392, 1785.044677, -1715.965698, 14.422772, -0.000036, 0.000000, 0.000029, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "easykerb", 0x00000000);
	tmpobjid = CreateDynamicObject(19937, 1785.517456, -1718.196777, 15.762789, 0.000036, 89.999977, 179.999771, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16639, "a51_labs", "ws_trainstationwin1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19937, 1784.888061, -1718.505004, 12.672773, 0.000036, -0.000007, 179.999740, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19087, 1784.874511, -1718.429565, 15.682770, 0.000014, 0.000027, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1784.874511, -1716.947265, 14.992765, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19817, 1768.763427, -1699.496582, 11.326538, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(1523, 1784.919311, -1716.719238, 12.662775, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "gg_end_lod_3", 0x00000000);
	tmpobjid = CreateDynamicObject(19463, 1789.488159, -1719.408447, 14.372776, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9903, "pier69", "pier69_blue2", 0x00000000);
	tmpobjid = CreateDynamicObject(19463, 1796.228515, -1719.398437, 14.372776, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 9903, "pier69", "pier69_blue2", 0x00000000);
	tmpobjid = CreateDynamicObject(19463, 1789.488159, -1719.308349, 14.372776, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5722, "sunrise01_lawn", "tileshoptop1_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19463, 1796.228515, -1719.298339, 14.372776, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5722, "sunrise01_lawn", "tileshoptop1_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.530029, -1719.371337, 13.672275, 89.999992, 154.471237, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.736083, -1719.164306, 13.673274, 89.999992, 244.471221, -64.471199, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.942382, -1719.371337, 13.672275, 89.999992, 332.065734, -62.065807, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.736328, -1719.578369, 13.673274, 89.999992, 422.065734, -62.065807, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.530029, -1719.371337, 15.671285, 89.999992, 154.471252, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.736083, -1719.164306, 15.672284, 89.999992, 244.471237, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.942382, -1719.371337, 15.671285, 89.999992, 333.286254, -63.286319, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.736328, -1719.578369, 15.672284, 89.999992, 423.286254, -63.286319, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.469970, -1712.250122, 13.672277, 89.999992, 154.471267, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.676025, -1712.043090, 13.673274, 89.999992, 244.471252, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.882324, -1712.250122, 13.672277, 89.999992, 333.883239, -63.883281, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.676269, -1712.457153, 13.673274, 89.999992, 423.883239, -63.883281, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.469970, -1712.250122, 15.671286, 89.999992, 154.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.676025, -1712.043090, 15.672284, 89.999992, 244.471267, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.882324, -1712.250122, 15.671286, 89.999992, 334.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1784.676269, -1712.457153, 15.672284, 89.999992, 424.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.739257, -1712.190063, 13.672277, 89.999992, 154.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945312, -1711.983032, 13.673274, 89.999992, 244.471267, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1801.151611, -1712.190063, 13.672277, 89.999992, 334.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945556, -1712.397094, 13.673274, 89.999992, 424.178375, -64.178382, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.739257, -1712.190063, 15.671286, 89.999992, 154.471298, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945312, -1711.983032, 15.672284, 89.999992, 244.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1801.151611, -1712.190063, 15.671286, 89.999992, 334.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945556, -1712.397094, 15.672284, 89.999992, 424.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5709, "melrose17_lawn", "shopface02bl_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.739257, -1719.351928, 13.672277, 89.999992, 154.471298, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945312, -1719.144897, 13.673274, 89.999992, 244.471282, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1801.151611, -1719.351928, 13.672277, 89.999992, 334.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945556, -1719.558959, 13.673274, 89.999992, 424.325073, -64.325080, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.739257, -1719.351928, 15.671286, 89.999992, 154.471313, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945312, -1719.144897, 15.672284, 89.999992, 244.471298, -64.471206, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1801.151611, -1719.351928, 15.671286, 89.999992, 334.398223, -64.398208, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1800.945556, -1719.558959, 15.672284, 89.999992, 424.398223, -64.398208, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1792.735595, -1719.609008, 13.673274, 89.999992, 424.434753, -64.434730, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1783.848022, -1719.742797, 19.406106, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1792.735595, -1719.609008, 15.672284, 89.999992, 424.453063, -64.452957, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 1355, "break_s_bins", "CJ_WOOD_DARK", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1717.500122, 12.593773, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10973, "mall_sfse", "mallfloor3", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1714.000488, 12.593773, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10973, "mall_sfse", "mallfloor3", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1717.500122, 12.603773, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10973, "mall_sfse", "mallfloor3", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1714.000488, 12.603773, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10973, "mall_sfse", "mallfloor3", 0x00000000);
	tmpobjid = CreateDynamicObject(9131, 1800.850830, -1713.091674, 16.342773, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1800.850830, -1715.361938, 16.342773, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1800.850830, -1717.632324, 16.342773, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1800.850830, -1718.472656, 16.342773, 0.009982, 90.009986, -89.999984, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1784.748901, -1713.091674, 16.342773, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1784.748901, -1715.361938, 16.342773, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1784.748901, -1717.632324, 16.342773, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1784.748901, -1718.472656, 16.342773, 0.009982, 90.009979, -90.000030, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1786.258666, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1788.528930, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1790.800537, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1793.060791, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1795.331298, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1797.601440, -1712.320922, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1799.863159, -1712.310913, 16.342773, 0.000014, 89.999992, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1786.258666, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1788.528930, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1790.800537, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1793.060791, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1795.331298, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1797.601440, -1719.244262, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(9131, 1799.863159, -1719.234252, 16.342773, 0.000020, 89.999992, 179.999816, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14577, "casinovault01", "cof_wood1", 0xFFFFFFFF);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1717.500122, 16.553770, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1714.000488, 16.553770, 0.000014, 90.000022, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1717.500122, 16.563770, 0.000014, 90.000030, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1714.000488, 16.563770, 0.000014, 90.000030, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1717.500122, 16.483768, 0.000014, 90.000030, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "mp_burn_ceiling", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1795.971069, -1714.000488, 16.483768, 0.000014, 90.000030, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "mp_burn_ceiling", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1717.500122, 16.493770, 0.000014, 90.000038, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "mp_burn_ceiling", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1789.741333, -1714.000488, 16.493770, 0.000014, 90.000038, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "mp_burn_ceiling", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1800.413696, -1713.772827, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1800.413696, -1716.003906, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1800.413696, -1718.223876, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1796.413696, -1713.772827, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1796.413696, -1716.003906, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1796.413696, -1718.223876, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1792.413696, -1713.772827, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1792.413696, -1716.003906, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1792.413696, -1718.223876, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1788.413696, -1713.772827, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1788.413696, -1716.003906, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1788.413696, -1718.223876, 16.479713, -89.999992, 115.528808, 115.528709, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1785.164306, -1713.772827, 16.479713, -89.999992, 115.528823, 115.528717, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1785.164306, -1716.003906, 16.479713, -89.999992, 115.528823, 115.528717, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1897, 1785.164306, -1718.223876, 16.479713, -89.999992, 115.528823, 115.528717, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1800.806518, -1714.497070, 14.992765, 0.000014, 90.000015, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateDynamicObject(1731, 1790.144287, -1712.691284, 15.039710, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_fabricRed", 0x00000000);
	tmpobjid = CreateDynamicObject(1731, 1787.522827, -1712.691284, 15.039710, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_fabricRed", 0x00000000);
	tmpobjid = CreateDynamicObject(1731, 1792.834838, -1712.691284, 15.039710, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_fabricRed", 0x00000000);
	tmpobjid = CreateDynamicObject(1731, 1795.465087, -1712.691284, 15.039710, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_fabricRed", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 1797.673461, -1719.668212, 21.502817, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10375, "subshops_sfs", "ws_archangels_dirty", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 1762.911865, -1719.878417, 20.732807, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10375, "subshops_sfs", "ws_archangels_dirty", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 1779.093017, -1719.868286, 17.952783, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 13598, "destructo", "sunshinebillboard", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.267944, -1698.249877, 12.550606, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1764.767822, -1698.249877, 12.550606, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1796.268310, -1698.242919, 12.510605, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1799.750488, -1692.475708, 12.486541, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1796.270019, -1692.475708, 12.486541, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1792.789916, -1692.475708, 12.486541, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1789.299072, -1692.475708, 12.486541, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1785.828857, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1782.348388, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1778.868286, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1775.377441, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1771.916259, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1768.445312, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1764.974365, -1692.475708, 12.486541, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19357, 1763.613159, -1692.475708, 12.506542, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 12844, "cos_liquorstore", "b_wtilesreflect", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1796.248291, -1695.672851, 19.280614, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1796.248291, -1705.283325, 19.280614, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1796.268310, -1714.914794, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1785.816650, -1714.944824, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1785.816650, -1705.314086, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1785.816650, -1695.682861, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.357055, -1695.732910, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.357055, -1705.323364, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1775.357055, -1714.953979, 19.290615, 0.000000, 90.000015, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1767.004394, -1714.873901, 19.220613, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1767.004394, -1705.263793, 19.220613, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1767.004394, -1695.612548, 19.220613, 0.000000, 90.000022, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 17298, "weefarmcuntw", "sjmscruffhut4", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1717.342285, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1712.352294, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1707.361694, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1702.381591, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1697.382202, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1801.426635, -1693.400756, 19.406106, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1798.836547, -1719.742797, 19.406106, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1778.857299, -1719.742797, 19.406106, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1773.868041, -1719.742797, 19.406106, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1768.867553, -1719.742797, 19.406106, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1764.188598, -1719.752807, 19.406106, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1769.357666, -1690.899414, 19.406106, 0.000000, -0.000007, -90.000007, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1774.356933, -1690.899414, 19.406106, 0.000000, -0.000007, -90.000007, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1779.346191, -1690.899414, 19.406106, 0.000000, -0.000007, -90.000007, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1693.299926, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1698.289916, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1703.280517, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1708.260620, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1713.260009, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1761.767578, -1717.241455, 19.406106, 0.000007, 0.000000, 179.999877, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1764.357666, -1690.899414, 19.406106, 0.000000, -0.000007, -90.000007, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1784.336914, -1690.899414, 19.406106, 0.000007, -0.000007, -90.000038, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1789.326171, -1690.899414, 19.406106, 0.000007, -0.000007, -90.000038, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1794.326660, -1690.899414, 19.406106, 0.000015, -0.000007, -90.000053, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19866, 1799.005615, -1690.889404, 19.406106, 0.000015, -0.000007, -90.000053, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 6284, "bev_law2", "pierbild04_law", 0x00000000);
	tmpobjid = CreateDynamicObject(19826, 1801.524047, -1697.948486, 14.182216, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "GARAGE 1", 60, "Arial", 26, 0, 0xFF000000, 0xFFFFFFFF, 1);
	tmpobjid = CreateDynamicObject(3761, 1775.770874, -1718.918701, 14.596542, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1767.446289, -1718.763916, 13.266537, 0.000000, 90.000000, 180.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	tmpobjid = CreateDynamicObject(19329, 1793.482543, -1719.178100, 15.202775, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{000000} z", 120, "Webdings", 80, 0, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateDynamicObject(19329, 1785.130981, -1713.997436, 14.752775, -0.000014, -0.000014, -89.999984, object_world, object_int, -1); 
	SetDynamicObjectMaterialText(tmpobjid, 0, "{000000} z", 120, "Webdings", 80, 0, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateDynamicObject(19087, 1767.446289, -1710.483276, 13.266537, 0.000000, 89.999992, 179.999954, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	tmpobjid = CreateDynamicObject(19087, 1767.446289, -1702.193603, 13.266537, 0.000000, 89.999984, 179.999908, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.170898, -1719.390258, 14.296545, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.170898, -1718.869750, 14.296545, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.170898, -1718.479492, 14.296545, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.950927, -1719.235473, 14.301992, 0.000000, 91.200004, 18.600000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.944091, -1718.805053, 14.299265, 0.000000, 91.200004, 18.600000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.170898, -1719.109985, 14.516549, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(3082, 1776.170898, -1718.639526, 14.516549, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ventb128", 0x00000000);
	tmpobjid = CreateDynamicObject(19483, 1766.168457, -1703.089965, 14.906552, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14776, "genintintcarint3", "toolwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19483, 1766.168457, -1711.481079, 14.906552, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14776, "genintintcarint3", "toolwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19483, 1766.168457, -1719.681762, 14.906552, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14776, "genintintcarint3", "toolwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 1783.890502, -1691.024658, 17.456525, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10439, "hashblock3_sfs", "ws_mural1", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 1790.668579, -1691.059204, 16.016546, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14530, "estate2", "Auto_Slamvan2", 0x00000000);
	tmpobjid = CreateDynamicObject(19893, 1799.411499, -1717.508911, 13.469714, 0.000000, 0.000000, -19.200000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 1, 14776, "genintintcarint3", "auto_tune3", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1808.931762, -1688.811889, 12.544754, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1807.201538, -1688.811889, 11.134738, 0.000000, 180.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19626, "spade1", "brownmetalcopy", 0x00000000);
	tmpobjid = CreateDynamicObject(19366, 1808.942138, -1690.471313, 11.274739, 90.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19626, "spade1", "brownmetalcopy", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(18762, 1801.052246, -1721.746337, 13.396550, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19377, 1785.768188, -1717.402709, 12.510605, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1798.043579, -1721.821289, 13.366874, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1798.051391, -1721.746337, 13.076541, 90.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1795.062622, -1721.746337, 13.396550, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1792.062866, -1721.821289, 13.366874, 0.000000, 0.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1792.070678, -1721.746337, 13.076541, 89.999992, 179.999984, -90.000007, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1793.410156, -1719.775024, 17.666557, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1786.082397, -1721.821289, 13.366874, 0.000000, 0.000014, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1786.090209, -1721.746337, 13.076541, 89.999992, 179.999984, -89.999984, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1783.101440, -1721.746337, 13.396550, 0.000000, 0.000014, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1780.102783, -1721.821289, 13.366874, 0.000000, 0.000014, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1780.110595, -1721.746337, 13.076541, 89.999992, 179.999984, -89.999984, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1777.121826, -1721.746337, 13.396550, 0.000000, 0.000014, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1774.122314, -1721.821289, 13.366874, 0.000000, 0.000022, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1774.130126, -1721.746337, 13.076541, 89.999992, 179.999984, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1771.141357, -1721.746337, 13.396550, 0.000000, 0.000022, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1768.134155, -1721.821289, 13.366874, 0.000000, 0.000022, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1768.141967, -1721.746337, 13.076541, 89.999992, 179.999984, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1765.153198, -1721.746337, 13.396550, 0.000000, 0.000022, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1762.153686, -1721.821289, 13.366874, 0.000000, 0.000029, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1762.161499, -1721.746337, 13.076541, 89.999992, 180.000000, -89.999961, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.172729, -1721.746337, 13.396550, 0.000000, 0.000029, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1718.740356, 13.366874, -0.000007, 0.000029, -90.000015, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1718.748168, 13.076541, 89.999992, 424.471191, -64.471237, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1715.759399, 13.396550, -0.000007, 0.000029, -90.000015, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1796.642456, -1719.775024, 14.166543, -0.000007, 0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1712.749755, 13.366874, -0.000014, 0.000029, -89.999992, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1712.757568, 13.076541, 89.999992, 436.631469, -76.631500, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1709.768798, 13.396550, -0.000014, 0.000029, -89.999992, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1787.011840, -1719.775024, 14.166543, -0.000007, 0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1706.759399, 13.366874, -0.000022, 0.000029, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1706.767211, 13.076541, 89.999992, 443.225952, -83.225975, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1703.778442, 13.396550, -0.000022, 0.000029, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19399, 1780.594848, -1719.790161, 14.166543, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1760.153564, -1688.209228, 13.396550, -0.000029, 0.000029, -89.999946, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1761.153686, -1688.209228, 13.396550, -0.000029, 0.000029, -89.999946, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1789.082153, -1721.746337, 13.396550, 0.000000, 0.000014, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1807.053100, -1721.746337, 13.396550, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1774.201660, -1719.775024, 14.166543, -0.000007, 0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.520385, -1719.765014, 14.166543, -0.000007, 0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1801.422241, -1715.024902, 14.176541, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1801.422241, -1702.224975, 14.166542, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19826, 1801.530151, -1697.950561, 13.945621, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1795.551757, -1690.912719, 17.636541, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1785.932617, -1690.912719, 17.636541, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1795.551757, -1690.912719, 14.146540, -0.000022, 0.000000, -89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1776.312622, -1690.912719, 17.636541, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.712890, -1690.912719, 17.636541, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.771118, -1695.604980, 17.656545, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.771118, -1705.225097, 17.656545, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.771118, -1714.844482, 17.656545, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.812744, -1715.529296, 15.642777, -89.999992, -64.471160, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1796.721801, -1712.277832, 14.592758, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1796.732666, -1712.289306, 13.602770, 89.999992, 154.471191, -64.471214, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.781127, -1714.855957, 14.156540, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1794.080444, -1712.277832, 14.592758, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.771118, -1705.234985, 14.166542, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1794.091308, -1712.289306, 13.602770, 89.999992, 154.471221, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1791.468994, -1712.277832, 14.592758, 0.000014, 0.000036, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1761.771118, -1695.604980, 14.156540, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1791.439819, -1712.289306, 13.602770, 89.999992, 154.471252, -64.471206, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1788.797973, -1712.277832, 14.592758, 0.000014, 0.000044, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1785.921386, -1690.902465, 14.166542, -0.000014, 0.000000, -89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1776.291503, -1690.903564, 14.146540, -0.000014, 0.000000, -89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.660278, -1690.893066, 14.146542, -0.000014, 0.000000, -89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1788.808837, -1712.289306, 13.602770, 89.999992, 154.471267, -64.471206, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1786.167358, -1712.277832, 14.592758, 0.000014, 0.000051, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1786.178222, -1712.289306, 13.602770, 89.999992, 154.471282, -64.471206, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.631958, -1711.586425, 14.166542, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(11313, 1799.532470, -1694.347778, 16.501760, 0.000000, 1160.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18084, 1794.190063, -1713.310913, 14.392772, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1796.732666, -1712.289306, 15.622791, -89.999992, -150.180572, 119.819488, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1794.091308, -1712.289306, 15.622791, -89.999992, 195.825103, 105.824996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1791.439819, -1712.289306, 15.622791, -89.999992, 195.825103, 105.824996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1788.808837, -1712.289306, 15.622791, -89.999992, 195.825134, 105.824996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1786.178222, -1712.289306, 15.622791, -89.999992, 195.825134, 105.824996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1801.025878, -1712.285644, 15.178776, 89.999992, 872.791015, -62.791049, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1801.025878, -1712.285644, 13.178779, 89.999992, 872.791015, -62.791049, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.792724, -1713.280029, 13.602770, 89.999992, 64.471221, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.812744, -1713.279418, 15.642777, -89.999992, -64.471160, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.812744, -1717.759643, 15.646778, -89.999992, -64.471160, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19975, 1771.696533, -1703.473754, 12.546532, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19975, 1771.696533, -1711.654418, 12.546532, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1714.370117, 14.598780, 89.999992, 783.640075, -63.640048, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1714.370117, 12.598784, 89.999992, 783.640075, -63.640048, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1801.025878, -1717.327148, 15.178776, 89.999992, 873.640075, -63.640048, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.792724, -1717.770996, 13.602770, 89.999992, 64.471237, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.812744, -1718.320922, 15.642775, -89.999992, -64.471138, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1719.411621, 14.598780, 89.999992, 784.057922, -64.057884, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1719.411621, 12.598784, 89.999992, 784.057922, -64.057884, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1717.570800, 14.598780, 89.999992, 784.265197, -64.265113, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.824096, -1717.570800, 12.598784, 89.999992, 784.265197, -64.265113, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1784.860717, -1713.280029, 13.602770, 89.999992, 64.471237, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1784.880737, -1713.279418, 15.642777, -89.999992, -64.471138, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1714.370117, 14.598780, 89.999992, 784.057922, -64.057884, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1714.370117, 12.598784, 89.999992, 784.057922, -64.057884, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1785.093872, -1717.327148, 15.178776, 89.999992, 874.057922, -64.057884, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1784.869750, -1718.309326, 14.592758, 0.000029, -0.000014, 179.999786, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1784.860717, -1718.321533, 13.602770, 89.999992, 64.471267, -64.471206, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1784.880737, -1718.320922, 15.642775, -89.999992, -64.471115, 115.528717, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1719.411621, 14.598780, 89.999992, 784.265197, -64.265113, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1719.411621, 12.598784, 89.999992, 784.265197, -64.265113, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1717.570800, 14.598780, 89.999992, 784.368347, -64.368293, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1784.892089, -1717.570800, 12.598784, 89.999992, 784.368347, -64.368293, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19466, 1784.871215, -1713.267822, 14.592758, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18084, 1785.918823, -1713.578613, 14.212775, -0.000014, -0.000014, -89.999984, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1801.422241, -1705.356323, 17.666555, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1801.422241, -1695.723632, 17.666555, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19426, 1800.697998, -1690.922607, 14.145428, 0.000022, 0.000000, 89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19426, 1800.698120, -1690.892578, 17.595420, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.631958, -1703.326049, 14.166542, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1801.442260, -1714.996337, 17.666555, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19325, 1800.833007, -1715.834594, 13.539720, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.631958, -1695.245239, 14.166542, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.854125, -1715.350830, 14.598780, 89.999992, 796.156982, -76.156951, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1796.700561, -1719.775024, 17.666557, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1800.854125, -1716.640869, 14.598780, 89.999992, 796.156982, -76.156951, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.792724, -1715.519775, 13.602770, 89.999992, 64.471221, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1800.792724, -1718.241455, 13.602770, 89.999992, 64.471237, -64.471199, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1798.499633, -1713.858520, 16.369705, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1798.499633, -1715.858520, 16.369705, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1798.499633, -1717.568237, 16.369705, 0.000014, 0.000020, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1794.569702, -1713.858520, 16.369705, 0.000014, 0.000029, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1794.569702, -1715.858520, 16.369705, 0.000014, 0.000029, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1794.569702, -1717.568237, 16.369705, 0.000014, 0.000029, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1790.549682, -1713.858520, 16.369705, 0.000014, 0.000036, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1790.549682, -1715.858520, 16.369705, 0.000014, 0.000036, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1790.549682, -1717.568237, 16.369705, 0.000014, 0.000036, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1786.899780, -1713.858520, 16.369705, 0.000014, 0.000044, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1786.899780, -1715.858520, 16.369705, 0.000014, 0.000044, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2707, 1786.899780, -1717.568237, 16.369705, 0.000014, 0.000044, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1766.520385, -1719.765014, 17.666536, -0.000007, 0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1774.171386, -1719.775024, 17.666557, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19445, 1783.800781, -1719.755004, 17.666557, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1761.153686, -1688.497680, 13.396550, -0.000022, 0.000029, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1761.153686, -1688.497680, 13.396550, -0.000022, 0.000029, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1761.153686, -1688.497680, 13.396550, -0.000022, 0.000029, -89.999969, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1700.728881, 13.366874, -0.000029, 0.000029, -89.999946, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1700.736694, 13.076541, 89.999992, 446.601165, -86.601173, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1697.747924, 13.396550, -0.000029, 0.000029, -89.999946, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1694.699218, 13.366874, -0.000037, 0.000029, -89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1694.707031, 13.076541, 89.999992, 448.299072, -88.299072, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1691.718261, 13.396550, -0.000037, 0.000029, -89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19869, 1759.078369, -1691.188598, 13.366874, -0.000045, 0.000029, -89.999900, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1691.196411, 13.076541, 89.999992, 449.149353, -89.149330, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1759.153320, -1688.207641, 13.396550, -0.000045, 0.000029, -89.999900, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1767.529541, -1716.112670, 19.286550, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1767.529541, -1707.482177, 19.286550, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1767.529541, -1700.222534, 19.286550, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1767.529541, -1693.241577, 19.286550, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1779.130615, -1716.112670, 19.286550, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1779.130615, -1707.482177, 19.286550, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1779.130615, -1700.222534, 19.286550, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1779.130615, -1693.241577, 19.286550, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1786.501342, -1716.112670, 19.286550, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1786.501342, -1707.482177, 19.286550, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1786.501342, -1700.222534, 19.286550, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1786.501342, -1693.241577, 19.286550, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1795.051757, -1716.112670, 19.286550, 0.000022, 0.000000, 89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1795.051757, -1707.482177, 19.286550, 0.000022, 0.000000, 89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1795.051757, -1700.222534, 19.286550, 0.000022, 0.000000, 89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1893, 1795.051757, -1693.241577, 19.286550, 0.000022, 0.000000, 89.999931, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1801.052246, -1720.745971, 13.396550, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18762, 1801.052246, -1719.745605, 13.396550, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(651, 1788.343383, -1720.660644, 12.756541, 0.000000, 0.000000, 48.499996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(651, 1790.003540, -1720.595214, 12.756541, 0.000000, 0.000000, -61.700000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(651, 1785.229248, -1720.588500, 12.756541, 0.000000, 0.000000, -61.700000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19903, 1762.708007, -1719.013427, 12.626543, 0.000000, 0.000000, 40.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(3761, 1777.331298, -1691.778320, 14.596542, 0.000000, 0.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1327, 1771.484619, -1718.826538, 13.083676, 0.000000, 270.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1327, 1771.484619, -1718.826538, 13.083676, 0.000000, 270.000000, 450.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1744, 1791.336669, -1719.385131, 13.905650, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1744, 1791.336669, -1719.385131, 14.525651, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1183, 1761.980346, -1716.665649, 15.776541, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1185, 1761.874389, -1716.774291, 15.126550, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1186, 1762.211914, -1716.578491, 14.316536, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1769.900146, -1719.632324, 12.704474, -55.400009, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1768.660034, -1719.632324, 12.704474, -55.400009, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1767.450073, -1719.632324, 12.704474, -55.400009, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.674316, -1719.245239, 13.206544, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.374267, -1719.245239, 13.206544, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.084106, -1719.245239, 13.206544, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1768.383422, -1719.245239, 13.206544, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2062, 1773.802734, -1691.503295, 13.126545, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2062, 1772.942016, -1691.503295, 13.126545, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1744, 1798.828613, -1719.359619, 14.599716, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2345, 1798.385498, -1718.787353, 14.667767, 37.000003, -0.000018, 179.999862, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1690, 1787.464599, -1718.257934, 17.097644, 0.000014, 0.000014, 89.999923, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19814, 1795.435180, -1712.532226, 13.409717, -0.000014, 0.000014, 0.000014, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19814, 1791.454589, -1712.532226, 13.409717, -0.000014, 0.000014, 0.000014, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19814, 1787.343994, -1712.532226, 13.409717, -0.000014, 0.000014, 0.000014, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2062, 1773.302368, -1692.203979, 13.126546, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19903, 1762.708007, -1710.732788, 12.626543, 0.000004, 0.000005, 40.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1183, 1761.980346, -1708.385009, 15.776541, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1687, 1792.429077, -1715.523681, 17.353408, 0.000014, -0.000014, 179.999832, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1185, 1761.874389, -1708.493652, 15.126550, -0.000007, -0.000000, -89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1186, 1762.211914, -1708.297851, 14.316536, 0.000007, 0.000000, 89.999977, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1769.900146, -1711.351684, 12.704474, -55.400005, 0.000013, 0.000011, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1768.660034, -1711.351684, 12.704474, -55.400005, 0.000013, 0.000011, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.674316, -1710.964599, 13.206544, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.374267, -1710.964599, 13.206544, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.084106, -1710.964599, 13.206544, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1768.383422, -1710.964599, 13.206544, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19903, 1762.708007, -1702.443115, 12.626543, 0.000009, 0.000011, 40.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1183, 1761.980346, -1700.095336, 15.776541, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1185, 1761.874389, -1700.203979, 15.126550, -0.000015, 0.000000, -89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1186, 1762.211914, -1700.008178, 14.316536, 0.000015, 0.000000, 89.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1769.900146, -1703.062011, 12.704474, -55.400005, 0.000026, 0.000022, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1897, 1768.660034, -1703.062011, 12.704474, -55.400005, 0.000026, 0.000022, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.674316, -1702.674926, 13.206544, 0.000000, -0.000015, 179.999908, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.374267, -1702.674926, 13.206544, 0.000000, -0.000015, 179.999908, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1769.084106, -1702.674926, 13.206544, 0.000000, -0.000015, 179.999908, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1073, 1768.383422, -1702.674926, 13.206544, 0.000000, -0.000015, 179.999908, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1046, 1774.995361, -1719.068115, 13.946546, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1046, 1775.995849, -1719.068115, 13.946546, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1046, 1777.056152, -1719.068115, 13.946546, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1046, 1778.256469, -1719.068115, 13.946546, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1046, 1779.346435, -1719.068115, 13.946546, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19816, 1775.223022, -1718.914428, 14.286541, 0.000000, 270.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19816, 1775.223022, -1719.244384, 14.286541, 0.000000, 270.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19816, 1775.223022, -1718.583862, 14.286541, 0.000000, 270.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19816, 1774.734130, -1718.912597, 14.299105, -2.599999, -89.599983, 58.800006, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19816, 1774.633544, -1718.711425, 14.289652, -2.599999, -89.599983, 58.800006, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1650, 1778.294677, -1718.917602, 14.526535, 0.000000, 0.000000, 64.199989, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1650, 1778.030395, -1718.934936, 14.526535, 0.000000, 0.000000, 64.199989, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1650, 1777.700805, -1719.020385, 14.526535, 0.000000, 0.000000, 64.199989, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1650, 1778.014404, -1718.371826, 14.526535, 0.000000, 0.000000, 64.199989, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1650, 1778.278930, -1718.399658, 14.526535, 0.000000, 0.000000, 64.199989, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19899, 1766.758544, -1695.834228, 12.636542, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19899, 1766.758544, -1703.873779, 12.636542, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19899, 1766.758544, -1712.173706, 12.636542, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19917, 1762.257446, -1696.969238, 12.636543, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19917, 1762.257446, -1704.699707, 12.636543, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19917, 1762.257446, -1713.410034, 12.636543, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2690, 1766.609008, -1719.618286, 12.996548, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2690, 1766.609008, -1711.488159, 12.996548, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2690, 1766.609008, -1703.136596, 12.996548, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1726, 1790.360839, -1713.063964, 12.689709, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1726, 1787.910766, -1713.063964, 12.689709, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2311, 1790.494018, -1714.522216, 12.679697, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2311, 1788.123779, -1714.522216, 12.679697, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1670, 1788.961059, -1714.617553, 13.209709, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2173, 1798.666992, -1717.399536, 12.679711, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(11280, 1784.659179, -1699.058105, 12.636538, 0.000000, 0.000000, -69.400001, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1671, 1799.393188, -1718.479736, 13.149718, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1694.905517, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1698.525390, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1702.045166, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1705.615600, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1709.225341, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1713.055664, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1716.636108, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(638, 1760.253540, -1719.976318, 13.293325, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(922, 1788.446411, -1711.354248, 13.486537, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1428, 1792.738769, -1711.732666, 14.126545, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2534, 1792.984252, -1718.490966, 12.809710, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2133, 1796.291870, -1718.716796, 12.829710, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2133, 1795.301635, -1718.716796, 12.829710, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2485, 1791.425903, -1719.056518, 14.289705, 0.000000, 0.000000, -61.499996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2485, 1790.564208, -1719.103027, 14.289705, 0.000000, 0.000000, -61.499996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2485, 1790.564208, -1719.103027, 14.899703, 0.000000, 0.000000, -61.499996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2485, 1791.425903, -1719.056518, 14.899706, 0.000000, 0.000000, -61.499996, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(645, 1808.574584, -1688.863525, 9.943684, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1297, 1809.650512, -1716.935546, 15.976568, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1297, 1809.650512, -1703.765380, 15.976568, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1582, 1790.797485, -1714.548339, 13.189130, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1415, 1782.756347, -1719.022460, 12.650961, 0.000000, 0.000000, 180.000000, object_world, object_int, -1);*/


/*	NewMap[0] = CreateObject(1728, 2440.1564, -1965.8996, 12.5712, 0.0000, 0.0000, 88.8999); //mrk_seating3
	NewMap[1] = CreateObject(2311, 2441.6711, -1965.6020, 12.6302, 0.0000, 0.0000, 90.1998); //CJ_TV_TABLE2
	NewMap[2] = CreateObject(2860, 2441.7158, -1965.5522, 13.1068, 0.0000, 0.0000, 0.0000); //gb_kitchtakeway05
	NewMap[3] = CreateObject(1728, 2443.1181, -1963.7983, 12.5712, 0.0000, 0.0000, -93.1999); //mrk_seating3
	NewMap[4] = CreateObject(2103, 2441.7585, -1963.8546, 13.1631, 0.0000, 0.0000, 0.0000); //LOW_HI_FI_1
	NewMap[5] = CreateObject(1486, 2441.4729, -1964.4486, 13.2920, 0.0000, 0.0000, 0.0000); //DYN_BEER_1
	NewMap[6] = CreateObject(1486, 2441.9133, -1964.2384, 13.2920, 0.0000, 0.0000, 0.0000); //DYN_BEER_1
	NewMap[7] = CreateObject(1486, 2441.9133, -1964.7486, 13.2920, 0.0000, 0.0000, 0.0000); //DYN_BEER_1
	NewMap[8] = CreateObject(1486, 2441.6535, -1964.7486, 13.2920, 0.0000, 0.0000, 0.0000); //DYN_BEER_1
	NewMap[9] = CreateObject(1486, 2441.4533, -1965.1490, 13.2920, 0.0000, 0.0000, 0.0000); //DYN_BEER_1
	NewMap[10] = CreateObject(1485, 2441.1953, -1965.6623, 13.1267, 0.0000, 0.0000, 0.0000); //CJ_CIGGY
	NewMap[11] = CreateObject(349, 2441.4287, -1965.8801, 13.1656, 98.4999, 16.6998, -2.2999); //chromegun
	NewMap[12] = CreateObject(2047, 2439.8581, -1964.8332, 15.9468, 0.0000, 0.0000, 88.4998); //CJ_FLAG1
	NewMap[13] = CreateObject(2677, 2443.5600, -2001.0335, 12.8467, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_7
	NewMap[14] = CreateObject(2676, 2441.4133, -2000.8620, 12.6568, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[15] = CreateObject(14490, 2441.8430, -1993.2279, 15.0567, 0.0000, 0.0000, 94.0999); //cuntchair
	NewMap[16] = CreateObject(2121, 2445.1386, -2001.9354, 13.0507, 0.0000, 0.0000, -90.4000); //LOW_DIN_CHAIR_2
	NewMap[17] = CreateObject(2121, 2444.9565, -2000.2668, 13.0607, 0.0000, 0.0000, -54.3998); //LOW_DIN_CHAIR_2
	NewMap[18] = CreateObject(2229, 2444.1896, -1997.9228, 12.5768, 0.0000, 0.0000, 0.0000); //SWANK_SPEAKER
	NewMap[19] = CreateObject(2779, 2440.7614, -1998.3770, 12.4987, 0.0000, 0.0000, 0.0000); //CJ_COIN_OP_2
	NewMap[20] = CreateObject(1978, 2445.5690, -1964.7126, 13.5616, 0.0000, 0.0000, -179.2998); //roulette_tbl
	NewMap[21] = CreateObject(1550, 2441.8186, -1966.5821, 12.9252, 0.0000, 0.0000, 0.0000); //CJ_MONEY_BAG
	NewMap[22] = CreateObject(1726, 1884.6695, -2058.7580, 12.5264, 0.0000, 0.0000, 0.0000); //mrk_seating2
	NewMap[23] = CreateObject(3497, 2444.0051, -1962.6733, 15.5805, 0.0000, 0.0000, 176.5000); //vgsxrefbballnet2
	NewMap[24] = CreateObject(2226, 1884.6983, -2061.5112, 12.5391, 0.0000, 0.0000, 130.5998); //LOW_HI_FI_3
	NewMap[25] = CreateObject(1767, 1886.5020, -2062.0541, 12.5136, 0.0000, 0.0000, 178.4998); //MED_SINGLE_1
	NewMap[26] = CreateObject(2689, 1885.1291, -2060.4208, 15.2161, -94.2998, -113.6997, 0.0000); //CJ_HOODIE_2
	NewMap[27] = CreateObject(2311, 1884.7777, -2060.4636, 12.5703, 0.0000, 0.0000, 0.0000); //CJ_TV_TABLE2
	NewMap[28] = CreateObject(918, 1887.3260, -2061.8479, 12.9130, 0.0000, 0.0000, 0.0000); //CJ_FLAME_Drum
	NewMap[29] = CreateObject(2672, 1886.8199, -2060.4799, 12.8367, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_4
	NewMap[30] = CreateObject(2676, 1883.2863, -2059.9721, 12.6568, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[31] = CreateObject(19820, 1886.6201, -2060.0664, 13.1121, 0.0000, 0.0000, 0.0000); //AlcoholBottle1
	NewMap[32] = CreateObject(19820, 1886.6201, -2060.4467, 13.1121, 0.0000, 0.0000, 0.0000); //AlcoholBottle1
	NewMap[33] = CreateObject(19821, 1886.3851, -2060.3420, 13.0822, 0.0000, 0.0000, 0.0000); //AlcoholBottle2
	NewMap[34] = CreateObject(19821, 1886.3851, -2060.1218, 13.0422, 0.0000, 0.0000, 0.0000); //AlcoholBottle2
	NewMap[35] = CreateObject(1584, 1884.5268, -2062.3542, 12.5654, 0.0000, 0.0000, 0.0000); //tar_gun1
	NewMap[36] = CreateObject(355, 1886.0273, -2060.6306, 13.0662, 96.4000, 93.0000, -0.3000); //ak47
	NewMap[37] = CreateObject(356, 1885.7060, -2060.5187, 13.1577, -96.2998, -90.2998, -2.6998); //m4
	NewMap[38] = CreateObject(2048, 1886.4581, -2062.6215, 14.5768, 0.0000, 0.0000, -178.6999); //CJ_FLAG2
	NewMap[39] = CreateObject(1279, 1884.8902, -2060.3620, 13.1133, 0.0000, 0.0000, 0.0000); //craigpackage
	NewMap[40] = CreateObject(3264, 2256.8183, -2024.3483, 12.2637, 0.0000, 0.0000, -121.1000); //privatesign3
	NewMap[41] = CreateObject(926, 2283.8222, -2030.8253, 12.7920, 0.0000, 0.0000, 0.0000); //RUBBISH_BOX2
	NewMap[42] = CreateObject(19354, 2281.4699, -2024.0838, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[42], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[43] = CreateObject(19354, 2278.3371, -2024.0616, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[43], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[44] = CreateObject(19354, 2275.1867, -2024.0395, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[44], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[45] = CreateObject(19354, 2272.0947, -2024.0174, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[45], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[46] = CreateObject(19354, 2269.0324, -2023.9963, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[46], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[47] = CreateObject(19354, 2267.5642, -2025.4898, 14.2768, 0.0000, 0.0000, 7.8000); //wall002
	SetObjectMaterial(NewMap[47], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[48] = CreateObject(19354, 2284.6223, -2024.1055, 14.2768, 0.0000, 0.0000, -90.3999); //wall002
	SetObjectMaterial(NewMap[48], 0, 17545, "burnsground", "dirtyredwall512", 0x00000000);
	NewMap[49] = CreateObject(19845, 2274.6047, -2033.2475, 12.5134, 0.0000, 0.0000, 0.0000); //MetalPanel3
	NewMap[50] = CreateObject(18661, 2271.7661, -2024.1356, 14.4568, 0.0000, 0.0000, 87.9999); //SprayTag3
	NewMap[51] = CreateObject(18661, 2267.5603, -2034.8818, 13.7668, 0.0000, 0.0000, -135.2002); //SprayTag3
	NewMap[52] = CreateObject(2673, 2277.7941, -2025.3797, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[53] = CreateObject(2926, 2280.4191, -2026.0528, 12.5205, 0.0000, 0.0000, 0.0000); //dyno_box_A
	NewMap[54] = CreateObject(3926, 2278.2021, -2040.4643, 12.5168, 0.0000, 0.0000, 0.0000); //d_sign
	NewMap[55] = CreateObject(1499, 2281.4274, -2049.0681, 12.5004, 0.0000, 0.0000, 43.6999); //Gen_doorINT05
	NewMap[56] = CreateObject(2673, 2280.6047, -2028.4705, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[57] = CreateObject(2673, 2277.3833, -2028.4705, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[58] = CreateObject(2673, 2277.3833, -2031.7309, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[59] = CreateObject(2673, 2281.9150, -2031.7309, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[60] = CreateObject(2673, 2281.9150, -2036.2717, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[61] = CreateObject(2673, 2284.8068, -2036.2717, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[62] = CreateObject(2673, 2284.8068, -2033.4212, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[63] = CreateObject(2673, 2281.6645, -2033.4212, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[64] = CreateObject(2673, 2281.6645, -2030.2706, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[65] = CreateObject(2673, 2284.3771, -2030.2706, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[66] = CreateObject(2673, 2284.3771, -2028.8197, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[67] = CreateObject(2673, 2284.3771, -2027.0788, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[68] = CreateObject(2673, 2284.3771, -2025.3883, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[69] = CreateObject(2673, 2281.1760, -2025.3883, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[70] = CreateObject(2673, 2281.7565, -2027.1079, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[71] = CreateObject(2673, 2278.9450, -2027.1079, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[72] = CreateObject(2673, 2275.5549, -2027.1079, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[73] = CreateObject(2673, 2274.3142, -2027.1079, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[74] = CreateObject(2673, 2274.3142, -2029.5179, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[75] = CreateObject(2673, 2272.2629, -2027.7371, 12.6668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_5
	NewMap[76] = CreateObject(2674, 2278.2514, -2034.6636, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[77] = CreateObject(2674, 2282.7937, -2034.6636, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[78] = CreateObject(2674, 2282.7937, -2031.0328, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[79] = CreateObject(2674, 2278.3005, -2031.0328, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[80] = CreateObject(2674, 2278.3005, -2028.5727, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[81] = CreateObject(2674, 2282.7717, -2028.5727, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[82] = CreateObject(2674, 2282.7717, -2025.2429, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[83] = CreateObject(2674, 2279.9318, -2025.2429, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[84] = CreateObject(2674, 2277.8002, -2025.2429, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[85] = CreateObject(2674, 2273.7192, -2028.3935, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[86] = CreateObject(2674, 2273.7192, -2026.3931, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[87] = CreateObject(2674, 2276.0908, -2027.6400, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[88] = CreateObject(2674, 2276.0908, -2027.6400, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[89] = CreateObject(2674, 2276.0908, -2031.0411, 12.5668, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[90] = CreateObject(2674, 2275.2509, -2037.7357, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_2
	NewMap[91] = CreateObject(2675, 2276.9843, -2038.8980, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[92] = CreateObject(2675, 2276.9843, -2035.4681, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[93] = CreateObject(2675, 2280.6774, -2035.4681, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[94] = CreateObject(2675, 2280.1069, -2031.3773, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[95] = CreateObject(2675, 2282.3991, -2029.7070, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[96] = CreateObject(2675, 2282.3991, -2026.7462, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[97] = CreateObject(2675, 2280.0969, -2026.7462, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[98] = CreateObject(2675, 2280.0969, -2028.9772, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[99] = CreateObject(2675, 2276.9970, -2028.9772, 12.6368, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_6
	NewMap[100] = CreateObject(2676, 2282.9877, -2042.0397, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[101] = CreateObject(2676, 2282.9877, -2038.7791, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[102] = CreateObject(2676, 2282.9877, -2035.5091, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[103] = CreateObject(2676, 2279.1340, -2035.5091, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[104] = CreateObject(2676, 2279.1340, -2040.6087, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[105] = CreateObject(2676, 2272.1206, -2036.8576, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[106] = CreateObject(2676, 2272.1206, -2031.7669, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[107] = CreateObject(2676, 2274.1923, -2035.1364, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[108] = CreateObject(2676, 2278.5246, -2037.2573, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[109] = CreateObject(2676, 2278.5246, -2030.1566, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[110] = CreateObject(2676, 2281.8166, -2030.1566, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[111] = CreateObject(2676, 2284.0783, -2032.3564, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[112] = CreateObject(2676, 2285.8996, -2040.8969, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[113] = CreateObject(2676, 2285.8996, -2040.8969, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[114] = CreateObject(2676, 2283.2177, -2044.7868, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[115] = CreateObject(2676, 2279.5454, -2044.7868, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[116] = CreateObject(2676, 2279.5454, -2042.6658, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[117] = CreateObject(2676, 2289.9555, -2042.6658, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[118] = CreateObject(2676, 2289.9555, -2040.4052, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[119] = CreateObject(2676, 2289.9555, -2046.4453, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[120] = CreateObject(2676, 2286.4528, -2043.3347, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[121] = CreateObject(2676, 2294.0046, -2043.3347, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[122] = CreateObject(2676, 2294.0046, -2040.7738, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[123] = CreateObject(2676, 2294.0046, -2045.7535, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[124] = CreateObject(2676, 2293.1037, -2048.0644, 12.6768, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_8
	NewMap[125] = CreateObject(2677, 2291.0937, -2045.1672, 12.8868, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_7
	NewMap[126] = CreateObject(2677, 2288.7619, -2045.1672, 12.8868, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_7
	NewMap[127] = CreateObject(2677, 2288.7619, -2042.1970, 12.8868, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_7
	NewMap[128] = CreateObject(2677, 2292.2744, -2042.1970, 12.8868, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_7
	NewMap[129] = CreateObject(1415, 2275.2746, -2024.6413, 12.4690, 0.0000, 0.0000, 0.0000); //DYN_DUMPSTER
	NewMap[130] = CreateObject(1450, 2271.9775, -2038.5201, 13.2531, 0.0000, 0.0000, 135.4999); //DYN_CRATE_3
	NewMap[131] = CreateObject(1338, 2273.7626, -2039.3547, 13.2045, 0.0000, 0.0000, 0.0000); //BinNt08_LA
	NewMap[132] = CreateObject(18246, 2286.2680, -2035.5399, 13.5429, 0.0000, 0.0000, 131.9998); //cuntwjunk04
	NewMap[133] = CreateObject(928, 2281.1767, -2037.1997, 12.7763, 0.0000, 0.0000, 0.0000); //RUBBISH_BOX1
	NewMap[134] = CreateObject(1441, 2279.4943, -2033.2545, 13.1463, 0.0000, 0.0000, 0.0000); //DYN_BOX_PILE_4
	NewMap[135] = CreateObject(1327, 2268.7331, -2025.1716, 13.4677, 0.0000, 0.0000, -46.1000); //junk_tyre
	NewMap[136] = CreateObject(12957, 2284.0878, -2030.0980, 13.2374, 0.0000, 0.0000, -175.0999); //sw_pickupwreck01
	NewMap[137] = CreateObject(1762, 2277.8173, -2027.0643, 12.5843, 0.0000, 0.0000, 0.0000); //SWANK_SINGLE_2
	NewMap[138] = CreateObject(1762, 2276.2619, -2028.6276, 12.5843, 0.0000, 0.0000, 70.3999); //SWANK_SINGLE_2
	NewMap[139] = CreateObject(1762, 2279.7365, -2028.5125, 12.5843, 0.0000, 0.0000, -94.5000); //SWANK_SINGLE_2
	NewMap[140] = CreateObject(1819, 2277.5397, -2029.3361, 12.6589, 0.0000, 0.0000, 0.0000); //COFFEE_SWANK_4
	NewMap[141] = CreateObject(1518, 2284.0131, -2029.2329, 14.2968, 0.0000, 0.0000, -87.1000); //DYN_TV_2
	NewMap[142] = CreateObject(3399, 2285.0571, -2036.4219, 14.5165, 0.0000, 0.0000, 86.9001); //cxrf_a51_stairs
	NewMap[143] = CreateObject(2866, 2276.4895, -2033.5380, 12.5368, 0.0000, 0.0000, 0.0000); //gb_foodwrap04
	NewMap[144] = CreateObject(1985, 2285.4516, -2033.6527, 15.6876, 0.0000, 0.0000, 0.0000); //punchbagnu
	NewMap[145] = CreateObject(3092, 2285.1691, -2026.1480, 12.7778, 0.0000, 87.7000, 81.5999); //dead_tied_cop
	NewMap[146] = CreateObject(2611, 2281.0080, -2024.2727, 14.8268, 0.0000, 0.0000, 0.0000); //POLICE_NB1
	NewMap[147] = CreateObject(11710, 2267.5834, -2026.1938, 15.0668, 0.0000, 0.0000, 93.3000); //FireExitSign1
	NewMap[148] = CreateObject(2587, 2286.9133, -2039.4078, 14.6268, 0.0000, 0.0000, 0.0000); //SEX_2
	NewMap[149] = CreateObject(2588, 2286.4208, -2045.1856, 14.7168, 0.0000, 0.0000, 131.3999); //SEX_3
	NewMap[150] = CreateObject(19327, 2291.1220, -2039.3016, 14.4868, 0.0000, 0.0000, 0.0000); //7_11_sign02
	NewMap[151] = CreateObject(19328, 2298.3376, -2039.2418, 14.5068, 0.0000, 0.0000, 0.0000); //7_11_sign03
	NewMap[152] = CreateObject(14651, 2294.4003, -2042.4711, 14.8996, 0.0000, 0.0000, 0.0000); //trukstp05
	NewMap[153] = CreateObject(1594, 2306.9521, -2020.9851, 17.2435, 0.0000, 0.0000, 0.0000); //chairsntable
	NewMap[154] = CreateObject(1432, 2302.9763, -2021.5784, 16.9169, 0.0000, 0.0000, 0.0000); //DYN_TABLE_2
	NewMap[155] = CreateObject(1499, 2277.1867, -2044.7504, 12.4704, 0.0000, 0.0000, -45.6999); //Gen_doorINT05
	NewMap[156] = CreateObject(1499, 2273.5380, -2041.0128, 12.4704, 0.0000, 0.0000, -45.6999); //Gen_doorINT05
	NewMap[157] = CreateObject(1499, 2288.4768, -2047.5068, 12.5322, 0.0000, 1.5000, -45.6999); //Gen_doorINT05
*/


	// map benh vien
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-08-02 21:42:54" by "le_nguyen"
		Created by "le_nguyen"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*	new worldbv = 2, intbv = 2;
	tmpobjid = CreateDynamicObject(1499, 152.978637, -29.799669, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 141.773284, -24.928752, 1253.805664, 0.000000, 179.999984, -179.999938, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(1499, 165.038726, -11.569662, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 141.773284, -15.293770, 1253.805664, 0.000000, 179.999984, -179.999938, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 146.653381, -29.598785, 1253.805664, -0.000007, 179.999984, -89.999984, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -24.914817, 1258.184936, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -24.914817, 1254.684692, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -28.124778, 1258.184936, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -28.124778, 1254.684692, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19379, 146.653381, -19.758760, 1253.805664, -0.000007, 179.999984, -89.999984, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(1499, 151.628540, -23.311048, 1253.925781, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -20.184818, 1254.684692, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -21.704805, 1258.184936, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.441497, -18.494810, 1258.184936, 0.000014, 179.999969, -179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -24.914817, 1258.184936, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -24.914817, 1254.684692, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -28.124778, 1258.184936, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -28.124778, 1254.684692, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -20.184818, 1254.684692, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -21.704805, 1258.184936, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19370, 151.621398, -18.494808, 1258.184936, 0.000014, 179.999969, -179.999801, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19360, 152.891036, -31.462039, 1254.956787, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	tmpobjid = CreateDynamicObject(19449, 154.020294, -5.121140, 1252.840332, 0.000000, 180.000015, 179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19449, 149.485504, -5.121140, 1255.232177, 0.000000, 90.000022, 179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19598, "sfbuilding1", "wall8", 0x00000000);
	tmpobjid = CreateDynamicObject(19449, 152.355010, -5.121140, 1254.512084, 0.000000, 270.000000, 179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 19598, "sfbuilding1", "wall8", 0x00000000);
	tmpobjid = CreateDynamicObject(19454, 148.193634, -5.118455, 1257.019042, 0.000000, 0.000035, 179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18996, "mattextures", "sampred", 0x00000000);
	tmpobjid = CreateDynamicObject(19932, 150.944976, -3.378034, 1255.327758, -0.000000, -0.000006, -0.000106, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "mp_diner_wood", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 152.348052, -9.858688, 1253.791381, 89.999992, 314.950500, -44.950569, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 149.488555, -9.857712, 1254.512084, 89.999992, 314.950500, -44.950569, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 152.348052, -0.385056, 1253.791381, 89.999992, 314.934020, -44.934055, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19433, 149.488555, -0.384080, 1254.512084, 89.999992, 314.934020, -44.934055, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19449, 151.150375, -5.121135, 1253.571044, 0.000000, 180.000015, 179.999847, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 12821, "alleystuff", "sjmstair", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 148.285552, -3.383326, 1256.529785, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF} +", 130, "Tahoma", 199, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateDynamicObject(19482, 152.518234, -29.682144, 1254.376220, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF}P1", 100, "Arial", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateDynamicObject(19565, 151.675659, -23.733137, 1255.417236, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19482, 151.718383, -21.142141, 1254.296142, 0.000000, 0.000000, 360.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF}P2", 100, "Arial", 20, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateDynamicObject(19482, 165.078536, -11.832108, 1254.154296, 0.000000, 0.000000, 630.000000, worldbv, intbv, -1, 100.00);
	SetDynamicObjectMaterialText(tmpobjid, 0, "{FFFFFF}P3", 100, "Arial", 20, 1, 0x00000000, 0x00000000, 0);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(14595, 164.322189, -24.798603, 1257.868896, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19462, 167.567626, -36.315425, 1256.496582, 89.999992, 89.999992, -89.999992, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19325, 167.625518, -26.510185, 1255.225341, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19325, 167.625518, -17.690195, 1255.225341, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 156.351974, -35.086975, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 152.642288, -35.086975, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 148.112548, -39.636913, 1253.915771, 0.000000, 0.000000, 360.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 148.122329, -33.847019, 1253.915771, 0.000000, 0.000000, 720.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(3657, 152.129943, -26.359268, 1254.466308, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(3657, 157.789901, -29.299276, 1254.466308, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1302, 152.004211, -20.787363, 1253.915771, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2434, 159.952835, -22.206764, 1253.915771, 0.000000, 0.000007, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2435, 160.116470, -21.081039, 1253.915771, 0.000007, 0.000000, 89.999977, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2435, 160.116470, -20.151029, 1253.915771, 0.000007, 0.000000, 89.999977, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2435, 159.026306, -22.204053, 1253.915771, 0.000007, 0.000000, 359.999969, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2435, 158.096069, -22.204053, 1253.915771, 0.000007, 0.000000, 359.999969, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2434, 156.966796, -22.039758, 1253.915771, 0.000000, 0.000007, 630.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1518, 160.312652, -20.280021, 1255.256469, 0.000000, 0.000000, -68.800003, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19808, 159.924926, -20.620849, 1254.976684, 0.000000, 0.000000, -77.899986, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1518, 159.949508, -22.212762, 1255.256469, 0.000000, 0.000000, -135.100006, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19808, 159.186218, -22.088327, 1254.976684, 0.000000, 0.000000, 192.100006, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1714, 158.613281, -20.746540, 1253.915771, 0.000000, 0.000000, 26.500007, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2202, 156.909988, -20.209003, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 145.382339, -29.136978, 1253.915771, 0.000000, 0.000000, 450.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 145.382339, -24.916982, 1253.915771, 0.000000, 0.000000, 450.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 145.382339, -21.146966, 1253.915771, 0.000000, 0.000000, 450.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2002, 156.444473, -30.806272, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 147.732315, -28.136959, 1253.915771, 0.000000, 0.000000, 630.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1808, 151.110977, -24.473489, 1253.922607, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1808, 151.110977, -25.103490, 1253.922607, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19360, 142.780990, -26.492025, 1254.956787, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19360, 142.780990, -22.522018, 1254.956787, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19360, 153.870910, -37.692050, 1254.956787, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19360, 150.330917, -37.692050, 1254.956787, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1801, 151.752044, -29.327020, 1253.915771, 0.000000, 0.000000, 900.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19360, 150.330917, -31.142042, 1254.956787, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 154.340713, -37.162498, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 150.760803, -37.162498, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 148.260910, -35.542568, 1253.915771, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 149.910949, -31.172580, 1253.915771, 0.000000, 0.000000, 540.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 150.661056, -33.282493, 1253.915771, 0.000000, 0.000000, 810.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 150.870941, -27.462493, 1253.915771, 0.000000, 0.000000, 900.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 142.230895, -27.212488, 1253.915771, 0.000000, 0.000000, 1080.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 142.230895, -25.822465, 1253.915771, 0.000000, 0.000000, 1080.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19903, 142.630874, -22.052459, 1253.915771, 0.000000, 0.000000, 1170.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11729, 172.561508, -29.352457, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11729, 171.811508, -29.352457, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11729, 171.051330, -29.352457, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11729, 170.281448, -29.352457, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11730, 169.490447, -29.350482, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2165, 171.946105, -20.296554, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2165, 169.366043, -20.296554, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2165, 172.925872, -23.126571, 1253.915771, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2165, 172.925872, -25.476583, 1253.915771, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2356, 170.032196, -21.600130, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2356, 172.532211, -21.600130, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2356, 171.712295, -24.160142, 1253.915771, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2356, 171.712295, -26.230144, 1253.915771, 0.000000, 0.000000, 270.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2267, 151.734741, -27.619159, 1256.537109, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2258, 151.722198, -24.989072, 1256.016479, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(19376, 150.057037, -5.296676, 1253.697387, 0.000000, 89.999992, 179.999847, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 160.864517, -2.776621, 1254.506347, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 160.864517, -5.066624, 1254.506347, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 160.864517, -7.306630, 1254.506347, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 158.824645, -2.776621, 1254.506347, 0.000015, 0.000000, 89.999954, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 158.824645, -5.066624, 1254.506347, 0.000015, 0.000000, 89.999954, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 158.824645, -7.306630, 1254.506347, 0.000015, 0.000000, 89.999954, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 162.834686, -2.776621, 1254.506347, 0.000022, 0.000000, 89.999931, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 162.834686, -5.066624, 1254.506347, 0.000022, 0.000000, 89.999931, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2639, 162.834686, -7.306630, 1254.506347, 0.000022, 0.000000, 89.999931, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2002, 162.778182, -10.652587, 1253.915771, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(1514, 157.934982, -22.187822, 1255.126953, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2947, 167.543563, -35.684635, 1253.915771, 0.000000, 0.000000, 0.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(11711, 167.487167, -36.357822, 1256.406372, 0.000000, 0.000000, 90.000000, worldbv, intbv, -1, 100.00);
	tmpobjid = CreateDynamicObject(2258, 155.691131, -38.563697, 1256.657958, 0.000000, 0.000000, 180.000000, worldbv, intbv, -1, 100.00);*/





	//khuphovanhoa
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-26 16:49:27" by "co_rich"
		Created by "co_rich"
		Spawn Position: 1960.470703, -1809.748901, 20.068582
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	/* tmpobjid = CreateObject(19454, 2074.885253, -1805.176635, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19377, 2074.891357, -1766.645751, 12.451499, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1776.277832, 12.445872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1785.907104, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1834.064697, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1795.546630, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2074.885986, -1785.907104, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1805.176635, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1814.806152, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.385986, -1824.435913, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2074.885253, -1814.796020, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2074.885742, -1776.277832, 12.445872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2074.884033, -1824.425903, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2071.386962, -1834.694213, 12.445872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2075.415283, -1776.277832, 12.446872, 0.000000, 90.000015, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2064.815429, -1762.848022, 12.446872, 0.000000, 90.000015, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2055.185058, -1762.848022, 12.446872, 0.000000, 90.000015, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2045.545410, -1762.848022, 12.446872, 0.000000, 90.000015, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19454, 2035.915771, -1762.848022, 12.446872, 0.000000, 90.000015, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	tmpobjid = CreateObject(19377, 1971.903686, -1817.500854, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono2_sfe", 0x00000000);
	tmpobjid = CreateObject(19377, 1971.903686, -1807.871948, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono2_sfe", 0x00000000);
	tmpobjid = CreateObject(19377, 1971.903686, -1807.122924, 12.466590, 0.000000, 90.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono2_sfe", 0x00000000);
	tmpobjid = CreateObject(19377, 1975.271118, -1825.903198, 12.475596, 0.000000, 90.000000, 0.000005, 100.00);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "mono2_sfe", 0x00000000);
	tmpobjid = CreateObject(19362, 1988.998535, -1824.196777, 14.451529, 0.000000, 0.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18028, "cj_bar2", "CJ_nastybar_D4", 0x00000000);
	tmpobjid = CreateObject(19362, 2007.538330, -1792.037231, 18.381523, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18028, "cj_bar2", "CJ_nastybar_D", 0x00000000);
	tmpobjid = CreateObject(19462, 1998.277099, -1761.636108, 18.836872, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19462, 1996.007812, -1761.637084, 18.836872, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18646, "matcolours", "blue", 0x00000000);
	tmpobjid = CreateObject(19482, 1999.164916, -1761.534057, 17.872814, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} KHU PHO", 0, 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1994.444946, -1761.534057, 17.872814, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} VAN HOA", 0, 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1991.667236, -1761.496582, 17.517877, -24.800001, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} /", 0, 130, "Arial", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1995.405029, -1761.534057, 18.312818, 0.000000, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} ^", 0, 130, "Arial", 100, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1995.431274, -1761.496582, 17.594251, -24.800001, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} /", 0, 130, "Arial", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19482, 1993.673950, -1761.496582, 18.184965, -3.599985, 0.000000, 90.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
	SetObjectMaterialText(tmpobjid, "{FFFFFF} u", 0, 130, "Symbol", 70, 1, 0x00000000, 0x00000000, 0);
	tmpobjid = CreateObject(19087, 2002.694213, -1761.546264, 20.052818, 0.000000, 0.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19087, 1991.703735, -1761.546264, 20.052818, 0.000000, 0.000000, 0.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2002.675659, -1761.560302, 20.042818, 360.000000, 90.000000, 360.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 1999.054809, -1761.560302, 20.042818, 360.000000, 90.000000, 360.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 1999.054809, -1761.560302, 17.602807, 360.000000, 90.000000, 360.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	tmpobjid = CreateObject(19089, 2002.675659, -1761.560302, 17.592809, 360.000000, 90.000000, 360.000000, 100.00);
	SetObjectMaterial(tmpobjid, 0, 18835, "mickytextures", "whiteforletters", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(3317, 2050.964843, -1827.018432, 15.846858, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(3353, 2050.530029, -1797.977294, 13.502811, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(3316, 2050.949462, -1777.022460, 15.877443, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(3484, 2017.274902, -1779.392333, 19.182788, 0.000000, 0.000000, 539.399963, 100.00);
	tmpobjid = CreateObject(3487, 1982.142456, -1779.358032, 19.172849, 0.000000, 0.000000, 180.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1767.082519, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1776.712646, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1786.342041, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1795.981201, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1805.620971, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1815.249755, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 1997.333740, -1824.859497, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2005.985595, -1833.604492, 12.455597, 0.000000, 90.000000, -13.399993, 100.00);
	tmpobjid = CreateObject(19377, 1995.781982, -1831.173461, 12.455597, 0.000000, 90.000000, -13.399993, 100.00);
	tmpobjid = CreateObject(19377, 1985.568725, -1828.739624, 12.455597, 0.000000, 90.000000, -13.399993, 100.00);
	tmpobjid = CreateObject(19377, 1975.345581, -1826.304443, 12.455597, 0.000000, 90.000000, -13.399993, 100.00);
	tmpobjid = CreateObject(19377, 2015.193725, -1834.700317, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2025.703613, -1834.700317, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2036.203002, -1834.700317, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(3487, 1982.156860, -1813.579345, 19.172616, 0.000000, 0.000000, 180.000000, 100.00);
	tmpobjid = CreateObject(3466, 2018.904418, -1815.752685, 15.081534, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(19377, 2007.832885, -1795.981201, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2007.832885, -1805.600708, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2007.832885, -1815.239990, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2007.832885, -1824.869628, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1568, 1991.447998, -1762.833129, 12.536875, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2018.341796, -1795.981201, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19377, 2028.841918, -1795.981201, 12.465590, 0.000000, 90.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1704, 2019.899780, -1824.091430, 12.877134, 0.000000, 0.000000, -67.499977, 100.00);
	tmpobjid = CreateObject(1256, 2001.821777, -1766.263671, 13.191530, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1704, 2017.155395, -1823.256103, 12.955045, 0.000000, 0.000000, 18.200000, 100.00);
	tmpobjid = CreateObject(1704, 2016.052978, -1826.259277, 12.903493, 0.000000, 0.000000, 111.800018, 100.00);
	tmpobjid = CreateObject(1704, 2019.027343, -1827.276367, 12.905967, 0.000000, 0.000000, 177.499984, 100.00);
	tmpobjid = CreateObject(1297, 2001.167724, -1768.394531, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1256, 2001.821777, -1775.874145, 13.191530, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1256, 2001.821777, -1784.465332, 13.191530, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2001.167724, -1778.004760, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2001.167724, -1786.525512, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2004.397583, -1802.015014, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2004.397583, -1812.015380, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2004.397583, -1819.955322, 15.821524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(2725, 2018.013916, -1825.290771, 13.319799, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(3035, 2031.438598, -1798.831176, 13.291523, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(1440, 2023.745117, -1797.554565, 13.061524, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(2866, 2027.883666, -1797.478759, 12.561528, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(3471, 2001.740112, -1763.225219, 13.726870, 0.000000, 0.000000, 90.500000, 100.00);
	tmpobjid = CreateObject(849, 2024.263671, -1799.680297, 12.821517, 0.000000, 0.000000, 51.799991, 100.00);
	tmpobjid = CreateObject(18661, 2013.170532, -1800.742919, 13.471532, 0.000000, 0.000000, 270.000000, 100.00);
	tmpobjid = CreateObject(2229, 2017.034667, -1820.028930, 13.596624, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1358, 2027.857421, -1799.465209, 13.711527, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(3471, 1992.646850, -1763.224487, 13.726870, 0.000000, 0.000000, 90.500000, 100.00);
	tmpobjid = CreateObject(2229, 2016.287475, -1820.023071, 13.596658, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(18664, 2020.714477, -1800.745849, 13.481529, 15.900002, 0.000000, 270.000000, 100.00);
	tmpobjid = CreateObject(18665, 2016.719482, -1800.733032, 13.601523, 0.000000, 0.000000, 270.000000, 100.00);
	tmpobjid = CreateObject(2103, 2016.330932, -1820.687744, 13.640230, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1978, 2038.983276, -1820.238891, 14.550917, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(18662, 1990.153930, -1812.244873, 14.411531, 0.000000, 0.000000, 178.900039, 100.00);
	tmpobjid = CreateObject(18664, 2022.654663, -1817.001464, 14.597165, 0.000000, 0.000000, 90.800003, 100.00);
	tmpobjid = CreateObject(18663, 2008.721313, -1813.030273, 14.181533, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19860, 2055.325683, -1801.778686, 15.447697, 0.000000, 0.000000, 90.000000, 100.00);
	tmpobjid = CreateObject(2672, 2013.690307, -1824.627563, 12.915892, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1441, 2030.439331, -1799.291259, 13.121533, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1441, 2029.787963, -1797.337524, 13.231535, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1441, 2026.837036, -1797.287475, 13.231535, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2076.683593, -1839.346679, 15.912797, 0.000000, 0.000000, 180.000000, 100.00);
	tmpobjid = CreateObject(1327, 2023.163696, -1798.897827, 12.551527, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2076.683593, -1822.626831, 15.912797, 0.000000, 0.000000, 180.000000, 100.00);
	tmpobjid = CreateObject(1338, 2025.602661, -1800.206787, 12.551527, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2076.683593, -1801.625976, 15.912797, 0.000000, 0.000000, 900.000000, 100.00);
	tmpobjid = CreateObject(1338, 2025.602661, -1798.655517, 12.551527, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1297, 2076.683593, -1785.865112, 15.912797, 0.000000, 0.000000, 162.100006, 100.00);
	tmpobjid = CreateObject(1219, 2025.894531, -1798.226562, 12.968174, 5.299986, 0.000000, -9.900001, 100.00);
	tmpobjid = CreateObject(1297, 2079.889892, -1772.713500, 15.912797, 0.000000, 0.000000, 162.100006, 100.00);
	tmpobjid = CreateObject(1257, 2075.449951, -1766.709716, 13.764100, 0.000000, 0.000000, 165.599990, 100.00);
	tmpobjid = CreateObject(918, 2022.196899, -1799.678588, 12.961529, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1225, 2022.702880, -1798.425415, 13.015525, -95.000022, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1257, 1969.031616, -1807.776000, 13.792808, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1257, 1969.031616, -1817.426757, 13.792808, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(6965, 1997.103637, -1813.913208, 15.511521, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19868, 1975.037231, -1831.159667, 12.481550, 0.000000, 0.000000, -12.400008, 100.00);
	tmpobjid = CreateObject(19868, 1980.103149, -1832.373779, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(1597, 1996.913330, -1767.889526, 15.081520, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1597, 1996.913330, -1784.239746, 15.081520, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(1597, 1996.913330, -1799.699096, 15.081520, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19868, 1985.115234, -1833.558593, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(19868, 1990.165649, -1834.752807, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(19868, 1995.244262, -1835.954589, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(19868, 2000.275878, -1837.143066, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(19868, 2005.297485, -1838.329345, 12.481550, 0.000000, 0.000000, -13.300011, 100.00);
	tmpobjid = CreateObject(19868, 2010.357055, -1839.459716, 12.481550, 0.000000, 0.000000, -11.400021, 100.00);
	tmpobjid = CreateObject(19868, 2014.624023, -1839.520874, 12.481550, 0.000000, 0.000000, -0.300018, 100.00);
	tmpobjid = CreateObject(19868, 2019.794921, -1839.547729, 12.481550, 0.000000, 0.000000, -0.300018, 100.00);
	tmpobjid = CreateObject(19868, 2024.956787, -1839.554809, 12.481550, 0.000000, 0.000000, -0.300018, 100.00);
	tmpobjid = CreateObject(617, 2007.076171, -1827.402221, 12.560558, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19868, 2030.157836, -1839.572265, 12.471549, 0.000000, 0.000000, -0.300018, 100.00);
	tmpobjid = CreateObject(617, 1990.725830, -1801.211914, 12.560558, 0.000000, 0.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19866, 2002.256958, -1762.247802, 15.016870, 90.000000, 180.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19866, 1992.017211, -1762.247802, 15.016870, 90.000000, 180.000000, 0.000000, 100.00);
	tmpobjid = CreateObject(19866, 2101.688720, -1791.171630, 12.526867, 0.000000, 0.000000, -89.800018, 100.00);
	tmpobjid = CreateObject(19866, 2102.954589, -1822.207031, 12.526867, 0.000000, 0.000000, 89.699943, 100.00);
	tmpobjid = CreateObject(19866, 2101.653076, -1822.199951, 12.526867, 0.000000, 0.000000, 89.699943, 100.00);*/





	//khutruocppiza
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-26 16:48:34" by "co_rich"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*tmpobjid = CreateDynamicObject(1968, 2104.082275, -1791.993652, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1968, 2104.101318, -1795.094726, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.101318, -1798.447509, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.101318, -1801.649169, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.738037, -1801.649169, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.738037, -1798.367309, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.738037, -1795.084960, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.738037, -1792.044067, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.738037, -1810.396850, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.712402, -1813.437866, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.712402, -1816.619384, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2100.712402, -1819.369628, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.164550, -1819.419799, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.164550, -1816.607421, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.164550, -1813.256713, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1968, 2104.164550, -1810.316406, 13.058923, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(707, 2098.105224, -1826.475708, 12.382812, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2102.919921, -1791.167480, 12.526867, 0.000000, 0.000000, -89.800018, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2101.688720, -1791.171630, 12.526867, 0.000000, 0.000000, -89.800018, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.250732, -1793.584594, 12.526867, 0.000000, 0.000000, 0.199985, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.262207, -1798.548339, 12.526867, 0.000000, 0.000000, -0.000015, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.260009, -1799.805786, 12.526867, 0.000000, 0.000000, 0.199985, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.247802, -1814.227661, 12.526867, 0.000000, 0.000000, 0.199985, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.251220, -1819.793823, 12.526867, 0.000000, 0.000000, -0.100065, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19866, 2099.262207, -1817.462036, 12.526867, 0.000000, 0.000000, -0.100065, object_world, object_int, -1); */
	////////////

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	return 1;
}
