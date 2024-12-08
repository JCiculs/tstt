#include <a_samp>
#pragma tabsize 0

#undef MAX_PLAYERS
#define MAX_PLAYERS 700

public OnFilterScriptInit() {

    print("RemoveBuilding Filterscript Initiated");
}

public OnPlayerConnect(playerid)
{
    //mechanic
 /*   RemoveBuildingForPlayer(playerid, 5110, 2443.629, -1901.319, 18.007, 0.250);
    RemoveBuildingForPlayer(playerid, 5226, 2443.629, -1901.319, 18.007, 0.250);
    RemoveBuildingForPlayer(playerid, 1635, 2441.439, -1901.699, 14.726, 0.250);
    RemoveBuildingForPlayer(playerid, 3594, 2450.459, -1890.780, 13.164, 0.250);
    RemoveBuildingForPlayer(playerid, 1687, 2430.520, -1917.729, 18.960, 0.250);
    RemoveBuildingForPlayer(playerid, 5267, 2485.770, -1900.439, 18.531, 0.250);
    RemoveBuildingForPlayer(playerid, 5228, 2485.770, -1900.439, 18.531, 0.250);
    RemoveBuildingForPlayer(playerid, 1689, 2473.449, -1903.709, 17.757, 0.250);
    RemoveBuildingForPlayer(playerid, 1687, 2497.679, -1891.709, 25.359, 0.250);
    RemoveBuildingForPlayer(playerid, 1688, 2500.760, -1904.380, 25.562, 0.250);
    RemoveBuildingForPlayer(playerid, 1447, 2434.270, -1879.699, 13.820, 0.250);
    RemoveBuildingForPlayer(playerid, 1413, 2439.550, -1879.920, 13.820, 0.250);
    RemoveBuildingForPlayer(playerid, 1447, 2444.830, -1879.880, 13.820, 0.250);
    RemoveBuildingForPlayer(playerid, 1413, 2452.300, -1879.709, 13.820, 0.250);
    RemoveBuildingForPlayer(playerid, 1447, 2461.879, -1879.699, 13.820, 0.250);
    RemoveBuildingForPlayer(playerid, 1226, 2495.300, -1928.199, 16.367, 0.250);*/
    	//
//	RemoveBuildingForPlayer(playerid, 5536, 1866.3281, -1789.7813, 20.9453, 0.25);
//    RemoveBuildingForPlayer(playerid, 1308, 1867.7188, -1798.2031, 12.7031, 0.25);
//    RemoveBuildingForPlayer(playerid, 5397, 1866.3281, -1789.7813, 20.9453, 0.25);

    // 247
    RemoveBuildingForPlayer(playerid, 5409, 1918.848, -1776.328, 16.975, 0.250);
	RemoveBuildingForPlayer(playerid, 5535, 1918.848, -1776.328, 16.975, 0.250);
	RemoveBuildingForPlayer(playerid, 5681, 1921.479, -1778.910, 18.577, 0.250);
	RemoveBuildingForPlayer(playerid, 1524, 1910.160, -1779.660, 18.750, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1778.448, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1774.310, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1771.338, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 1676, 1941.660, -1767.290, 14.140, 0.250);
	RemoveBuildingForPlayer(playerid, 955, 1928.729, -1772.448, 12.944, 0.250);

    //hospital exterior
    RemoveBuildingForPlayer(playerid, 5931, 1114.312, -1348.100, 17.983, 0.250);
    RemoveBuildingForPlayer(playerid, 5935, 1120.156, -1303.453, 18.569, 0.250);
    RemoveBuildingForPlayer(playerid, 1440, 1085.703, -1361.022, 13.265, 0.250);
    RemoveBuildingForPlayer(playerid, 5810, 1114.312, -1348.100, 17.983, 0.250);
    RemoveBuildingForPlayer(playerid, 5993, 1110.897, -1328.812, 13.850, 0.250);
    RemoveBuildingForPlayer(playerid, 5811, 1131.194, -1380.421, 17.069, 0.250);
    RemoveBuildingForPlayer(playerid, 1440, 1145.332, -1365.647, 13.265, 22.000);
    RemoveBuildingForPlayer(playerid, 5737, 1120.156, -1303.453, 18.569, 0.250);
    RemoveBuildingForPlayer(playerid, 1297, 1112.619, -1389.869, 15.670, 0.250);
    RemoveBuildingForPlayer(playerid, 618, 1177.729, -1315.660, 13.295, 0.250);
    RemoveBuildingForPlayer(playerid, 617, 1178.598, -1332.068, 12.890, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1184.010, -1343.270, 12.578, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1184.010, -1353.500, 12.578, 0.250);
    //taxi
    RemoveBuildingForPlayer(playerid, 620, 1703.468, -1846.710, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1710.835, -1846.710, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1710.835, -1833.054, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1703.468, -1833.054, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1721.156, -1846.710, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1731.476, -1846.710, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1741.796, -1833.054, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1731.476, -1833.054, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1721.156, -1833.054, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 620, 1747.187, -1846.710, 10.804, 0.250);
    RemoveBuildingForPlayer(playerid, 5024, 1748.838, -1883.030, 14.187, 0.250);
    RemoveBuildingForPlayer(playerid, 5083, 1748.838, -1883.030, 14.187, 0.250);
    RemoveBuildingForPlayer(playerid, 5033, 1745.198, -1882.848, 26.139, 0.250);
    RemoveBuildingForPlayer(playerid, 5055, 1745.198, -1882.848, 26.139, 0.250);
    RemoveBuildingForPlayer(playerid, 4821, 1745.198, -1882.848, 26.139, 0.250);
    RemoveBuildingForPlayer(playerid, 4961, 1745.198, -1882.848, 26.139, 0.250);
    return 1;
}