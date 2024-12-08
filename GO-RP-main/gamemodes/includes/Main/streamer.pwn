// new TromVehicles[3];
new Xe_Tap_Lai[5];

forward LoadStreamerStaticVehicles();
public LoadStreamerStaticVehicles()
{
    Xe_Tap_Lai[0] = AddStaticVehicleEx(400,-2120.6001,-416.0120,35.4284,87.0614,-1,-1,1);
    Xe_Tap_Lai[1] = AddStaticVehicleEx(400,-2120.6001,-416.0120-5,35.4284,87.0614,-1,-1,1);

	/*TromVehicles[0] = CreateVehicle(499,2612.838,-1393.897,34.880,90.0000,-1,-1,-1);
    TromVehicles[1] = CreateVehicle(499,2613.073,-1399.745,34.881,90.0000,-1,-1,-1);
    TromVehicles[2] = CreateVehicle(499,2612.739,-1405.000,34.842,90.0000,-1,-1,-1);*/
  
	//MechanicVehicles[0] = AddStaticVehicleEx(525,1580.7230,-2153.6982,13.4175,270.0000,1,1,-1); // xe
	//MechanicVehicles[1] = AddStaticVehicleEx(525,1580.7230,-2153.6982+8,13.4175,270.0000,1,1,-1); // xe2
	//MechanicVehicles[2] = AddStaticVehicle(525,1790.7533,-1693.8940,13.4746,270.9467,1,1); // xe3

    /*PoliceVehicles[0] = CreateVehicle(415,1546.547,-1680.248,5.662,89.744,1,-1,-1,1);
    PoliceVehicles[1] = CreateVehicle(402,1546.119,-1684.445,5.722,90.016,0,-1,-1,1);
    PoliceVehicles[2] = CreateVehicle(560,1544.013,-1676.146,5.890,87.353,0,-1,-1,1);
    PoliceVehicles[3] = CreateVehicle(560,1544.778,-1668.159,5.890,88.818,0,0,-1,1);
    PoliceVehicles[4] = CreateVehicle(579,1543.120,-1662.396,5.890,82.334,0,0,-1,1);
    PoliceVehicles[5] = CreateVehicle(579,1566.973,-1708.435,5.890,197.444,0,0,-1,1);
    PoliceVehicles[6] = CreateVehicle(541,1528.765,1683.841,5.516,268.2020,0,0,-1,1);
    PoliceVehicles[7] = CreateVehicle(541,1563.288,-1710.280,5.512,355.7249,1,0,-1,1);
    //PoliceVehicles[8] = CreateVehicle(541,1537.686,-1675.695,5.890,190.712,1,0,-1,1);
    PoliceVehicles[9] = CreateVehicle(445,1587.184,-1667.141,5.892,272.697,0,0,-1,1);*/



    /*TruckerVehicles[0] = AddStaticVehicleEx(530,2470.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[1] = AddStaticVehicleEx(530,2473.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[2] = AddStaticVehicleEx(530,2476.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[3] = AddStaticVehicleEx(530,2479.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[4] = AddStaticVehicleEx(530,2482.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[5] = AddStaticVehicleEx(530,2485.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[6] = AddStaticVehicleEx(530,2488.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[7] = AddStaticVehicleEx(530,2491.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[8] = AddStaticVehicleEx(530,2494.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	TruckerVehicles[9] = AddStaticVehicleEx(530,2497.1179,-2097.1926,13.6623,0,201,135,0); //Burrito
	*/
/*	PizzaVehicles[0] =  AddStaticVehicleEx(448,2123.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[1] =	AddStaticVehicleEx(448,2121.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[2] =	AddStaticVehicleEx(448,2119.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[3] =	AddStaticVehicleEx(448,2117.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[4] =	AddStaticVehicleEx(448,2115.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[5] =	AddStaticVehicleEx(448,2113.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[6] =	AddStaticVehicleEx(448,2111.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[7] =	AddStaticVehicleEx(448,2109.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[8] =	AddStaticVehicleEx(448,2107.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	PizzaVehicles[9] =	AddStaticVehicleEx(448,2105.3752,-1785.1288,12.9856,0,3,6,0); //Pizzaboy
	*/
	/*GiaoHang1Vehicles[0] = AddStaticVehicleEx(400, 2132.7778, -2094.4500, 13.6133, 139.1328, -1, -1, 100);
	GiaoHang1Vehicles[1] = AddStaticVehicleEx(400, 2116.3088, -2078.6497, 13.6133, 139.1328, -1, -1, 100);
	GiaoHang1Vehicles[2] = AddStaticVehicleEx(400, 2123.5720, -2084.8408, 13.6133, 139.1328, -1, -1, 100);
	GiaoHang1Vehicles[3] = AddStaticVehicleEx(400, 2119.5793, -2081.0942, 13.6133, 139.1328, -1, -1, 100);
	GiaoHang1Vehicles[4] = AddStaticVehicleEx(400, 2126.1099, -2087.2813, 13.6133, 139.1328, -1, -1, 100);
	GiaoHang1Vehicles[5] = AddStaticVehicleEx(400, 2130.1433, -2091.9763, 13.6133, 139.1328, -1, -1, 100);*/

	/*NguDanVehicles[0] =  AddStaticVehicleEx(453,140.9720,-1810.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[1] =  AddStaticVehicleEx(453,140.9720,-1830.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[2] =  AddStaticVehicleEx(453,140.9720,-1850.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[3] =  AddStaticVehicleEx(453,140.9720,-1870.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[4] =  AddStaticVehicleEx(453,140.9720,-1890.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[5] =  AddStaticVehicleEx(453,140.9720,-1910.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[6] =  AddStaticVehicleEx(453,140.9720,-1930.0840,-0.2200,180.0559,-1,-1,0); //Reefer
	NguDanVehicles[7] =  AddStaticVehicleEx(453,166.9218,-1900.1563,-0.3895,181.4977,-1,-1,0); //Reefer
	NguDanVehicles[8] =  AddStaticVehicleEx(453,166.9218,-1920.1563,-0.3895,181.4977,-1,-1,0); //Reefer*/	

	/*AddStaticVehicleEx(593,382.5172,2536.9561,16.5338,179.7261,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(513,348.3660,2536.9792,16.7418,178.8195,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(487,365.4068,2537.0327,16.6645,181.9959,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(593,-1429.2843,-505.8203,13.7824,205.7709,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(593,-1462.4779,-524.2803,13.7832,204.8137,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(593,1907.7614,-2624.4097,13.5416,53.1810,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(593,1887.0736,-2627.6543,13.5394,52.6116,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(513,-1354.3270,-466.5467,13.7827,162.0134,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(513,-1390.3510,-482.7985,13.7883,250.3124,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(513,1835.3215,-2624.1938,13.5405,56.0569,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(513,1813.2893,-2625.6296,13.5394,53.2858,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(487,1963.29,-2647.07,13.76,21.93,-1,-1, 2000); // Maverick
	AddStaticVehicleEx(487,1948.81,-2647.30,13.68,21.93,-1,-1, 2000); // Maverick*/

	/*
	// VIP garage
	VIPVehicles[0] = AddStaticVehicleEx(411,-4365.93212891,839.28680420,986.18029785,0.00000000,-1,-1,180); //Infernus
	VIPVehicles[1] = AddStaticVehicleEx(429,-4370.52832031,840.57843018,986.13031006,0.00000000,-1,-1,180); //Banshee
	VIPVehicles[2] = AddStaticVehicleEx(451,-4374.41894531,840.36810303,986.14465332,0.00000000,-1,-1,180); //Turismo
	VIPVehicles[3] = AddStaticVehicleEx(541,-4378.48046875,840.84783936,986.08032227,0.00000000,-1,-1,180); //Bullet
	VIPVehicles[4] = AddStaticVehicleEx(559,-4382.43701172,840.60235596,986.13439941,0.00000000,-1,-1,180); //Jester
	VIPVehicles[5] = AddStaticVehicleEx(560,-4386.68066406,841.29382324,986.18530273,0.00000000,-1,-1,180); //Sultan
	VIPVehicles[6] = AddStaticVehicleEx(603,-4390.54345703,841.60748291,986.38299561,0.00000000,-1,-1,180); //Phoenix
	VIPVehicles[7] = AddStaticVehicleEx(480,-4394.61035156,841.88873291,986.23028564,0.00000000,-1,-1,180); //Comet
	VIPVehicles[8] = AddStaticVehicleEx(506,-4399.16455078,842.31146240,986.17242432,0.00000000,-1,-1,180); //Super GT
	VIPVehicles[9] = AddStaticVehicleEx(587,-4402.89990234,842.34979248,986.19030762,0.00000000,-1,-1,180); //Euros
	VIPVehicles[10] = AddStaticVehicleEx(411,-4407.21337891,842.98492432,986.18029785,0.00000000,-1,-1,180); //Infernus
	VIPVehicles[11] = AddStaticVehicleEx(429,-4410.96923828,843.07391357,986.13031006,0.00000000,-1,-1,180); //Banshee
	VIPVehicles[12] = AddStaticVehicleEx(451,-4415.64257812,843.46972656,986.14465332,0.00000000,-1,-1,180); //Turismo
	VIPVehicles[13] = AddStaticVehicleEx(541,-4419.40478516,843.48645020,986.08032227,0.00000000,-1,-1,180); //Bullet
	VIPVehicles[14] = AddStaticVehicleEx(559,-4423.40332031,843.19854736,986.13439941,0.00000000,-1,-1,180); //Jester
	VIPVehicles[15] = AddStaticVehicleEx(560,-4427.88232422,843.82849121,986.18530273,0.00000000,-1,-1,180); //Sultan
	VIPVehicles[16] = AddStaticVehicleEx(603,-4431.95849609,844.09509277,986.38299561,0.00000000,-1,-1,180); //Phoenix
	VIPVehicles[17] = AddStaticVehicleEx(480,-4436.15429688,844.76721191,986.23028564,0.00000000,-1,-1,180); //Comet
	VIPVehicles[18] = AddStaticVehicleEx(506,-4441.21337891,850.94598389,986.17242432,270.00000000,-1,-1,180); //Super GT
	VIPVehicles[19] = AddStaticVehicleEx(587,-4441.05224609,854.70550537,986.19030762,270.00000000,-1,-1,180); //Euros
	VIPVehicles[20] = AddStaticVehicleEx(522,-4418.77490234,858.65576172,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[21] = AddStaticVehicleEx(522,-4414.77441406,858.50390625,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[22] = AddStaticVehicleEx(522,-4410.77441406,858.35253906,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[23] = AddStaticVehicleEx(522,-4406.30957031,857.78234863,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[24] = AddStaticVehicleEx(522,-4394.11425781,856.77416992,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[25] = AddStaticVehicleEx(522,-4390.35644531,856.70147705,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[26] = AddStaticVehicleEx(522,-4386.21923828,856.22369385,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[27] = AddStaticVehicleEx(522,-4382.18164062,855.81323242,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[28] = AddStaticVehicleEx(522,-4417.77832031,876.99304199,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[29] = AddStaticVehicleEx(522,-4414.06494141,876.46301270,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[30] = AddStaticVehicleEx(522,-4409.78320312,876.41296387,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[31] = AddStaticVehicleEx(522,-4405.26074219,876.33081055,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[32] = AddStaticVehicleEx(522,-4393.28417969,875.69360352,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[33] = AddStaticVehicleEx(522,-4389.04248047,875.41735840,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[34] = AddStaticVehicleEx(522,-4385.04980469,875.21435547,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[35] = AddStaticVehicleEx(522,-4381.05761719,875.00488281,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[36] = AddStaticVehicleEx(411,-4407.94287109,891.34375000,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[37] = AddStaticVehicleEx(411,-4403.66748047,891.17761230,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[38] = AddStaticVehicleEx(411,-4399.91601562,891.28747559,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[39] = AddStaticVehicleEx(411,-4395.91601562,891.31347656,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[40] = AddStaticVehicleEx(451,-4391.23242188,891.03985596,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[41] = AddStaticVehicleEx(451,-4387.48339844,891.00421143,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[42] = AddStaticVehicleEx(451,-4383.49218750,890.44665527,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[43] = AddStaticVehicleEx(429,-4374.92187500,890.17211914,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[44] = AddStaticVehicleEx(429,-4370.80273438,889.91503906,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[45] = AddStaticVehicleEx(429,-4379.33349609,890.09112549,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[46] = AddStaticVehicleEx(560,-4366.63867188,889.44537354,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[47] = AddStaticVehicleEx(560,-4358.66015625,888.96386719,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[48] = AddStaticVehicleEx(560,-4354.67675781,888.44500732,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[49] = AddStaticVehicleEx(560,-4362.83789062,889.30908203,986.18530273,180.00000000,-1,-1,180); //Sultan
	*/
	/* Palomino Creek Docks 
	TruckerVehicles[19] = AddStaticVehicleEx(452,2185.99658203,-149.95848083,0.00000000,276.54052734,-1,-1,180); //Speeder
	TruckerVehicles[20] = AddStaticVehicleEx(452,2186.97680664,-158.20143127,0.00000000,276.53686523,-1,-1,180); //Speeder
	TruckerVehicles[21] = AddStaticVehicleEx(452,2187.71826172,-166.46507263,0.00000000,276.34887695,-1,-1,180); //Speeder
	TruckerVehicles[22] = AddStaticVehicleEx(452,2192.13793945,-200.85733032,0.00000000,276.53259277,-1,-1,180); //Speeder
	TruckerVehicles[23] = AddStaticVehicleEx(446,2193.27734375,-208.95735168,0.00000000,276.53137207,-1,-1,180); //Speeder
	TruckerVehicles[24] = AddStaticVehicleEx(452,2194.16015625,-217.30232239,0.00000000,276.53137207,-1,-1,180); //Speeder
	TruckerVehicles[25] = AddStaticVehicleEx(446,2194.73437500,-225.24971008,0.00000000,276.53137207,-1,-1,180); //Speeder
	TruckerVehicles[26] = AddStaticVehicleEx(452,2195.46508789,-233.01260376,0.00000000,276.53137207,-1,-1,180); //Speeder
	TruckerVehicles[27] = AddStaticVehicleEx(452,2196.51562500,-240.20898438,0.00000000,276.53137207,-1,-1,180); //Speeder
	TruckerVehicles[28] = AddStaticVehicleEx(452,2248.83911133,-236.78352356,0.00000000,274.83947754,-1,-1,180); //Speeder
	TruckerVehicles[29] = AddStaticVehicleEx(452,2248.34790039,-228.59799194,0.00000000,274.83947754,-1,-1,180); //Speeder
	TruckerVehicles[30] = AddStaticVehicleEx(446,2247.91552734,-219.05198669,0.00000000,274.83947754,-1,-1,180); //Speeder
	TruckerVehicles[31] = AddStaticVehicleEx(452,2247.09057617,-210.72824097,0.00000000,274.83947754,-1,-1,180); //Speeder
	TruckerVehicles[32] = AddStaticVehicleEx(452,2245.94946289,-202.20306396,0.00000000,274.08752441,-1,-1,180); //Speeder
	TruckerVehicles[33] = AddStaticVehicleEx(452,2245.44799805,-194.00953674,0.00000000,273.41845703,-1,-1,180); //Speeder
	TruckerVehicles[34] = AddStaticVehicleEx(452,2244.83129883,-185.67364502,0.00000000,273.89953613,-1,-1,180); //Speeder
	TruckerVehicles[35] = AddStaticVehicleEx(453,2244.21508789,-177.24726868,0.00000000,274.83947754,-1,-1,180); //Speeder
	TruckerVehicles[36] = AddStaticVehicleEx(453,2243.78955078,-168.67892456,0.00000000,274.83947754,-1,-1,180); //Speeder
	*/
	/*
	//Sultan
	FamedVehicles[0] = AddStaticVehicleEx(560,2515.6797,2381.6501,3.9175,90.5219,-1,-1,180);
	FamedVehicles[1] = AddStaticVehicleEx(560,2515.9753,2372.6431,3.9167,89.3516,-1,-1,180);
	FamedVehicles[2] = AddStaticVehicleEx(560,2515.2947,2363.1985,3.9228,89.3915,-1,-1,180);
	//Cheetah
	FamedVehicles[3] = AddStaticVehicleEx(415,2515.2170,2377.3411,3.9823,90.2256,-1,-1,180);
	FamedVehicles[4] = AddStaticVehicleEx(415,2515.2529,2368.2183,3.9826,90.2256,-1,-1,180);
	//NRG
	FamedVehicles[5] = AddStaticVehicleEx(522,2498.9292,2363.5708,3.7897,242.9848,-1,-1,180);
	FamedVehicles[6] = AddStaticVehicleEx(522,2499.3206,2366.6091,3.8081,242.9848,-1,-1,180);
	FamedVehicles[7] = AddStaticVehicleEx(522,2499.4883,2370.2681,3.8290,242.9847,-1,-1,180);
	FamedVehicles[8] = AddStaticVehicleEx(522,2499.3398,2382.6699,3.8842,242.9847,-1,-1,180);
	FamedVehicles[9] = AddStaticVehicleEx(522,2499.2588,2385.4790,3.7989,242.9847,-1,-1,180);
	FamedVehicles[10] = AddStaticVehicleEx(522,2499.0728,2390.9985,3.8373,242.9846,-1,-1,180);
	//PCJ
	FamedVehicles[11] = AddStaticVehicleEx(461,2494.5908,2353.1921,3.7971,328.9557,-1,-1,180);
	FamedVehicles[12] = AddStaticVehicleEx(461,2497.6455,2352.8145,3.7880,328.9523,-1,-1,180);
	FamedVehicles[13] = AddStaticVehicleEx(461,2501.5059,2352.7971,3.7973,328.9482,-1,-1,180);
	FamedVehicles[14] = AddStaticVehicleEx(461,2506.0073,2352.9568,3.7935,328.9489,-1,-1,180);
	//Comets
	FamedVehicles[15] = AddStaticVehicleEx(480,2524.4268,2381.5957,3.9851,269.3853,-1,-1,180);
	FamedVehicles[16] = AddStaticVehicleEx(480,2524.3342,2372.9875,3.9898,269.3844,-1,-1,180);
	FamedVehicles[17] = AddStaticVehicleEx(480,2524.2336,2363.5969,3.9947,269.3852,-1,-1,180);
	//Bullet
	FamedVehicles[18] = AddStaticVehicleEx(541,2524.1758,2377.0989,3.8359,269.6020,-1,-1,180);
	FamedVehicles[19] = AddStaticVehicleEx(541,2524.1130,2368.1453,3.8404,269.6032,-1,-1,180);
	//Jester
	FamedVehicles[20] = AddStaticVehicleEx(559,2542.2134,2381.6531,3.8673,89.7158,-1,-1,180);
	FamedVehicles[21] = AddStaticVehicleEx(559,2541.9707,2372.5603,3.8675,89.7158,-1,-1,180);
	//SuperGT
	FamedVehicles[22] = AddStaticVehicleEx(506,2541.7937,2367.7646,3.9154,89.7431,-1,-1,180);
	FamedVehicles[23] = AddStaticVehicleEx(506,2541.8357,2377.2507,3.9155,89.7431,-1,-1,180);
	//Banshee
	FamedVehicles[24] = AddStaticVehicleEx(429,2542.5437,2363.3955,3.8906,90.2345,-1,-1,180);
	//Infernus
	FamedVehicles[25] = AddStaticVehicleEx(411,2510.7610,2397.8477,3.9380,180.5807,-1,-1,180);
	FamedVehicles[26] = AddStaticVehicleEx(411,2519.9934,2397.9417,3.9424,180.5807,-1,-1,180);
	//Uranus
	FamedVehicles[27] = AddStaticVehicleEx(558,2515.1958,2398.0537,3.8412,179.9306,-1,-1,180);
	FamedVehicles[28] = AddStaticVehicleEx(558,2524.5942,2397.4172,3.8415,179.9293,-1,-1,180);
	//Huntley
	FamedVehicles[31] = AddStaticVehicleEx(579,2528.9141,2397.9255,4.1505,179.4067,-1,-1,180);
	FamedVehicles[32] = AddStaticVehicleEx(579,2537.8970,2397.8325,4.1541,179.4066,-1,-1,180);
	//Premier
	FamedVehicles[33] = AddStaticVehicleEx(426,2533.3384,2397.8184,3.9538,179.7989,-1,-1,180);
	FamedVehicles[34] = AddStaticVehicleEx(426,2542.4468,2397.7859,3.9583,179.8030,-1,-1,180);
	//Sanchez
	FamedVehicles[35] = AddStaticVehicleEx(468,2508.5623,2352.0640,3.8801,327.8297,-1,-1,180);
	FamedVehicles[36] = AddStaticVehicleEx(468,2512.6743,2352.0581,3.8747,327.8297,-1,-1,180);
	FamedVehicles[37] = AddStaticVehicleEx(468,2513.9478,2351.9365,3.8822,327.8291,-1,-1,180);
	FamedVehicles[38] = AddStaticVehicleEx(468,2516.2051,2352.1504,3.8789,327.8291,-1,-1,180);
	*/
	

	/*AddStaticVehicleEx(593,1402.44238281,-2428.44042969,14.10486984,180.00000000,-1,-1,2000); Dodo - 255
	AddStaticVehicleEx(593,1418.70190430,-2427.98681641,14.10486984,180.00000000,-1,-1,2000); Dodo
	AddStaticVehicleEx(593,1433.76721191,-2427.92626953,14.10486984,180.00000000,-1,-1,2000); Dodo*/

	/*
	AddStaticVehicleEx(509,1702.7448,-1884.2257,13.0817,291.3965,-1,-1,2000); // BIKENEWBIESPAWN1
	AddStaticVehicleEx(509,1702.6656,-1882.6167,13.0815,298.5609,-1,-1,2000); // BIKENEWBIESPAWN2
	AddStaticVehicleEx(509,1702.5789,-1881.3337,13.0545,289.8956,-1,-1,2000); // BIKENEWBIESPAWN3
	AddStaticVehicleEx(509,1702.5829,-1879.5234,13.0822,296.3651,-1,-1,2000); // BIKENEWBIESPAWN4
	AddStaticVehicleEx(509,1702.6434,-1877.2375,13.0821,302.0038,-1,-1,2000); // BIKENEWBIESPAWN5
	AddStaticVehicleEx(481,1727.4503,-1885.0702,13.0807,65.2583,-1,-1,2000); // BIKENEWBIESPAWN6
	AddStaticVehicleEx(481,1727.5376,-1882.7361,13.0772,66.9472,-1,-1,2000); // BIKENEWBIESPAWN7
	AddStaticVehicleEx(481,1727.2814,-1880.4712,13.0770,65.2958,-1,-1,2000); // BIKENEWBIESPAWN8
	AddStaticVehicleEx(481,1727.7151,-1877.8586,13.0783,65.9359,-1,-1,2000); // BIKENEWBIESPAWN9
	AddStaticVehicleEx(481,1727.5710,-1875.3071,13.0782,70.6519,-1,-1,2000); // BIKENEWBIESPAWN10
*/
	print("[Streamer] Dynamic Static Vehicles has been loaded.");
	
	return 1;
}

