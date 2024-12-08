#include <a_samp>
#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{

	// map
	new tmpobjid, object_world = -1, object_int = -1;
	tmpobjid = CreateDynamicObject(19376, 1822.190795, 1802.257812, 4620.470703, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1832.691894, 1802.257812, 4620.470703, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1832.248168, 1807.159179, 4620.384765, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1836.725341, 1802.399047, 4620.384765, 0.000000, 180.000000, 360.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1822.598754, 1797.570800, 4620.384765, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1832.219238, 1797.570800, 4620.384765, 0.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1817.713989, 1812.028076, 4620.384765, 0.000000, 179.999984, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1817.713989, 1802.397827, 4620.384765, 0.000000, 179.999984, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1822.190795, 1802.257812, 4624.677734, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1827.508666, 1811.887939, 4620.384765, 0.000000, 180.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1822.598754, 1815.179809, 4622.632324, 180.000000, 180.000000, 90.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 18028, "cj_bar2", "CJ_nastybar_D4", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1822.190795, 1811.887573, 4620.470703, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 14534, "ab_wooziea", "ab_tileDiamond", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1832.691894, 1802.257812, 4624.677734, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1822.190795, 1811.887573, 4624.677734, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 19071, "wssections", "wood1", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1827.508666, 1812.887939, 4620.384765, 0.000000, 180.000000, 45.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1818.713989, 1814.028076, 4620.384765, 0.000000, 179.999984, 135.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1819.774047, 1797.422363, 4620.384765, 0.000000, 180.000000, 225.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 1835.283691, 1797.833007, 4620.384765, 0.000000, 180.000000, 315.000000, object_world, object_int, -1); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2589, "ab_ab", "ab_sheetSteel", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19406, 1832.962158, 1805.489868, 4622.101074, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19406, 1832.962158, 1802.280029, 4622.101074, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19406, 1832.783935, 1802.280151, 4622.101074, 0.000000, 0.000015, 179.999938, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19406, 1832.783935, 1805.489990, 4622.101074, 0.000000, 0.000015, 179.999938, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.788085, 1805.486694, 4629.100585, 0.000000, 0.000000, 540.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.961425, 1805.486694, 4629.100585, 0.000000, 0.000000, 720.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1368, 1833.474365, 1802.302246, 4621.243164, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19836, 1823.608886, 1799.631591, 4620.605468, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1567, 1834.782958, 1807.015747, 4620.556640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.788085, 1794.394653, 4624.920410, 0.000000, -0.000022, 179.999862, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.961425, 1794.394653, 4624.920410, -0.000000, 0.000022, -0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1499, 1832.964355, 1799.175537, 4620.556640, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1516, 1831.164428, 1804.908569, 4620.713378, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.783203, 1800.825805, 4628.316406, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1670, 1831.115600, 1804.853637, 4621.270996, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19376, 1832.963378, 1800.825805, 4628.316406, 0.000000, -0.000007, 179.999954, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19474, 1821.197631, 1803.713256, 4621.107421, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1723, 1830.219726, 1806.553955, 4620.556640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1977, 1829.255859, 1806.557495, 4620.556640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18885, 1828.026367, 1806.648925, 4621.617675, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19280, 1818.937377, 1813.951416, 4624.349609, 0.000000, 0.000000, -145.399993, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2010, 1833.457763, 1804.143920, 4620.546875, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1833.043701, 1802.591186, 4623.275390, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1833.043701, 1798.599975, 4623.275390, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1833.043701, 1800.599853, 4623.275390, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1550, 1832.393554, 1805.661132, 4620.904785, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1833.043701, 1804.590332, 4623.275390, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1833.043701, 1806.589843, 4623.275390, 0.000000, 90.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1661, 1823.081909, 1811.253662, 4624.431152, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1832.703369, 1802.591186, 4623.275390, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1832.703369, 1798.599975, 4623.275390, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1832.703369, 1800.599853, 4623.275390, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1832.703369, 1804.590332, 4623.275390, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19940, 1832.703369, 1806.589843, 4623.275390, 0.000000, 90.000007, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(355, 1831.091308, 1804.493774, 4621.280273, 90.000000, -61.099941, 810.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1661, 1823.081909, 1805.881469, 4624.431152, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(11686, 1820.268310, 1811.768676, 4620.556640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1583, 1832.074096, 1797.603027, 4620.556640, 0.000000, 0.000000, 540.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1744, 1818.309082, 1813.742553, 4621.528320, 0.000000, 0.000000, 45.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1744, 1818.309082, 1813.742553, 4622.105957, 0.000000, 0.000000, 45.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19820, 1819.010620, 1814.054565, 4622.427246, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19820, 1819.190795, 1814.054565, 4622.427246, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19820, 1819.190795, 1814.284790, 4622.427246, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19821, 1818.625244, 1813.627075, 4622.446289, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2785, 1818.299072, 1807.336791, 4621.293945, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19821, 1818.625244, 1813.416870, 4622.446289, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1512, 1818.565063, 1813.572753, 4622.062011, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1512, 1818.875366, 1813.652832, 4622.062011, 0.000000, 0.000000, 45.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1512, 1818.854125, 1813.886474, 4622.062011, 0.000000, 0.000000, 45.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1669, 1819.081054, 1814.131103, 4622.025390, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1669, 1819.191162, 1814.231201, 4622.025390, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1669, 1819.351318, 1814.231201, 4622.025390, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1895, 1817.904541, 1804.069946, 4622.722167, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19824, 1819.002929, 1813.996582, 4621.866210, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19824, 1818.362304, 1813.406005, 4621.866210, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1661, 1823.081909, 1802.000610, 4624.431152, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19474, 1825.707763, 1803.713256, 4621.107421, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19474, 1823.207763, 1808.685180, 4621.107421, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1661, 1828.613403, 1802.000610, 4624.431152, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1716, 1819.618774, 1810.736083, 4620.546875, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1716, 1820.699096, 1810.736083, 4620.546875, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2167, 1825.861206, 1814.327026, 4620.556640, 0.000000, 0.000000, 315.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2167, 1826.738403, 1813.449829, 4620.556640, 0.000000, 0.000000, 315.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18661, 1831.175537, 1806.992797, 4621.656738, 0.000000, 0.000000, 90.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18661, 1827.412719, 1809.413208, 4621.656738, 0.000000, 0.000000, 360.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18660, 1817.833007, 1810.725952, 4623.334960, 0.000000, 0.000000, 178.899948, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18663, 1829.987060, 1797.662231, 4622.989257, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18663, 1826.519531, 1797.813964, 4621.709960, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18665, 1825.002075, 1797.693115, 4622.793457, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18665, 1826.672485, 1797.693115, 4622.793457, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(18665, 1831.683471, 1797.693115, 4623.519042, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2002, 1834.614257, 1798.111694, 4620.541015, 0.000000, 0.000000, 180.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19328, 1832.633178, 1803.875488, 4621.760253, 0.000000, 0.000000, 270.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(1584, 1818.792846, 1798.587768, 4620.542968, 0.000000, 0.000000, -49.900062, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2670, 1823.721801, 1806.424926, 4620.644531, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2670, 1820.880249, 1808.715332, 4620.644531, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2671, 1823.157226, 1801.972900, 4620.599121, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2672, 1823.647705, 1805.194458, 4620.909667, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2672, 1827.438354, 1803.773925, 4620.909667, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2672, 1827.438354, 1803.773925, 4620.909667, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2674, 1824.781616, 1798.299804, 4620.579589, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2674, 1820.080810, 1800.410156, 4620.579589, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2674, 1820.080810, 1806.441650, 4620.579589, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2676, 1826.665527, 1800.785156, 4620.675781, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2676, 1825.786499, 1803.915039, 4620.675781, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(19325, 1832.859008, 1804.601806, 4621.231445, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 
	tmpobjid = CreateDynamicObject(2842, 1835.013183, 1805.945068, 4620.556640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1); 


	return 1;
}
