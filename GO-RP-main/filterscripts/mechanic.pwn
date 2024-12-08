#include <a_samp>
#include <streamer>
public OnFilterScriptExit()
{
    for(new i; i < MAX_PLAYERS; i++)
    {
        if(GetPlayerVirtualWorld(i) != 0 || GetPlayerInterior(i) != 0) TogglePlayerControllable(i, false);
    }
}
public OnFilterScriptInit()
{
//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
new g_Object[208];
	g_Object[0] = CreateObject(1502, 1854.5688, -1800.2475, 12.5277, 0.0000, 0.0000, -90.5000); //Gen_doorINT04
	g_Object[1] = CreateObject(19538, 1891.0863, -1788.9709, 12.5426, 0.0000, 0.0000, 0.0000); //Plane62_5x125Conc1
	SetObjectMaterial(g_Object[1], 0, 16640, "a51", "plaintarmac1", 0xFFFFFFFF);
	g_Object[2] = CreateObject(9301, 1879.6163, -1811.8918, 16.7735, 0.0000, 0.0000, 180.0000); //tempobj_SFN04
	g_Object[3] = CreateObject(9301, 1838.4361, -1783.3122, 16.7735, 0.0000, 0.0000, -90.0000); //tempobj_SFN04
	g_Object[4] = CreateObject(19379, 1858.8105, -1767.9061, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[5] = CreateObject(11313, 1850.0625, -1763.6572, 16.4783, 0.0000, -85.4999, -90.0000); //modshopdoor_SFSe
	g_Object[6] = CreateObject(19454, 1854.5500, -1798.5144, 13.2818, 90.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[6], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[7] = CreateObject(19454, 1855.6120, -1763.1250, 18.2518, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(g_Object[7], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[8] = CreateObject(19377, 1844.4781, -1767.9974, 12.8486, 0.0000, 0.0000, 0.0000); //wall025
	SetObjectMaterial(g_Object[8], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[9] = CreateObject(19377, 1844.4781, -1777.6195, 12.8486, 0.0000, 0.0000, 0.0000); //wall025
	SetObjectMaterial(g_Object[9], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[10] = CreateObject(19377, 1844.4781, -1787.2496, 12.8486, 0.0000, 0.0000, 0.0000); //wall025
	SetObjectMaterial(g_Object[10], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[11] = CreateObject(19377, 1841.7386, -1763.1693, 12.8486, 0.0000, 0.0000, 90.0000); //wall025
	SetObjectMaterial(g_Object[11], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[12] = CreateObject(19377, 1844.4781, -1796.8701, 12.8486, 0.0000, 0.0000, 0.0000); //wall025
	SetObjectMaterial(g_Object[12], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[13] = CreateObject(11313, 1856.9536, -1763.6572, 16.4783, 0.0000, -85.4999, -90.0000); //modshopdoor_SFSe
	g_Object[14] = CreateObject(19454, 1862.1606, -1763.1760, 13.2818, 90.0000, 90.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[14], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[15] = CreateObject(11313, 1862.6584, -1776.9719, 16.4074, 0.0000, -87.6998, 180.0000); //modshopdoor_SFSe
	g_Object[16] = CreateObject(19379, 1848.3100, -1767.9061, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[17] = CreateObject(19377, 1864.0177, -1792.1191, 12.8486, 0.0000, 0.0000, 0.0000); //wall025
	SetObjectMaterial(g_Object[17], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[18] = CreateObject(19377, 1859.2849, -1796.8586, 12.8486, 0.0000, 0.0000, 90.0000); //wall025
	SetObjectMaterial(g_Object[18], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[19] = CreateObject(19377, 1849.2137, -1805.0616, 8.1288, 0.0000, 0.0000, 90.0000); //wall025
	SetObjectMaterial(g_Object[19], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[20] = CreateObject(19454, 1844.4792, -1803.3962, 13.2818, 90.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[20], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[21] = CreateObject(3857, 1848.3126, -1805.0521, 15.2214, 0.0000, 0.0000, 45.0000); //ottosmash3
	g_Object[22] = CreateObject(3583, 1840.3504, -1812.0367, 15.4660, 0.0000, 0.0000, 0.0000); //compbigho3_LAe
	g_Object[23] = CreateObject(3857, 1848.3110, -1805.0378, 15.1871, 0.0000, 0.0000, 45.0000); //ottosmash3
	g_Object[24] = CreateObject(3857, 1848.3110, -1805.0378, 15.1871, 0.0000, 0.0000, 45.0000); //ottosmash3
	g_Object[25] = CreateObject(19454, 1852.7696, -1805.0666, 13.2818, 90.0000, 90.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[25], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[26] = CreateObject(1502, 1854.5876, -1803.2878, 12.5277, 0.0000, 0.0000, 90.0000); //Gen_doorINT04
	g_Object[27] = CreateObject(19454, 1864.0023, -1764.8541, 13.2818, 90.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[27], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[28] = CreateObject(19454, 1854.5500, -1805.0343, 13.2818, 90.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[28], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[29] = CreateObject(19454, 1854.5600, -1801.7629, 16.7917, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[29], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[30] = CreateObject(19378, 1848.3518, -1777.4990, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[30], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[31] = CreateObject(19379, 1848.3100, -1777.5345, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[32] = CreateObject(19378, 1848.3430, -1767.8686, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[32], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[33] = CreateObject(19378, 1848.3304, -1787.1274, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[33], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[34] = CreateObject(19378, 1858.8387, -1787.1274, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[34], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[35] = CreateObject(19378, 1858.8387, -1777.4975, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[35], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[36] = CreateObject(19378, 1858.8387, -1767.8663, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[36], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[37] = CreateObject(19454, 1864.0023, -1771.4044, 18.2518, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[37], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[38] = CreateObject(19454, 1864.0023, -1781.0244, 18.2518, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[38], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[39] = CreateObject(19454, 1864.0023, -1790.6335, 18.2518, 0.0000, 0.0000, 0.0000); //wall094
	SetObjectMaterial(g_Object[39], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[40] = CreateObject(19378, 1858.8387, -1796.7561, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[40], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[41] = CreateObject(19378, 1848.3486, -1796.7561, 18.1653, 0.0000, 90.0000, 0.0000); //wall026
	SetObjectMaterial(g_Object[41], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[42] = CreateObject(19458, 1849.6556, -1803.3221, 18.1947, 0.0000, 90.0000, 90.0000); //wall098
	SetObjectMaterial(g_Object[42], 0, 18049, "ammu_twofloor", "mp_gun_stairs", 0xFFFFFFFF);
	g_Object[43] = CreateObject(19454, 1845.9814, -1763.1250, 18.2518, 0.0000, 0.0000, 90.0000); //wall094
	SetObjectMaterial(g_Object[43], 0, 9920, "anotherbuildsfe", "gz_vic2c", 0xFFFFFFFF);
	g_Object[44] = CreateObject(11313, 1862.6584, -1770.0808, 16.4074, 0.0000, -87.6998, 180.0000); //modshopdoor_SFSe
	g_Object[45] = CreateObject(11313, 1862.6584, -1783.8834, 16.4074, 0.0000, -87.6998, 180.0000); //modshopdoor_SFSe
	g_Object[46] = CreateObject(19379, 1848.3100, -1787.1567, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[47] = CreateObject(19379, 1848.3100, -1796.7768, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[48] = CreateObject(19379, 1858.8105, -1777.5284, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[49] = CreateObject(19379, 1858.8105, -1787.1518, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[50] = CreateObject(19379, 1858.8105, -1796.7838, 12.4617, 0.0000, 90.0000, 0.0000); //wall027
	g_Object[51] = CreateObject(2960, 1858.1611, -1794.4713, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[52] = CreateObject(1893, 1850.3839, -1777.8719, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[53] = CreateObject(2960, 1858.1611, -1789.8514, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[54] = CreateObject(2960, 1858.1611, -1785.2414, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[55] = CreateObject(2960, 1858.1611, -1780.6308, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[56] = CreateObject(2960, 1858.1611, -1776.0195, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[57] = CreateObject(2960, 1858.1611, -1771.3999, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[58] = CreateObject(2960, 1858.1611, -1765.5080, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[59] = CreateObject(2960, 1850.3900, -1765.5581, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[60] = CreateObject(2960, 1850.3900, -1770.1474, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[61] = CreateObject(2960, 1850.3900, -1774.7486, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[62] = CreateObject(2960, 1850.3900, -1779.3592, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[63] = CreateObject(2960, 1850.3900, -1783.9702, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[64] = CreateObject(2960, 1850.3900, -1788.5803, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[65] = CreateObject(2960, 1850.3900, -1793.1910, 17.9941, 0.0000, 0.0000, 90.0000); //kmb_beam
	g_Object[66] = CreateObject(1893, 1850.3839, -1772.3100, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[67] = CreateObject(1893, 1850.3839, -1767.1009, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[68] = CreateObject(1893, 1850.3839, -1782.8514, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[69] = CreateObject(1893, 1850.3839, -1788.5323, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[70] = CreateObject(1893, 1850.3839, -1794.1650, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[71] = CreateObject(1893, 1858.1628, -1794.1650, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[72] = CreateObject(1893, 1858.1628, -1788.4333, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[73] = CreateObject(1893, 1858.1628, -1782.7927, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[74] = CreateObject(1893, 1858.1628, -1777.4018, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[75] = CreateObject(1893, 1858.1628, -1770.6528, 17.7889, 0.0000, 0.0000, 90.0000); //shoplight1
	g_Object[76] = CreateObject(19817, 1859.1313, -1793.9304, 10.6450, 0.0000, 0.0000, 0.0000); //CarFixerRamp1
	g_Object[77] = CreateObject(19817, 1851.6700, -1789.9903, 10.6450, 0.0000, 0.0000, 90.0000); //CarFixerRamp1
	g_Object[78] = CreateObject(19817, 1851.6700, -1782.6495, 10.6450, 0.0000, 0.0000, 90.0000); //CarFixerRamp1
	g_Object[79] = CreateObject(19817, 1851.6700, -1775.4188, 10.6450, 0.0000, 0.0000, 90.0000); //CarFixerRamp1
	g_Object[80] = CreateObject(19817, 1851.6700, -1768.0687, 10.6450, 0.0000, 0.0000, 90.0000); //CarFixerRamp1
	g_Object[81] = CreateObject(19899, 1863.4245, -1789.4587, 12.5707, 0.0000, 0.0000, 180.0000); //ToolCabinet1
	g_Object[82] = CreateObject(19899, 1863.4245, -1794.1894, 12.5707, 0.0000, 0.0000, 180.0000); //ToolCabinet1
	g_Object[83] = CreateObject(19899, 1845.0445, -1793.5196, 12.5707, 0.0000, 0.0000, 0.0000); //ToolCabinet1
	g_Object[84] = CreateObject(19899, 1845.0445, -1786.1893, 12.5707, 0.0000, 0.0000, 0.0000); //ToolCabinet1
	g_Object[85] = CreateObject(19899, 1845.0445, -1777.9571, 12.5707, 0.0000, 0.0000, 0.0000); //ToolCabinet1
	g_Object[86] = CreateObject(19899, 1845.0445, -1771.6274, 12.5707, 0.0000, 0.0000, 0.0000); //ToolCabinet1
	g_Object[87] = CreateObject(1080, 1844.6815, -1781.9836, 15.7551, 0.0000, 0.0000, 0.0000); //wheel_sr5
	g_Object[88] = CreateObject(19815, 1844.5683, -1790.0351, 15.0256, 0.0000, 0.0000, 90.0000); //ToolBoard1
	g_Object[89] = CreateObject(19815, 1844.5683, -1775.2352, 15.0256, 0.0000, 0.0000, 90.0000); //ToolBoard1
	g_Object[90] = CreateObject(19815, 1844.5683, -1767.4062, 15.0256, 0.0000, 0.0000, 90.0000); //ToolBoard1
	g_Object[91] = CreateObject(11280, 1862.1761, -1784.1839, 12.5465, 0.0000, 0.0000, 165.6997); //crackhseskid
	g_Object[92] = CreateObject(19898, 1861.4680, -1787.9017, 12.5593, 0.0000, 0.0000, 0.0000); //OilFloorStain1
	g_Object[93] = CreateObject(19898, 1851.0311, -1789.8984, 12.5593, 0.0000, 0.0000, -164.3999); //OilFloorStain1
	g_Object[94] = CreateObject(19898, 1859.8288, -1782.2021, 12.5593, 0.0000, 0.0000, -83.9999); //OilFloorStain1
	g_Object[95] = CreateObject(19898, 1850.5926, -1773.2286, 12.5593, 0.0000, 0.0000, -83.9999); //OilFloorStain1
	g_Object[96] = CreateObject(14826, 1859.6947, -1799.1037, 13.1176, 0.0000, 0.0000, -178.6997); //int_kbsgarage2
	g_Object[97] = CreateObject(19903, 1862.8768, -1791.8094, 12.5129, 0.0000, 0.0000, -178.7998); //MechanicComputer1
	g_Object[98] = CreateObject(19903, 1848.1933, -1792.4305, 12.5129, 0.0000, 0.0000, 39.4000); //MechanicComputer1
	g_Object[99] = CreateObject(19903, 1848.2181, -1785.4603, 12.5129, 0.0000, 0.0000, -0.3998); //MechanicComputer1
	g_Object[100] = CreateObject(19903, 1847.7218, -1771.5832, 12.5129, 0.0000, 0.0000, 16.2999); //MechanicComputer1
	g_Object[101] = CreateObject(19900, 1845.3437, -1780.8891, 12.5236, 0.0000, 0.0000, 160.2998); //ToolCabinet2
	g_Object[102] = CreateObject(19900, 1847.9339, -1777.7279, 12.5236, 0.0000, 0.0000, 180.0000); //ToolCabinet2
	g_Object[103] = CreateObject(19900, 1847.9339, -1777.7279, 13.3837, 0.0000, 0.0000, 180.0000); //ToolCabinet2
	g_Object[104] = CreateObject(1897, 1859.1794, -1796.8935, 12.5298, -57.7000, 0.0000, 0.0000); //wheel_support
	g_Object[105] = CreateObject(1897, 1856.9697, -1796.8935, 12.5298, -57.7000, 0.0000, 0.0000); //wheel_support
	g_Object[106] = CreateObject(1897, 1858.0688, -1796.0437, 13.0698, 0.0000, 90.0000, 0.0000); //wheel_support
	g_Object[107] = CreateObject(1025, 1858.9593, -1796.2823, 13.4489, 0.0000, 0.0000, 0.0000); //wheel_or1
	g_Object[108] = CreateObject(1080, 1857.1335, -1796.2767, 13.4603, 0.0000, 0.0000, 180.0000); //wheel_sr5
	g_Object[109] = CreateObject(1080, 1858.4836, -1796.2767, 13.4603, 0.0000, 0.0000, 180.0000); //wheel_sr5
	g_Object[110] = CreateObject(1085, 1857.8072, -1796.3203, 13.0607, 0.0000, 0.0000, 90.6998); //wheel_gn2
	g_Object[111] = CreateObject(1079, 1844.7092, -1783.0141, 15.4132, 0.0000, 0.0000, 0.0000); //wheel_sr1
	g_Object[112] = CreateObject(1096, 1844.7032, -1780.9271, 15.4064, 0.0000, 0.0000, 0.0000); //wheel_gn3
	g_Object[113] = CreateObject(1081, 1844.6866, -1783.8927, 14.7458, 0.0000, 0.0000, 0.0000); //wheel_sr4
	g_Object[114] = CreateObject(1074, 1844.6915, -1779.9554, 14.7749, 0.0000, 0.0000, 0.0000); //wheel_sr3
	g_Object[115] = CreateObject(1327, 1845.4903, -1764.4365, 12.5267, 0.0000, 90.0000, 0.0000); //junk_tyre
	g_Object[116] = CreateObject(1327, 1862.6308, -1764.4365, 12.5267, 0.0000, 90.0000, 0.0000); //junk_tyre
	g_Object[117] = CreateObject(1327, 1862.6308, -1764.4365, 13.1865, 0.0000, 90.0000, 23.0000); //junk_tyre
	g_Object[118] = CreateObject(1327, 1862.6308, -1764.4365, 13.8465, 0.0000, 90.0000, 34.0000); //junk_tyre
	g_Object[119] = CreateObject(2062, 1845.0991, -1788.1092, 13.1295, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
	g_Object[120] = CreateObject(2062, 1845.0991, -1774.2573, 13.1295, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
	g_Object[121] = CreateObject(2062, 1861.8885, -1795.9283, 13.1295, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
	g_Object[122] = CreateObject(2062, 1860.9979, -1795.9283, 13.1295, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
	g_Object[123] = CreateObject(2062, 1861.2679, -1794.8874, 13.1295, 0.0000, 0.0000, 0.0000); //CJ_OilDrum2
	g_Object[124] = CreateObject(1723, 1845.2485, -1799.9350, 12.5247, 0.0000, 0.0000, 90.0000); //mrk_seating1
	g_Object[125] = CreateObject(1723, 1845.2485, -1804.1744, 12.5247, 0.0000, 0.0000, 90.0000); //mrk_seating1
	g_Object[126] = CreateObject(1723, 1850.2595, -1804.1744, 12.5247, 0.0000, 0.0000, 180.0000); //mrk_seating1
	g_Object[127] = CreateObject(2714, 1844.6081, -1775.4527, 16.1800, 0.0000, 0.0000, 90.0000); //CJ_OPEN_SIGN_2
	g_Object[128] = CreateObject(2714, 1844.6081, -1767.9217, 16.1800, 0.0000, 0.0000, 90.0000); //CJ_OPEN_SIGN_2
	g_Object[129] = CreateObject(2714, 1844.6081, -1790.0428, 16.1800, 0.0000, 0.0000, 90.0000); //CJ_OPEN_SIGN_2
	g_Object[130] = CreateObject(2714, 1859.3072, -1796.7099, 16.0340, 0.0000, 0.0000, -180.0000); //CJ_OPEN_SIGN_2
	g_Object[131] = CreateObject(19172, 1844.5625, -1802.6081, 16.3577, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	g_Object[132] = CreateObject(19172, 1844.5625, -1798.9470, 15.2978, 0.0000, 0.0000, 90.0000); //SAMPPicture1
	SetObjectMaterial(g_Object[132], 0, 2266, "picture_frame", "CJ_PAINTING11", 0xFFFFFFFF);
	g_Object[133] = CreateObject(1649, 1854.4571, -1801.7406, 16.7418, 0.0000, 0.0000, -90.0000); //wglasssmash
	g_Object[134] = CreateObject(2229, 1854.6042, -1799.3962, 15.4337, 0.0000, 0.0000, -90.0000); //SWANK_SPEAKER
	g_Object[135] = CreateObject(2229, 1854.6042, -1804.8166, 15.4337, 0.0000, 0.0000, -90.0000); //SWANK_SPEAKER
	g_Object[136] = CreateObject(2942, 1854.1263, -1797.6506, 13.0415, 0.0000, 0.0000, -90.0000); //kmb_atm1
	g_Object[137] = CreateObject(2942, 1854.1263, -1798.9604, 13.0415, 0.0000, 0.0000, -90.0000); //kmb_atm1
	g_Object[138] = CreateObject(11280, 1856.2213, -1771.6241, 12.5465, 0.0000, 0.0000, 71.6996); //crackhseskid
	g_Object[139] = CreateObject(19898, 1857.8391, -1767.7513, 12.5593, 0.0000, 0.0000, -83.9999); //OilFloorStain1
	g_Object[140] = CreateObject(19313, 1900.9455, -1769.5383, 10.4766, 180.0000, 0.0000, 90.0000); //a51fensin
	g_Object[141] = CreateObject(19454, 1895.1838, -1805.1197, 12.6162, 0.0000, 90.0000, 90.0000); //wall094
	g_Object[142] = CreateObject(19454, 1885.5334, -1805.1197, 12.6162, 0.0000, 90.0000, 90.0000); //wall094
	g_Object[143] = CreateObject(19454, 1875.9221, -1805.1197, 12.6162, 0.0000, 90.0000, 90.0000); //wall094
	g_Object[144] = CreateObject(19454, 1866.3315, -1805.1197, 12.6162, 0.0000, 90.0000, 90.0000); //wall094
	g_Object[145] = CreateObject(19313, 1900.9455, -1783.5277, 10.4766, 180.0000, 0.0000, 90.0000); //a51fensin
	g_Object[146] = CreateObject(19313, 1900.9455, -1804.5190, 10.4766, 180.0000, 0.0000, 90.0000); //a51fensin
	g_Object[147] = CreateObject(19313, 1882.6833, -1762.5683, 10.4766, 180.0000, 0.0000, 180.0000); //a51fensin
	g_Object[148] = CreateObject(1597, 1882.5583, -1764.0727, 15.1266, 0.0000, 0.0000, 90.0000); //cntrlrsac1
	g_Object[149] = CreateObject(19313, 1840.4737, -1762.5683, 10.4766, 180.0000, 0.0000, 180.0000); //a51fensin
	g_Object[150] = CreateObject(19313, 1854.5318, -1762.5683, 10.4766, 180.0000, 0.0000, 180.0000); //a51fensin
	g_Object[151] = CreateObject(19866, 1835.4261, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[152] = CreateObject(19866, 1841.5250, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[153] = CreateObject(19866, 1847.5566, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[154] = CreateObject(19866, 1853.7169, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[155] = CreateObject(19866, 1859.7374, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[156] = CreateObject(19866, 1910.9676, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[157] = CreateObject(19866, 1903.9769, -1820.0666, 12.5436, 0.0000, 0.0000, 90.0000); //MIFenceBlocks1
	g_Object[158] = CreateObject(1597, 1879.5378, -1801.6695, 15.1266, 0.0000, 0.0000, 90.0000); //cntrlrsac1
	g_Object[159] = CreateObject(19425, 1899.0660, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[160] = CreateObject(19425, 1895.5167, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[161] = CreateObject(19425, 1891.9066, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[162] = CreateObject(19425, 1873.5561, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[163] = CreateObject(19425, 1869.8360, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[164] = CreateObject(19425, 1866.0959, -1762.5732, 12.5208, 0.0000, 0.0000, 0.0000); //speed_bump01
	g_Object[165] = CreateObject(19425, 1900.7967, -1792.3337, 12.5298, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[166] = CreateObject(19425, 1900.7967, -1795.6943, 12.5298, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[167] = CreateObject(8292, 1863.9531, -1775.9663, 19.6240, 0.0000, 0.0000, -34.7999); //vgsbboardsigns01
	g_Object[168] = CreateObject(7910, 1853.3321, -1763.3293, 20.0361, 0.0000, 0.0000, 180.0000); //vgwestbillbrd11
	g_Object[169] = CreateObject(19450, 1899.9123, -1776.3110, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[169], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[170] = CreateObject(19450, 1879.6278, -1797.5710, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[170], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[171] = CreateObject(19450, 1898.4724, -1774.1186, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[171], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[172] = CreateObject(19450, 1882.7983, -1777.9902, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[172], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[173] = CreateObject(19450, 1874.6267, -1797.5710, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[173], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[174] = CreateObject(19450, 1884.6273, -1797.5710, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[174], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[175] = CreateObject(19450, 1899.9123, -1785.4775, 10.8463, 0.0000, 0.0000, 0.0000); //wall090
	SetObjectMaterial(g_Object[175], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[176] = CreateObject(19450, 1898.4724, -1778.5185, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[176], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[177] = CreateObject(19450, 1898.4724, -1782.7585, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[177], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[178] = CreateObject(19450, 1898.4724, -1786.3281, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[178], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[179] = CreateObject(19450, 1898.4724, -1790.1993, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[179], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[180] = CreateObject(19450, 1882.8133, -1782.7390, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[180], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[181] = CreateObject(19450, 1882.8133, -1777.9687, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[181], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[182] = CreateObject(19450, 1882.8133, -1773.2375, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[182], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[183] = CreateObject(19450, 1898.5030, -1771.5257, 10.8463, 0.0000, 0.0000, 90.0000); //wall090
	SetObjectMaterial(g_Object[183], 0, 9525, "boigas_sfw", "GEwhite1_64", 0xFFFFFFFF);
	g_Object[184] = CreateObject(1597, 1902.2779, -1775.5924, 15.1266, 0.0000, 0.0000, 0.0000); //cntrlrsac1
	g_Object[185] = CreateObject(1597, 1902.2779, -1785.8719, 15.1266, 0.0000, 0.0000, 0.0000); //cntrlrsac1
	g_Object[186] = CreateObject(3853, 1883.8458, -1800.3348, 16.3418, 0.0000, 0.0000, -90.0000); //Gay_lamppost
	g_Object[187] = CreateObject(3853, 1874.8846, -1800.3348, 16.3418, 0.0000, 0.0000, -90.0000); //Gay_lamppost
	g_Object[188] = CreateObject(3853, 1878.3243, -1765.1462, 16.3418, 0.0000, 0.0000, 90.0000); //Gay_lamppost
	g_Object[189] = CreateObject(3853, 1887.2054, -1765.1462, 16.3418, 0.0000, 0.0000, 90.0000); //Gay_lamppost
	g_Object[190] = CreateObject(3853, 1901.5058, -1771.4134, 16.3418, 0.0000, 0.0000, 0.0000); //Gay_lamppost
	g_Object[191] = CreateObject(3853, 1901.5058, -1790.4254, 16.3418, 0.0000, 0.0000, 0.0000); //Gay_lamppost
	g_Object[192] = CreateObject(3853, 1901.5058, -1780.7745, 16.3418, 0.0000, 0.0000, 0.0000); //Gay_lamppost
	g_Object[193] = CreateObject(13562, 1898.7452, -1807.4056, 22.0375, 0.0000, 0.0000, 0.0000); //bigsprunkpole
	g_Object[194] = CreateObject(12846, 1838.6142, -1764.8480, 20.6147, 0.0000, 0.0000, 45.4000); //otb_sign
	g_Object[195] = CreateObject(3335, 1899.2141, -1802.5739, 12.4372, 0.0000, 0.0000, 180.0000); //CE_roadsign1
	SetObjectMaterial(g_Object[195], 2, 7088, "casinoshops1", "247sign1", 0xFFFFFFFF);
	g_Object[196] = CreateObject(8613, 1849.3934, -1809.2274, 14.8509, 0.0000, 0.0000, 0.0000); //vgsSstairs03_lvs
	g_Object[197] = CreateObject(19313, 2071.5556, -1830.5687, 14.0266, 180.0000, 0.0000, 90.0000); //a51fensin
	g_Object[198] = CreateObject(19313, 1024.9632, -1029.3087, 33.0693, 0.0000, 0.0000, 0.0000); //a51fensin
	g_Object[199] = CreateObject(19313, 487.9919, -1735.3270, 12.9648, 0.0000, 0.0000, -7.7999); //a51fensin
	g_Object[200] = CreateObject(19313, -1933.3287, 238.9564, 35.4708, 0.0000, 0.0000, 0.0000); //a51fensin
	g_Object[201] = CreateObject(19313, -1901.4743, 277.8909, 43.1282, 0.0000, 0.0000, 0.0000); //a51fensin
	g_Object[202] = CreateObject(19313, -2716.0620, 217.8793, 5.2637, 0.0000, 0.0000, 90.0000); //a51fensin
	g_Object[203] = CreateObject(19313, -1423.1000, 2591.0734, 57.2631, 0.0000, 0.0000, 0.0000); //a51fensin
	g_Object[204] = CreateObject(19313, 1968.6322, 2162.0576, 12.1142, 0.0000, 0.0000, 90.0000); //a51fensin
	g_Object[205] = CreateObject(19313, 720.0585, -462.4800, 12.9789, 0.0000, -90.0000, 0.0000); //a51fensin
	g_Object[206] = CreateObject(19313, 2647.9006, -2039.0883, 13.2257, 0.0000, 0.0000, 0.0000); //a51fensin
	g_Object[207] = CreateObject(19313, 1045.1016, -1026.0041, 32.5489, 0.0000, 0.0000, 0.0000); //a51fensin
return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

//Remove Buildings///////////////////////////////////////////////////////////////////////////////////////////////
RemoveBuildingForPlayer(playerid, 5536, 1866.3281, -1789.7813, 20.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 1308, 1867.7188, -1798.2031, 12.7031, 0.25);
    RemoveBuildingForPlayer(playerid, 5397, 1866.3281, -1789.7813, 20.9453, 0.25);
return 1;
}