forward LoadStreamerDynamicPickups();
public LoadStreamerDynamicPickups()
{
	// Points
	new string[128];
    for(new h = 0; h < sizeof(Points); h++)
	{
		if(Points[h][Type] == 3)
		{
			format(string, sizeof(string), " POT/THUOC PHIEN CO SAN: %d/1000.", Points[h][Stock]);
			Points[h][TextLabel] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, Points[h][Pointx], Points[h][Pointy], Points[h][Pointz], 4.0);
			Points[h][CratePoint] = 1;
		}
		else if(Points[h][Type] == 4)
		{
			format(string, sizeof(string), " CRACK CO SAN: %d/500.", Points[h][Stock]);
			Points[h][TextLabel] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, Points[h][Pointx], Points[h][Pointy], Points[h][Pointz], 4.0);
			Points[h][CratePoint] = 2;
		}
		CreateDynamicPickup(1239, 23, Points[h][Pointx], Points[h][Pointy], Points[h][Pointz]);
	}
	// arena
	CreateDynamicPickup(2035, 2, 1296.2177,-1424.0673,14.9531);
	/*
    // Pickups
	CreateDynamicPickup(1239, 23, 301.042633, 178.700408, 1007.171875, -1); // Detective job (SF)
	CreateDynamicPickup(1239, 23, -2089.344970, 87.800231, 35.320312, -1); // Drug Dealer job (SF)
	CreateDynamicPickup(1239, 23, 2096.1035,-1795.0962,13.3889, -1); // Pizza Boy job (SF)
	CreateDynamicPickup(1239, 23, -2240.9011, 2313.1653, 4.9918, -1); // Taxi Driver job (TR)
	CreateDynamicPickup(1239, 23, 833.60, 3.23, 1004.17, -1); // /paymytickets point
	CreateDynamicPickup(1239, 23, -4429.944824, 905.032470, 987.078186, -1); // VIP Garage Travel
	CreateDynamicPickup(1239, 23, 2102.71,-103.97,2.28, -1); // Matrun 3
	CreateDynamicPickup(1239, 23, -1816.528686, -179.502624, 9.398437, -1); // Matrun 4 (pickup)
	CreateDynamicPickup(1239, 23, -1872.879760, 1416.312500, 7.180089, -1); // Matrun 4 (dropoff)
	CreateDynamicPickup(1239, 23, -1522.7351, 2587.2612, 55.8359, -1); //Matrun TR (Pickup)
	CreateDynamicPickup(1239, 23, -688.7897,966.1434,12.1627, -1); //Matrun TR (DropOff)
  	//CreateDynamicPickup(1239, 23, 2565.346191, 1403.409790, 7699.584472, -1);// VIP ph changing station.
  	CreateDynamicPickup(1239, 23, 701.7953,-519.8322,16.3348, -1); //Rental Icon
	CreateDynamicPickup(1239, 23, -1475.4224,1877.3550,32.6328, -1); // Mechanic Job (TR)
	CreateDynamicPickup(1239, 23, -1385.6786,2625.6636,55.5572, -1); // Detective Job (TR)
	CreateDynamicPickup(1239, 23, -1513.4904,2614.3591,55.8078, -1); // Arms Dealer Job (TR)
	CreateDynamicPickup(1239, 23, -1356.7195,2065.3450,52.4677, -1); // Craftsman Job (TR)
	CreateDynamicPickup(1239, 23, -1528.0924,2688.7837,55.8359, -1); // Drug Dealer Job (TR)
	CreateDynamicPickup(1239, 23, -821.3508,1574.9393,27.1172, -1); // Bodyguard Job (TR)
	CreateDynamicPickup(1239, 23, -2630.7375,2349.3994,8.4892, -1); // Drug Smuggler Job (TR)
	CreateDynamicPickup(1239, 23, -864.3550,1536.9703,22.5870, -1); // Bartender Job (TR)
	CreateDynamicPickup(1239, 23, 757.3734,5.7227,1000.7012, -1); // Train Pos
	CreateDynamicPickup(1239, 23, 758.43,-78.0,1000.65, -1); // Train Pos (MALL GYM)
	CreateDynamicPickup(1239, 23, 293.6505,188.3670,1007.1719, -1); //FBI
	CreateDynamicPickup(1240, 23, 1179.4012451172,-1331.5632324219,2423.0461425781, -1);// /healme//Old Healme: 2103.4998,2824.2568,-16.1672
	CreateDynamicPickup(1239, 23, 1169.7209472656,-1348.3218994141,2423.0461425781, -1);// /Old Insurance: 2086.4915,2826.7122,-16.1744
    CreateDynamicPickup(1210, 23, -71.419654846191,1360.4097900391,1080.2185058594, -1); //Hitman Pickup
	CreateDynamicPickup(1240, 23, -1528.814331, 2540.706054, 55.835937, -1);// Deliverpt (TR - El Quebrados)
	CreateDynamicPickup(1240, 23, 1142.4733,-1326.3633,13.6259, -1);// Deliverpt (All Saints)
	CreateDynamicPickup(1240, 23, 2027.0599,-1410.6870,16.9922, -1);// Deliverpt (County General)
	CreateDynamicPickup(1240, 23, 1227.2339,306.4730,19.7028, -1);// Deliverpt (Montgomery)
	CreateDynamicPickup(1240, 23, -339.2989,1055.8138,19.7392, -1);// Deliverpt (Fort Carson)
	CreateDynamicPickup(1240, 23, -2695.5725,639.4147,14.4531, -1); // Deliverpt (SF)
	CreateDynamicPickup(1240, 23, 1165.1564,-1368.8240,26.6502, -1);// Deliverpt (All Saints Rooftop)
	CreateDynamicPickup(1240, 23, 2024.5742,-1382.7844,48.3359, -1);// Deliverpt (County General)
	CreateDynamicPickup(1240, 23, 1233.3384,316.4022,24.7578, -1);// Deliverpt (Montgomery Rooftop)
	CreateDynamicPickup(1240, 23, -334.1560,1051.4434,26.0125, -1);// Deliverpt (Fort Carson Rooftop)
	CreateDynamicPickup(1240, 23, -2656.0339,615.2567,66.0938, -1);// Deliverpt (SF Rooftop)
	CreateDynamicPickup(1240, 23, 1579.58,1768.88,10.82, -1);// Deliverpt (LV Hospital)
	CreateDynamicPickup(1240, 23, -2482.4338,2231.1106,4.8463, -1);// Deliverpt (TR - Bayside)
	CreateDynamicPickup(1240, 23, 225.3467,1981.8497,17.6406, -1); //capcuu (DeMorgan)
	CreateDynamicPickup(1239, 23, 366.54, 159.09, 1008.38, -1); // LICENSES @ CITY HALL
	*/
	

	
	
	/*
	
	CreateDynamicPickup(1239, 23, 2354.2808,-1169.2959,28.0066, -1); //Buon ma tuy LS
	CreateDynamicPickup(1239, 23, 1380.7683,-1088.7391,27.3844); // Tham tu LS
	CreateDynamicPickup(1239, 23, 1469.5247,-1755.7039,3285.2859); // Luat su LS
	CreateDynamicPickup(1239, 23, 1215.1304,-11.8431,1000.9219); // Gai diem LS
	CreateDynamicPickup(1239, 23, 2166.3772,-1675.3829,15.0859); //Buon thuoc phien LS
	CreateDynamicPickup(1239, 23, 1911.7753,-1872.7100,13.5475); //Tho sua xe LS
	CreateDynamicPickup(1239, 23, 2226.1716,-1718.1792,13.5165); //Ve si LS
	CreateDynamicPickup(1239, 23, 2450.2000,-2126.0259,13.5469); //Buon vu khi LS
	CreateDynamicPickup(1239, 23, 2450.2000,-2126.0259,13.5469); //Trucker registration
    CreateDynamicPickup(1239, 23, 2103.9937,-1809.6488,13.5547); //Pizza job registration
	CreateDynamicPickup(1239, 23, 1808.4767,-1885.1515,13.5851); //TaxiDriver Registration (LS)
	CreateDynamicPickup(1239, 23, 1099.73,-1504.67,15.800); // BodyGuard Registration (MALL GYM)
	*/
	
	
	
	
	
	
	
	
	/*
	
	CreateDynamicPickup(1239, 23, -2269.256103, -158.054321, 35.320312); //BodyGuard Registration (SF)
	CreateDynamicPickup(1239, 23, 1224.13, 267.98, 19.55); //Bodyguard (Montgomery) Registration

	CreateDynamicPickup(1239, 23, -2032.601928, 143.866592, 28.835937); //CarMechanic (SF) Registration
	CreateDynamicPickup(1239, 23, -2623.333984, 209.235931, 4.684767); //ArmsDealer Registration (SF)
	//CreateDynamicPickup(1239, 23, 2195.8335,-1973.0638,13.5589); //Craftsman Registration
	//CreateDynamicPickup(1239, 23, 502.6696,-11.6603,1000.6797); //Bartender Registration
	//CreateDynamicPickup(1239, 23, 766.0804,14.5133,1000.7004); //Boxer Registration
	CreateDynamicPickup(1239, 23, 758.98,-60.32,1000.78); //Boxer Registration2

	CreateDynamicPickup(1239, 23, -1981.144775, 133.063293, 27.687500); //TaxiDriver Registration (SF)
	
	
	*/
	CreateDynamicPickup(371, 23, 1544.2,-1353.4,329.4); //LS towertop
	CreateDynamicPickup(371, 23, 1536.0, -1360.0, 1150.0); //LS towertop
	CreateDynamicPickup(1242, 23, 1527.5,-12.1,1002.0); //binco armor
	//CreateDynamicPickup(1240, 23, 279.3000,1853.5619,8.7649); //area51 health
	CreateDynamicPickup(1239, 23, 1260.1556,-1244.8586,16.1917, -1); //Khai thac
	CreateDynamicPickup(1239, 23, 2178.4500,-1987.3132,13.5502); //Don ve sinh
	CreateDynamicPickup(1239, 23, 153.0719,-1976.7560,1); //Tha luoi
	
	
	
	print("[Streamer] Dynamic Pickups has been loaded.");
	
	return 1;
}

