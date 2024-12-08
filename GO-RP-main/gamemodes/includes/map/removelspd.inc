#include <a_samp>
#include <YSI_Coding\y_hooks>
hook OnPlayerConnect(playerid)
{
		//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-07-16 17:58:52" by "Thuandeptrai"
		Created by "Thuandeptrai"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
	/*RemoveBuildingForPlayer(playerid, 647, 1546.869, -1658.339, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1661.030, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.599, -1664.630, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.869, -1687.099, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1547.569, -1689.979, 13.046, 0.250);
	RemoveBuildingForPlayer(playerid, 647, 1546.599, -1693.390, 14.437, 0.250);
	RemoveBuildingForPlayer(playerid, 1536, 1555.890, -1674.109, 15.179, 0.250);
	RemoveBuildingForPlayer(playerid, 1536, 1555.930, -1677.130, 15.179, 0.250);
	RemoveBuildingForPlayer(playerid, 4228, 1568.290, -1677.780, 10.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3975, 1578.469, -1676.420, 13.070, 0.250);
	RemoveBuildingForPlayer(playerid, 4063, 1578.469, -1676.420, 13.070, 0.250);
	RemoveBuildingForPlayer(playerid, 4228, 1568.290, -1677.780, 10.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3976, 1571.599, -1675.750, 35.679, 0.250);
	RemoveBuildingForPlayer(playerid, 4064, 1571.599, -1675.750, 35.679, 0.250);*/
	return 1;
}
//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
hook OnGameModeInit()
{
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	//new tmpobjid;
	//new tmpobjid, object_world = -1, object_int = -1;
	/*tmpobjid = CreateDynamicObject(970, 1556.114013, -1622.727050, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(3976, 1571.599975, -1675.750000, 35.679698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "a51_blastdoor", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 6064, "law_beach1", "musk1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 19162, "newpolicehats", "policehatmap2", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 3, 6064, "law_beach1", "musk1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 6052, "law_doontoon", "sf_window_mod1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 5, 6052, "law_doontoon", "sf_window_mod1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 6, 6064, "law_beach1", "musk1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 12, 6052, "law_doontoon", "sf_window_mod1", 0x00000000);
	tmpobjid = CreateDynamicObject(10832, 1544.909545, -1619.400756, 14.332809, 0.000000, 0.000000, 450.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 16640, "a51", "pavegrey128", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 4, 16640, "a51", "pavegrey128", 0x00000000);
	tmpobjid = CreateDynamicObject(3975, 1578.469970, -1676.420043, 13.070300, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 7, 9514, "711_sfw", "mono1_sfe", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 11, 14581, "ab_mafiasuitea", "walp45S", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1674.119750, 14.845319, 90.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1677.090209, 14.845312, 90.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1677.090209, 16.845317, 90.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(10575, 1555.897338, -1676.229858, 15.865303, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18757, "vcinteriors", "dt_officflr1", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1674.119750, 16.845317, 90.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.629760, 16.845317, 89.999992, 89.999992, -89.999992, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.629760, 14.845298, 89.999992, 89.999992, -89.999992, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.129272, 17.835304, 180.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1677.129272, 17.835304, 180.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1677.130004, 15.205286, 180.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.130126, 15.205286, 180.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.664916, 16.845317, 89.999992, 89.999992, -89.999977, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19940, 1556.052734, -1675.664916, 14.845298, 89.999992, 89.999992, -89.999977, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 18646, "matcolours", "grey", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1542.889892, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1546.560058, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1550.220214, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1553.900512, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1557.471191, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1561.121704, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1564.981567, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1568.692016, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1572.362182, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1576.271972, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1580.402709, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	tmpobjid = CreateDynamicObject(19462, 1584.282470, -1607.484252, 10.652791, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	SetDynamicObjectMaterial(tmpobjid, 0, 1239, "icons6", "lyellow32", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(970, 1551.814331, -1622.727050, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1560.414062, -1622.727050, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1564.734619, -1622.727050, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(1597, 1570.782958, -1634.148315, 15.152806, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1551.814331, -1632.976806, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1547.564208, -1632.976806, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1556.035400, -1632.976806, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	tmpobjid = CreateDynamicObject(970, 1560.275146, -1632.976806, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1564.505493, -1632.976806, 13.032814, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1597, 1571.433593, -1621.776733, 15.152806, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(1622, 1542.880004, -1713.465209, 25.922822, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1622, 1544.018676, -1714.119384, 25.922822, 0.000000, 0.000000, 102.600013, object_world, object_int, -1);
	CreateDynamicObject(1231, 1553.922607, -1622.318847, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1558.352905, -1622.318847, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1562.653564, -1622.318847, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1562.653564, -1633.240112, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1557.843505, -1633.210083, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1546.411499, -1633.210083, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1231, 1551.752807, -1633.210083, 14.326863, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(11547, 1604.017944, -1612.270996, 15.322970, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1622, 1542.880004, -1638.553710, 25.922822, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(1622, 1543.600830, -1637.703125, 25.462825, 0.000000, 0.000000, 270.000000, object_world, object_int, -1);
	CreateDynamicObject(1622, 1539.117797, -1625.702392, 12.382811, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(11245, 1550.950927, -1666.587524, 27.182813, 0.000000, 0.000000, 180.000000, object_world, object_int, -1);
	CreateDynamicObject(11245, 1550.950927, -1684.637573, 27.182813, 0.000000, 0.000000, 180.000000, object_world, object_int, -1);
	CreateDynamicObject(2614, 1554.983398, -1675.627319, 20.984193, 0.000000, 0.000000, 270.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1653.487670, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1657.678100, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1661.868041, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1666.068969, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1670.279052, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1681.159912, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1685.350219, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1689.550659, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1693.751220, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(970, 1539.535156, -1697.921997, 13.082814, 0.000000, 0.000000, 90.000000, object_world, object_int, -1);
	CreateDynamicObject(3505, 1546.127197, -1661.536010, 12.771789, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(3507, 1545.778198, -1657.937866, 11.152815, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(3507, 1545.778198, -1665.298583, 11.382821, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(3505, 1546.127197, -1689.757080, 12.771789, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(3507, 1545.778198, -1685.769775, 11.382821, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(3507, 1545.778198, -1693.290039, 11.382821, 0.000000, 0.000000, 0.000000, object_world, object_int, -1);
	CreateDynamicObject(4032, 1568.290039, -1677.780029, 10.820300, 0.000000, 0.000000, -0.000018, object_world, object_int, -1);
*/

	//int
	//Map Exported with Texture Studio By: [uL]Pottus, Crayder, Svyatoy, encoder, devhub/////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2021-08-02 22:14:01" by "le_nguyen"
		Created by "le_nguyen"
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	new worldlspd = 1, intlspd = 1;
	CreateDynamicObject(14577, 330.226257, 1039.906982, 1946.536010, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19379, 339.169342, 1056.815429, 1939.623046, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19313, 363.952575, 1052.275512, 1942.147094, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19313, 346.211791, 1052.275512, 1942.147094, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19313, 355.111724, 1052.255493, 1949.935424, 360.000000, 270.000000, 360.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19379, 350.129272, 1024.945434, 1939.623046, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2664, 384.968170, 1038.264648, 1942.767578, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19370, 385.091430, 1037.472778, 1942.836547, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1032.575439, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1033.166015, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1033.736083, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1034.336669, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1034.997314, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1035.728027, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1036.358642, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(11729, 361.601531, 1036.358642, 1939.614135, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 373.845703, 1042.180908, 1940.160278, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 373.845703, 1040.340576, 1940.160278, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 373.845703, 1035.540893, 1940.160278, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 373.845703, 1033.830444, 1940.160278, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 359.310760, 1023.176208, 1939.621948, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 359.310760, 1020.466308, 1939.621948, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 357.956573, 1019.727966, 1940.163208, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 357.956573, 1022.178710, 1940.163208, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 351.409515, 1018.068786, 1939.621948, -0.000007, 0.000007, -0.000007, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 354.119415, 1018.068786, 1939.621948, -0.000007, 0.000007, -0.000007, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 354.857757, 1016.714660, 1940.163208, 0.000007, 0.000007, 89.999946, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 352.407012, 1016.714660, 1940.163208, 0.000007, 0.000007, 89.999946, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 354.857757, 1024.435058, 1939.621948, -0.000007, 0.000015, 179.999893, worldlspd, intlspd, -1);
	CreateDynamicObject(2165, 352.147857, 1024.435058, 1939.621948, -0.000007, 0.000015, 179.999893, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 351.409515, 1025.789306, 1940.163208, 0.000015, 0.000007, -90.000045, worldlspd, intlspd, -1);
	CreateDynamicObject(2343, 353.860260, 1025.789306, 1940.163208, 0.000015, 0.000007, -90.000045, worldlspd, intlspd, -1);
	CreateDynamicObject(19379, 350.129272, 1018.345581, 1939.623046, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19325, 357.474334, 1014.836914, 1941.629882, 0.000000, 0.000000, 90.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19325, 350.843933, 1014.836914, 1941.629882, 0.000000, 0.000000, 90.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(19325, 357.474334, 1027.168457, 1941.629882, 0.000007, 0.000000, 89.999977, worldlspd, intlspd, -1);
	CreateDynamicObject(19325, 350.843933, 1027.168457, 1941.629882, 0.000007, 0.000000, 89.999977, worldlspd, intlspd, -1);
	CreateDynamicObject(2390, 364.526000, 1032.041870, 1940.968139, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2390, 363.686096, 1032.041870, 1940.968139, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1649, 364.735076, 1034.043457, 1941.270019, 0.000000, 0.000000, 90.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1649, 364.735076, 1034.043457, 1944.599731, 0.000000, 0.000000, 90.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1649, 364.735076, 1034.043457, 1944.599731, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1649, 364.735076, 1034.043457, 1941.270019, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2627, 370.185607, 1032.940917, 1939.619262, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2627, 368.925659, 1032.940917, 1939.619262, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2627, 367.565521, 1032.940917, 1939.619262, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2630, 368.340820, 1036.221557, 1939.621215, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(14791, 364.553894, 1042.171508, 1940.937255, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2611, 380.696166, 1039.817626, 1942.584350, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(14455, 373.148345, 1044.720703, 1941.317138, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2615, 379.548980, 1032.920043, 1941.887939, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2615, 379.548980, 1033.270385, 1943.219238, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 378.969940, 1028.815063, 1940.173095, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 378.969940, 1024.305175, 1940.173095, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(2748, 378.969940, 1020.035339, 1940.173095, 0.000000, 0.000000, 270.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(630, 378.988739, 1031.790161, 1940.684814, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(630, 378.988739, 1033.370361, 1940.684814, 0.000000, 0.000000, 0.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1742, 368.747528, 1019.073486, 1939.620117, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);
	CreateDynamicObject(1742, 370.417510, 1019.073486, 1939.620117, 0.000000, 0.000000, 180.000000, worldlspd, intlspd, -1);

	return 1;
}
