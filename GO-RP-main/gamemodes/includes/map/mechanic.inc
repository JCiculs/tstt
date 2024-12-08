#include <a_samp>
#include <YSI_Coding\y_hooks>
#include "./includes/main/streamer.pwn"

hook OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 4606, 1825.0000, -1413.9297, 12.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 4594, 1825.0000, -1413.9297, 12.5547, 0.25);
	return 1;
}

hook OnGameModeInit()
{
		new vratameh1 = CreateDynamicObject(19325, 1823.07092, -1413.02844, 13.93840,   0.00000, 0.00000, 0.00000); //����� �������� - 1
		new vratameh2 = CreateDynamicObject(19325, 1823.07092, -1419.67175, 13.93840,   0.00000, 0.00000, 0.00000); //����� �������� - 2

		new Mechanic = CreateObject(19325, 1823.1446, -1438.8256, 17.8744, -0.1998, 0.0000, 179.9742);
		SetObjectMaterialText(Mechanic, "Mechanic", 0, 50, "Arial", 30, 1, -15066598, 0, 1);

		new Garage = CreateObject(19325, 1823.1446, -1426.6662, 17.7358, -0.4999, 0.0000, 179.8941);
		SetObjectMaterialText(Garage, "Garage", 0, 50, "Arial", 30, 1, -65536, 0, 1);

		new mehcrno = CreateDynamicObject(19454, 1823.03503, -1425.72974, 11.43320,   90.00000, 0.00000, 0.00000);
		new mehcrno1 = CreateDynamicObject(19454, 1823.03503, -1420.96484, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehcrno2 = CreateDynamicObject(19362, 1823.03503, -1424.40735, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrno3 = CreateDynamicObject(19362, 1823.03503, -1427.87512, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrno4 = CreateDynamicObject(19362, 1823.03503, -1430.89551, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrno5 = CreateDynamicObject(19377, 1818.29724, -1422.74036, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehcrno6 = CreateDynamicObject(19377, 1805.17078, -1427.45313, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehcrno7 = CreateDynamicObject(19377, 1809.93774, -1422.74036, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehcrno8 = CreateDynamicObject(19377, 1805.17419, -1427.80505, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehcrno9 = CreateDynamicObject(19391, 1823.03503, -1416.36853, 14.29590,   0.00000, 0.00000, 0.00000);
		new mehcrno10 = CreateDynamicObject(19454, 1823.03503, -1424.41040, 11.43321,   90.00000, 0.00000, 0.00000);
		new mehcrno11 = CreateDynamicObject(19454, 1823.03503, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehcrno12 = CreateDynamicObject(19454, 1823.03503, -1413.08435, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehcrno13 = CreateDynamicObject(19454, 1823.03503, -1411.83960, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehcrno14 = CreateDynamicObject(19435, 1823.03503, -1409.33948, 14.28710,   0.00000, 0.00000, 0.00000);
		new mehcrno15 = CreateDynamicObject(19377, 1818.25208, -1408.60779, 10.78580,   0.00000, 0.00000, 90.00000);
		new mehcrno16 = CreateDynamicObject(19377, 1818.26917, -1413.79468, 15.98210,   0.00000, 90.00000, 90.00000);
		new mehcrno17 = CreateDynamicObject(19377, 1813.51123, -1413.34766, 10.78580,   0.00000, 0.00000, 0.00000);
		new mehcrno18 = CreateDynamicObject(19377, 1813.51123, -1417.85156, 10.78580,   0.00000, 0.00000, 0.00000);
		new mehcrno19 = CreateDynamicObject(19377, 1818.26917, -1417.44714, 15.98210,   0.00000, 90.00000, 90.00000);
		new mehcrno20 = CreateDynamicObject(19377, 1810.39648, -1427.78503, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrno21 = CreateDynamicObject(19377, 1810.39648, -1427.50500, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrno22 = CreateDynamicObject(19377, 1817.78223, -1427.78503, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrno23 = CreateDynamicObject(19377, 1817.78223, -1427.50500, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrno24 = CreateDynamicObject(19362, 1823.68530, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
		new mehcrno25 = CreateDynamicObject(19362, 1823.20532, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
		new mehcrno26 = CreateDynamicObject(19362, 1823.36536, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
		new mehcrno27 = CreateDynamicObject(19362, 1823.52539, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
		new mehcrno28 = CreateDynamicObject(1297, 1833.91675, -1414.39209, 18.10580,   30.00000, -80.00000, 180.00000);
		new mehcrno29 = CreateDynamicObject(1297, 1833.91675, -1417.85913, 18.10580,   -30.00000, -80.00000, 180.00000);

		SetDynamicObjectMaterial(mehcrno, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno1, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno2, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno3, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno4, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno5, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno6, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno7, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno8, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno9, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno10, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno11, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno12, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno13, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno14, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno15, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno16, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno17, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno18, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno19, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno20, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno21, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno22, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno23, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno24, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno25, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno26, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno27, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno28, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcrno29, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);

		new grotti = CreateDynamicObject(3354, 1823.11292, -1432.60730, 17.74190,   0.00000, 0.00000, 0.00000);
		SetDynamicObjectMaterial(grotti, 0, 6337, "sunset02_law2", "SunBillB08", 0);

		new mehcrveno = CreateDynamicObject(19454, 1823.03503, -1440.89795, 11.43320,   90.00000, 0.00000, 0.00000);
		new mehcrveno1 = CreateDynamicObject(19454, 1823.03503, -1439.43225, 11.43320,   90.00000, 0.00000, 0.00000);
		new mehcrveno2 = CreateDynamicObject(19362, 1823.03503, -1434.37402, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrveno3 = CreateDynamicObject(19362, 1823.03503, -1440.88538, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrveno4 = CreateDynamicObject(19362, 1823.03503, -1437.64282, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehcrveno5 = CreateDynamicObject(19377, 1818.30676, -1442.57776, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehcrveno6 = CreateDynamicObject(19377, 1809.93774, -1442.57776, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehcrveno7 = CreateDynamicObject(19377, 1805.17078, -1437.43542, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehcrveno8 = CreateDynamicObject(19377, 1805.17078, -1437.83423, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehcrveno9 = CreateDynamicObject(19377, 1817.78223, -1437.41541, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrveno10 = CreateDynamicObject(19377, 1810.39648, -1437.41541, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrveno11 = CreateDynamicObject(19377, 1817.78223, -1437.79541, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrveno12 = CreateDynamicObject(19377, 1810.39648, -1437.79541, 19.40020,   0.00000, 90.00000, 0.00000);
		new mehcrveno13 = CreateDynamicObject(1223, 1828.51904, -1418.47351, 12.43320,   0.00000, 0.00000, 0.00000);
		new mehcrveno14 = CreateDynamicObject(1223, 1834.14978, -1413.32275, 12.43320,   0.00000, 0.00000, 180.00000);

		SetDynamicObjectMaterial(mehcrveno, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno1, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno2, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno3, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno4, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno5, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno6, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno7, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno8, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno9, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno10, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno11, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno12, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno13, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehcrveno14, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

		new mehgarage = CreateDynamicObject(3037, 1822.96338, -1432.60852, 17.15933,   0.00000, 0.00000, 0.00000);
		SetDynamicObjectMaterial(mehgarage, 0, 3354, "ce_burbhouse", "ws_garagedoor3_whiteMaterial", 0xFF8F8F8F);

		new mehbelo = CreateDynamicObject(19377, 1818.18225, -1441.22217, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehbelo1 = CreateDynamicObject(19377, 1810.01196, -1423.92712, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehbelo2 = CreateDynamicObject(19377, 1810.03381, -1441.22217, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehbelo3 = CreateDynamicObject(19377, 1808.19019, -1428.05676, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehbelo4 = CreateDynamicObject(19377, 1818.12830, -1423.92712, 14.19180,   0.00000, 0.00000, 90.00000);
		new mehbelo5 = CreateDynamicObject(19377, 1808.19019, -1437.14758, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehbelo6 = CreateDynamicObject(19454, 1822.93433, -1425.72144, 14.57724,   90.00000, 0.00000, 0.00000);
		new mehbelo7 = CreateDynamicObject(19454, 1822.93433, -1439.43225, 14.57720,   90.00000, 0.00000, 0.00000);
		new mehbelo8 = CreateDynamicObject(19362, 1822.93433, -1429.14063, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehbelo9 = CreateDynamicObject(19362, 1822.93433, -1432.52002, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehbelo10 = CreateDynamicObject(19362, 1822.93433, -1435.94043, 17.83410,   90.00000, 0.00000, 0.00000);
		new mehbelo11 = CreateDynamicObject(19377, 1808.19019, -1428.05676, 14.19180,   0.00000, 0.00000, 0.00000);
		new mehbelo12 = CreateDynamicObject(19377, 1813.25818, -1436.48645, 7.34810,   0.00000, 0.00000, 0.00000);
		new mehbelo13 = CreateDynamicObject(19377, 1813.25818, -1428.62097, 7.34814,   0.00000, 0.00000, 0.00000);
		new mehbelo14 = CreateDynamicObject(19377, 1813.59119, -1417.85156, 10.78580,   0.00000, 0.00000, 0.00000);
		new mehbelo15 = CreateDynamicObject(19377, 1813.59119, -1413.34766, 10.78580,   0.00000, 0.00000, 0.00000);
		new mehbelo16 = CreateDynamicObject(19435, 1822.93506, -1409.33948, 14.28710,   0.00000, 0.00000, 0.00000);
		new mehbelo17 = CreateDynamicObject(19454, 1822.93506, -1413.08435, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehbelo18 = CreateDynamicObject(19454, 1822.93506, -1411.83960, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehbelo19 = CreateDynamicObject(19391, 1822.93506, -1416.36853, 14.29590,   0.00000, 0.00000, 0.00000);
		new mehbelo20 = CreateDynamicObject(19454, 1822.93506, -1420.96484, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehbelo21 = CreateDynamicObject(19454, 1823.03503, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehbelo22 = CreateDynamicObject(19377, 1818.25208, -1408.60779, 10.78580,   0.00000, 0.00000, 90.00000);
		new mehbelo23 = CreateDynamicObject(19377, 1818.20361, -1422.59680, 7.44777,   0.00000, 0.00000, 90.00000);
		new mehbelo24 = CreateDynamicObject(19454, 1822.93506, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
		new mehbelo25 = CreateDynamicObject(19454, 1810.85510, -1428.64478, 18.18910,   0.00000, 90.00000, 0.00000);
		new mehbelo26 = CreateDynamicObject(19454, 1810.85510, -1437.15710, 18.18910,   0.00000, 90.00000, 0.00000);
		new mehbelo27 = CreateDynamicObject(19454, 1808.80615, -1428.68958, 18.18910,   0.00000, 90.00000, 0.00000);
		new mehbelo28 = CreateDynamicObject(19454, 1808.80615, -1437.15710, 18.18910,   0.00000, 90.00000, 0.00000);

		SetDynamicObjectMaterial(mehbelo, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo1, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo2, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo3, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo4, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo5, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo6, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo7, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo8, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo9, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo10, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo11, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo12, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo13, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo14, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo15, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo16, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo17, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo18, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo19, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo20, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo21, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo22, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo23, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo24, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo25, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo26, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo27, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbelo28, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);

		new ormar = CreateDynamicObject(1742, 1809.00549, -1440.23096, 12.55500,   0.00000, 0.00000, -40.00000);
		SetDynamicObjectMaterial(ormar, 2, 10282, "michgar", "tool_store", 0);

		new ormar2 = CreateDynamicObject(1742, 1809.00549, -1440.23096, 12.55500,   0.00000, 0.00000, -40.00000);
		SetDynamicObjectMaterial(ormar2, 2, 10282, "michgar", "tool_store", 0);

		new ormar3 = CreateDynamicObject(2087, 1810.73145, -1424.14832, 12.46910,   0.00000, 0.00000, 0.00000);
		new ormar4 = CreateDynamicObject(1742, 1808.75122, -1434.22827, 12.55500,   0.00000, 0.00000, -90.00000);
		new ormar5 = CreateDynamicObject(1742, 1809.79333, -1424.33936, 12.55500,   0.00000, 0.00000, 180.00000);
		new ormar6 = CreateDynamicObject(1742, 1808.75122, -1434.22827, 12.55500,   0.00000, 0.00000, -90.00000);
		new ormar7 = CreateDynamicObject(1742, 1809.79333, -1424.69934, 12.55500,   0.00000, 0.00000, 180.00000);

		SetDynamicObjectMaterial(ormar3, 0, 10282, "michgar", "tool_store", 0);
		SetDynamicObjectMaterial(ormar4, 2, 10282, "michgar", "tool_store", 0);
		SetDynamicObjectMaterial(ormar5, 2, 10282, "michgar", "tool_store", 0);
		SetDynamicObjectMaterial(ormar6, 2, 10282, "michgar", "tool_store", 0);
		SetDynamicObjectMaterial(ormar7, 2, 10282, "michgar", "tool_store", 0);

		new mehbeton = CreateDynamicObject(19377, 1818.12183, -1437.35486, 12.49670,   0.00000, 90.00000, 90.00000);
		new mehbeton1 = CreateDynamicObject(19377, 1818.12183, -1426.86023, 12.49670,   0.00000, 90.00000, 90.00000);

		SetDynamicObjectMaterial(mehbeton, 0, 9495, "vict_sfw", "concretebigb256128", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehbeton1, 0, 9495, "vict_sfw", "concretebigb256128", 0xFFDEDEDE);

		new mehcigle = CreateDynamicObject(19454, 1811.43970, -1427.53967, 12.48240,   0.00000, 90.00000, 0.00000);
		new mehcigle1 = CreateDynamicObject(19454, 1811.43970, -1437.17358, 12.48240,   0.00000, 90.00000, 0.00000);
		new mehcigle2 = CreateDynamicObject(19454, 1807.94104, -1427.53967, 12.48240,   0.00000, 90.00000, 0.00000);
		new mehcigle3 = CreateDynamicObject(19454, 1807.94104, -1437.17358, 12.48240,   0.00000, 90.00000, 0.00000);
		new mehcigle4 = CreateDynamicObject(19377, 1817.79395, -1437.65784, 18.21760,   0.00000, 90.00000, 0.00000);
		new mehcigle5 = CreateDynamicObject(19377, 1817.79395, -1428.06445, 18.21760,   0.00000, 90.00000, 0.00000);

		SetDynamicObjectMaterial(mehcigle, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcigle1, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcigle2, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcigle3, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcigle4, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehcigle5, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);

		new mehalat = CreateDynamicObject(2204, 1808.69556, -1435.65295, 11.68770,   0.00000, 0.00000, -90.00000);
		SetDynamicObjectMaterial(mehalat, 0, 10282, "michgar", "tool_store2", 0);

		new mehshop = CreateDynamicObject(2434, 1815.96655, -1413.13330, 12.60420,   0.00000, 0.00000, 90.00000);
		new mehshop1 = CreateDynamicObject(2435, 1815.96655, -1415.91846, 12.60420,   0.00000, 0.00000, 90.00000);
		new mehshop2 = CreateDynamicObject(2435, 1814.83545, -1412.96753, 12.60420,   0.00000, 0.00000, 180.00000);
		new mehshop3 = CreateDynamicObject(2435, 1815.96655, -1414.99146, 12.60420,   0.00000, 0.00000, 90.00000);
		new mehshop4 = CreateDynamicObject(2435, 1815.96655, -1414.06201, 12.60420,   0.00000, 0.00000, 90.00000);
		new mehshop5 = CreateDynamicObject(2434, 1815.80103, -1417.05188, 12.60420,   0.00000, 0.00000, 0.00000);
		new mehshop6 = CreateDynamicObject(2435, 1814.87061, -1417.05090, 12.60420,   0.00000, 0.00000, 0.00000);

		SetDynamicObjectMaterial(mehshop, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);//0 drska
		SetDynamicObjectMaterial(mehshop1, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehshop2, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehshop3, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehshop4, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehshop5, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehshop6, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);

		SetDynamicObjectMaterial(mehshop, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);//1 dole
		SetDynamicObjectMaterial(mehshop1, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehshop2, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehshop3, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehshop4, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehshop5, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehshop6, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

		SetDynamicObjectMaterial(mehshop, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);//2 sredina
		SetDynamicObjectMaterial(mehshop1, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehshop2, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehshop3, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehshop4, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehshop5, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehshop6, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);

		new Michelin = CreateObject(19329, 1808.2811, -1429.1574, 16.5324, 0.1000, -0.0999, 90.0708);
		SetObjectMaterialText(Michelin, "Michelin", 0, 40, "Arial", 30, 1, -1, -16776961, 1);

		new BFGoodrich = CreateObject(19329, 1817.0158, -1441.1131, 16.8204, -1.4000, -31.1000, -0.6351);
		SetObjectMaterialText(BFGoodrich, "BFGoodrich", 0, 50, "Verdana", 24, 1, -16730675, 0, 1);

		new Tigar = CreateObject(19329, 1817.3315, -1424.0202, 15.6215, 0.0000, 21.7999, -0.1533);
		SetObjectMaterialText(Tigar, "TIGAR", 0, 20, "Beckett", 24, 1, -16468988, 0, 1);

		new premium = CreateObject(19329, 1833.8264, -1416.1945, 15.6215, 0.0000, 0.0000, -89.9407);
		SetObjectMaterialText(premium, "Premium", 0, 50, "Verdana", 24, 1, -16776961, 0, 1);

		new evrodizel = CreateObject(19329, 1828.9138, -1416.0230, 15.6315, 0.0000, 0.0000, -89.9159);
		SetObjectMaterialText(evrodizel, "Evro Dizel", 0, 50, "Verdana", 24, 1, -65536, 0, 1);

		new grottishop = CreateObject(19325, 1813.7138, -1415.0430, 14.5585, 0.0000, 0.0000, 179.9476);
		SetObjectMaterialText(grottishop, "Grotti", 0, 50, "Diploma", 30, 1, -65536, 0, 1);

		new goregrotti = CreateObject(19325, 1837.0590, -1416.0830, 18.3625, 0.0000, 0.0000, -179.9923);
		SetObjectMaterialText(goregrotti, "GROTTI", 0, 60, "Arial", 29, 1, -1, 0, 1);

		new mehpod1 = CreateDynamicObject(19454, 1818.22583, -1413.80750, 12.54260,   0.00000, 90.00000, 90.00000);
		new mehpod2 = CreateDynamicObject(19454, 1818.22583, -1417.29346, 12.54260,   0.00000, 90.00000, 90.00000);
		new mehpod3 = CreateDynamicObject(19454, 1818.22583, -1420.77234, 12.54260,   0.00000, 90.00000, 90.00000);
		new mehpod4 = CreateDynamicObject(19454, 1818.22583, -1410.31238, 12.54260,   0.00000, 90.00000, 90.00000);

		SetDynamicObjectMaterial(mehpod1, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehpod2, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehpod3, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehpod4, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);

		new mehulje = CreateDynamicObject(1650, 1823.44727, -1413.52502, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje1 = CreateDynamicObject(1650, 1823.44727, -1413.30505, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje2 = CreateDynamicObject(1650, 1823.44727, -1413.08508, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje3 = CreateDynamicObject(1650, 1823.44727, -1412.86511, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje4 = CreateDynamicObject(1650, 1823.44727, -1412.64514, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje5 = CreateDynamicObject(1650, 1823.44727, -1412.42505, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje6 = CreateDynamicObject(1650, 1823.44727, -1412.20496, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje7 = CreateDynamicObject(1650, 1823.44727, -1411.98499, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje8 = CreateDynamicObject(1650, 1823.44727, -1411.76501, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje9 = CreateDynamicObject(1650, 1823.44727, -1411.54504, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje10 = CreateDynamicObject(1650, 1823.44727, -1411.32495, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje11 = CreateDynamicObject(1650, 1823.44727, -1411.10498, 13.53020,   0.00000, 0.00000, 0.00000);

		SetDynamicObjectMaterial(mehulje, 0, 2361, "shopping_freezers", "white", 0xCC6873E3);
		SetDynamicObjectMaterial(mehulje1, 0, 2361, "shopping_freezers", "white", 0xCC6873E3);
		SetDynamicObjectMaterial(mehulje2, 0, 2361, "shopping_freezers", "white", 0xAA6873E3);
		SetDynamicObjectMaterial(mehulje3, 0, 2361, "shopping_freezers", "white", 0xAA6873E3);

		SetDynamicObjectMaterial(mehulje4, 0, 2361, "shopping_freezers", "white", 0xCC4CAD2B);
		SetDynamicObjectMaterial(mehulje5, 0, 2361, "shopping_freezers", "white", 0xCC4CAD2B);
		SetDynamicObjectMaterial(mehulje6, 0, 2361, "shopping_freezers", "white", 0xAA4CAD2B);
		SetDynamicObjectMaterial(mehulje7, 0, 2361, "shopping_freezers", "white", 0xAA4CAD2B);

		SetDynamicObjectMaterial(mehulje8, 0, 2361, "shopping_freezers", "white", 0xCCC9571E);
		SetDynamicObjectMaterial(mehulje9, 0, 2361, "shopping_freezers", "white", 0xCCC9571E);
		SetDynamicObjectMaterial(mehulje10, 0, 2361, "shopping_freezers", "white", 0xAAC9571E);
		SetDynamicObjectMaterial(mehulje11, 0, 2361, "shopping_freezers", "white", 0xAAC9571E);

		new mehulje12 = CreateDynamicObject(1650, 1823.44727, -1413.52502, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje13 = CreateDynamicObject(1650, 1823.44727, -1413.30505, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje14 = CreateDynamicObject(1650, 1823.44727, -1413.08508, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje15 = CreateDynamicObject(1650, 1823.44727, -1412.86511, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje16 = CreateDynamicObject(1650, 1823.44727, -1412.64514, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje17 = CreateDynamicObject(1650, 1823.44727, -1412.42505, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje18 = CreateDynamicObject(1650, 1823.44727, -1412.20496, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje19 = CreateDynamicObject(1650, 1823.44727, -1411.98499, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje20 = CreateDynamicObject(1650, 1823.44727, -1411.76501, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje21 = CreateDynamicObject(1650, 1823.44727, -1411.54504, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje22 = CreateDynamicObject(1650, 1823.44727, -1411.32495, 13.53020,   0.00000, 0.00000, 0.00000);
		new mehulje23 = CreateDynamicObject(1650, 1823.44727, -1411.10498, 13.53020,   0.00000, 0.00000, 0.00000);

		SetDynamicObjectMaterial(mehulje12, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje13, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje14, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje15, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje16, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje17, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje18, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje19, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje20, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje21, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje22, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
		SetDynamicObjectMaterial(mehulje23, 0, 1649, "wglass", "carshowwin2", 0xFF000000);

		new mehstub = CreateDynamicObject(2960, 1815.29785, -1432.81494, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub1 = CreateDynamicObject(2960, 1818.63440, -1432.83484, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub2 = CreateDynamicObject(2960, 1815.29785, -1426.86047, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub3 = CreateDynamicObject(2960, 1818.63440, -1426.86047, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub4 = CreateDynamicObject(2960, 1815.29785, -1431.15442, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub5 = CreateDynamicObject(2960, 1818.63440, -1431.15442, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub6 = CreateDynamicObject(2960, 1815.29785, -1437.09802, 14.57020,   0.00000, 90.00000, 0.00000);
		new mehstub7 = CreateDynamicObject(2960, 1818.63196, -1437.09802, 14.57020,   0.00000, 90.00000, 0.00000);

		new mehdizalica = CreateDynamicObject(19435, 1818.69617, -1436.34875, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica1 = CreateDynamicObject(19435, 1815.19543, -1433.58594, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica2 = CreateDynamicObject(19435, 1818.69617, -1433.58594, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica3 = CreateDynamicObject(19435, 1815.19543, -1427.57898, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica4 = CreateDynamicObject(19435, 1818.69617, -1427.57898, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica5 = CreateDynamicObject(19435, 1815.19543, -1430.33691, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica6 = CreateDynamicObject(19435, 1818.69617, -1430.33691, 12.54790,   0.00000, 90.00000, 0.00000);
		new mehdizalica7 = CreateDynamicObject(19435, 1815.19543, -1436.34875, 12.54790,   0.00000, 90.00000, 0.00000);

		SetDynamicObjectMaterial(mehstub, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub1, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub2, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub3, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub4, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub5, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub6, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehstub7, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

		SetDynamicObjectMaterial(mehdizalica, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica1, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica2, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica3, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica4, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica5, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica6, 0, 13131, "cunte_blockammo", "metpat64", 0);
		SetDynamicObjectMaterial(mehdizalica7, 0, 13131, "cunte_blockammo", "metpat64", 0);

		new mehgas = CreateDynamicObject(18452, 1831.40356, -1415.95642, 15.50220,   0.00000, 0.00000, 90.00000);
		SetDynamicObjectMaterial(mehgas, 3, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
		SetDynamicObjectMaterial(mehgas, 1, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
		SetDynamicObjectMaterial(mehgas, 2, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
		SetDynamicObjectMaterial(mehgas, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

		CreateDynamicObject(1886, 1828.34851, -1412.71680, 17.91790,   20.00000, 0.00000, 40.00000);
		CreateDynamicObject(1886, 1813.92725, -1409.07190, 16.07490,   0.00000, 0.00000, 30.00000);
		CreateDynamicObject(737, 1831.09998, -1379.90002, 13.90000,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2190, 1808.23181, -1437.46191, 13.29660,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1073, 1808.34949, -1428.32361, 13.91070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1082, 1808.34949, -1427.61792, 15.15590,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1098, 1808.34949, -1429.14526, 15.15590,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1097, 1808.34949, -1430.76160, 15.15593,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1079, 1808.34949, -1429.96765, 13.91069,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1225, 1821.23743, -1424.55432, 12.94390,   0.00000, 0.00000, 30.00000);
		CreateDynamicObject(1218, 1822.30872, -1424.50500, 12.94390,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1348, 1816.08081, -1424.42578, 13.23503,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(927, 1813.71704, -1424.05847, 15.68720,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(914, 1812.27429, -1424.04578, 15.26402,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(3804, 1808.27209, -1437.08875, 15.96225,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2798, 1819.59387, -1439.26563, 12.60520,   90.00000, 0.00000, 25.97999);
		CreateDynamicObject(2465, 1815.34949, -1408.94507, 14.61880,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2057, 1820.98071, -1425.27295, 12.72270,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(918, 1817.23059, -1424.31348, 12.93510,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1009, 1817.45642, -1424.80896, 12.96880,   0.00000, 90.00000, -40.00000);
		CreateDynamicObject(1066, 1819.46753, -1440.79724, 13.11990,   0.00000, 0.00000, 140.00000);
		CreateDynamicObject(1983, 1814.05664, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2541, 1820.70227, -1422.14575, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2362, 1815.78931, -1416.09607, 13.65970,   0.00000, 0.00000, 60.00000);
		CreateDynamicObject(2369, 1815.74097, -1415.05737, 13.64010,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(2543, 1819.39575, -1413.62341, 12.56150,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2542, 1821.16736, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2541, 1820.18726, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1987, 1817.03406, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2578, 1813.78076, -1420.53076, 13.57240,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(2365, 1821.87219, -1414.73730, 12.62480,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1983, 1815.04712, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1983, 1816.03772, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2541, 1819.69946, -1422.14417, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2541, 1819.70532, -1420.27271, 12.56150,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2542, 1820.68823, -1420.27271, 12.56150,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2542, 1819.20520, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1887, 1814.06689, -1410.12231, 12.38460,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1844, 1815.14233, -1409.22888, 12.38460,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1843, 1818.11865, -1409.22888, 12.38460,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2543, 1820.36230, -1413.62341, 12.56150,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2543, 1820.35864, -1412.58032, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2543, 1819.39233, -1412.58032, 12.56150,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(2443, 1822.20264, -1409.11475, 12.62509,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2452, 1820.39929, -1409.08203, 12.56510,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2578, 1813.78076, -1419.49878, 13.57240,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(918, 1817.95703, -1424.36194, 12.93510,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(918, 1817.47742, -1424.84436, 12.93510,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1421, 1819.48889, -1440.01721, 13.32120,   0.00000, 0.00000, -20.00000);
		CreateDynamicObject(1221, 1817.88745, -1440.48743, 12.99115,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1421, 1821.61865, -1440.12781, 13.32120,   0.00000, 0.00000, 30.00000);
		CreateDynamicObject(1074, 1817.32410, -1439.74402, 13.00410,   0.00000, -20.00000, 110.00000);
		CreateDynamicObject(1025, 1815.33948, -1440.46021, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(14826, 1812.05322, -1445.30310, 13.26680,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1897, 1813.54321, -1440.43323, 12.02360,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1025, 1814.93909, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1025, 1814.53979, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1025, 1814.13562, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1025, 1813.75256, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1025, 1815.69751, -1440.46021, 13.11070,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1897, 1814.68408, -1440.46741, 13.03300,   90.00000, 0.00000, 90.00000);
		CreateDynamicObject(1897, 1815.93066, -1440.43323, 12.02360,   0.00000, 0.00000, -90.00000);
		CreateDynamicObject(2197, 1811.03418, -1440.24695, 12.54200,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1428, 1818.79480, -1424.72156, 13.90560,   0.00000, 0.00000, -110.00000);
		CreateDynamicObject(2197, 1811.74658, -1440.25073, 12.54200,   0.00000, 0.00000, 180.00000);
		CreateDynamicObject(1428, 1819.54321, -1425.03430, 13.90560,   0.00000, 0.00000, 70.00000);
		CreateDynamicObject(1218, 1822.02087, -1425.43738, 12.94390,   20.00000, 90.00000, 230.00000);
		CreateDynamicObject(1077, 1817.02686, -1441.06470, 15.31610,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1078, 1818.31152, -1441.06470, 15.31611,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1442, 1808.76965, -1426.73157, 13.02124,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(2690, 1809.14807, -1427.05542, 12.89900,   -20.00000, 0.00000, 50.00000);
		CreateDynamicObject(2961, 1808.30457, -1435.95483, 14.22710,   0.00000, 0.00000, -90.00000);
		CreateDynamicObject(1650, 1812.36475, -1440.93616, 12.87360,   0.00000, 0.00000, 60.00000);
		CreateDynamicObject(970, 1836.86377, -1448.76196, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1830.67065, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1826.54395, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1822.42456, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1818.30615, -1450.49780, 13.09560,   0.00000, 0.00000, -10.00000);
		CreateDynamicObject(970, 1814.24158, -1449.77490, 13.09560,   0.00000, 0.00000, -10.00000);
		CreateDynamicObject(970, 1810.17871, -1449.06274, 13.09560,   0.00000, 0.00000, -10.00000);
		CreateDynamicObject(970, 1806.11182, -1448.35706, 13.09560,   0.00000, 0.00000, -10.00000);
		CreateDynamicObject(970, 1802.00867, -1445.56726, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1804.06311, -1447.99268, 13.09560,   0.00000, 0.00000, -10.00000);
		CreateDynamicObject(970, 1802.01025, -1441.44495, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1439.35889, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1435.22681, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1431.08606, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1426.97095, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1422.82764, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1802.00867, -1418.70837, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1834.76868, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1836.86377, -1444.63501, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1440.50208, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1412.84692, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1416.96545, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1421.06531, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1425.22693, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1393.37915, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1836.86377, -1408.69836, 13.09560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1834.80493, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1830.69568, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1826.56909, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1822.42761, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1818.27344, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1814.14063, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1812.07202, -1393.37280, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1812.07202, -1397.49329, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1812.07202, -1401.66602, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1812.07202, -1405.79456, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1813.45776, -1409.90454, 12.89560,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(970, 1811.40295, -1407.86304, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(970, 1807.25769, -1407.86194, 12.89560,   0.00000, 0.00000, 0.00000);
		CreateDynamicObject(1676, 1834.30273, -1416.19019, 14.25010,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(1676, 1828.45435, -1416.03247, 14.25010,   0.00000, 0.00000, 90.00000);
		CreateDynamicObject(11392, 1809.27478, -1434.25146, 12.60620,   0.00000, 0.00000, 90.00000);
	return 1;
}