forward LoadStreamerDynamic3DTextLabels();
public LoadStreamerDynamic3DTextLabels()
{
	// 1919.5537,-1773.6747,13.5828
	
	new string[128];
	//ActorVukhi = CreateActor(29,2795.8154,-1416.0573,16.2500,95.2672);
	//CreateDynamic3DTextLabel("{42f572}Weapon Make {FFFFFF}Nhan {8142f5}Y de tuong tac.", -1, 2795.8154,-1416.0573,16.2500+1.1,10.0);
 	//new npc247;
	Actor247[1] = CreateActor(294,1919.5537,-1773.6747,13.5828,179.7659);
	ApplyActorAnimation(Actor247[1], "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0);
	CreateDynamic3DTextLabel("{00b33a}[NHAN VIEN]\n{00FFFF}USE : [Y] De Tuong Tac", -1, 1919.5537,-1773.6747,13.5828+1.1,10.0);

	Actor247[2] = CreateActor(113, 0,0,0,0);
	//CreateDynamic3DTextLabel("{00ff00}[CONG VIEC]\n{99cc00}Luat su{FFFFFF}\nSu dung {ffff00}Y{FFFFFF} de tim hieu cong viec.", -1, 1484.8108,-1772.0048,18.7958+1.5, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1);
	ApplyActorAnimation(Actor247[2], "PED", "IDLE_CHAT", 4.1, 1, 0, 0, 0, 0);

	Actor247[3] = CreateActor(85, 0,0,0,0);
	//CreateDynamic3DTextLabel("{00ff00}[CONG VIEC]\n{99cc00}Gai diem{FFFFFF}\nSu dung {ffff00}Y{FFFFFF} de tim hieu cong viec.", -1, 2230.3130,-1763.2295,13.5625+1.5, 30.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1);
	ApplyActorAnimation(Actor247[3], "STRIP", "strip_E", 4.1, 1, 0, 0, 0, 0);

	
	
    npccityhall = CreateActor(294,2413.1533,2616.9988,1044.1726,91.4172);
	ApplyActorAnimation(npccityhall, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0);
	CreateDynamic3DTextLabel("{00b33a}[NHAN VIEN CITY HALL]\n{00FFFF}USE : [Y] De Tuong Tac", -1, 2413.1533,2616.9988,1044.1726+1.1,10.0);
    CreateDynamic3DTextLabel("{FF8000}/loadforklift\nDe dua cac thung len xe forklift", COLOR_YELLOW, -2114.1, -1723.5, 11984.5, 20.0, _, _, 1, 0, -1, _, 20.0);
	CreateDynamic3DTextLabel("{FF8000}LOCKDOWN\nCHI BAM TRONG TRUONG HOP KHAN CAP", COLOR_YELLOW, -1121.70, 4290.41, 5.88, 20.0, _, _, 1, 0, 0, _, 20.0);

	// General text labels
    CreateDynamic3DTextLabel("Thay doi so dien thoai VIP, su dung /vipnum",COLOR_YELLOW,2549.548095, 1404.047729, 7699.584472+0.6,4.0);//
    CreateDynamic3DTextLabel("Thay doi so dien thoai VIP, su dung /vipnum",COLOR_YELLOW,1832.6000, 1375.1700, 1464.4600+0.6,4.0);//
    CreateDynamic3DTextLabel("Su dung /travel\nDe dua chiec xe cua ban ra khoi bai do xe VIP",COLOR_YELLOW,-4429.944824, 905.032470, 987.078186+0.5,13.0);// VIP garage travel
    CreateDynamic3DTextLabel("{66CC66}(Y)\n{9933CC}De mo tu do VIP.",COLOR_YELLOW,2555.747314, 1404.106079, 7699.584472+0.6,4.0);/// LS VIP locker room
	CreateDynamic3DTextLabel("{66CC66}(Y)\n{9933CC}De mo tu do VIP.",COLOR_YELLOW,1832.0533, 1380.7281, 1464.3822+0.6,4.0);/// LV Main VIP locker room
    CreateDynamic3DTextLabel("{66CC66}(Y)\n{9933CC}De mo tu do VIP",COLOR_YELLOW,772.4844, 1715.7213, 1938.0391+0.6,4.0);/// LV Plat VIP locker room
	CreateDynamic3DTextLabel("/getgift\nDe nhan phan thuong ben trong tui qua.",COLOR_YELLOW,2546.611572, 1403.323608, 7700.768066,8.0);/// VIP Lounge
	CreateDynamic3DTextLabel("/nhanqua\nDe nhan phan thuong ben trong tui qua.",COLOR_YELLOW,1726.1000, 1370.1000, 1449.9000,8.0);/// LV VIP Lounge
	CreateDynamic3DTextLabel("/nhanqua\nDe nhan phan thuong ben trong tui qua.",COLOR_YELLOW,1763.5000, 1432.5000, 2015.7000,8.0);/// LV GVIP Lounge
	CreateDynamic3DTextLabel("/nhanqua\nDe nhan phan thuong ben trong tui qua.",COLOR_YELLOW,772.4000, 1743.2000, 1938.8800,8.0);/// LV PVIP Lounge
    CreateDynamic3DTextLabel("Thue mot chiec xe dap theo yeu cau",COLOR_YELLOW,701.7953,-519.8322,16.3348+0.6,4.0);
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, -2043.527832, -189.208435, 985.183105+0.6, 4.0); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 1112.7, -2055.8, 1409.7+0.6, 4.0); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 321.43, 303.96, 999.14+0.6, 4.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 2112, 5, -1); //
	CreateDynamic3DTextLabel("Factions Duty Point", COLOR_DBLUE, 1533.6, -1760.9, 2264.4+0.6, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 2345, 18, -1); //
	CreateDynamic3DTextLabel("Tro lai Entrance", COLOR_DBLUE, -2033.7502,-154.8784,35.3203+0.6, 4.0); // Prison
   	CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,1174.5896,-1337.3615,13.5424+0.6,4.0);///capcuu (County General)
   	CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,1139.5889,-1331.0060,36.9457+0.6,4.0);///capcuu (All Saints Rooftop)
   	CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,2030.3644,-1411.8820,16.9989+0.6,4.0);///capcuu (County General)
   	CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,2060.1650,-1418.5410,48.3359+0.6,4.0);///capcuu (All Saints)
   	//CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,-334.1560,1051.4434,26.0125+0.6,4.0);///capcuu (Fort Carson Rooftop)
   	//CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,-2656.0339,615.2567,66.0938+0.6,4.0);///capcuu (SF Rooftop)
	//CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,1579.58,1768.88,10.82+0.6,4.0); // /capcuu (LV Hospital)
   	//CreateDynamic3DTextLabel("Emergency Room\n/capcuu",COLOR_DBLUE,-2695.5725,639.4147,14.4531+0.6,4.0);///capcuu (SF)
	//CreateDynamic3DTextLabel("/capcuu",COLOR_LIGHTRED,-2482.4338,2231.1106,4.8463+0.6,4.0);///capcuu (TR - Bayside)
   	//CreateDynamic3DTextLabel("/deliver",COLOR_DBLUE,1991.7953,-2321.2532,13.5469+0.6,4.0);// Deliver
   	CreateDynamic3DTextLabel("/healme \nDe chua benh cua ban",COLOR_DBLUE,1179.4012451172,-1331.5632324219,2423.0461425781+0.6,4.0);// /healme
   	CreateDynamic3DTextLabel("/muabaohiem \n Mua bao hiem y te",COLOR_DBLUE,1402.7266,-38.3610,1000.8640+0.6,4.0);// Insurance
   	CreateDynamic3DTextLabel("/muabaohiem \n Mua bao hiem y te",COLOR_DBLUE,2785.586914, 2400.224853, 1240.531127+0.6,8.0);// GVIP Insurance
   	CreateDynamic3DTextLabel("/muabaohiem \n Mua bao hiem y te",COLOR_DBLUE,912.1003,1429.9298,-81.1762+0.6,4.0);// Famed Room Insurance
	CreateDynamic3DTextLabel("Su dung /layvatlieu tu mot chiec thuyen \nde co duoc vat lieu",COLOR_YELLOW,2102.71,-103.97,2.28+0.5,8.0);// Deliver
	//CreateDynamic3DTextLabel("Su dung /muagiayphep to \nDe chon mua giay phep.",COLOR_YELLOW,366.54,159.09,1008.38+0.5,8.0);// Licenses.
	//CreateDynamic3DTextLabel("Type /registerplate to\nchange your license plate.",COLOR_YELLOW,366.54,159.09,1008.38+1,8.0);// Licenses.
    CreateDynamic3DTextLabel("/muatrangphuc\n De thay trang phuc ca nhan.",COLOR_YELLOW,208.8970,-100.3289,1005.2578,8.0);
    CreateDynamic3DTextLabel("/muatrangphuc\n De thay trang phuc ca nhan.",COLOR_YELLOW,206.5429,-41.2313,1001.8047,8.0);
    CreateDynamic3DTextLabel("/muatrangphuc\n De thay trang phuc ca nhan.",COLOR_YELLOW,209.3064,-8.3033,1005.2109,8.0);
    CreateDynamic3DTextLabel("/muatrangphuc\n De thay trang phuc ca nhan.",COLOR_YELLOW,159.6771,-83.2866,1001.8120,8.0);
    CreateDynamic3DTextLabel("/muatrangphuc\n De thay trang phuc ca nhan.",COLOR_YELLOW,206.4552,-163.0903,1000.5234,8.0);
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,206.3253,-100.3268,1005.2578,8.0);
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,201.0413,-40.1616,1001.8047,8.0);
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,206.3963,-8.2122,1001.2109,8.0);
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,162.7706,-83.2726,1001.8047,8.0);
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,2787.095947, 2390.353027, 1240.531127+0.6,4.0); // Gold+ VIP Room
    CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,202.6777,-163.0623,1000.5306,8.0);
	CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,1774.7533, 1422.6665, 2013.4979,8.0);
	CreateDynamic3DTextLabel("/muadochoi\n De mua phu kien trang tri.",COLOR_YELLOW,775.0900, 1742.4900, 1938.3800,8.0);
	CreateDynamic3DTextLabel("De hoc mon vo cua minh\nNhan {00b33a}/hocvo{FFFFFF} de xem.",COLOR_YELLOW,754.0793,-26.4657,1000.5904,8.0);


    CreateDynamic3DTextLabel("Tank Spawn\nZone",COLOR_YELLOW,286.7334, 2024.3762, 17.6406,10.0);
    CreateDynamic3DTextLabel("Air Vehicle Spawn\nZone", COLOR_YELLOW, 326.2754,1887.7212,17.6566, 10.0);

	// Paintball Arena
 	CreateDynamic3DTextLabel("Phong tap ban arena\n\nSu dung /arena de vao phong",COLOR_YELLOW,1296.2177,-1424.0673,14.9531+0.5,6.0);

	// SANews Broadcast
	SANews3DText = CreateDynamic3DTextLabel(string,COLOR_LIGHTBLUE,632.7400,-14.2350,1108.2181,8.0);
	
	// Buildings 3D labels
	//CreateDynamic3DTextLabel("Press F (enter) to go inside.",COLOR_YELLOW,1568.5718,-1691.0177,5.8906+0.6,4.0); //LSPD Garage enter
	//CreateDynamic3DTextLabel("Press F (enter) to go inside.",COLOR_YELLOW,1564.8464,-1666.1444,28.3956+0.6,4.0); //LSPD Roof enter

    CreateDynamic3DTextLabel("Su dung /layvatlieu de lay vat lieu",COLOR_YELLOW,-1816.528686, -179.502624, 9.398437+0.6,5.0);
    CreateDynamic3DTextLabel("{03FF02}Lo Hang Boc Vac'ALT'De Bat Dau Cong Viec Boc Vac",COLOR_YELLOW,2054.3484, 13.5549, 262.3929+0.6,5.0);
	CreateDynamic3DTextLabel("Su dung /layvatlieu de lay vat lieu",COLOR_YELLOW,-1522.7351, 2587.2612, 55.8359+0.6, 5.0);
	//CreateDynamic3DTextLabel("Diem thay doi ten \nSu dung /doiten de thay doi ten",COLOR_YELLOW,1154.7295,-1440.2323,15.7969+0.6,18.0); // Namechange at mall

    /* Sprunk 3D Text
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,2140.4504,-1161.4298,23.9922+0.6,12.0); // May uong nuoc
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,2153.8826,-1015.5273,62.8895+0.6,12.0); // May uong nuoc
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,2325.9705,-1646.1234,14.8270+0.6,12.0); // May uong nuoc
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,2060.2163,-1898.6940,13.5538+0.6,12.0); // May uong nuoc
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,1929.8986,-1772.5122,13.5469+0.6,12.0); // May uong nuoc
    CreateDynamic3DTextLabel("May uong nuoc \nBam phim 'F' de lay nuoc uong",COLOR_YELLOW,1153.6688,-1460.8262,15.7969+0.6,12.0); // May uong nuoc
	*/
	/* Job's 3D Text */
	/*
	CreateDynamic3DTextLabel("Cong viec Tham tu \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1380.7683,-1088.7391,27.3844+0.5,4.0);// Tham tu (LS)
    CreateDynamic3DTextLabel("Cong viec Tham tu \nSu dung /xinviec de lua chon cong viec",COLOR_RED,301.042633, 178.700408, 1007.171875+0.5,4.0);// Cong viec Detective (SF) // bo qua
	CreateDynamic3DTextLabel("Cong viec Tham tu \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1385.6786, 2625.6636, 55.5572+0.5,4.0);// Cong viec Detective (TR) // bo qua
	CreateDynamic3DTextLabel("Nguoi ban vu khi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1366.4325,-1275.2096,13.5469+0.5,4.0);// Buon vu khi (LS)
    CreateDynamic3DTextLabel("Nguoi ban vu khi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2623.333984, 209.235931, 4.684767+0.5,4.0);// Gun Job // bo qua
	CreateDynamic3DTextLabel("Nguoi ban vu khi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1513.4904, 2614.3591, 55.8078+0.5,4.0);// Arms Dealer (TR) // bo qua
 	CreateDynamic3DTextLabel("Nguoi ban thuoc phien \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2166.3772,-1675.3829,15.0859+0.5,4.0);// Buon thuoc phien (LS)
    CreateDynamic3DTextLabel("Nguoi ban thuoc phien \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2089.344970, 87.800231, 35.320312+0.5,4.0);// Drug Dealer (SF) // bo qua
	CreateDynamic3DTextLabel("Nguoi ban thuoc phien \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1528.0924,2688.7837,55.8359+0.5,4.0);// Drug Dealer (TR) // bo qua
	CreateDynamic3DTextLabel("Cong viec Ve si \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2226.1716,-1718.1792,13.5165+0.5,4.0);// Ve si (LS)
    CreateDynamic3DTextLabel("Cong viec Ve si \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2269.256103, -158.054321, 35.320312+0.5,4.0);// Ve si (SF) // bo qua
	CreateDynamic3DTextLabel("Cong viec Ve si \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-821.3508,1574.9393,27.1172+0.5,4.0);// Ve si (TR) // bo qua
	CreateDynamic3DTextLabel("Luat su \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1469.5247,-1755.7039,3285.2859+0.5,4.0);// Luat su (LS)
    CreateDynamic3DTextLabel("Tai xe Taxi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1808.4767,-1885.1515,13.5851+0.5,4.0);// Tai xe Taxi (LS)
    CreateDynamic3DTextLabel("Tai xe Taxi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1981.144775, 133.063293, 27.687500+0.5,4.0);// Taxi Driver (SF) // bo qua
	CreateDynamic3DTextLabel("Tai xe Taxi \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2240.9011, 2313.1653, 4.9918+0.5,4.0);// Taxi Driver (TR) // bo qua
    CreateDynamic3DTextLabel("Cong viec Ve si \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1224.13, 267.98, 19.55+0.5,4.0);// Ve si (Montgomery) // bo qua
    CreateDynamic3DTextLabel("Tho sua xe \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1911.7753,-1872.7100,13.5475+0.5,4.0);// Tho sua xe (LS)
    CreateDynamic3DTextLabel("Tho sua xe \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2032.601928, 143.866592, 28.835937+0.5,4.0);// Mechanic (SF) // bo qua
	CreateDynamic3DTextLabel("Tho sua xe \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1475.4224, 1877.3550, 32.6328+0.5,4.0);// Mechanic (TR) // bo qua
	CreateDynamic3DTextLabel("Gai diem \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1215.1304,-11.8431,1000.9219+0.5,4.0);// Gai diem (LS)
    CreateDynamic3DTextLabel("Boxer Job \nSu dung /xinviec de lua chon cong viec",COLOR_RED,766.0804,14.5133,1000.7004+0.5,4.0);// Boxer (LS)
    CreateDynamic3DTextLabel("Boxer Job \nSu dung /xinviec de lua chon cong viec",COLOR_RED,758.98,-60.32,1000.78+0.5,4.0);// Boxer2 // bo qua
    CreateDynamic3DTextLabel("Buon lau ma tuy \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2354.2808,-1169.2959,28.0066+0.5,4.0);// Buon ma tuy (LS)
	CreateDynamic3DTextLabel("Buon lau ma tuy \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-2630.7375,2349.3994,8.4892+0.5,4.0);// Drug Smuggler (TR) // bo qua
    CreateDynamic3DTextLabel("Cong viec Ve si \nSu dung /xinviec de lua chon cong viec",COLOR_RED,1099.73,-1504.67,15.800+0.5,4.0);// Ve si (benh vien LS)
    //CreateDynamic3DTextLabel("Tho thu cong \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2195.8335,-1973.0638,13.5589+0.5,4.0);// Tho thu cong (LS)
	CreateDynamic3DTextLabel("Tho thu cong \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-1356.7195,2065.3450,52.4677+0.5,4.0);// Craftsman (TR) // bo qua
	CreateDynamic3DTextLabel("Nguoi pha che \nSu dung /xinviec de lua chon cong viec",COLOR_RED,502.6696,-11.6603,1000.6797+0.5,4.0);// Nguoi pha che (Alhambra)
	CreateDynamic3DTextLabel("Nguoi pha che \nSu dung /xinviec de lua chon cong viec",COLOR_RED,-864.3550,1536.9703,22.5870+0.5,4.0);// Nguoi pha che (TR) // bo qua
    CreateDynamic3DTextLabel("Trucker \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2450.2000,-2126.0259,13.5469+0.5,4.0);// Trucker Job (LS)
    CreateDynamic3DTextLabel("Nhan vien Pizza Boy \nSu dung /xinviec de lua chon cong viec",COLOR_RED,2103.9937,-1809.6488,13.5547+0.5,4.0);// Pizza Boy Job (LS)
    CreateDynamic3DTextLabel("Tierra Robada Gant Bridge Access.",0xFFFF00AA,-2678.2702636719,2148.0134277344,55.4296875+0.6,20.0);// Border Lable
	CreateDynamic3DTextLabel("Tierra Robada Airport",0xFFFF00AA,-1873.2819824219,2172.4621582031,6.2687501907349+0.6,20.0);// Airport Lable.
	CreateDynamic3DTextLabel("Famed Locker \nType /famedlocker to access the locker", COLOR_YELLOW,901.4825,1429.7404,-82.3235+0.6,4.0); //Famed Locker
	*/
	ActorRoleplay[0] = CreateActor(22, 2071.4492, -1775.3118, 13.5580, 0.0000); //Normal Ped
	ApplyActorAnimation(ActorRoleplay[0], "PED", "IDLE_CHAT", 4.0999, 1, 0, 0, 0, 0);
	ActorRoleplay[1] = CreateActor(21, 2071.5031, -1774.6632, 13.5560, 179.6999); //Normal Ped
	ApplyActorAnimation(ActorRoleplay[1], "MISC", "IDLE_CHAT_02", 4.0999, 1, 0, 0, 0, 0);
	ActorRoleplay[2] = CreateActor(23, 2068.8337, -1776.4434, 13.5582, -86.6999); //BMXer
	//ApplyActorAnimation(ActorRoleplay[2], "SHOP", "SMOKE_RYD", 4.0999, 1, 0, 0, 0, 0);

	//ActorNguoivanchuyen = CreateActor(183,2090.7449,-2068.3030,17.3572,4.5802); // nhanvie

	CreateActor(5,2289.4475,-1743.2357,13.5469,187.0009);
	CreateDynamic3DTextLabel("{66CC66}NPC Trung Thu\nTuong Tac\n-[/traodoi]-",COLOR_YELLOW,2289.4475,-1743.2357,13.5469,4.0);
	CreateActor(3,2289.3279,-1741.2294,13.5469,1.4431);
	CreateDynamic3DTextLabel("{66CC66}NPC Trung Thu\nTuong Tac\n-[/traodoi]-",COLOR_YELLOW,2289.3279,-1741.2294,13.5469,4.0);
	CreateActor(2,2314.5154,-1742.1925,13.3828,177.1779);
	CreateDynamic3DTextLabel("{66CC66}NPC Ghep Xe Trung Thu\nTuong Tac\n-[/ghepxe]-",COLOR_YELLOW,2314.5154,-1742.1925,13.3828,4.0);

	CreatePickup(11738, 1, 1153.1519,-1334.5374,24.3027, -1);
    CreateDynamic3DTextLabel("{66CC66}Mua Med Kit Medic\n[Y]",COLOR_YELLOW,-2031.3843,-114.7203,1035.1719+0.1,4.0);
    CreatePickup(11738, 1, 1492.6620,1308.2247,1093.2933, -1);
    CreatePickup(11738, 1, 1178.0042,-1338.6444,13.9075, -1); // MD
    CreatePickup(11738, 1, 1162.6141,-1363.3646,26.6531, -1); // MD
    CreatePickup(11738, 1, 2030.3644,-1411.8820,16.9989, -1); // MD
    CreatePickup(11738, 1, 2060.1650,-1418.5410,48.3359, -1); // MD
	CreateActor(133, 2211.2983, -2664.5122, 13.5469, 3.7735);
	CreateDynamic3DTextLabel("{D7DF01}Trucker Job\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de lam viec",COLOR_YELLOW,2211.2983, -2664.5122, 13.5469,10.0);

	//ActorThothucong = 		CreateActor(78, 2425.5254,-1779.2075,13.5469,5.9820);
	CreateActor(23, 423.7474,-1890.5851,2.0241,337.3772);
	CreateDynamic3DTextLabel("{66CC66}Ngu Dan\n[Thue Thuyen Danh Ca]\n-Bam ALT de tuong tac-",COLOR_YELLOW,423.7474,-1890.5851,2.0241,4.0);
    CreateActor(23, 2789.0022,-1415.1759,16.2500,182.3808);
	CreateDynamic3DTextLabel("{66CC66}Chopper\n[Ban vu khi]\n-Bam N de tuong tac-",COLOR_YELLOW,2789.0022,-1415.1759,16.2500,4.0);
	//SetActorPos(ActorPizza, 2105.4512,-1807.8400,13.5547);
	//ActorPizza = CreateActor(155,2106.3987,-1822.6704,13.5577,174.2552);
	//ActorBuonvukhi = CreateActor(185,2354.5576,-658.5878,128.0547,281.4114);
	CreateActor(185,2354.5576,-658.5878,128.0547,281.4114);
	CreateDynamic3DTextLabel("{66CC66}Job:Tho thu cong\n\n(Y)\t{FFFF99}Cap do yeu cau:1",COLOR_YELLOW,2425.5254,-1779.2075,13.5469+0.5,4.0);// Trucker (LS)
	//CreateDynamic3DTextLabel("{66CC66}Job:Pizza\n\n(Y)\t{FFFF99}Cap do yeu cau:1",COLOR_YELLOW,2106.3987,-1822.6704,13.5577+0.5,4.0);// Pizza (LS)
	CreateActor(194,-29.0548,-186.8218,1003.5469,90.8090);
	CreateDynamic3DTextLabel("{FFFFFF}NPC\n{35C9FA}Su dung (Y)\n{EEFD28}De tuong tac",COLOR_YELLOW,-29.0548,-186.8218,1003.5469+0.5,4.0);// Pizza (LS)
	//CreateDynamicPickup(2814, 0,2095.9663,-1796.6667,13.3889, 0, 0,0); // pizza
	//CreateDynamic3DTextLabel("{FFFF00}/batdaugiaobanh",COLOR_YELLOW,2095.9663,-1796.6667,13.3889+0.5,4.0);// Pizza (LS)
    CreateDynamic3DTextLabel("",COLOR_YELLOW,-781.3433,-157.7888,65.5189+0.6,12.0); // vi tir can sa
	ApplyActorAnimation(PizzaAnim[1], "CARRY","crry_prtial", 4.0999, 1, 0, 0, 0, 0);
	//PizzaAnim[1] = CreateActor(155, 2098.9956,-1800.2728,13.3889,96.0465);
	//CreateDynamic3DTextLabel("{FFFFFF}({{66CC66}N{FFFFFF}) De tuong tac",COLOR_YELLOW,2098.9956,-1800.2728,13.3889+0.5,4.0);// Pizza (LS)
	//NGGShop

	print("[Streamer] Dynamic 3D Text Labels has been loaded.");
	return 1;
}

forward LoadStreamerDynamicButtons();
public LoadStreamerDynamicButtons()
{
    //LSPD buttons
 	/*eastin = CreateButton(253.44921875,110.59960938,1003.79998779,90.00000000); //object(fire_break) (1)
	westout = CreateButton(239.79492188,116.18457031,1003.87286377,90.00000000); //object(fire_break) (2)
	westin = CreateButton(239.32031250,116.27441406,1003.87286377,270.00000000); //object(fire_break) (3)
	eastout = CreateButton(253.00000000,110.59960938,1003.79998779,270.00000000); //
	elevator = CreateButton(275.83984375,120.94921875,1005.12280273,90.00000000); //object(kmb_keypad) (1)
	cctvin = CreateButton(264.55566406,115.97949219,1005.12280273,179.99450684); //object(kmb_keypad) (2)
	cctvout = CreateButton(264.55566406,115.69531250,1005.12280273,0.00000000); //object(kmb_keypad) (3)
	lockerin = CreateButton(267.21679688,112.40917969,1005.12280273,0.00000000); //object(kmb_keypad) (4)
	lockerout = CreateButton(267.21679688,112.66992188,1005.12280273,179.99450684); //object(kmb_keypad) (5)
	chiefout = CreateButton(232.50000000,119.38476562,1010.81384277,0.00000000); //object(sec_keypad) (2)
	chiefin = CreateButton(229.67089844,119.66992188,1010.81384277,179.99450684); //object(sec_keypad) (1)
	roofkey = CreateButton(1565.93652344,-1667.35058594,28.85165977,179.99450684); //object(sec_keypad) (3)
	garagekey = CreateButton(1567.14550781,-1689.62011719,6.69999981,0.00000000); //object(sec_keypad) (4)
 	sasdbtn1 = CreateButton(2514.59179688,-1697.05761719,563.19116211,0.00000000); //SASD West
	sasdbtn2 = CreateButton(2522.82299805,-1660.15917969,563.15893555,0.00000000); //SASD East
	sasdbtn3 = CreateButton(2525.09863281,-1697.05761719,563.16284180,0.00000000); //SASD R4
	sasdbtn4 = CreateButton(2519.84375000,-1697.00659180,563.20904541,0.00000000); //SASD R5
	sasdbtn5 = CreateButton(2514.77880859,-1660.15917969,563.16925049); //SASD R6
	
	//Noose Int Buttons
	nooseenter[0] = CreateButton(-765.87152100,2539.55102539,10021.18847847,90); //object(kmb_keypad) (5) yes entrance
    nooseenter[1] = CreateButton(-766.81298828,2539.55664062,10021.18847847,0); //object(kmb_keypad) (9) yes entrance
    radarroom[0] = CreateButton(-747.22851562,2533.17968750,10021.18847656,260);
    radarroom[1] = CreateButton(-745.98876953,2533.04150391,10021.18847656,90);
	intergate[0] = CreateButton(-765.34863281,2549.97070312,10021.18847656,90);
	intergate[1] = CreateButton(-765.13671875,2554.51660156,10020.90917969,260 );
	intergate[2] = CreateButton(-773.29394531,2546.13134766,10020.86816406,90); // Cage
	bottomroom[0] = CreateButton(-764.06152344,2566.59277344,10021.18847656, 90);
	bottomroom[1] = CreateButton(-764.51269531,2566.65332031,10021.18847656, 260);
	ncontrolroom[0] = CreateButton(-754.32763672,2538.71655273,10021.61132812, 178.50000000);
	ncontrolroom[1] = CreateButton(-752.47076416,2538.23266602,10021.00195312, 0);

	//DoC Prison Buttons
	PrisonButtons[0] = CreateButton(-2097, -191.100006, 996.299987, 90); // Control Room
	PrisonButtons[1] = CreateButton(-2092.550048, -204, 996.099975, 0); // Control Room Door 2
	PrisonButtons[2] = CreateButton(-2088.530029, -213, 996, 90); //Control Room Door 1
	PrisonButtons[3] = CreateButton(-2037, -191, 992.200012, 270); // Security Room
	PrisonButtons[4] = CreateButton(-2050.5, -205.880004, 985.599975, 0); // Staff Lounge
	PrisonButtons[5] = CreateButton(-2046.599975, -194, 985.700012, 270); // Duty Room
	PrisonButtons[6] = CreateButton(-2092.772949, -193.570007, 979.299987, 0); // Security Room 2
 	PrisonButtons[7] = CreateButton( -2054.699951, -84, 35.7, 270);
 	PrisonButtons[8] = CreateButton(-2058, -146.75, 988.7,270);

 	// Create the required buttons for the interior.
	SFPDButton[0] = CreateButton(-1635.12597656,708.45117188,19996.32812500, 180.0);
	SFPDButton[1] = CreateButton(-1635.18176270,687.56250000,19996.32812500, 180.0);
	SFPDButton[2] = CreateButton(-1636.74023438,687.56250000,19996.32812500, 180.0);
	SFPDButton[3] = CreateButton(-1636.29687500,708.36035156,19996.32812500, 270.0);
	SFPDButton[4] = CreateButton(-1627.03222656,712.46093750,19996.32812500, 0.0);
	SFPDButton[5] = CreateButton(-1627.03295898,712.63281250,19996.32812500, 180.0);
	SFPDButton[6] = CreateButton(-1614.06738281,683.54052734,19990.56250000, 270.0);
	SFPDButton[7] = CreateButton(-1612.91674805,683.60369873,19990.56250000, 0.0);
	SFPDButton[8] = CreateButton(-1632.86157227,712.62530518,19996.32812500, 180.0);
	SFPDButton[9] = CreateButton(-1632.861328125, 712.47210693359, 19996.328125, 0.0);
	
	FBILobbyLeftBTN[0] = CreateButton(297.66613770,-1498.67749023,-44.59006119,0.79565430); //Lobby Button Left
	FBILobbyLeftBTN[1] = CreateButton(297.24850464,-1498.23107910,-44.59006119,180); //Lobby Button Left
	FBILobbyRightBTN[0] = CreateButton(300.05300903,-1521.40747070,-44.59006119,180); //Lobby Button Right
	FBILobbyRightBTN[1] = CreateButton(300.16033936,-1521.84387207,-44.59006119,0); //Lobby Button Right
	FBIPrivateBTN[0] = CreateButton(298.87384033,-1495.87316895,-27.32773209,270); //Private Office Button
	FBIPrivateBTN[1] = CreateButton(300.49453735,-1495.33837891,-27.28091812,180.49487305); //Private Office Button
	
	SANewsPrivate = CreateButton(625.51953125,-3.59961796,1108.50000000,269.99450684); //object(sec_keypad) (2)
	SANewsOffice = CreateButton(614.58581543,17.78320312,1108.55004883,0); //object(sec_keypad) (3)
	SANewsStudio = CreateButton(625.50000000,-13.60000038,1108.50000000,270.00000000); //object(sec_keypad) (1)
	SANewsPrivateOPP = CreateButton(626.13519287,-0.08516422,1108.61315918,0); //object(sec_keypad) (4)  
	
	*/
	
	lockdownbutton = CreateButton(-1121.70, 4290.41, 4.88, 180.00);
	print("[Streamer] Dynamic Buttons has been loaded.");
	
	return 1;
}

forward LoadStreamerDynamicObjects();
public LoadStreamerDynamicObjects()
{
    CrateLoad = CreateDynamicObject(964,-2114.1, -1723.5, 11984.5, 0, 0, 337.994, .worldid = 0, .interiorid = 1, .streamdistance = 200); //object(cj_metal_crate) (1)
	IslandGate = CreateDynamicObject(16773,-1083.90002441,4289.70019531,14.10000038,0.00000000,0.00000000,0.00000000, .streamdistance = 400); //object(door_savhangr1) (5)

	new VIPLogo = CreateDynamicObject(19353, 1803.89, -1593.99, 14.05,   0.00, 0.00, 312.26);
	SetDynamicObjectMaterialText(VIPLogo, 0, "{842787}VIP LOUNGE", 90, "Impact", 56, 1, 0xFFFFFFFF, 0, 1);

	new FCTS = CreateDynamicObject(19482, -58.9155, -1118.4808, 7.4781, 0.0000, 0.0000, 160.3858);
	SetDynamicObjectMaterialText(FCTS, 0, "{880000}Flint County Towing Services\n{000000}CALL 1715 OR 2112", 110, "Impact", 40, 1, 0xFF000000, 0, 1);

    new vipsf = CreateObject(19353, -2455.0632, 503.8305, 32.7488, 0.1999, 31.5000, -0.0145);
	SetObjectMaterialText(vipsf, "{FF0000}G{6C6E70}v {FF0000}C{6C6E70} Group {FF38AF}VIP", 0, 130, "Times New Roman", 30,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	//interchungcu
		new floor[2];
	floor[0] = CreateDynamicObject(19377, 987.77258, 1804.96313, 814.70679,   0.00000, 90.00000, 0.00000);
	floor[1] = CreateDynamicObject(19377, 987.77258, 1804.96313, 818.20679,   0.00000, 90.00000, 0.00000);
	{
	for(new i=0;i<2;i++)
	SetDynamicObjectMaterial(floor[i], 0,  5149, "lasground2_las2", "sjmlawarwall5", 0);
	}
	//Wall//
	new wall[11];
	wall[0] = CreateDynamicObject(19447, 987.29999, 1809.69604, 816.54089,   0.00000, 0.00000, -90.00000);
	wall[1] = CreateDynamicObject(19447, 987.31927, 1800.29810, 816.54089,   0.00000, 0.00000, -90.00000);
	wall[2] = CreateDynamicObject(19447, 982.58112, 1804.94189, 816.54089,   0.00000, 0.00000, 0.00000);
	wall[3] = CreateDynamicObject(19447, 992.11151, 1805.02039, 816.54089,   0.00000, 0.00000, 0.00000);
	wall[4] = CreateDynamicObject(19447, 982.08661, 1803.32385, 816.54089,   0.00000, 0.00000, -90.00000);
	wall[5] = CreateDynamicObject(19447, 994.76080, 1802.97754, 816.54089,   0.00000, 0.00000, -90.00000);
	wall[6] = CreateDynamicObject(19437, 986.81561, 1804.14795, 816.54089,   0.00000, 0.00000, 0.00000);
	wall[7] = CreateDynamicObject(19437, 986.81561, 1805.74792, 816.54089,   0.00000, 0.00000, 0.00000);
	wall[8] = CreateDynamicObject(19393, 986.81561, 1808.13757, 816.54089,   0.00000, 0.00000, 0.00000);
	wall[9] = CreateDynamicObject(19393, 985.66962, 1801.75073, 816.64093,   0.00000, 0.00000, 0.00000);
	wall[10] = CreateDynamicObject(19437, 985.67761, 1801.63611, 814.12091,   90.00000, 0.00000, 0.00000);
	{
	for(new i=0;i<11;i++)
	SetDynamicObjectMaterial(wall[i], 0,  18265, "w_town3cs_t", "ws_redbrickold", 0);
	}
	///door//
	new door[2];
	door[0] = CreateDynamicObject(1502, 986.85028, 1807.38745, 814.77179,   0.00000, 0.00000, 90.00000);
	door[1] = CreateDynamicObject(1502, 985.68640, 1801.01489, 814.87183,   0.00000, 0.00000, 90.00000);
	{
	for(new i=0;i<2;i++)
	SetDynamicObjectMaterial(door[i], 1,  11631, "mp_ranchcut", "CJ_SLATEDWOOD", 0);
	}
	//wood//
	new wood[2];
	wood[0] = CreateDynamicObject(1744, 992.18518, 1804.46240, 816.64618,   0.00000, 0.00000, -90.00000);
	wood[1] = CreateDynamicObject(2329, 983.20142, 1808.13855, 814.70422,   0.00000, 0.00000, 0.00000);
	{
	for(new i=0;i<2;i++)
	SetDynamicObjectMaterial(wood[i], 0,  3924, "rc_warhoose", "Gen_Scaffold_Wood_Under", 0);
	}
	//sink//
	new sink[1];
	sink[0] = CreateDynamicObject(2136, 991.53992, 1803.55261, 814.74438,   0.00000, 0.00000, 180.47990);
	{
	for (new i=0;i<1;i++)
	SetDynamicObjectMaterial(sink[0], 1,  16150, "ufo_bar", "des_ghotwood1", 0);
	SetDynamicObjectMaterial(sink[0], 4,  1637, "od_beachstuff", "wood02", 0);
	}


	///
	CreateDynamicObject(1498, 992.09027, 1800.86646, 814.75177,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 989.49329, 1809.60681, 817.03259,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1893, 988.57727, 1805.71826, 818.49377,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19813, 987.17297, 1809.60547, 815.02252,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2525, 983.08948, 1801.83435, 814.80109,   0.00000, 0.06000, 90.00000);
	CreateDynamicObject(14752, 990.33789, 1809.44678, 817.21863,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14752, 988.71790, 1809.44678, 817.21863,   0.00000, 0.00000, 90.00000);
// cityhall
		new pillar_cityhall[57];

	pillar_cityhall[0] = CreateDynamicObject(7606, 2401.2141, 2623.3748, 1041.8434, 0.0000, 180.0000, -89.9999);
	pillar_cityhall[1] = CreateDynamicObject(7606, 2396.3435, 2623.3748, 1041.8434, 0.0000, 180.0000, -89.9999);
	pillar_cityhall[2] = CreateDynamicObject(7606, 2411.773682, 2623.374756, 1052.1479, -0.000051, 360.000000, 0.000160);
	pillar_cityhall[3] = CreateDynamicObject(7606, 2411.773682, 2623.374756, 1052.1479, -0.000051, 360.000000, -89.999840);
	pillar_cityhall[4] = CreateDynamicObject(7606, 2411.778076, 2628.754150, 1052.1479, -0.000044, 360.000000, -89.999863);
	pillar_cityhall[5] = CreateDynamicObject(7606, 2411.773682, 2623.374756, 1041.843384, -0.000051, 180.000000, 0.000160);
	pillar_cityhall[6] = CreateDynamicObject(7606, 2411.773682, 2623.374756, 1041.843384, -0.000051, 180.000000, -89.999840);
	pillar_cityhall[7] = CreateDynamicObject(7606, 2405.009521, 2628.754150, 1052.1479, -0.000044, 360.000000, -89.999863);
	pillar_cityhall[8] = CreateDynamicObject(7606, 2405.009521, 2628.754150, 1041.847900, -0.000044, 540.000000, -89.999863);
	pillar_cityhall[9] = CreateDynamicObject(7606, 2401.214111, 2623.374756, 1052.1479, -0.000036, 360.000000, -89.999886);
	pillar_cityhall[10] = CreateDynamicObject(7606, 2411.879639, 2614.657959, 1052.1479, -0.000035, 360.000000, 180.000061);
	pillar_cityhall[11] = CreateDynamicObject(7606, 2412.374268, 2614.660156, 1041.7834, -0.000050, 180.000000, 270.000153);
	pillar_cityhall[12] = CreateDynamicObject(7606, 2398.777832, 2628.754150, 1052.1479, -0.000044, 360.000000, -89.999863);
	pillar_cityhall[13] = CreateDynamicObject(7606, 2418.414795, 2617.737061, 1052.1479, -0.000050, 360.000000, -179.999725);
	pillar_cityhall[14] = CreateDynamicObject(7606, 2398.777832, 2628.754150, 1041.847900, -0.000044, 540.000000, -89.999863);
	pillar_cityhall[15] = CreateDynamicObject(7606, 2401.768555, 2635.354248, 1052.1479, -0.000043, 360.000000, -89.999863);
	pillar_cityhall[16] = CreateDynamicObject(7606, 2396.343506, 2623.374756, 1052.1479, -0.000029, 360.000000, -89.999908);
	pillar_cityhall[17] = CreateDynamicObject(7606, 2398.763916, 2614.683838, 1041.843384, -0.000028, 180.000000, 0.000091);
	pillar_cityhall[18] = CreateDynamicObject(7606, 2398.763916, 2614.683838, 1041.843384, -0.000036, 180.000000, -89.999886);
	pillar_cityhall[19] = CreateDynamicObject(7606, 2385.81641, 2628.56909, 1052.86804,   -0.00004, 360.00000, 0.00014);
	pillar_cityhall[20] = CreateDynamicObject(7606, 2398.763916, 2614.683838, 1052.1479, -0.000028, 360.000000, 0.000091);
	pillar_cityhall[21] = CreateDynamicObject(7606, 2418.414795, 2611.714844, 1052.1479, -0.000050, 360.000000, -179.999725);
	pillar_cityhall[22] = CreateDynamicObject(7606, 2411.873779, 2618.302002, 1031.843384, -0.000050, 180.000000, 0.000159);
	pillar_cityhall[23] = CreateDynamicObject(7606, 2395.746338, 2635.354248, 1052.1479, -0.000043, 360.000000, -89.999863);
	pillar_cityhall[24] = CreateDynamicObject(7606, 2392.530518, 2628.754150, 1052.1479, -0.000036, 360.000000, -89.999886);
	pillar_cityhall[25] = CreateDynamicObject(7606, 2392.530518, 2628.754150, 1041.847900, -0.000036, 540.000000, -89.999886);
	pillar_cityhall[26] = CreateDynamicObject(7606, 2411.759521, 2605.927734, 1052.1479, -0.000035, 360.000000, 90.000053);
	pillar_cityhall[27] = CreateDynamicObject(7606, 2411.759521, 2605.927734, 1052.1479, -0.000035, 360.000000, 180.000061);
	pillar_cityhall[28] = CreateDynamicObject(7606, 2411.759521, 2605.927734, 1041.843384, -0.000035, 180.000000, 180.000061);
	pillar_cityhall[29] = CreateDynamicObject(7606, 2411.759521, 2605.927734, 1041.843384, -0.000035, 180.000000, 90.000053);
	pillar_cityhall[30] = CreateDynamicObject(7606, 2411.873779, 2611.001465, 1031.843384, -0.000050, 180.000000, 0.000159);
	pillar_cityhall[31] = CreateDynamicObject(7606, 2401.216553, 2605.927734, 1052.1479, -0.000020, 360.000000, 90.000008);
	pillar_cityhall[32] = CreateDynamicObject(7606, 2401.216553, 2605.927734, 1041.843384, -0.000021, 180.000000, 90.000008);
	pillar_cityhall[33] = CreateDynamicObject(7606, 2396.345947, 2605.927734, 1052.1479, -0.000028, 360.000000, 90.000031);
	pillar_cityhall[34] = CreateDynamicObject(7606, 2396.345947, 2605.927734, 1041.843384, -0.000028, 180.000000, 90.000031);
	pillar_cityhall[35] = CreateDynamicObject(7606, 2385.640537, 2623.374756, 1052.1479, -0.000043, 360.000000, 0.000137);
	pillar_cityhall[36] = CreateDynamicObject(7606, 2385.800537, 2623.374756, 1052.1479, -0.000043, 360.000000, -89.999863);
	pillar_cityhall[37] = CreateDynamicObject(7606, 2385.800537, 2623.374756, 1041.843384, -0.000043, 180.000000, -89.999863);
	pillar_cityhall[38] = CreateDynamicObject(7606, 2385.800537, 2623.374756, 1041.843384, -0.000043, 180.000000, 0.000137);
	pillar_cityhall[39] = CreateDynamicObject(7606, 2411.755127, 2600.548340, 1052.1479, -0.000028, 360.000000, 180.000031);
	pillar_cityhall[40] = CreateDynamicObject(7606, 2411.755127, 2600.548340, 1052.1479, -0.000028, 360.000000, 90.000031);
	pillar_cityhall[41] = CreateDynamicObject(7606, 2385.640537, 2618.294189, 1052.858398, -0.000043, 360.000000, 0.000136);
	pillar_cityhall[42] = CreateDynamicObject(7606, 2385.800537, 2618.294189, 1041.843384, -0.000043, 180.000000, 0.000136);
	pillar_cityhall[43] = CreateDynamicObject(7606, 2405.029541, 2600.548340, 1052.1479, -0.000028, 360.000000, 90.000031);
	pillar_cityhall[44] = CreateDynamicObject(7606, 2405.029541, 2600.548340, 1041.847900, -0.000028, 540.000000, 90.000031);
	pillar_cityhall[45] = CreateDynamicObject(7606, 2398.782227, 2600.548340, 1052.1479, -0.000036, 360.000000, 90.000053);
	pillar_cityhall[46] = CreateDynamicObject(7606, 2398.782227, 2600.548340, 1041.847900, -0.000036, 540.000000, 90.000053);
	pillar_cityhall[47] = CreateDynamicObject(7606, 2385.640537, 2611.023682, 1052.1479, -0.000043, 360.000000, 0.000136);
	pillar_cityhall[48] = CreateDynamicObject(7606, 2385.800537, 2611.023682, 1041.843384, -0.000043, 180.000000, 0.000136);
	pillar_cityhall[49] = CreateDynamicObject(7606, 2392.550537, 2600.548340, 1052.1479, -0.000036, 360.000000, 90.000053);
	pillar_cityhall[50] = CreateDynamicObject(7606, 2392.550537, 2600.548340, 1041.847900, -0.000036, 540.000000, 90.000053);
	pillar_cityhall[51] = CreateDynamicObject(7606, 2385.786377, 2605.927734, 1052.1479, -0.000043, 360.000000, 90.000076);
	pillar_cityhall[52] = CreateDynamicObject(7606, 2385.786377, 2605.927734, 1041.843384, -0.000043, 180.000000, 90.000076);
	pillar_cityhall[53] = CreateDynamicObject(7606, 2385.786377, 2605.927734, 1041.843384, -0.000043, 180.000000, 180.000076);
	pillar_cityhall[54] = CreateDynamicObject(7606, 2401.816162, 2593.912109, 1052.1479, -0.000043, 360.000000, 90.000076);
	pillar_cityhall[55] = CreateDynamicObject(7606, 2395.793945, 2593.912109, 1052.1479, -0.000043, 360.000000, 90.000076);
	pillar_cityhall[56] = CreateDynamicObject(7606, 2385.781982, 2600.548340, 1052.1479, -0.000036, 360.000000, 180.000061);


	for(new i=0;i<57;i++)
	{
		SetDynamicObjectMaterial(pillar_cityhall[i], 0, 14748, "sfhsm1", "ah_pnwainscot6");
		SetDynamicObjectMaterial(pillar_cityhall[i], 1, 14748, "sfhsm1", "ah_pnwainscot6");
	}
	////// Tham Do City Hall//////////
	new redflood_cityhall[23];
	 redflood_cityhall[0]= CreateDynamicObject(19458, 2411.557129, 2614.627686, 1043.086670, 0.000000, 270.000000, 0.000022);
	 redflood_cityhall[1]= CreateDynamicObject(19458, 2398.544189, 2628.254395, 1044.986694, 0.000022, 270.000000, 179.999893);
	 redflood_cityhall[2]= CreateDynamicObject(19458, 2399.014648, 2621.724365, 1043.086670, 0.000022, 270.000000, 179.999939);
	 redflood_cityhall[3]= CreateDynamicObject(19458, 2398.544189, 2621.724365, 1043.076660, 0.000022, 270.000000, 179.999939);
	 redflood_cityhall[4]= CreateDynamicObject(19458, 2403.488037, 2615.158203, 1043.086670, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[5]= CreateDynamicObject(14407, 2398.790283, 2621.622314, 1041.881592, 0.000000, -0.000007, 179.999954);
	 redflood_cityhall[6]= CreateDynamicObject(19458, 2403.488037, 2614.127197, 1043.076660, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[7]= CreateDynamicObject(14407, 2394.377686, 2626.061279, 1044.1425, -0.000007, 0.000000, -89.999977);
	 redflood_cityhall[8]= CreateDynamicObject(19458, 2393.858154, 2615.158203, 1043.086670, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[9]= CreateDynamicObject(19458, 2393.858154, 2614.127197, 1043.076660, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[10]= CreateDynamicObject(19458, 2399.015869, 2607.578125, 1043.076660, 0.000019, 270.000000, -0.000075);
	 redflood_cityhall[11]= CreateDynamicObject(19458, 2398.545410, 2607.568848, 1043.086670, 0.000019, 270.000000, -0.000075);
	 redflood_cityhall[12]= CreateDynamicObject(14407, 2398.769775, 2607.680176, 1041.881592, 0.000000, 0.000000, -0.000061);
	 redflood_cityhall[13]= CreateDynamicObject(14407, 2403.182373, 2603.241211, 1044.1425, 0.000000, 0.000000, 89.999939);
	 redflood_cityhall[14]= CreateDynamicObject(19458, 2399.015869, 2601.048096, 1044.986694, 0.000020, 270.000000, -0.000121);
	 redflood_cityhall[15]= CreateDynamicObject(19458, 2398.575439, 2601.048096, 1044.996704, 0.000020, 270.000000, -0.000121);
	 redflood_cityhall[16]= CreateDynamicObject(14407, 2394.356689, 2603.264404, 1044.1425, 0.000000, 0.000000, -90.000031);
	 redflood_cityhall[17]= CreateDynamicObject(19458, 2384.228271, 2615.158203, 1043.086670, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[18]= CreateDynamicObject(19458, 2384.228271, 2614.127197, 1043.076660, 0.000000, 270.000000, -89.999977);
	 redflood_cityhall[19]= CreateDynamicObject(19458, 2398.984619, 2628.254395, 1044.996704, 0.000022, 270.000000, 179.999893);
	 redflood_cityhall[20] = CreateDynamicObject(19458, 2396.3435, 2623.3748, 1041.8434, 0.0000, 180.0000, -89.9999);
	 redflood_cityhall[21] = CreateDynamicObject(19458, 2401.2141, 2623.3748, 1041.8434, 0.0000, 180.0000, -89.9999);
	 redflood_cityhall[22]= CreateDynamicObject(19458, 2384.228271, 2615.158203, 1043.086670, 0.000000, 270.000000, -89.999977);

	 for(new i=0;i<23;i++)
	{
	SetDynamicObjectMaterial(redflood_cityhall[i], 0, 14771, "int_brothelint3", "carpbroth1");
	}
	//////////////////////////////Light///////////////////////////////////////////
	new light_cityhall[26];
	light_cityhall[0] = CreateDynamicObject(2660, 2409.415771, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[1]= CreateDynamicObject(2660, 2415.038330, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[2] = CreateDynamicObject(2660, 2404.561768, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[3] = CreateDynamicObject(2660, 2408.082275, 2631.775879, 1050.7787, 89.999992, 89.999992, -89.999992);
	light_cityhall[4] = CreateDynamicObject(2660, 2415.038330, 2619.819092, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[5] = CreateDynamicObject(2660, 2403.289551, 2631.775879, 1050.7787, 89.999992, 89.999992, -89.999992);
	light_cityhall[6] = CreateDynamicObject(2660, 2398.976318, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[7] = CreateDynamicObject(2660, 2415.038330, 2614.595947, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[8] = CreateDynamicObject(2660, 2398.615967, 2631.775879, 1050.7787, 89.999992, 89.999992, -89.999992);
	light_cityhall[9] = CreateDynamicObject(2660, 2415.038330, 2610.172607, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[10] = CreateDynamicObject(2660, 2393.364746, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[11] = CreateDynamicObject(2660, 2393.605469, 2631.775879, 1050.7787, 89.999992, 89.999992, -89.999992);
	light_cityhall[12] = CreateDynamicObject(2660, 2389.437256, 2626.207520, 1050.7787, 89.999992, 154.471222, -64.471199);
	light_cityhall[13] = CreateDynamicObject(2660, 2409.415771, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[14] = CreateDynamicObject(2660, 2388.872070, 2631.775879, 1050.7787, 89.999992, 89.999992, -89.999992);
	light_cityhall[15] = CreateDynamicObject(2660, 2415.038330, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[16] = CreateDynamicObject(2660, 2404.561768, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[17] = CreateDynamicObject(2660, 2398.976318, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[18] = CreateDynamicObject(2660, 2415.038330, 2600.178467, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[19] = CreateDynamicObject(2660, 2393.364746, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[20] = CreateDynamicObject(2660, 2408.082275, 2597.544922, 1050.7787, 89.999992, 89.999992, -89.999977);
	light_cityhall[21] = CreateDynamicObject(2660, 2403.289551, 2597.544922, 1050.7787, 89.999992, 89.999992, -89.999977);
	light_cityhall[22] = CreateDynamicObject(2660, 2389.437256, 2603.750732, 1050.7787, 89.999992, 135.000000, -44.999992);
	light_cityhall[23] = CreateDynamicObject(2660, 2398.615967, 2597.544922, 1050.7787, 89.999992, 89.999992, -89.999977);
	light_cityhall[24] = CreateDynamicObject(2660, 2393.605469, 2597.544922, 1050.7787, 89.999992, 89.999992, -89.999977);
	light_cityhall[25] = CreateDynamicObject(2660, 2388.872070, 2597.544922, 1050.7787, 89.999992, 89.999992, -89.999977);
	 for(new i=0;i<26;i++)
	{
	SetDynamicObjectMaterial(light_cityhall[i], 0, 14581, "ab_mafiasuitea", "ab_blind");
	}
	/////////////////////////////////////////////wall/////////////
	new wall_cityhall[72];
	/////////////object 14722 //////////////////
	wall_cityhall[0] = CreateDynamicObject(14722, 2404.662354, 2624.528809, 1045.4533, 0.000007, -0.000005, 89.999863);
	wall_cityhall[1] = CreateDynamicObject(14722, 2405.341309, 2622.198730, 1045.4533, -0.000021, -0.000007, -90.000076);
	wall_cityhall[2] = CreateDynamicObject(14722, 2412.920166, 2619.921143, 1045.4533, -0.000036, 0.000015, -0.000061);
	wall_cityhall[3] = CreateDynamicObject(14722, 2410.590088, 2618.080566, 1045.4533, 0.000022, -0.000028, 179.999649);
	wall_cityhall[4] = CreateDynamicObject(14722, 2401.510498, 2627.589844, 1045.4533, -0.000037, -0.000007, -90.000031);
	wall_cityhall[5] = CreateDynamicObject(14722, 2402.260986, 2629.919678, 1045.4533, 0.000009, -0.000006, 89.999832);
	wall_cityhall[6] = CreateDynamicObject(14722, 2410.590088, 2612.540527, 1045.4533, 0.000022, -0.000036, 179.999603);
	wall_cityhall[7] = CreateDynamicObject(14722, 2396.009033, 2629.919678, 1045.4533, 0.000001, -0.000006, 89.999855);
	wall_cityhall[8] = CreateDynamicObject(14722, 2412.920166, 2611.231445, 1045.4533, -0.000036, 0.000023, -0.000061);
	wall_cityhall[9] = CreateDynamicObject(14722, 2395.258545, 2627.589844, 1045.4533, -0.000029, -0.000007, -90.000053);
	wall_cityhall[10] = CreateDynamicObject(14722, 2410.590088, 2609.359863, 1045.4533, 0.000022, -0.000036, 179.999603);
	wall_cityhall[11] = CreateDynamicObject(14722, 2392.911621, 2622.198730, 1045.4533, -0.000029, -0.000007, -90.000053);
	wall_cityhall[12] = CreateDynamicObject(14722, 2392.381836, 2624.528809, 1045.4533, 0.000015, -0.000005, 89.999840);
	wall_cityhall[13] = CreateDynamicObject(14722, 2407.648682, 2607.103760, 1045.4533, -0.000006, -0.000006, 89.999817);
	wall_cityhall[14] = CreateDynamicObject(14722, 2404.647949, 2607.103760, 1045.4533, -0.000006, -0.000006, 89.999817);
	wall_cityhall[15] = CreateDynamicObject(14722, 2389.910889, 2622.198730, 1045.4533, -0.000029, -0.000007, -90.000053);
	wall_cityhall[16] = CreateDynamicObject(14722, 2389.231934, 2624.528809, 1045.4533, 0.000015, -0.000005, 89.999840);
	wall_cityhall[17] = CreateDynamicObject(14722, 2408.327637, 2604.773682, 1045.4533, -0.000007, -0.000006, -90.000061);
	wall_cityhall[18] = CreateDynamicObject(14722, 2401.551025, 2599.382813, 1045.4533, -0.000006, -0.000006, -90.000092);
	wall_cityhall[19] = CreateDynamicObject(14722, 2396.049561, 2601.712646, 1045.4533, -0.000029, -0.000007, 89.999886);
	wall_cityhall[20] = CreateDynamicObject(14722, 2389.218018, 2607.103760, 1045.4533, -0.000013, -0.000006, 89.999840);
	wall_cityhall[21] = CreateDynamicObject(14722, 2389.747803, 2604.773682, 1045.4533, 0.000000, -0.000005, -90.000084);
	wall_cityhall[22] = CreateDynamicObject(14722, 2395.299072, 2599.382813, 1045.4533, 0.000001, -0.000006, -90.000114);
	wall_cityhall[23] = CreateDynamicObject(14722, 2405.177734, 2604.773682, 1045.4533, -0.000007, -0.000006, -90.000061);
	wall_cityhall[24] = CreateDynamicObject(14722, 2402.301514, 2601.712646, 1045.4533, -0.000021, -0.000006, 89.999863);
	wall_cityhall[25] = CreateDynamicObject(14722, 2392.218750, 2607.103760, 1045.4533, -0.000013, -0.000006, 89.999840);
	wall_cityhall[26] = CreateDynamicObject(14722, 2392.897705, 2604.773682, 1045.4533, 0.000000, -0.000005, -90.000084);
	wall_cityhall[27] = CreateDynamicObject(14722, 2408.36133, 2622.19873, 1045.4533,   0.00000, 0.00000, -90.00010);
	wall_cityhall[28] = CreateDynamicObject(19445, 2406.486084, 2623.103760, 1044.8569, 0.000014, 0.000000, 89.999954);
	wall_cityhall[29] = CreateDynamicObject(19426, 2412.348145, 2618.814697, 1044.8569, 0.000022, 0.000014, 89.999962);
	wall_cityhall[30] = CreateDynamicObject(19445, 2393.562012, 2628.458008, 1044.8569, 0.000014, 0.000000, 89.999954);
	wall_cityhall[31] = CreateDynamicObject(19445, 2391.062256, 2623.666992, 1044.8569, 0.000014, 0.000000, 89.999954);
	wall_cityhall[32] = CreateDynamicObject(19445, 2391.072266, 2623.103760, 1044.8569, 0.000022, 0.000000, 89.999931);
	wall_cityhall[33] = CreateDynamicObject(19445, 2421.607178, 2610.013428, 1044.8569, 0.000014, 0.000000, 179.999954);
	wall_cityhall[34] = CreateDynamicObject(19445, 2406.497559, 2606.183105, 1044.8569, 0.000006, 0.000000, -89.999992);
	wall_cityhall[35] = CreateDynamicObject(19445, 2421.797363, 2620.873535, 1044.8569, 0.000014, 0.000000, 269.999939);
	wall_cityhall[36] = CreateDynamicObject(19445, 2421.616943, 2619.282959, 1044.8569, 0.000014, 0.000000, 179.999954);
	wall_cityhall[37] = CreateDynamicObject(19445, 2411.588135, 2605.730225, 1044.8569, 0.000022, 0.000014, -0.000037);
	wall_cityhall[38] = CreateDynamicObject(19445, 2406.486572, 2605.642578, 1044.8569, 0.000014, 0.000000, -90.000015);
	wall_cityhall[39] = CreateDynamicObject(19445, 2421.797363, 2608.511963, 1044.8569, 0.000014, 0.000000, 269.999939);
	wall_cityhall[40] = CreateDynamicObject(19426, 2412.308105, 2610.461670, 1044.8569, 0.000022, 0.000014, 89.999962);
	wall_cityhall[41] = CreateDynamicObject(19445, 2391.056152, 2606.183105, 1044.8569, 0.000014, 0.000000, -90.000015);
	wall_cityhall[42] = CreateDynamicObject(19445, 2391.056152, 2605.642578, 1044.8569, 0.000014, 0.000000, -90.000015);
	wall_cityhall[43] = CreateDynamicObject(19445, 2386.028809, 2623.569092, 1044.8569, 0.000029, -0.000014, 179.999786);
	wall_cityhall[44] = CreateDynamicObject(19445, 2404.044189, 2600.840820, 1044.8569, 0.000014, 0.000000, -90.000015);
	wall_cityhall[45] = CreateDynamicObject(19445, 2386.028809, 2605.768066, 1044.8569, 0.000029, -0.000014, 179.999786);
	wall_cityhall[46] = CreateDynamicObject(19445, 2418.144287, 2623.274414, 1049.0963, -0.000016, 360.000000, 179.999771);
	wall_cityhall[47] = CreateDynamicObject(19445, 2406.685791, 2635.083740, 1049.0963, -0.000009, 360.000000, -90.000099);
	wall_cityhall[48] = CreateDynamicObject(19445, 2401.129395, 2625.122803, 1041.786377, 0.000007, -0.000007, 179.999924);
	wall_cityhall[49] = CreateDynamicObject(19445, 2401.107422, 2620.323730, 1041.028687, -34.300014, -0.000024, 179.999741);
	wall_cityhall[50] = CreateDynamicObject(19445, 2411.977295, 2614.086182, 1041.796631, 0.000006, 360.000000, 0.000007);
	wall_cityhall[51] = CreateDynamicObject(19445, 2412.727539, 2614.086182, 1041.796631, 0.000006, 360.000000, 0.000007);
	wall_cityhall[52] = CreateDynamicObject(19445, 2396.456787, 2625.122803, 1041.786377, 0.000007, -0.000007, 179.999924);
	wall_cityhall[53] = CreateDynamicObject(19445, 2419.009277, 2614.254639, 1049.0963, 0.000014, 360.000000, 179.999863);
	wall_cityhall[54] = CreateDynamicObject(19445, 2396.464355, 2620.323730, 1041.028687, -34.300014, -0.000023, 179.999741);
	wall_cityhall[55] = CreateDynamicObject(19445, 2401.095703, 2608.978760, 1041.028687, -34.300014, -0.000014, -0.000269);
	wall_cityhall[56] = CreateDynamicObject(19445, 2418.144287, 2606.177002, 1049.0963, -0.000016, 360.000000, 179.999771);
	wall_cityhall[57] = CreateDynamicObject(19445, 2396.452637, 2608.978760, 1041.028687, -34.300014, -0.000014, -0.000269);
	wall_cityhall[58] = CreateDynamicObject(19445, 2419.009277, 2604.624756, 1049.0963, 0.000014, 360.000000, 179.999863);
	wall_cityhall[59] = CreateDynamicObject(19445, 2401.103271, 2604.179688, 1041.786377, 0.000006, 0.000000, -0.000091);
	wall_cityhall[60] = CreateDynamicObject(19445, 2386.017090, 2623.572754, 1049.0963, 0.000013, 360.000000, -0.000152);
	wall_cityhall[61] = CreateDynamicObject(19445, 2387.6660, 2635.083740, 1049.0963, -0.000009, 360.000000, -90.000099);
	wall_cityhall[62] = CreateDynamicObject(19445, 2417.007324, 2600.821045, 1049.0963, 0.000029, 360.000000, 89.999847);
	wall_cityhall[63] = CreateDynamicObject(19445, 2396.430664, 2604.179688, 1041.786377, 0.000006, 0.000000, -0.000091);
	wall_cityhall[64] = CreateDynamicObject(19445, 2416.76587, 2628.46997, 1049.09631,   -0.00001, 360.00000, -90.00010);
	wall_cityhall[65] = CreateDynamicObject(19445, 2411.431641, 2595.343994, 1052.974854, 0.000013, 180.000000, -0.000061);
	wall_cityhall[66] = CreateDynamicObject(19445, 2401.11890, 2628.46094, 1044.85693,   0.00000, 0.00000, 90.00000);
	wall_cityhall[67] = CreateDynamicObject(19445, 2386.017090, 2605.753418, 1049.0963, 0.000012, 360.000000, -0.000151);
	wall_cityhall[68] = CreateDynamicObject(19445, 2409.9765, 2594.182617, 1049.0963, -0.000009, 360.000000, 89.999840);
	wall_cityhall[69] = CreateDynamicObject(19445, 2390.876709, 2594.182617, 1049.0963, -0.000009, 360.000000, 89.999840);
	wall_cityhall[70] = CreateDynamicObject(19445, 2394.13843, 2600.84082, 1044.8569,   0.00000, 0.00000, -90.00000);
	wall_cityhall[71] = CreateDynamicObject(19445, 2411.6157, 2623.5530, 1044.8569,   0.00000, 0.00000, 0.00000);

	for(new i=0;i<72;i++)
	{
	SetDynamicObjectMaterial(wall_cityhall[i], 0, 14748, "sfhsm1", "ah_pnwainscot6");
	}
	////////////////////////////flooor//////////////////////////////////
	new floor_cityhall[36];
	floor_cityhall[0] = CreateDynamicObject(19379, 2391.23071, 2618.27124, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[1] = CreateDynamicObject(19379, 2401.70190, 2618.31250, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[2] = CreateDynamicObject(19379, 2412.16187, 2618.31348, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[3] = CreateDynamicObject(19379, 2422.66479, 2618.31348, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[4] = CreateDynamicObject(19379, 2386.81689, 2601.26953, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[5] = CreateDynamicObject(19379, 2401.70190, 2608.79126, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[6] = CreateDynamicObject(19379, 2412.16187, 2608.79126, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[7] = CreateDynamicObject(19379, 2422.66479, 2608.75122, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[8] = CreateDynamicObject(19379, 2391.23071, 2608.79126, 1043.05347,   0.00000, 90.00000, 0.00000);
	floor_cityhall[9] = CreateDynamicObject(19379, 2386.81689, 2593.92627, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[10] = CreateDynamicObject(19379, 2397.29102, 2595.66992, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[11] = CreateDynamicObject(19379, 2407.74268, 2595.66992, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[12] = CreateDynamicObject(19379, 2410.76416, 2601.24683, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[13] = CreateDynamicObject(19379, 2421.23828, 2601.24683, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[14] = CreateDynamicObject(19379, 2416.94604, 2620.42969, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[15] = CreateDynamicObject(19379, 2416.94604, 2610.85327, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[16] = CreateDynamicObject(19379, 2416.94604, 2630.02368, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[17] = CreateDynamicObject(19379, 2410.73364, 2628.40479, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[18] = CreateDynamicObject(19379, 2410.73364, 2637.01929, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[19] = CreateDynamicObject(19379, 2400.24854, 2633.79517, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[20] = CreateDynamicObject(19379, 2390.03125, 2633.79517, 1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[21] = CreateDynamicObject(19379, 2386.81226, 2628.60327,  1047.2388,   0.00000, 90.00000, 0.00000);
	floor_cityhall[22] = CreateDynamicObject(14407, 2403.221436, 2625.714600, 1044.1268, 0.000007, 0.000000, 89.999916);
	floor_cityhall[23] = CreateDynamicObject(14407, 2403.221436, 2626.454590, 1044.1268, 0.000007, 0.000000, 89.999916);
	floor_cityhall[24] = CreateDynamicObject(14407, 2399.050537, 2621.627197, 1041.876587, 0.000000, -0.000007, 179.999954);
	floor_cityhall[25] = CreateDynamicObject(14407, 2398.510010, 2621.627197, 1041.876587, 0.000000, -0.000007, 179.999954);
	floor_cityhall[26] = CreateDynamicObject(14407, 2394.359619, 2625.714844, 1044.1268, -0.000007, 0.000000, -89.999977);
	floor_cityhall[27] = CreateDynamicObject(14407, 2394.359619, 2626.454834, 1044.1268, -0.000007, 0.000000, -89.999977);
	floor_cityhall[28] = CreateDynamicObject(14407, 2399.050049, 2607.675293, 1041.876587, 0.000000, 0.000000, -0.000061);
	floor_cityhall[29] = CreateDynamicObject(14407, 2398.509521, 2607.675293, 1041.876587, 0.000000, 0.000000, -0.000061);
	floor_cityhall[30] = CreateDynamicObject(14407, 2403.200439, 2603.587646, 1044.1268, 0.000000, 0.000000, 89.999939);
	floor_cityhall[31] = CreateDynamicObject(14407, 2403.200439, 2602.847656, 1044.1268, 0.000000, 0.000000, 89.999939);
	floor_cityhall[32] = CreateDynamicObject(14407, 2394.338623, 2603.587891, 1044.1268, 0.000000, 0.000000, -90.000031);
	floor_cityhall[33] = CreateDynamicObject(14407, 2394.338623, 2602.847900, 1044.1268, 0.000000, 0.000000, -90.000031);
	floor_cityhall[34] = CreateDynamicObject(19379, 2399.14331, 2601.03711, 1044.98328,   0.00000, 90.00000, 0.00000);
	floor_cityhall[35] = CreateDynamicObject(19379, 2398.41382, 2628.35425, 1044.98328,   0.00000, 90.00000, 0.00000);
	for(new i=0;i<36;i++)
	{
		SetDynamicObjectMaterial(floor_cityhall[i], 0, 14750, "sfhsm2", "wallpnice06");
	}
	//////////////////roof////////////////////////////
	new roof_cityhall[31];
	roof_cityhall[0] = CreateDynamicObject(19646, 2386.322021, 2614.648438, 1053.6232, 0.000000, 179.999985, -179.999985);
	roof_cityhall[1] = CreateDynamicObject(19376, 2405.69458, 2604.86914, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[2] = CreateDynamicObject(19376, 2416.19556, 2604.86914, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[3] = CreateDynamicObject(19376, 2395.31006, 2604.86914, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[4] = CreateDynamicObject(19376, 2384.86060, 2604.86914, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[5] = CreateDynamicObject(19376, 2384.86060, 2595.34180, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[6] = CreateDynamicObject(19376, 2395.31006, 2595.34180, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[7] = CreateDynamicObject(19376, 2405.69458, 2595.34180, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[8] = CreateDynamicObject(19376, 2416.19556, 2595.34180, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[9] = CreateDynamicObject(19376, 2395.31006, 2624.41211, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[10] = CreateDynamicObject(19376, 2384.86060, 2624.41211, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[11] = CreateDynamicObject(19376, 2405.73926, 2624.41211, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[12] = CreateDynamicObject(19376, 2416.19556, 2623.97217, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[13] = CreateDynamicObject(19376, 2416.17627, 2633.61938, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[14] = CreateDynamicObject(19376, 2405.73926, 2633.97949, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[15] = CreateDynamicObject(19376, 2395.31006, 2633.97949, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[16] = CreateDynamicObject(19376, 2384.86060, 2633.97949, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[17] = CreateDynamicObject(19376, 2416.19556, 2614.37012, 1050.9270,   0.00000, 90.00000, 0.00000);
	roof_cityhall[18] = CreateDynamicObject(19445, 2397.753906, 2621.053955, 1050.9290, 0.000007, 89.999992, -0.000182);
	roof_cityhall[19] = CreateDynamicObject(19445, 2397.753906, 2611.424072, 1050.9290, 0.000008, 89.999992, -0.000183);
	roof_cityhall[20] = CreateDynamicObject(19445, 2399.614014, 2621.053955, 1050.9290, 0.000008, 89.999992, -0.000183);
	roof_cityhall[21] = CreateDynamicObject(19445, 2399.614014, 2611.424072, 1050.9290, 0.000008, 89.999992, -0.000183);
	roof_cityhall[22] = CreateDynamicObject(19376, 2416.76245, 2609.41602, 1046.6892,   0.00000, 90.00000, 0.00000);
	roof_cityhall[23] = CreateDynamicObject(19376, 2416.76245, 2619.01392, 1046.6892,   0.00000, 90.00000, 0.00000);
	roof_cityhall[24] = CreateDynamicObject(19376, 2426.33569, 2619.01392, 1046.6892,   0.00000, 90.00000, 0.00000);
	roof_cityhall[25] = CreateDynamicObject(19376, 2426.33569, 2609.41602, 1046.6892,   0.00000, 90.00000, 0.00000);
	roof_cityhall[26] = CreateDynamicObject(19646, 2406.321533, 2614.648438, 1053.6232, 0.000000, 179.999985, -179.999985);
	roof_cityhall[27] = CreateDynamicObject(19646, 2406.302979, 2614.648438, 1053.6232, 0.000000, 179.999985, -89.999985);
	roof_cityhall[28] = CreateDynamicObject(19646, 2396.321777, 2614.648438, 1053.6232, 0.000000, 179.999985, -179.999985);
	roof_cityhall[29] = CreateDynamicObject(19646, 2391.062500, 2614.648438, 1053.6232, 0.000000, 179.999985, -89.999985);
	for(new i=0;i<30;i++)
	{
	SetDynamicObjectMaterial(roof_cityhall[i], 0, 14760, "sfhosemed2", "AH_walltile2");
	}

	////////////////////////// Vi?n Tu?ng ////////////////////////////
		new wallborder_cityhall[48];
		wallborder_cityhall[0] = CreateDynamicObject(19445, 2417.074463, 2625.659668, 1044.8569, 0.000022, 180.000000, 359.999969);
		wallborder_cityhall[2] = CreateDynamicObject(19445, 2411.425781, 2633.514404, 1049.0963, 0.000014, 360.000000, 179.999817);
		wallborder_cityhall[3] = CreateDynamicObject(19445, 2417.915283, 2622.113770, 1044.8569, 0.000022, 180.000000, 269.999969);
		wallborder_cityhall[4] = CreateDynamicObject(19866, 2401.838623, 2628.376221, 1050.6860, 0.000014, 90.000015, 89.999954);
		wallborder_cityhall[5] = CreateDynamicObject(19445, 2417.226807, 2628.415527, 1052.1680, 89.999992, -78.384224, -11.615928);
		wallborder_cityhall[6] = CreateDynamicObject(19866, 2412.172607, 2616.672852, 1050.6860, 0.000014, 90.000015, 179.999954);
		wallborder_cityhall[7] = CreateDynamicObject(19445, 2418.117676, 2626.735352, 1052.1680, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[8] = CreateDynamicObject(19445, 2410.127930, 2635.057129, 1052.1680, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[9] = CreateDynamicObject(19445, 2418.117676, 2619.856445, 1052.1680, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[10] = CreateDynamicObject(19445, 2403.218018, 2635.057129, 1052.1680, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[11]= CreateDynamicObject(19445, 2418.127686, 2616.399902, 1052.1749, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[12] = CreateDynamicObject(19445, 2400.465332, 2635.057129, 1047.055054, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[13] = CreateDynamicObject(19866, 2412.172607, 2611.672852, 1050.6860, 0.000014, 90.000015, 179.999954);
		wallborder_cityhall[14] = CreateDynamicObject(19866, 2395.837891, 2628.376221, 1050.6860, 0.000014, 90.000015, 89.999954);
		wallborder_cityhall[15] = CreateDynamicObject(19445, 2418.117676, 2612.988037, 1052.1749, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[16] = CreateDynamicObject(19445, 2396.972412, 2635.057129, 1047.055054, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[17] = CreateDynamicObject(19866, 2393.199707, 2623.004150, 1050.6860, 0.000014, 90.000015, 89.999954);
		wallborder_cityhall[18] = CreateDynamicObject(19866, 2412.172607, 2607.863770, 1050.6860, 0.000014, 90.000015, 179.999954);
		wallborder_cityhall[19] = CreateDynamicObject(19445, 2418.117676, 2609.645508, 1052.1680, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[20] = CreateDynamicObject(19445, 2394.076904, 2635.057129, 1052.1680, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[21] = CreateDynamicObject(19866, 2409.360352, 2606.298340, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[22] = CreateDynamicObject(19445, 2417.915283, 2607.210938, 1044.8569, 0.000022, 180.000000, 269.999969);
		wallborder_cityhall[23] = CreateDynamicObject(19445, 2413.024414, 2605.659668, 1044.8569, 0.000022, 180.000000, 359.999969);
		wallborder_cityhall[24] = CreateDynamicObject(19866, 2404.360352, 2606.298340, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[25] = CreateDynamicObject(19866, 2388.199707, 2623.004150, 1050.6860, 0.000014, 90.000015, 89.999954);
		wallborder_cityhall[26] = CreateDynamicObject(19445, 2417.074463, 2603.639404, 1044.8569, 0.000022, 180.000000, 359.999969);
		wallborder_cityhall[27] = CreateDynamicObject(19445, 2418.117676, 2602.726563, 1052.1680, 89.999992, -78.384224, -101.615929);
		wallborder_cityhall[28] = CreateDynamicObject(19445, 2386.117188, 2633.512939, 1049.0963, 0.000012, 360.000000, -0.000151);
		wallborder_cityhall[29] = CreateDynamicObject(19445, 2387.177979, 2635.057129, 1052.1680, 89.999992, -45.005444, -44.994793);
		wallborder_cityhall[30] = CreateDynamicObject(19866, 2393.039063, 2606.298340, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[31] = CreateDynamicObject(19866, 2402.010498, 2600.926270, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[32] = CreateDynamicObject(19445, 2385.988770, 2614.676025, 1049.0963, 0.000029, -0.000014, 179.999786);
		wallborder_cityhall[33] = CreateDynamicObject(19445, 2417.226807, 2600.834229, 1052.1680, 89.999992, -78.384224, -11.615928);
		wallborder_cityhall[34] = CreateDynamicObject(19445, 2386.008789, 2613.986816, 1044.8569, 0.000029, -0.000014, 179.999786);
		wallborder_cityhall[35] = CreateDynamicObject(19866, 2395.641113, 2600.926270, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[36] = CreateDynamicObject(19866, 2388.039063, 2606.298340, 1050.6860, 0.000006, 90.000015, -89.999992);
		wallborder_cityhall[37] = CreateDynamicObject(19445, 2411.445313, 2595.753418, 1049.0963, 0.000012, 360.000000, 179.999741);
		wallborder_cityhall[38] = CreateDynamicObject(19445, 2410.384521, 2594.209229, 1052.1680, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[39] = CreateDynamicObject(19445, 2403.485596, 2594.209229, 1052.1680, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[40] = CreateDynamicObject(19445, 2400.590088, 2594.209229, 1047.055054, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[41] = CreateDynamicObject(19445, 2397.097168, 2594.209229, 1047.055054, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[42] = CreateDynamicObject(19445, 2394.344482, 2594.209229, 1052.1680, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[43] = CreateDynamicObject(19445, 2386.136719, 2595.751953, 1049.0963, 0.000013, 360.000000, -0.000198);
		wallborder_cityhall[44] = CreateDynamicObject(19445, 2387.434570, 2594.209229, 1052.1680, 89.999992, -115.532585, -154.467682);
		wallborder_cityhall[45] = CreateDynamicObject(19445, 2413.014404, 2623.669678, 1044.8569, 0.000022, 180.000000, 359.999969);
		wallborder_cityhall[46] = CreateDynamicObject(19866, 2409.520996, 2623.004150, 1050.6860, 0.000014, 90.000015, 89.999954);
		wallborder_cityhall[47] = CreateDynamicObject(19866, 2412.172607, 2621.672852, 1050.6860, 0.000014, 90.000015, 179.999954);
		wallborder_cityhall[1] = CreateDynamicObject(19866, 2404.520996, 2623.004150, 1050.6860, 0.000014, 90.000015, 89.999954);
		for(new i=0;i<48;i++)
	{
	SetDynamicObjectMaterial(wallborder_cityhall[i], 0, 15048, "labigsave", "ah_wallstyle1");
	}
	///////////////////////////////////////// Vi?n Tu?ng 2//////////////////////////////////
		new wallborder2_cityhall[56];
		wallborder2_cityhall[0]	= CreateDynamicObject(19866, 2411.488770, 2621.273438, 1046.5957, 0.000014, -0.000016, 179.999771);
		wallborder2_cityhall[1] = CreateDynamicObject(19866, 2404.177979, 2623.665771, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[2] = CreateDynamicObject(19866, 2404.168457, 2623.105225, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[3] = CreateDynamicObject(19866, 2403.829102, 2628.466553, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[4] = CreateDynamicObject(19866, 2411.488770, 2616.273438, 1046.5957, 0.000014, -0.000016, 179.999771);
		wallborder2_cityhall[5] = CreateDynamicObject(19866, 2398.829102, 2628.466553, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[6] = CreateDynamicObject(19866, 2411.488770, 2611.273438, 1046.5957, 0.000014, -0.000016, 179.999771);
		wallborder2_cityhall[7] = CreateDynamicObject(19866, 2393.829102, 2623.665771, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[8] = CreateDynamicObject(19866, 2393.749023, 2623.105225, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[9] = CreateDynamicObject(19866, 2393.829102, 2628.466553, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[10] = CreateDynamicObject(19866, 2411.488770, 2606.273438, 1046.5757, 0.000014, -0.000016, 179.999771);
		wallborder2_cityhall[11] = CreateDynamicObject(19866, 2408.811035, 2606.197266, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[12] = CreateDynamicObject(19866, 2403.811035, 2606.197266, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[13] = CreateDynamicObject(19866, 2403.730957, 2605.636719, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[14] = CreateDynamicObject(19866, 2388.749023, 2623.105225, 1046.5757, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[15] = CreateDynamicObject(19866, 2386.029053, 2620.458008, 1046.5957, 0.000007, -0.000007, 179.999832);
		wallborder2_cityhall[16] = CreateDynamicObject(19866, 2393.391602, 2606.197266, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[17] = CreateDynamicObject(19866, 2403.730957, 2600.835938, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[18] = CreateDynamicObject(19866, 2393.382080, 2605.636719, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[19] = CreateDynamicObject(19866, 2386.029053, 2615.458008, 1046.5957, 0.000007, -0.000007, 179.999832);
		wallborder2_cityhall[20] = CreateDynamicObject(19866, 2398.730957, 2600.835938, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[21] = CreateDynamicObject(19866, 2386.029053, 2610.458008, 1046.5957, 0.000007, -0.000007, 179.999832);
		wallborder2_cityhall[22] = CreateDynamicObject(19866, 2388.391602, 2606.197266, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[23] = CreateDynamicObject(19866, 2393.730957, 2600.835938, 1046.5957, 0.000006, 0.000014, -89.999992);
		wallborder2_cityhall[24] = CreateDynamicObject(19866, 2386.029053, 2605.458008, 1046.5957, 0.000007, -0.000007, 179.999832);
		wallborder2_cityhall[25] = CreateDynamicObject(19866, 2385.458496, 2603.396484, 1046.5957, 0.000007, -0.000008, 179.999832);
		wallborder2_cityhall[26] = CreateDynamicObject(19866, 2409.177979, 2623.665771, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[27] = CreateDynamicObject(19866, 2409.168457, 2623.105225, 1046.5957, 0.000014, 0.000014, 89.999954);
		wallborder2_cityhall[28] = CreateDynamicObject(2242, 2410.447754, 2622.028809, 1043.276733, -0.000065, 0.000037, -89.999794);
		wallborder2_cityhall[29] = CreateDynamicObject(2743, 2410.718018, 2632.090088, 1048.6733, 0.000019, -0.000005, -90.000214);
		wallborder2_cityhall[30] = CreateDynamicObject(2242, 2417.251465, 2627.731689, 1047.4771, -0.000117, 0.000014, -179.999466);
		wallborder2_cityhall[31] = CreateDynamicObject(19866, 2412.7090, 2616.3728, 1043.3552, 0.000014, -0.000015, 179.999771);
		wallborder2_cityhall[32] = CreateDynamicObject(19866, 2411.989258, 2616.273438, 1043.375244, 0.000014, -0.000015, 179.999771);
		wallborder2_cityhall[33] = CreateDynamicObject(2242, 2417.251465, 2617.781494, 1047.4771, -0.000117, 0.000021, -179.999512);
		wallborder2_cityhall[34] = CreateDynamicObject(2743, 2398.776611, 2627.694580, 1046.422852, 0.000020, -0.000005, -0.000129);
		wallborder2_cityhall[35] = CreateDynamicObject(2242, 2410.447754, 2614.656982, 1043.276733, -0.000072, 0.000037, -89.999771);
		wallborder2_cityhall[36] = CreateDynamicObject(2242, 2401.747803, 2634.190918, 1047.4771, -0.000118, 0.000037, -89.999634);
		wallborder2_cityhall[37] = CreateDynamicObject(19866, 2412.708984, 2612.203369, 1043.355225, 0.000014, -0.000015, 179.999771);
		wallborder2_cityhall[38] = CreateDynamicObject(19866, 2411.989258, 2611.273193, 1043.375244, 0.000014, -0.000015, 179.999771);
		wallborder2_cityhall[39] = CreateDynamicObject(2242, 2417.251465, 2611.735596, 1047.4771, -0.000125, 0.000021, -179.999496);
		wallborder2_cityhall[40] = CreateDynamicObject(2242, 2395.701904, 2634.190918, 1047.4771, -0.000110, 0.000037, -89.999657);
		wallborder2_cityhall[41] = CreateDynamicObject(2242, 2410.447754, 2607.217285, 1043.276733, -0.000073, 0.000037, -89.999771);
		wallborder2_cityhall[42] = CreateDynamicObject(2242, 2386.919922, 2628.759277, 1047.4771, -0.000141, 0.000037, -89.999565);
		wallborder2_cityhall[43] = CreateDynamicObject(2242, 2387.104980, 2622.028809, 1043.276733, -0.000058, 0.000037, -89.999817);
		wallborder2_cityhall[44] = CreateDynamicObject(2743, 2386.854980, 2632.085693, 1048.6733, 0.000019, -0.000005, 89.999725);
		wallborder2_cityhall[45] = CreateDynamicObject(2242, 2410.642578, 2600.507080, 1047.4771, -0.000141, 0.000037, 90.000374);
		wallborder2_cityhall[46] = CreateDynamicObject(2242, 2417.251465, 2601.457031, 1047.4771, -0.000117, 0.000006, -179.999420);
		wallborder2_cityhall[47] = CreateDynamicObject(2743, 2398.781006, 2601.583740, 1046.422852, 0.000020, -0.000005, 179.999771);
		wallborder2_cityhall[48] = CreateDynamicObject(2743, 2410.707520, 2597.180664, 1048.6733, 0.000019, -0.000005, -90.000244);
		wallborder2_cityhall[49] = CreateDynamicObject(2242, 2387.104980, 2607.217285, 1043.276733, -0.000065, 0.000037, -89.999794);
		wallborder2_cityhall[50] = CreateDynamicObject(2242, 2401.860596, 2595.075439, 1047.4771, -0.000110, 0.000037, 90.000282);
		wallborder2_cityhall[51] = CreateDynamicObject(2743, 2379.538086, 2611.910645, 1044.442383, 0.000006, -0.000014, 89.999886);
		wallborder2_cityhall[52] = CreateDynamicObject(2242, 2386.839844, 2600.507080, 1047.4771, -0.000133, 0.000037, 90.000351);
		wallborder2_cityhall[53] = CreateDynamicObject(2743, 2386.844482, 2597.176270, 1048.6733, 0.000019, -0.000005, 89.999725);
		wallborder2_cityhall[54] = CreateDynamicObject(2242, 2410.722656, 2628.759277, 1047.4771, -0.000133, 0.000037, -89.999588);
		wallborder2_cityhall[55] = CreateDynamicObject(2242, 2395.814697, 2595.075439, 1047.4771, -0.000118, 0.000037, 90.000305);
			for(new i=0;i<56;i++)
	{
		SetDynamicObjectMaterial(wallborder2_cityhall[i], 0, 14748, "sfhsm1", "AH_orncorn");
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	new frence_cityhall[10];
	frence_cityhall[0] = CreateDynamicObject(19446, 2406.488037, 2623.381348, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[1] = CreateDynamicObject(19446, 2411.788086, 2618.251709, 1046.5968, 0.000000, 0.000000, 0.000000);
	frence_cityhall[2] = CreateDynamicObject(19446, 2399.808838, 2628.721191, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[3] = CreateDynamicObject(19446, 2397.776855, 2628.721191, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[4] = CreateDynamicObject(19446, 2411.788086, 2611.250000, 1046.5968, 0.000000, 0.000000, 0.000000);
	frence_cityhall[5] = CreateDynamicObject(19446, 2391.068115, 2623.381348, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[6] = CreateDynamicObject(19446, 2406.487549, 2605.931396, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[7] = CreateDynamicObject(19446, 2399.787598, 2600.560791, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[8] = CreateDynamicObject(19446, 2391.068115, 2605.931396, 1046.5968, 0.000000, 0.000000, 90.000000);
	frence_cityhall[9] = CreateDynamicObject(19446, 2397.776855, 2600.560791, 1046.5968, 0.000000, 0.000000, 90.000000);
	for(new i=0;i<10;i++)
	{
	SetDynamicObjectMaterial(frence_cityhall[i], 0, 19962, "samproadsigns", "materialtext1");
	}

	//////////////////////////ghe/////////////////////////////////////
		CreateDynamicObject(1735, 2407.727295, 2620.392578, 1043.156616, -0.000121, 0.000017, -34.999771);
		CreateDynamicObject(1735, 2405.290283, 2620.364990, 1043.156616, -0.000010, 0.000122, 39.999969);
		CreateDynamicObject(1735, 2407.727539, 2609.064941, 1043.156616, -0.000015, 0.000116, -140.000015);
		CreateDynamicObject(1735, 2405.290527, 2609.037354, 1043.156616, -0.000117, 0.000011, 145.000183);
		CreateDynamicObject(1735, 2392.307129, 2620.392578, 1043.156616, -0.000117, 0.000011, -34.999771);
		CreateDynamicObject(1735, 2389.870117, 2620.364990, 1043.156616, -0.000015, 0.000116, 39.999969);
		CreateDynamicObject(1735, 2392.307373, 2609.064941, 1043.156616, -0.000010, 0.000122, -140.000015);
		CreateDynamicObject(1735, 2389.870361, 2609.037354, 1043.156616, -0.000121, 0.000017, 145.000183);
	///////////////////////////ghe 2///////////////////////////////
		CreateDynamicObject(1763, 2407.576660, 2594.919189, 1047.3124, 0.000000, 0.000000, 179.999893);
		CreateDynamicObject(1763, 2386.875488, 2602.526123, 1047.3124, 0.000015, 0.000000, 89.999954);
		CreateDynamicObject(1763, 2391.530762, 2594.919189, 1047.3124, 0.000000, 0.000000, 179.999893);
		CreateDynamicObject(1763, 2413.185791, 2627.695557, 1047.3124, -0.000022, 0.000007, 0.000106);
		CreateDynamicObject(1763, 2417.407715, 2623.917969, 1047.3124, -0.000022, 0.000007, -89.999901);
		CreateDynamicObject(1763, 2406.031738, 2634.347168, 1047.3124, 0.000000, 0.000000, 360.000000);
		CreateDynamicObject(1763, 2417.407715, 2606.861084, 1047.3124, -0.000022, 0.000007, -89.999901);
		CreateDynamicObject(1763, 2389.985840, 2634.347168, 1047.3124, 0.000000, 0.000000, 360.000000);
		CreateDynamicObject(1763, 2386.875488, 2625.346680, 1047.3124, 0.000000, 0.000000, 450.000000);
		CreateDynamicObject(1763, 2414.428955, 2601.566895, 1047.3124, -0.000022, 0.000007, -179.999817);
	//////////////////////////////////////////////////////tree///////////////////////////////////////////////////////////////
	CreateDynamicObject(630, 2410.631836, 2600.649902, 1048.3479, -0.000141, 0.000037, 90.000374);
	CreateDynamicObject(630, 2417.108643, 2601.446289, 1048.3479, -0.000117, 0.000006, -179.999420);
	CreateDynamicObject(630, 2387.095703, 2607.134521, 1044.107544, -0.000065, 0.000037, -89.999794);
	CreateDynamicObject(630, 2401.849854, 2595.218262, 1048.3479, -0.000110, 0.000037, 90.000282);
	CreateDynamicObject(630, 2395.803955, 2595.218262, 1048.3479, -0.000118, 0.000037, 90.000305);
	CreateDynamicObject(630, 2386.829102, 2600.649902, 1048.3479, -0.000133, 0.000037, 90.000351);
	CreateDynamicObject(630, 2410.733398, 2628.616455, 1048.3479, -0.000133, 0.000037, -89.999588);
	CreateDynamicObject(630, 2410.438477, 2621.946045, 1044.107544, -0.000065, 0.000037, -89.999794);
	CreateDynamicObject(630, 2417.108643, 2627.720947, 1048.3479, -0.000117, 0.000014, -179.999466);
	CreateDynamicObject(630, 2417.108643, 2617.770752, 1048.3479, -0.000117, 0.000021, -179.999512);
	CreateDynamicObject(630, 2410.438477, 2614.574219, 1044.107544, -0.000072, 0.000037, -89.999771);
	CreateDynamicObject(630, 2401.758545, 2634.048096, 1048.3479, -0.000118, 0.000037, -89.999634);
	CreateDynamicObject(630, 2417.108643, 2611.724854, 1048.3479, -0.000125, 0.000021, -179.999496);
	CreateDynamicObject(630, 2395.712646, 2634.048096, 1048.3479, -0.000110, 0.000037, -89.999657);
	CreateDynamicObject(630, 2410.438477, 2607.134521, 1044.107544, -0.000073, 0.000037, -89.999771);
	CreateDynamicObject(630, 2386.930664, 2628.616455, 1048.3479, -0.000141, 0.000037, -89.999565);
	CreateDynamicObject(630, 2387.095703, 2621.946045, 1044.107544, -0.000058, 0.000037, -89.999817);
	
	/////////////////////////////////////////////////////////////////////////////////

	//////////////////////////////light//////////////////////////////////////////////

	CreateDynamicObject(2069, 2406.410889, 2622.611328, 1043.166138, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2069, 2390.984131, 2622.611328, 1043.166138, 0.000000, 0.000000, 0.000000);
	CreateDynamicObject(2069, 2406.410889, 2606.688477, 1043.166138, 0.000000, 0.000007, 0.000000);
	CreateDynamicObject(2069, 2390.984131, 2606.688477, 1043.166138, 0.000000, 0.000007, 0.000000);
	CreateDynamicObject(14629, 2375.408203, 2614.697754, 1055.1904, 0.000000, 0.000000, 90.000000);
	CreateDynamicObject(14629, 2406.309326, 2614.697754, 1055.1904, 0.000000, 0.000000, 90.000000);
	//////////////////////////////////////////tranh///////////////////////////////////////////////
	new picture_cityhall[18];
	picture_cityhall[0] = CreateDynamicObject(2283, 2421.489990, 2619.223877, 1045.172852, -0.000007, 0.000052, -89.999947);
	SetDynamicObjectMaterial(picture_cityhall[0], 1, 2266, "picture_frame", "CJ_PAINTING34");
	SetDynamicObjectMaterial(picture_cityhall[0], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[1] = CreateDynamicObject(2283, 2394.267822, 2622.996826, 1045.172852, 0.000000, 0.000029, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[1], 1, 2266, "picture_frame", "CJ_PAINTING28");
	SetDynamicObjectMaterial(picture_cityhall[1], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[2] = CreateDynamicObject(2283, 2421.489990, 2613.212158, 1045.172852, -0.000022, 0.000052, -89.999901);
	SetDynamicObjectMaterial(picture_cityhall[2], 1, 2266, "picture_frame", "CJ_PAINTING5");
	SetDynamicObjectMaterial(picture_cityhall[2], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[3] = CreateDynamicObject(2283, 2409.774902, 2606.305664, 1045.172852, 0.000000, -0.000008, 179.999756);
	SetDynamicObjectMaterial(picture_cityhall[3], 1, 2266, "picture_frame", "CJ_PAINTING35");
	SetDynamicObjectMaterial(picture_cityhall[3], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[4] = CreateDynamicObject(2283, 2403.283936, 2606.305664, 1045.172852, 0.000000, -0.000015, 179.999710);
	SetDynamicObjectMaterial(picture_cityhall[4], 1, 2266, "picture_frame", "CJ_PAINTING34");
	SetDynamicObjectMaterial(picture_cityhall[4], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[5] = CreateDynamicObject(2283, 2418.028809, 2606.253418, 1049.2632, -0.000022, 0.000051, -89.999901);
	SetDynamicObjectMaterial(picture_cityhall[5], 1, 2254, "picture_frame_clip", "CJ_PAINTING24");
	SetDynamicObjectMaterial(picture_cityhall[5], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[6] = CreateDynamicObject(2283, 2390.595215, 2634.968262, 1049.2632, 0.000000, 0.000051, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[6], 1, 2266, "picture_frame", "CJ_PAINTING35");
 	SetDynamicObjectMaterial(picture_cityhall[6], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[7] = CreateDynamicObject(2283, 2387.796387, 2622.996826, 1045.172852, 0.000000, 0.000037, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[7], 1, 2266, "picture_frame", "CJ_PAINTING23");
	SetDynamicObjectMaterial(picture_cityhall[7], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[8] = CreateDynamicObject(2283, 2394.333252, 2606.305664, 1045.172852, 0.000000, -0.000015, 179.999664);
	SetDynamicObjectMaterial(picture_cityhall[8], 1, 2254, "picture_frame_clip", "CJ_PAINTING4");
	SetDynamicObjectMaterial(picture_cityhall[8], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[9] = CreateDynamicObject(2283, 2413.819580, 2600.945801, 1049.2632, -0.000022, 0.000058, -179.999817);
	SetDynamicObjectMaterial(picture_cityhall[9], 1, 2254, "picture_frame_clip", "CJ_PAINTING27");
	SetDynamicObjectMaterial(picture_cityhall[9], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[10] = CreateDynamicObject(2283, 2387.852051, 2606.305664, 1045.172852, 0.000000, -0.000007, 179.999710);
	SetDynamicObjectMaterial(picture_cityhall[10], 1, 2254, "picture_frame_clip", "CJ_PAINTING2");
	SetDynamicObjectMaterial(picture_cityhall[10], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[11] = CreateDynamicObject(2283, 2406.967285, 2594.298096, 1049.2632, 0.000000, 0.000051, 179.999893);
	SetDynamicObjectMaterial(picture_cityhall[11], 1, 2266, "picture_frame", "CJ_PAINTING23");
	SetDynamicObjectMaterial(picture_cityhall[11], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[12] = CreateDynamicObject(2283, 2390.923096, 2594.298096, 1049.2632, 0.000000, 0.000044, 179.999893);
	SetDynamicObjectMaterial(picture_cityhall[12], 1, 2266, "picture_frame", "CJ_PAINTING3");
	SetDynamicObjectMaterial(picture_cityhall[12], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[13] = CreateDynamicObject(2283, 2409.680664, 2622.996826, 1045.172852, 0.000000, 0.000037, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[13], 1, 2266, "picture_frame", "CJ_PAINTING30");
	SetDynamicObjectMaterial(picture_cityhall[13], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[14] = CreateDynamicObject(2283, 2413.795166, 2628.316650, 1049.2632, -0.000022, 0.000058, 0.000106);
	SetDynamicObjectMaterial(picture_cityhall[14], 1, 2254, "picture_frame_clip", "CJ_PAINTING4");
	SetDynamicObjectMaterial(picture_cityhall[14], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[15] = CreateDynamicObject(2283, 2403.200684, 2622.996826, 1045.172852, 0.000000, 0.000045, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[15], 1, 2266, "picture_frame", "CJ_PAINTING3");
	SetDynamicObjectMaterial(picture_cityhall[15], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[16] = CreateDynamicObject(2283, 2418.028809, 2623.308594, 1049.2632, -0.000022, 0.000058, -89.999901);
	SetDynamicObjectMaterial(picture_cityhall[16], 1, 2254, "picture_frame_clip", "CJ_PAINTING12");
	SetDynamicObjectMaterial(picture_cityhall[16], 0, 2266, "picture_frame", "CJ_PAINTING32");
	picture_cityhall[17] = CreateDynamicObject(2283, 2406.639404, 2634.968262, 1049.2632, 0.000000, 0.000044, 0.000000);
	SetDynamicObjectMaterial(picture_cityhall[17], 1, 2266, "picture_frame", "CJ_PAINTING34");
	SetDynamicObjectMaterial(picture_cityhall[17], 0, 2266, "picture_frame", "CJ_PAINTING32");
	///////////////////////////////////////window////////////////////////////
	new window_cityhall[6];
	window_cityhall[0] = CreateDynamicObject(2984, 2385.578613, 2625.963867, 1049.0123, 0.000000, 0.000014, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[0], 0, 18200, "w_town2cs_t", "inwindow1128");
	window_cityhall[1] = CreateDynamicObject(2984, 2385.578613, 2620.383301, 1049.0123, 0.000000, 0.000015, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[1], 0, 18200, "w_town2cs_t", "inwindow1128");
	window_cityhall[2] = CreateDynamicObject(2984, 2385.578613, 2620.383301, 1045.161987, 0.000000, 0.000022, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[2], 0, 18200, "w_town2cs_t", "inwindow1128");
	window_cityhall[3] = CreateDynamicObject(2984, 2385.578613, 2608.942139, 1049.0123, 0.000000, 0.000015, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[3], 0, 18200, "w_town2cs_t", "inwindow1128");
	window_cityhall[4] = CreateDynamicObject(2984, 2385.578613, 2608.942139, 1045.161987, 0.000000, 0.000022, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[4], 0, 18200, "w_town2cs_t", "inwindow1128");
	window_cityhall[5] = CreateDynamicObject(2984, 2385.578613, 2603.143311, 1049.0123, 0.000000, 0.000029, 0.000000);
	SetDynamicObjectMaterial(window_cityhall[5], 0, 18200, "w_town2cs_t", "inwindow1128");
	/////////////////////////////////////////Buc Tuong///////////////////////////////////////////////////////
	CreateDynamicObject(2809, 2398.776611, 2627.694580, 1046.422852, 0.000020, -0.000005, -0.000129);
	CreateDynamicObject(2809, 2386.854980, 2632.085693, 1048.6733, 0.000019, -0.000005, 89.999725);
	CreateDynamicObject(2809, 2398.781006, 2601.583740, 1046.422852, 0.000020, -0.000005, 179.999771);
	CreateDynamicObject(2809, 2410.707520, 2597.180664, 1048.6733, 0.000019, -0.000005, -90.000244);
	CreateDynamicObject(2809, 2410.718018, 2632.090088, 1048.6733, 0.000019, -0.000005, -90.000214);
	CreateDynamicObject(2809, 2386.844482, 2597.176270, 1048.6733, 0.000019, -0.000005, 89.999725);
	CreateDynamicObject(19487, 2410.748535, 2597.296631, 1049.9582, -0.000019, 0.000000, 90.000107);
	CreateDynamicObject(19487, 2386.803467, 2597.060303, 1049.9582, -0.000019, 0.000000, -89.999832);
	CreateDynamicObject(19487, 2410.759033, 2632.206055, 1049.9582, -0.000019, 0.000000, 90.000137);
	CreateDynamicObject(19487, 2398.660645, 2627.735596, 1047.707764, -0.000020, 0.000000, -179.999863);
	CreateDynamicObject(19487, 2386.813965, 2631.969727, 1049.9582, -0.000019, 0.000000, -89.999832);
	CreateDynamicObject(19487, 2398.896973, 2601.542725, 1047.707764, -0.000020, 0.000000, 0.000122);
	///////////////////Ban Tron///////////////////////////
	new table_cityhall[4];
	table_cityhall[0] = CreateDynamicObject(1819, 2405.816162, 2620.943115, 1043.156616, -0.000123, 0.000006, -40.999767);
	SetDynamicObjectMaterial(table_cityhall[0], 0, 15048, "labigsave", "ah_wallstyle1");
	table_cityhall[1] = CreateDynamicObject(1819, 2407.201660, 2608.486816, 1043.156616, -0.000118, 0.000000, 139.000214);
	SetDynamicObjectMaterial(table_cityhall[1], 0, 15048, "labigsave", "ah_wallstyle1");
	table_cityhall[2] = CreateDynamicObject(1819, 2390.395996, 2620.943115, 1043.156616, -0.000118, 0.000000, -40.999767);
	SetDynamicObjectMaterial(table_cityhall[2], 0, 15048, "labigsave", "ah_wallstyle1");
	table_cityhall[3] = CreateDynamicObject(1819, 2391.781494, 2608.486816, 1043.156616, -0.000123, 0.000006, 139.000214);
	SetDynamicObjectMaterial(table_cityhall[3], 0, 15048, "labigsave", "ah_wallstyle1");
	///////////////////////////tap chi /////////////////////////
	CreateDynamicObject(2852, 2391.096924, 2608.431885, 1043.647095, -0.000121, -0.000019, 126.300102);
	CreateDynamicObject(2852, 2406.500732, 2620.998047, 1043.647095, -0.000121, -0.000019, -53.699833);
	CreateDynamicObject(2852, 2406.517090, 2608.431885, 1043.647095, -0.000115, -0.000024, 126.300102);
	CreateDynamicObject(2852, 2391.080566, 2620.998047, 1043.647095, -0.000115, -0.000024, -53.699833);
	/////////////door///////////////////////
	new door_cityhall[8];
	door_cityhall[0] = CreateDynamicObject(11714, 2379.002441, 2614.928223, 1044.364502, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(door_cityhall[0], 0, 3187, "cxref_quarrytest", "gs_door1");
	door_cityhall[1] = CreateDynamicObject(11714, 2398.822510, 2594.306885, 1048.5734, 0.000022, 0.000007, -90.000038);
	SetDynamicObjectMaterial(door_cityhall[1], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[2] = CreateDynamicObject(11714, 2415.129883, 2622.029541, 1044.412842, 0.000000, 0.000007, -90.000000);
	SetDynamicObjectMaterial(door_cityhall[2], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[3] = CreateDynamicObject(11714, 2418.020020, 2614.743408, 1048.5734, 0.000029, 0.000022, -0.000061);
	SetDynamicObjectMaterial(door_cityhall[3], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[4] = CreateDynamicObject(11714, 2398.739990, 2634.959473, 1048.5734, 0.000022, 0.000007, 89.999931);
	SetDynamicObjectMaterial(door_cityhall[4], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[5] = CreateDynamicObject(11714, 2415.129883, 2607.287842, 1044.412842, 0.000000, 0.000007, -90.000000);
	SetDynamicObjectMaterial(door_cityhall[5], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[6] = CreateDynamicObject(11714, 2386.130371, 2615.399414, 1044.412842, 0.000000, 0.000007, 0.000000);
	SetDynamicObjectMaterial(door_cityhall[6], 0, 14706, "labig2int2", "frenchwinds_int");
	door_cityhall[7] = CreateDynamicObject(11714, 2386.120361, 2613.879395, 1044.412842, 0.000000, 0.000007, 0.000000);
	SetDynamicObjectMaterial(door_cityhall[7], 0, 14706, "labig2int2", "frenchwinds_int");
	/////////////////////////////////////////Vien Tuong //////////////////
	new vientuong_cityhall[18];
	vientuong_cityhall[0] = CreateDynamicObject(19866, 2402.971436, 2600.926270, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[1] = CreateDynamicObject(19866, 2397.971436, 2600.926270, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[2] = CreateDynamicObject(19866, 2394.853271, 2600.926270, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[3] = CreateDynamicObject(19866, 2388.378662, 2606.287354, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[4] = CreateDynamicObject(19866, 2409.181396, 2623.015137, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[5] = CreateDynamicObject(19866, 2412.154297, 2621.277100, 1047.2458, 0.000014, 89.999992, 179.999817);
	vientuong_cityhall[6] = CreateDynamicObject(19866, 2404.181396, 2623.015137, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[7] = CreateDynamicObject(19866, 2402.706787, 2628.376221, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[8] = CreateDynamicObject(19866, 2412.154297, 2616.277100, 1047.2458, 0.000014, 89.999992, 179.999817);
	vientuong_cityhall[9] = CreateDynamicObject(19866, 2399.588623, 2628.376221, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[10] = CreateDynamicObject(19866, 2412.154297, 2611.277100, 1047.2458, 0.000014, 89.999992, 179.999817);
	vientuong_cityhall[11] = CreateDynamicObject(19866, 2394.588623, 2628.376221, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[12] = CreateDynamicObject(19866, 2393.408936, 2623.015137, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[13] = CreateDynamicObject(19866, 2412.154297, 2608.028809, 1047.2458, 0.000014, 89.999992, 179.999817);
	vientuong_cityhall[14] = CreateDynamicObject(19866, 2409.151123, 2606.287354, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[15] = CreateDynamicObject(19866, 2404.151123, 2606.287354, 1047.2458, 0.000006, 90.000015, -89.999992);
	vientuong_cityhall[16] = CreateDynamicObject(19866, 2388.408936, 2623.015137, 1047.2458, 0.000014, 90.000015, 89.999954);
	vientuong_cityhall[17] = CreateDynamicObject(19866, 2393.378662, 2606.287354, 1047.2458, 0.000006, 90.000015, -89.999992);
	for(new i=0;i<18;i++)
	{
		SetDynamicObjectMaterial(vientuong_cityhall[i], 0, 15048, "labigsave", "ah_wallstyle1");
	}

	CreateDynamicObject(1714, 2414.021973, 2617.890869, 1043.181274, 0.000000, 0.000000, -90.000000);
	CreateDynamicObject(1714, 2414.021973, 2616.250977, 1043.181274, 0.000000, 0.000000, -90.000000);
	CreateDynamicObject(1714, 2414.021973, 2613.341064, 1043.181274, 0.000000, 0.000000, -90.000000);
	CreateDynamicObject(1714, 2414.021973, 2611.651367, 1043.181274, 0.000000, 0.000000, -90.000000);
	new pc1 = CreateDynamicObject(2165, 2412.386719, 2611.003662, 1043.347778, 0.000015, 0.000000, 89.999954);
	SetDynamicObjectMaterial(pc1, 3, 15048, "labigsave", "ah_wallstyle1");
	new pc2 = CreateDynamicObject(2165, 2412.386719, 2617.314941, 1043.345778, 0.000014, 0.000000, 89.999954);
	SetDynamicObjectMaterial(pc2, 3, 15048, "labigsave", "ah_wallstyle1");
	new pc3 = CreateDynamicObject(2165, 2412.386719, 2615.614014, 1043.345778, 0.000022, 0.000000, 89.999931);
	SetDynamicObjectMaterial(pc3, 3, 15048, "labigsave", "ah_wallstyle1");
	new pc4 = CreateDynamicObject(2165, 2412.386719, 2612.762939, 1043.347778, 0.000022, 0.000000, 89.999931);
	SetDynamicObjectMaterial(pc4, 3, 15048, "labigsave", "ah_wallstyle1");

	///////////////////////////////////////////////////////////////////////////////////
	new book_cityhall[12];
	book_cityhall[0] = CreateDynamicObject(14455, 2417.886719, 2617.741943, 1044.742310, -0.000014, 0.000007, 0.000061);
	book_cityhall[1] = CreateDynamicObject(14455, 2422.237061, 2620.614990, 1044.742310, 0.000014, -0.000015, 179.999786);
	book_cityhall[2] = CreateDynamicObject(14455, 2417.886719, 2614.741943, 1044.742310, -0.000014, 0.000007, 0.000061);
	book_cityhall[3] = CreateDynamicObject(14455, 2422.237061, 2617.642090, 1044.742310, 0.000014, -0.000007, 179.999832);
	book_cityhall[4] = CreateDynamicObject(14455, 2417.886719, 2611.741943, 1044.742310, -0.000014, 0.000007, 0.000061);
	book_cityhall[5] = CreateDynamicObject(14455, 2422.237061, 2614.642090, 1044.742310, 0.000014, -0.000007, 179.999832);
	book_cityhall[6] = CreateDynamicObject(14455, 2417.886719, 2608.759033, 1044.742310, -0.000014, 0.000015, 0.000061);
	book_cityhall[7] = CreateDynamicObject(14455, 2422.237061, 2611.642090, 1044.742310, 0.000014, -0.000007, 179.999832);
	book_cityhall[8] = CreateDynamicObject(2161, 2413.158936, 2608.641846, 1044.531128, 0.000000, 0.000000, 90.000000);
	book_cityhall[9] = CreateDynamicObject(2161, 2413.158936, 2608.641846, 1043.181274, 0.000000, 0.000000, 90.000000);
	book_cityhall[10] = CreateDynamicObject(2161, 2413.158936, 2620.322266, 1044.531250, 0.000007, 0.000000, 89.999977);
	book_cityhall[11] = CreateDynamicObject(2161, 2413.158936, 2620.322266, 1043.181274, 0.000007, 0.000000, 89.999977);
	for(new i=0;i<12;i++)
	{
		SetDynamicObjectMaterial(book_cityhall[i], 0, 14846, "genintintpoliceb", "pol_dor_surr2");
	}
	//////////////////////flag///////////////////////
	new flag_cityhall[9];
	flag_cityhall[0] = CreateDynamicObject(19482, 2386.151367, 2614.533936, 1048.804565, 990.000000, 0.000000, 360.000000);
	flag_cityhall[1] = CreateDynamicObject(19477, 2391.092041, 2606.283691, 1045.536377, 270.000000, 0.000000, 270.000000);
	flag_cityhall[2] =  CreateDynamicObject(19477, 2386.239990, 2597.173828, 1049.847046, -89.999992, 0.039566, -179.960434);
	flag_cityhall[3] =  CreateDynamicObject(19477, 2406.452393, 2622.983643, 1045.536377, 270.000000, 0.000000, 270.000000);
	flag_cityhall[4] = CreateDynamicObject(19477, 2411.322510, 2632.092529, 1049.847046, 270.000000, 0.000000, 360.000000);
	flag_cityhall[5] = CreateDynamicObject(19477, 2391.072266, 2622.983643, 1045.536377, 270.000000, 0.000000, 270.000000);
	flag_cityhall[6] = CreateDynamicObject(19477, 2406.532471, 2606.283691, 1045.536377, 270.000000, 0.000000, 270.000000);
	flag_cityhall[7] = CreateDynamicObject(19477, 2386.219727, 2632.062500, 1049.837036, 270.000000, 0.000000, 360.000000);
	flag_cityhall[8] = CreateDynamicObject(19477, 2411.342773, 2597.203857, 1049.837036, -89.999992, 0.039566, -179.960434);
	for(new i=0;i<9;i++)
	{
		SetDynamicObjectMaterial(flag_cityhall[i], 0, 12853, "cunte_gas01", "starspangban1_256");
	}

	
    //(ongamemodeinit) - LSPD stuff
	/*eastlobby1 = CreateDynamicObject(1536,253.14941406,110.59960938,1002.21502686,0.00000000,0.00000000,270.00000000,-1,10,-1,100.0); // East lobby door (moves north)
	eastlobby2 = CreateDynamicObject(1536,253.18457031,107.59960938,1002.21502686,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); // East lobby door (moves south)
	westlobby1 = CreateDynamicObject(1536,239.71582031,116.09179688,1002.21502686,0.00000000,0.00000000,90.00000000,-1,10,-1,100.0); // West lobby door (moves north)
	westlobby2 = CreateDynamicObject(1536,239.67968750,119.09960938,1002.21502686,0.00000000,0.00000000,269.98901367,-1,10,-1,100.0); // West lobby door (moves south)
	locker1 = CreateDynamicObject(1536,267.29980469,112.56640625,1003.61718750,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // Locker door (moves east)
	locker2 = CreateDynamicObject(1536,264.29980469,112.52929688,1003.61718750,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // Locker door (moves west)
	cctv1 = CreateDynamicObject(1536,264.44921875,115.79980469,1003.61718750,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // CCTV door (moves west)
	cctv2 = CreateDynamicObject(1536,267.46875000,115.83691406,1003.61718750,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // CCTV door (moves east)
	chief1 = CreateDynamicObject(1536,229.59960938,119.50000000,1009.21875000,0.00000000,0.00000000,0.00000000,-1,10,-1,100.0); // innermost chief's door
	chief2 = CreateDynamicObject(1536,232.59960938,119.53515625,1009.21875000,0.00000000,0.00000000,179.99450684,-1,10,-1,100.0); // outermost chief's door (both move west)
	
	// New LSPD Interior Doors & Cells
	AkaDoor[0] = CreateDynamicObject(1495,1487.00000000,-1762.42504883,3284.23608398,0.00000000,0.00000000,270.00000000); //object(gen_doorext01) (1)
	AkaDoor[1] = CreateDynamicObject(1495,1483.79003906,-1762.42504883,3284.23608398,0.00000000,0.00000000,270.00000000); //object(gen_doorext01) (2)
	AkaDoor[2] = CreateDynamicObject(1495,1479.85998535,-1758.31994629,3284.23388672,0.00000000,0.00000000,0.00000000); //object(gen_doorext01) (2)
	AkaDoor[3] = CreateDynamicObject(1495,1467.06701660,-1758.31994629,3284.23388672,0.00000000,0.00000000,0.00000000); //object(gen_doorext01) (2)
	AkaCell[0] = CreateDynamicObject(1567,1491.21484375,-1764.90002441,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (2)
	AkaCell[1] = CreateDynamicObject(1567,1494.41210938,-1764.90002441,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (3)
	AkaCell[2] = CreateDynamicObject(1567,1497.61132812,-1764.90002441,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (4)
	AkaCell[3] = CreateDynamicObject(1567,1500.81445312,-1764.90002441,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (6)
	AkaCell[4] = CreateDynamicObject(1567,1500.81994629,-1761.51000977,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (7)
	AkaCell[5] = CreateDynamicObject(1567,1491.22094727,-1761.50000000,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (8)
	AkaCell[6] = CreateDynamicObject(1567,1494.41894531,-1761.51000977,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (9)
	AkaCell[7] = CreateDynamicObject(1567,1497.61999512,-1761.51000977,3284.25048828,0.00000000,0.00000000,0.00000000); //object(gen_wardrobe) (10)

	//Noose Int Buttons End
	sasd1A = CreateDynamicObject(1536,2511.65332031,-1697.00976562,561.79223633,0.00000000,0.00000000,0.00000000); //R6
	sasd1B = CreateDynamicObject(1536,2514.67211914,-1696.97485352,561.79223633,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (2)
 	sasd2A = CreateDynamicObject(1536,2516.87548828,-1697.01525879,561.79223633,0.00000000,0.00000000,0.00000000); //R5
	sasd2B = CreateDynamicObject(1536,2519.89257812,-1696.97509766,561.79223633,0.00000000,0.00000000,179.99450684); //object(gen_doorext15) (4)
	sasd3A = CreateDynamicObject(1536,2522.15600586,-1697.01550293,561.79223633,0.00000000,0.00000000,0.00000000); //R4
	sasd3B = CreateDynamicObject(1536,2525.15893555,-1696.98010254,561.79223633,0.00000000,0.00000000,179.99450684); //object(gen_doorext15) (6)
	sasd4A = CreateDynamicObject(1536,2511.84130859,-1660.08081055,561.79528809,0.00000000,0.00000000,0.00000000); //West
	sasd4B = CreateDynamicObject(1536,2514.81982422,-1660.04650879,561.80004883,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (1)
	sasd5A = CreateDynamicObject(1536,2522.86059570,-1660.07177734,561.80206299,0.00000000,0.00000000,179.99450684); //East
	sasd5B = CreateDynamicObject(1536,2519.84228516,-1660.10888672,561.80004883,0.00000000,0.00000000,0.00000000); //object(gen_doorext15) (1)

	lspddoor1 = CreateDynamicObject(1569, 246.35150146484, 72.547714233398, 1002.640625, 0.000000, 0.000000, 0.000000); //
	lspddoor2 = CreateDynamicObject(1569, 245.03300476074, 72.568511962891, 1002.640625, 0.000000, 0.000000, 0.000000); //

	FBIPrivate[0] = CreateDynamicObject(1536,299.29986572,-1492.82666016,-28.73300552,0.00000000,0.00000000,270.00000000,1324123, .interiorid = 1); //Private Office Door Left
	FBIPrivate[1] = CreateDynamicObject(1536,299.33737183,-1495.83911133,-28.73300552,0.00000000,0.00000000,90.00000000,1324123, .interiorid = 1); //Private Office Door Right
	FBILobbyLeft = CreateDynamicObject(1536,295.40136719,-1498.43457031,-46.13965225,0.00000000,0.00000000,0.00000000,1324123, .interiorid = 1); //Lobby Door Left
	FBILobbyRight = CreateDynamicObject(1536,302.39355469,-1521.62988281,-46.13965225,0.00000000,0.00000000,179.99450684,1324123, .interiorid = 1); //Lobby Door Right


	//SANews Custom Interior
	SANewsStudioA = CreateDynamicObject(1536,625.60937500,-10.80000019,1106.96081543,0.00000000,0.00000000,270.00000000, .interiorid = 1); //object(gen_doorext15) (1)
	SANewsStudioB = CreateDynamicObject(1536,625.64941406,-13.77000046,1106.96081543,0.00000000,0.00000000,89.99450684, .interiorid = 1); //object(gen_doorext15) (2)

    SANewsPrivateA = CreateDynamicObject(1536,625.60937500,-0.55000001,1106.96081543,0.00000000,0.00000000,269.98901367, .interiorid = 1); //object(gen_doorext15) (4)
	SANewsPrivateB = CreateDynamicObject(1536,625.65002441,-3.54999995,1106.96081543,0.00000000,0.00000000,89.99450684, .interiorid = 1); //object(gen_doorext15) (4)

	SANewsOfficeA = CreateDynamicObject(1536,614.66998291,17.82812500,1106.98425293,0.00000000,0.00000000,0.00000000, .interiorid = 1); //object(gen_doorext15) (3)
	SANewsOfficeB = CreateDynamicObject(1536,617.69000244,17.86899948,1106.98425293,0.00000000,0.00000000,179.99450684, .interiorid = 1); //object(gen_doorext15) (5)
	*/

	//SAAS CARRIER
	/*sidelift = CreateDynamicObject(3114, 231.916656, 3615.134277, 17.269205, 0.0000, 0.0000, 0.0000); // Side Lift Up
	backhatch = CreateDynamicObject(3113, 180.344864, 3600.390137, 2.516232, 0.0000, 0.0000, 0.0000); // Back Hatch Closed
	backlift = CreateDynamicObject(3115, 189.694626, 3599.983398, 17.483730, 0.0000, 0.0000, 0.0000); // Back Lift Up

	Carrier[0] = CreateDynamicObject(10771, 288.665771, 3600.003418, 6.032381, 0.0000, 0.0000, 0.0000);
	Carrier[1] = CreateDynamicObject(11145, 225.782196, 3600.015137, 4.754915, 0.0000, 0.0000, 0.0000);
	Carrier[2] = CreateDynamicObject(11149, 282.526093, 3594.805176, 12.487646, 0.0000, 0.0000, 0.0000);
	Carrier[3] = CreateDynamicObject(11146, 279.620544, 3600.541016, 12.893089, 0.0000, 0.0000, 0.0000);
	Carrier[4] = CreateDynamicObject(10770, 291.858917, 3592.397949, 39.171509, 0.0000, 0.0000, 0.0000);
	Carrier[5] = CreateDynamicObject(10772, 290.014313, 3599.787598, 17.833616, 0.0000, 0.0000, 0.0000);
	Carrier[6] = CreateDynamicObject(1671, 354.860748, 3589.442383, 11.234554, 0.0000, 0.0000, 175.3254);
	Carrier[7] = CreateDynamicObject(925, 304.330383, 3589.067383, 11.735489, 0.0000, 0.0000, 0.0000);
	Carrier[8] = CreateDynamicObject(930, 301.851654, 3588.497070, 11.131838, 0.0000, 0.0000, 0.0000);
	Carrier[9] = CreateDynamicObject(930, 301.856079, 3589.598145, 11.181837, 0.0000, 0.0000, 0.0000);
	Carrier[10] = CreateDynamicObject(964, 300.513062, 3589.303711, 10.705961, 0.0000, 0.0000, 177.4217);
	Carrier[11] = CreateDynamicObject(964, 299.024902, 3589.362793, 10.698584, 0.0000, 0.0000, 177.4217);
	Carrier[12] = CreateDynamicObject(1271, 305.058319, 3591.442871, 11.048584, 0.0000, 0.0000, 359.1406);
	Carrier[13] = CreateDynamicObject(1431, 303.009491, 3591.383789, 11.253574, 0.0000, 0.0000, 0.0000);
	Carrier[14] = CreateDynamicObject(2567, 297.100800, 3591.239746, 12.558563, 0.0000, 0.0000, 91.1003);
	Carrier[15] = CreateDynamicObject(3576, 301.050110, 3593.777344, 12.198634, 0.0000, 0.0000, 0.0000);
	Carrier[16] = CreateDynamicObject(3633, 304.567841, 3593.262207, 11.173386, 0.0000, 0.0000, 0.0000);

	CarrierS[0] = CreateDynamicObject(3267, 320.358582, 3592.519043, 21.567169, 0.0000, 0.0000, 0.0000);
	CarrierS[1] = CreateDynamicObject(11237, 291.557526, 3592.407715, 39.065594, 0.0000, 0.0000, 0.0000);
	CarrierS[2] = CreateDynamicObject(3395, 354.861725, 3590.989746, 10.797120, 0.0000, 0.0000, 88.0403);
	CarrierS[3] = CreateDynamicObject(1671, 356.571838, 3588.612793, 11.234554, 0.0000, 0.0000, 134.9316);
	CarrierS[4] = CreateDynamicObject(3393, 358.360016, 3588.834961, 10.797121, 0.0000, 0.0000, 0.0000);
	CarrierS[5] = CreateDynamicObject(3277, 320.391876, 3592.538086, 21.514416, 0.0000, 0.0000, 164.0483); */
	
	entrancedoor = CreateDynamicObject(2951,-766.27539062,2536.58691406,10019.5,0.98876953,0.00000000,85.49011230); //object(a51_labdoor) (1)

	blastdoor[0] = CreateDynamicObject(2927,-764.11816406,2568.81445312,10021.5,0.70861816,0.49438477,86.46789551); //object(a51_blastdoorr) (5)
	blastdoor[1] = CreateDynamicObject(2927,-746.02636719,2535.19433594,10021.5,359.74731445,0.00000000,265.24291992); //object(a51_blastdoorr) (1)
	cage = CreateDynamicObject(2930,-773.52050781,2545.62109375,10022.29492188,359.73632812,359.23095703,354.73205566); //object(chinatgate) (1)
	blastdoor[2] = CreateDynamicObject(2927,-765.26171875,2552.31347656,10021.5,0.00000000,0.00000000,87.44567871); //object(a51_blastdoorr) (5)

	ncontrolroomobjects[0] = CreateDynamicObject(3037,-760.61718750,2544.21679688,10024.92480469,0.00000000,0.00000000,355.98999023); //object(warehouse_door2b) (1)
	ncontrolroomobjects[1] = CreateDynamicObject(3037,-759.52246094,2560.88574219,10024.79785156,0.00000000,0.00000000,355.98999023); //object(warehouse_door2b) (2)
	ncontrolroomobjects[2] = CreateDynamicObject(3037,-755.53906250,2538.61035156,10025.02636719,0.00000000,0.00000000,85.99548340); //object(warehouse_door2b) (3)

	CellGates[1] = CreateDynamicObject(10252,-2075.55273438,-191.64550781,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
 	CellGates[0] = CreateDynamicObject(10252,-2080.28613281,-193.01757812,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[2] = CreateDynamicObject(10252,-2068.00195312,-193.01757812,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[3] = CreateDynamicObject(10252,-2063.56738281,-191.64550781,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[4] = CreateDynamicObject(10252,-2055.99511719,-193.01757812,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[5] = CreateDynamicObject(10252,-2052.22460938,-191.64550781,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[11] = CreateDynamicObject(10252,-2084.99902344,-207.03710938,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[10] = CreateDynamicObject(10252,-2081.52539062,-205.66894531,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[8] = CreateDynamicObject(10252,-2069.53710938,-205.66894531,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[9] = CreateDynamicObject(10252,-2074.00585938,-207.03710938,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[6] = CreateDynamicObject(10252,-2057.59765625,-205.66894531,992.19836426,0.00000000,0.00000000,0.00000000, .interiorid = 10); //object(china_town_gateb)(3)
    CellGates[7] = CreateDynamicObject(10252,-2061.96289062,-207.03710938,992.19836426,0.00000000,0.00000000,179.99450684, .interiorid = 10); //object(china_town_gateb)(3)
    BlastDoors[1] = CreateDynamicObject(2952,-2088.76562500,-211.33984375,994.66918945,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[6] = CreateDynamicObject(2952,-2088.76562500,-209.21093750,994.66918945,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(2)
    BlastDoors[0] = CreateDynamicObject(2952,-2095.10156250,-203.91210938,994.66918945,0.00000000,0.00000000,90.00000000); //prisongate1
    BlastDoors[2] = CreateDynamicObject(2952,-2048.29296875,-205.54394531,990.45825195,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[7] = CreateDynamicObject(2952,-2048.29296875,-207.67382812,990.45825195,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[3] = CreateDynamicObject(2952,-2041.79785156,-195.64550781,990.45825195,0.00000000,0.00000000,179.99450684); //object(kmb_gimpdoor)(1)
    BlastDoors[8] = CreateDynamicObject(2952,-2041.79687500,-197.77246094,990.45825195,0.00000000,0.00000000,179.99450684); //object(kmb_gimpdoor)(1)
    BlastDoors[4] = CreateDynamicObject(2952,-2041.78613281,-211.28515625,984.02539062,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[9] = CreateDynamicObject(2952,-2041.78808594,-209.15917969,984.02539062,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[5] = CreateDynamicObject(2952,-2053.92187500,-205.46679688,977.75732422,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[10] = CreateDynamicObject(2952,-2053.92187500,-207.59570312,977.75732422,0.00000000,0.00000000,0.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[11] = CreateDynamicObject(2952,-2050.50097656,-205.82617188,984.02539062,0.00000000,0.00000000,90.00000000); //object(kmb_gimpdoor)(1)
    BlastDoors[16] = CreateDynamicObject(1569, -2057.9, -144.905, 987.24 ,0, 0.00000000, 270.0);

	SFPDObject[0] =	CreateDynamicObject(976,-1636.02539062,701.49707031,19994.54101562,0.00000000,0.00000000,90.00000000, .interiorid = 3); //object(phils_compnd_gate) (1)
	SFPDObject[1] =	CreateDynamicObject(976,-1635.99414062,696.53320312,19994.55078125,0.00000000,0.00000000,270.00000000, .interiorid = 3); //object(phils_compnd_gate) (2)
	SFPDObject[2] =	CreateDynamicObject(1569,-1625.28808594,712.56250000,19994.85937500,0.00000000,0.00000000,179.99450684, .interiorid = 3); //object(adam_v_door) (2)
	SFPDObject[3] =	CreateDynamicObject(1569,-1613.92871094,681.78125000,19989.05468750,0.00000000,0.00000000,90.00000000, .interiorid = 3); //object(adam_v_door) (4)
	SFPDObject[4] =	CreateDynamicObject(1569,-1634.79492188,712.56250000,19994.85937500,0.00000000,0.00000000,0.00000000, .interiorid = 3); //object(adam_v_door) (7)

	// Gym dynamic objects (bmx parkour)
	BikeParkourObjects[0] = CreateDynamicObject(2669,2848.1015625,-2243.1552734,99.0883789,0.0000000,0.0000000,90.0000000, .worldid = 5, .streamdistance = 300); //object(cj_chris_crate) (1)
	//BikeParkourObjects[1] = CreateDynamicObject(1381,2847.4970703,-2243.1191406,4901.4877930,0.0000000,0.0000000,69.7851562, .worldid = -1, .streamdistance = 300); //object(magnocrane_04) (1)

    MoveDynamicObject(BikeParkourObjects[0], 2848.1015625, -2238.1552734, 99.0883789, 0.5, 0.0, 0.0, 90.0);
	//MoveDynamicObject(BikeParkourObjects[1], 2847.4970703, -2243.1191406, 4901.4877930, 0.5, 0.0, 0.0, 69.7851562);
	
	gFerrisWheel = CreateObject( 18877, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );
	CreateObject( 18878, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );
 	for(new x;x<10;x++)
    {
        gFerrisCages[x] = CreateObject( 19316, gFerrisOrigin[0], gFerrisOrigin[1], gFerrisOrigin[2],
	  							 0.0, 0.0, -270.0, 300.0 );

        AttachObjectToObject( gFerrisCages[x], gFerrisWheel,
							  gFerrisCageOffsets[x][0],
							  gFerrisCageOffsets[x][1],
	  						  gFerrisCageOffsets[x][2],
							  0.0, 0.0, -270.0, 0 );
	}
	
	print("[Streamer] Dynamic Objects has been loaded.");
	
	return 1;
}

/* forward RemoveBuildings(playerid);
public RemoveBuildings(playerid)
{
	//trucker
	RemoveBuildingForPlayer(playerid, 3574, 2182.363, -2292.449, 13.570, 60.000);
	RemoveBuildingForPlayer(playerid, 3744, 2182.363, -2292.449, 13.570, 60.000);
	RemoveBuildingForPlayer(playerid, 3578, 2181.270, -2265.672, 13.428, 30.000);
	RemoveBuildingForPlayer(playerid, 3569, 2226.968, -2252.138, 14.937, 11.000);
	RemoveBuildingForPlayer(playerid, 3747, 2226.968, -2252.138, 14.937, 11.000);
	RemoveBuildingForPlayer(playerid, 3630, 2242.477, -2276.709, 15.234, 27.000);
	RemoveBuildingForPlayer(playerid, 3577, 2244.640, -2273.957, 15.199, 12.000);
	RemoveBuildingForPlayer(playerid, 3631, 2243.128, -2258.448, 14.288, 0.250);
	RemoveBuildingForPlayer(playerid, 3633, 2242.356, -2257.777, 15.335, 2.000);
	// trung thu
	RemoveBuildingForPlayer(playerid, 1226, 2114.718, -1785.180, 16.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2114.718, -1785.180, 16.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 2114.718, -1785.180, 16.398, 0.250);


    RemoveBuildingForPlayer(playerid, 1525, 2065.4375, -1897.2344, 13.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2075.8516, -1926.3281, 16.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 2071.9844, -1922.1250, 11.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);

	// xoa thung nuoc
    RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 956, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1977, 0.0, 0.0, 0.0, 6000.0);

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
	
	
	
	//Cai gi k biet
    RemoveBuildingForPlayer(playerid, 6463, 389.7734, -2028.4688, 19.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5000, 32.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6406, 29.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4531, 24.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2017.4297, 16.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2021.6328, 10.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2028.5156, 8.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3984, 10.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6406, 16.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2039.6563, 24.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3751, 389.8750, -2035.3828, 29.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6406, 16.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2039.6563, 24.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 6298, 389.7734, -2028.4688, 19.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 6461, 389.7734, -2028.5000, 20.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5000, 32.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6406, 29.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4531, 24.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2017.4297, 16.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2021.6328, 10.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2028.5156, 8.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3984, 10.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3752, 389.8750, -2035.3828, 29.9531, 0.25);

	// Mailboxes
	RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1704.7656, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1692.2344, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1291, 231.2813, -1590.0547, 32.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 1291, 546.6953, -1519.8594, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1291, 300.3750, -1645.3750, 32.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, -2617.3984, 817.4375, 49.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, -2516.0781, 898.7813, 64.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, -2596.3672, 459.0234, 14.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, -2756.4375, 698.5547, 40.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 1258, -2374.5313, 678.2109, 34.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 322.6875, -131.1328, 0.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 322.7422, -89.7734, 0.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 242.8672, -131.0781, 0.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 242.8750, -82.6641, 0.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 270.7344, -61.7813, 0.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 291.5625, -61.7266, 0.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 731.8047, -578.8203, 15.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 746.6484, -519.9688, 15.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 746.6875, -540.2422, 15.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 759.5391, -520.0703, 15.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3407, 782.8125, -520.0703, 15.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 3408, 816.7969, -519.9688, 15.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1950.8438, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1933.3125, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1954.2500, 2752.1953, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1965.7109, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1996.1250, 2752.1953, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 2023.0078, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 2018.0703, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 1999.8125, 2732.2422, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 2005.7734, 2752.1953, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 2037.7031, 2752.1953, 10.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1478, 2045.4844, 2752.1953, 10.4453, 0.25);

	// Gas Pumps
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1778.4531, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1774.3125, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1771.3438, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1767.2891, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 970.8516, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 976.1875, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -2410.8047, 981.5234, 44.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -92.1016, -1161.7891, 2.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -97.0703, -1173.7500, 3.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -85.2422, -1165.0313, 2.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, -90.1406, -1176.6250, 2.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1685.9688, 409.6406, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1679.3594, 403.0547, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1681.8281, 413.7813, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1675.2188, 407.1953, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1676.5156, 419.1172, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1669.9063, 412.5313, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1672.1328, 423.5000, 6.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 1686, -1665.5234, 416.9141, 6.3828, 0.25);

	//SAAS SF Base
	RemoveBuildingForPlayer(playerid, 10814, -1146.5547, -145.3047, 17.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1178.1016, -114.8281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1217.1406, -67.1719, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1272.0781, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1334.4766, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1396.8750, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3814, -1459.2734, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1178.1016, -114.8281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1217.1406, -67.1719, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1272.0781, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1334.4766, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1396.8750, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 3815, -1459.2734, -660.3281, 19.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -1365.1563, -643.6875, 25.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 968, -1526.4375, 481.3828, 6.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 966, -1526.3906, 481.3828, 6.1797, 0.25);

	//NOOSE
	RemoveBuildingForPlayer(playerid, 785, -594.9141, -1954.3984, 31.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 785, -635.9219, -1923.8828, 8.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 785, -535.4766, -1851.0703, 8.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -827.9922, -2001.9375, 7.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -817.7266, -2025.5313, 17.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 721, -794.8984, -2066.2422, 13.3438, 0.25);
	RemoveBuildingForPlayer(playerid, 721, -737.4844, -2112.3125, 20.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -686.2813, -1954.3203, 14.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 721, -790.9297, -1900.4531, 3.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 17027, -779.6563, -1845.1016, 27.1797, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -737.9688, -1874.2578, 6.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -732.8906, -1837.1406, 15.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -713.1172, -1837.2266, 14.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 722, -688.0234, -1867.7734, 7.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 17076, -660.6719, -1958.4141, -0.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 791, -594.9141, -1954.3984, 31.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 791, -635.9219, -1923.8828, 8.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 791, -535.4766, -1851.0703, 8.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 17071, -464.1875, -1884.9531, 5.8984, 0.25);

	//San Fierro VIP Lounge -- Exterior
	RemoveBuildingForPlayer(playerid, 10662, -2453.6563, 514.5000, 24.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 966, -2436.8516, 495.4531, 28.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 967, -2438.7266, 495.0078, 29.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 968, -2436.8125, 495.4688, 29.6797, 0.25);

	//Flint County Towing -- LS Office (Farva)
	RemoveBuildingForPlayer(playerid, 4976, 1931.0000, -1871.3906, 15.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1834.3125, -1879.5547, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1839.5859, -1879.5547, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1844.8672, -1879.5547, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1850.1406, -1879.5547, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1855.4141, -1879.5547, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1879.9922, -1879.8906, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1885.2578, -1879.8984, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1864.1797, -1879.6641, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1869.4609, -1879.6641, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1874.7344, -1879.6641, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1890.5234, -1879.6641, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1869.0547, -1876.6328, 11.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1915.0547, -1890.4531, 11.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1951.7344, -1913.2656, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1971.1328, -1891.1484, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1904.3750, -1879.7344, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1909.6563, -1879.7344, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1914.9297, -1879.7344, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1920.1953, -1879.9531, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1413, 1925.4609, -1879.9609, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1930.7188, -1879.7344, 13.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1969.4766, -1875.8906, 12.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1946.4766, -1877.1094, 11.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 4848, 1931.0000, -1871.3906, 15.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 4983, 1961.0313, -1871.4063, 23.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1931.8750, -1863.4609, 16.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1915.7422, -1863.4609, 16.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1952.0313, -1862.9297, 11.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1971.1641, -1826.6953, 12.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1952.0313, -1801.0156, 11.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 1141.9844, -1346.1094, 13.2656, 0.25);
	RemoveBuildingForPlayer(playerid, 1440, 1148.6797, -1385.1875, 13.2656, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 347.1953, 1799.2656, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, 342.9375, 1796.2891, 18.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 0.25);
	// Car Parking Benh vien LS
	RemoveBuildingForPlayer(playerid, 5955, 1301.1875, -1257.0625, 21.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 5967, 1259.4375, -1246.8125, 17.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1388, 1238.3750, -1258.2813, 57.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1391, 1238.3750, -1258.2734, 44.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, 1254.6875, -1276.1641, 17.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 5857, 1259.4375, -1246.8125, 17.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1219, 1284.1797, -1239.6406, 12.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 5709, 1301.1875, -1257.0625, 21.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1327.4297, -1239.9844, 13.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1327.4297, -1234.7422, 13.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1219, 1332.8359, -1241.7188, 13.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3778, 337.4531, -1875.0000, 3.4063, 0.25);
	RemoveBuildingForPlayer(playerid, 3778, 289.2266, -1875.0000, 3.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3615, 289.2266, -1875.0000, 3.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 3615, 337.4531, -1875.0000, 3.4063, 0.25);
	return 1;
} */