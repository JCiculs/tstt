#include <a_samp>
#include <YSI_Coding\y_hooks>

new Money_Vehicles[MAX_VEHICLES];
new Obj_Trom[22];
new ObjModel_Trom[22];
new TromVehicles[3];
new npctrom[1];
new Player_TromItem[MAX_PLAYERS];

enum Trom_enum
{
	Trom_Model,
	Float:TromModel_X,
	Float:TromModel_Y,
	Float:TromModel_Z,
	Float:TromModel_RX,
	Float:TromModel_RY,
	Float:TromModel_RZ,
	TromMoney
}

new TromData[13][Trom_enum] = {
        { 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0 },
        { 2358, 0.143999,0.448000,0.000000,1.300000,91.699943,0.000000, 10 },
        { 2117, 0.857999,0.704999,-0.448999,-1.899999,-88.400054,0.000000, 16 },
        { 2120, -0.009000,0.561999,-0.063999,-1.899999,-88.400054,0.000000, 20 },
        { 2386, 0.179999,0.469000,-0.063999,-5.199999,98.199897,-0.299999, 16 },
        { 948, 0.013999,0.469000,-0.009999,-5.199999,98.199897,-0.299999, 30 },
        { 1708, -0.065000,0.734000,0.249000,-5.199999,98.199897,-0.299999, 30 },
        { 2465, 0.253999,0.377000,-0.018999,-5.199999,98.199897,-167.000015, 10 },
	    { 1550, 0.402000,0.441000,-0.081999,-5.199999,98.199897,-167.000015, 20 },
	    { 1788, 0.090999,0.571000,0.043000,-5.199999,98.199897,-167.000015, 16 },
	    { 2069, 0.083999,0.499000,-0.031999,-5.199999,98.199897,-167.000015, 20 },
	    { 1726, 0.083999,0.499000,-0.031999,-5.199999,98.199897,-167.000015, 20 },
	    { 1714, 0.083999,0.499000,-0.031999,-5.199999,98.199897,-167.000015, 20 }
};

hook OnGameModeInit()
{

 	npctrom[0] = CreateActor(34,2607.03,-1381.83,34.74,90.0000); // don dep nha cua
 	CreateDynamic3DTextLabel("{e52000}House Thief{FFFFFF}\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}nhan viec\nJason",COLOR_YELLOW,2607.03,-1381.83,34.74+1.5,10.0);

	new tmpobjid,houint = 1, houvw = 1;
    tmpobjid = CreateDynamicObject(19379,858.675,1994.941,1009.985,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(2133,850.552,2004.425,1010.093,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19379,848.223,1994.937,1009.985,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(19441,851.953,1995.531,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.232,1994.822,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.232,1996.241,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,850.513,1995.531,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.950,2000.079,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.232,1999.362,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19386,850.513,1997.848,1011.789,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.232,2000.802,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.364,1997.857,1013.679,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,850.642,1997.941,1012.963,180.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,849.476,2004.565,1010.015,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0);
    tmpobjid = CreateDynamicObject(19441,851.364,1994.366,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.364,1991.108,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,846.160,1989.975,1010.005,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
    tmpobjid = CreateDynamicObject(19448,847.216,1994.824,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,858.731,1989.925,1010.005,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(19379,848.250,1989.975,1013.455,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(2152,843.286,1990.036,1010.091,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2152,843.286,1991.406,1010.091,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2152,843.286,1992.776,1010.091,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2152,843.286,1994.136,1010.091,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,843.857,1989.461,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,844.573,1988.745,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,845.408,1987.947,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,847.007,1987.947,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,847.453,1988.645,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,848.166,1989.357,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,849.745,1989.366,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2152,852.900,1999.964,1010.091,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,844.301,1991.045,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,844.307,1994.490,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,843.578,1993.496,1012.775,0.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,843.586,1990.192,1012.765,0.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,843.354,1990.890,1012.786,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,843.344,1993.812,1012.786,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.197,1989.973,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.197,1993.463,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,846.005,1989.350,1010.383,90.000,90.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,849.939,1999.812,1009.392,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2152,854.260,1999.964,1010.091,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2152,854.525,2001.281,1010.091,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2152,854.525,2002.651,1010.091,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,854.674,2000.535,1009.393,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,854.674,2002.135,1009.393,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,854.674,2002.334,1009.393,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,847.054,2000.796,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2141,851.104,2000.681,1010.086,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2141,850.075,2000.681,1010.086,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2133,849.562,2004.425,1010.093,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2133,850.526,2003.409,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2133,849.536,2003.409,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19448,848.661,2007.006,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,846.825,2004.994,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2141,848.622,2007.163,1010.086,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2141,849.581,2007.170,1010.086,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2141,850.541,2007.170,1010.086,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2132,847.411,2004.303,1010.091,0.000,0.000,-269.980, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2134,847.406,2003.316,1010.091,0.000,0.000,-269.980, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2131,847.405,2001.345,1010.088,0.000,0.000,-269.980, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2134,847.401,2006.290,1010.091,0.000,0.000,-269.980, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2134,847.401,2007.290,1010.091,0.000,0.000,-269.980, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19379,848.223,1999.537,1013.486,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,848.226,2009.126,1013.491,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19448,861.546,1992.709,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,861.554,2002.336,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,859.924,2004.523,1010.005,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 3922, "bistro", "DinerFloor", 0);
    tmpobjid = CreateDynamicObject(19448,858.236,2007.015,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,857.215,1988.639,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,859.018,1989.354,1010.328,90.000,90.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.494,1989.354,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,858.987,1988.639,1011.043,0.000,90.000,0.018, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "walp73S", 0);
    tmpobjid = CreateDynamicObject(19441,861.934,1988.514,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,861.184,1987.782,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,865.081,1997.991,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19325,859.335,1988.532,1011.338,0.000,0.000,-89.940, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(19379,858.731,1989.925,1013.440,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(2141,851.512,2007.170,1010.086,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2163,861.668,1993.166,1010.096,0.000,0.000,-90.058, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2200,861.544,1995.506,1010.098,0.000,0.000,-90.058, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2200,861.517,1991.310,1010.098,0.000,0.000,-90.058, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,850.133,2003.926,1013.463,180.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "gun_ceiling2_128", 0);
    tmpobjid = CreateDynamicObject(2133,851.526,2003.409,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2133,851.552,2004.425,1010.093,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19379,858.684,1999.541,1013.481,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,858.703,2009.104,1013.476,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19441,860.323,2001.814,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,861.039,2002.542,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,860.354,2004.319,1010.129,90.000,90.000,-270.600, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,860.393,2007.786,1010.129,90.000,90.000,-270.600, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,862.515,1989.347,1010.328,90.000,90.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,862.484,1988.625,1011.043,0.000,90.000,0.018, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "walp73S", 0);
    tmpobjid = CreateDynamicObject(19441,861.062,2003.509,1010.844,0.000,90.000,-90.518, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "walp73S", 0);
    tmpobjid = CreateDynamicObject(19441,861.098,2006.969,1010.844,0.000,90.000,-90.518, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 15041, "bigsfsave", "walp73S", 0);
    tmpobjid = CreateDynamicObject(19325,860.976,2004.326,1011.338,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(19441,861.015,2007.182,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,860.325,2000.264,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 18064, "ab_sfammuunits", "gun_targetc", 0);
    tmpobjid = CreateDynamicObject(19441,860.338,1998.744,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,858.864,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,860.465,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,855.664,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19448,848.073,2011.600,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,854.065,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,852.474,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,851.375,1990.192,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,850.666,1990.932,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,849.945,1990.212,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2257,860.219,2000.303,1011.976,0.000,0.000,-89.638, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 2691, "cj_base5", "base5_2", 0);
    tmpobjid = CreateDynamicObject(19441,852.474,2008.666,1011.080,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,854.065,2008.666,1011.080,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,855.664,2008.666,1011.080,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,858.864,2008.666,1011.054,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,860.465,2008.666,1011.051,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19379,856.456,1983.698,1013.107,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19441,851.174,1989.369,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,852.611,1989.369,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2267,861.425,1992.809,1011.635,0.000,0.000,-90.059, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 3096, "bbpcpx", "blugrad32", 0);
    tmpobjid = CreateDynamicObject(19389,854.150,1989.362,1011.626,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19389,854.150,1989.372,1011.626,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,855.015,1988.484,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,855.015,1986.884,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.841,1988.494,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.839,1986.913,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,852.519,1984.513,1010.015,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14789, "ab_sfgymmain", "gym_floor6", 0);
    tmpobjid = CreateDynamicObject(19448,859.751,1986.143,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19389,855.328,1979.797,1011.626,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19389,849.357,1979.789,1011.626,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,852.970,1979.799,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.370,1979.799,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19448,847.865,1981.803,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,851.838,1985.397,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,847.105,1984.679,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.943,1980.517,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.943,1982.117,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.943,1983.297,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.943,1984.897,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,856.943,1985.307,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2163,852.544,1979.847,1010.088,0.000,0.000,-179.759, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2163,852.544,1979.847,1011.006,0.000,0.000,-179.759, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19379,852.942,1980.458,1013.098,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,848.498,1974.905,1010.015,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 14668, "711c", "bwtilebroth", 0);
    tmpobjid = CreateDynamicObject(19448,847.872,1972.284,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,853.663,1975.070,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,856.764,1970.189,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,863.055,1974.922,1010.025,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(19448,861.705,1979.799,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,866.456,1975.055,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19448,866.211,1970.207,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19379,856.476,1974.099,1013.107,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(19379,866.900,1974.957,1013.107,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0);
    tmpobjid = CreateDynamicObject(2267,861.076,1970.873,1011.774,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2267,861.112,1970.934,1011.774,0.000,0.000,-180.180, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 3096, "bbpcpx", "blugrad32", 0);
    tmpobjid = CreateDynamicObject(2238,861.111,1970.840,1011.060,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19441,860.775,1977.008,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(19441,862.375,1977.008,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19389,864.773,1977.008,1011.626,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,860.051,1977.726,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(19441,860.051,1978.966,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2163,857.609,1979.689,1010.092,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(19448,853.671,1965.810,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2131,854.245,1970.922,1010.024,0.000,0.000,90.239, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2163,859.687,1970.269,1010.103,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2163,863.410,1970.297,1010.103,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2272,854.501,1974.214,1011.078,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 3096, "bbpcpx", "blugrad32", 0);
    tmpobjid = CreateDynamicObject(2238,853.935,1974.190,1011.280,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2272,854.624,1973.397,1011.078,0.000,0.000,104.940, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 3096, "bbpcpx", "blugrad32", 0);
    tmpobjid = CreateDynamicObject(2272,854.659,1974.999,1011.078,0.000,0.000,68.459, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 3096, "bbpcpx", "blugrad32", 0);
    tmpobjid = CreateDynamicObject(2272,853.723,1975.385,1011.078,0.000,0.000,-111.600, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2272,853.491,1974.232,1011.078,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2272,853.656,1973.155,1011.078,0.000,0.000,-75.040, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2257,866.352,1971.739,1011.480,0.000,0.000,-89.940, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(2257,866.352,1973.759,1011.480,0.000,0.000,-89.940, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(2257,866.354,1975.779,1011.480,0.000,0.000,-89.940, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(2265,861.544,1976.431,1011.535,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(2265,860.674,1976.431,1011.535,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(19448,852.133,2011.571,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2257,847.413,1994.713,1011.976,0.000,0.000,0.061, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 18064, "ab_sfammuunits", "gun_targetc", 0);
    tmpobjid = CreateDynamicObject(19448,848.764,1974.689,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 9515, "bigboxtemp1", "ws_alley5_256_blank", 0);
    tmpobjid = CreateDynamicObject(2200,853.593,1977.971,1010.084,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2163,850.117,1974.673,1010.103,0.000,0.000,-180.059, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    tmpobjid = CreateDynamicObject(2270,851.172,1979.217,1011.335,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(2270,853.134,1979.212,1011.307,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0);
    SetDynamicObjectMaterial(tmpobjid, 1, 14581, "ab_mafiasuitea", "barbersmir1", 0);
    tmpobjid = CreateDynamicObject(19379,848.223,1994.237,1009.995,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(19379,859.034,1974.922,1010.015,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    SetDynamicObjectMaterial(tmpobjid, 0, 4887, "downtown_las", "pershing1_LAn", 0);
    tmpobjid = CreateDynamicObject(19448,842.976,1991.324,1011.793,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,842.630,1993.133,1012.075,0.000,90.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,842.640,1990.821,1012.075,0.000,90.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19379,842.658,1984.619,1011.106,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,855.729,1989.353,1011.822,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,850.510,2000.079,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,851.361,1997.364,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,850.518,1988.650,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,843.697,1994.193,1012.672,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,843.784,1992.225,1012.672,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(3094,848.044,1992.185,1010.073,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(3122,848.627,1992.828,1011.258,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(3122,847.445,1992.837,1011.258,0.000,-18.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2999,847.833,1992.389,1011.010,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2995,848.419,1992.208,1011.010,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,851.293,1991.829,1012.672,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,851.293,1993.420,1012.672,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,843.784,1990.265,1012.672,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,851.361,1987.697,1013.479,90.000,90.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2421,847.047,2003.442,1011.064,0.000,0.000,-270.979, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19448,862.077,1987.923,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,855.776,1988.637,1011.822,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2270,852.526,1999.677,1011.692,0.000,0.000,89.338, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2270,852.526,2000.437,1011.692,0.000,0.000,89.338, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,858.244,1992.600,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,858.244,1991.640,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,862.065,2008.666,1011.163,180.000,90.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,863.208,2006.120,1011.163,180.000,90.000,-179.940, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,863.208,2004.520,1011.163,180.000,90.000,-179.940, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1716,855.744,2000.537,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1716,855.744,2001.687,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1716,855.744,2002.897,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2236,858.213,1992.036,1010.059,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,855.312,1988.499,1014.775,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,853.723,1988.499,1014.775,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,852.122,1988.499,1014.775,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,851.265,2003.340,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,848.825,2003.340,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,850.054,2003.340,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,850.054,2004.480,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,848.794,2004.480,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(957,851.255,2004.480,1013.348,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,861.043,2001.087,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,861.744,2006.489,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,854.443,2000.707,1011.132,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,854.299,2001.029,1011.132,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,854.395,2002.423,1011.132,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,854.383,2002.823,1011.132,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2848,851.465,2003.567,1011.145,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1536,850.541,1998.630,1010.093,0.000,0.000,-89.819, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19441,857.265,2008.666,1010.723,180.009,90.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,857.380,2003.336,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,857.359,2004.306,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2817,857.359,2005.265,1010.091,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2204,856.517,2006.922,1010.085,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2194,860.581,2004.510,1011.203,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2194,859.205,1989.079,1011.403,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1736,846.119,1988.342,1012.700,0.000,0.000,-175.979, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(18871,858.184,1992.650,1010.565,0.000,0.000,-28.680, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19421,858.945,1992.352,1010.565,0.000,0.000,31.319, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2059,843.164,1991.495,1011.153,0.000,0.000,-28.920, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2272,852.533,1995.505,1011.609,0.000,0.000,90.179, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2059,858.781,1992.649,1010.575,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,857.036,2006.604,1011.861,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2694,847.304,2001.296,1012.664,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2694,847.367,2002.131,1012.664,0.000,0.000,11.100, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19448,847.106,1986.195,1011.793,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1798,860.538,1973.596,1010.103,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2089,861.549,1970.573,1010.103,0.000,0.000,-180.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2173,854.324,1973.689,1010.077,0.000,0.000,90.239, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2268,856.867,1970.770,1011.476,0.000,0.000,-180.180, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1828,861.277,1972.857,1010.103,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2372,860.804,1977.825,1010.073,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2394,860.585,1978.431,1010.783,0.000,0.000,-90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2373,862.698,1979.861,1010.077,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2401,862.557,1979.627,1011.492,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2401,863.218,1979.627,1011.492,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2843,864.744,1978.520,1010.114,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2844,860.964,1978.314,1010.104,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2845,862.933,1977.835,1010.104,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,862.325,1970.564,1011.028,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,862.707,1976.534,1010.605,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1516,862.941,1976.296,1010.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1543,862.831,1976.328,1010.605,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1665,863.093,1976.090,1010.640,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2074,860.967,1974.879,1012.797,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2843,858.450,1973.459,1010.114,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2845,855.273,1971.918,1010.104,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1787,859.798,1970.462,1011.093,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2953,863.168,1970.523,1011.037,0.000,0.000,-136.259, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2856,857.425,1979.446,1011.017,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2256,860.151,1978.476,1012.022,0.000,0.000,90.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2647,849.897,2004.178,1011.285,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2647,849.583,2004.146,1011.285,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2526,851.818,1975.359,1010.103,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2528,852.384,1979.280,1010.104,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(19379,846.010,1973.542,1013.107,0.000,90.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2524,850.679,1979.189,1010.104,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(2571,855.304,1984.636,1010.103,0.000,0.000,-88.860, houint,  houvw, -1,100.00);
    tmpobjid = CreateDynamicObject(1665,856.068,1982.952,1010.612,0.000,0.000,0.000, houint,  houvw, -1,100.00);


    Obj_Trom[1] = CreateDynamicObject(2358,856.489,2006.697,1011.989,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[1] = 2358;
    Obj_Trom[2] = CreateDynamicObject(2117,857.731,2004.913,1010.093,0.000,0.000,-90.058, houint,  houvw, -1,100.00);
    ObjModel_Trom[2] = 2117;
    Obj_Trom[3] = CreateDynamicObject(2120,858.966,2004.785,1010.723,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[3] = 2120;
    Obj_Trom[4] = CreateDynamicObject(2120,858.955,2003.984,1010.723,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[4] = 2120;
    Obj_Trom[5] = CreateDynamicObject(2120,856.757,2004.785,1010.723,0.000,0.000,-179.220, houint,  houvw, -1,100.00);
    ObjModel_Trom[5] = 2120;
    Obj_Trom[6] = CreateDynamicObject(2120,856.757,2003.925,1010.723,0.000,0.000,-179.220, houint,  houvw, -1,100.00);
    ObjModel_Trom[6] = 2120;
    Obj_Trom[7] = CreateDynamicObject(2386,844.947,1988.875,1011.304,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[7] = 2386;
    Obj_Trom[8] = CreateDynamicObject(2386,844.924,1988.288,1011.304,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[8] = 2386;
    Obj_Trom[9] = CreateDynamicObject(948,848.594,1984.091,1010.103,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[9] = 948;
    Obj_Trom[10] = CreateDynamicObject(1708,850.148,1983.974,1010.103,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[10] = 1708;
    Obj_Trom[11] = CreateDynamicObject(2465,857.956,2006.647,1012.117,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[11] = 2465;
    Obj_Trom[12] = CreateDynamicObject(1726,857.453,1995.291,1010.093,0.000,0.000,0.119, houint,  houvw, -1,100.00);
    ObjModel_Trom[12] = 1726;
    Obj_Trom[13] = CreateDynamicObject(1726,856.013,1991.732,1010.093,0.000,0.000,89.458, houint,  houvw, -1,100.00);
    ObjModel_Trom[13] = 1726;
    Obj_Trom[14] = CreateDynamicObject(1726,859.773,1990.353,1010.093,0.000,0.000,179.759, houint,  houvw, -1,100.00);
    ObjModel_Trom[14] = 1726;
    Obj_Trom[15] = CreateDynamicObject(1550,861.465,1977.376,1010.448,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[15] = 1550;
    Obj_Trom[16] = CreateDynamicObject(1550,861.952,1977.343,1010.448,0.000,0.000,52.439, houint,  houvw, -1,100.00);
    ObjModel_Trom[16] = 1550;
    Obj_Trom[17] = CreateDynamicObject(1788,859.812,1970.496,1011.221,0.000,0.000,-179.759, houint,  houvw, -1,100.00);
    ObjModel_Trom[17] = 1788;
    Obj_Trom[18] = CreateDynamicObject(2069,856.521,1989.790,1010.114,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[18] = 2069;
    Obj_Trom[19] = CreateDynamicObject(2069,856.481,1985.655,1010.138,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[19] = 2069;
    Obj_Trom[20] = CreateDynamicObject(2069,859.456,1979.371,1010.147,0.000,0.000,0.000, houint,  houvw, -1,100.00);
    ObjModel_Trom[20] = 2069;
    Obj_Trom[21] = CreateDynamicObject(1714,855.916,1974.880,1010.103,0.000,0.000,-54.299, houint,  houvw, -1,100.00);
    ObjModel_Trom[21] = 1714;

	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(Player_TromItem[playerid] != 0) Player_TromItem[playerid] = 0;
	return 1;
}

hook OnVehicleSpawn(vehicleid){

	if(IsATromCar(vehicleid))
	{
	    Money_Vehicles[vehicleid] = 0;
	}
	return 1;
}

hook OnPlayerUpdate(playerid)
{
	if(GetPVarInt(playerid,"HouseTrom") > 0)
	{
	    CheckTrom(playerid);
	}
	return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(vehicleid == TromVehicles[0] || vehicleid == TromVehicles[1] || vehicleid == TromVehicles[2])
    {
    	if(Money_Vehicles[vehicleid] > 0)
    	{
			SendClientMessageEx(playerid, -1, "{e52000}House Thief{FFFFFF}: Hay bam nut Y tren ban phim de di ban nhung do ban da trom duoc.");
			return 1;
    	}
	}
	/*if(!ispassenger)
	{
		if(IsATromCar(vehicleid))
		{
		    if(PlayerInfo[playerid][pJob] != 25 && PlayerInfo[playerid][pJob2] != 25)
		    {
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz+1.3);
				PlayerPlaySound(playerid, 1130, slx, sly, slz+1.3);
			    RemovePlayerFromVehicle(playerid);
			    SendClientMessageEx(playerid, COLOR_GRAD2, "{e52000}House Thief{FFFFFF}: Ban khong the su dung phuong tien nay.");
			}
		}
	}*/
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	if(CP[playerid] == 252000)
	{
	 	CP[playerid] = 0;
	 	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	 	DisablePlayerCheckpoint(playerid);
	}
    if(CP[playerid] == 303010) // trom
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        new string[128];
        if(IsATromCar(vehicleid))
        {
        	format(string,128,"{e52000}House Thief{FFFFFF}: Ban da nhan duoc $%d tu phi vu trom do nay.",Money_Vehicles[vehicleid]);
        	SendClientMessageEx(playerid,-1,string);
        	PlayerInfo[playerid][pCash] += Money_Vehicles[vehicleid];
        	Money_Vehicles[vehicleid] = 0;
        	SetVehicleToRespawn(vehicleid);
        	DisablePlayerCheckpoint(playerid);
 	    	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
        }
    }
    if(CP[playerid] == 303009) // trom
    {
        if(Player_TromItem[playerid] > 0)
        {
            GiveMoneyTrom(playerid,GetPVarInt(playerid,"TromVehicle"));
            Player_TromItem[playerid] = 0;
            RemovePlayerAttachedObject(playerid, 9);
            ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
            new Float:Pos[3], Float:PPos[3];
			GetVehiclePos(GetPVarInt(playerid,"TromVehicle"), Pos[0], Pos[1], Pos[2]);
			GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
			DisablePlayerCheckpoint(playerid);
 	    	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
 	    	// await task_ms(1000);
            SetTimerEx("LayHangBocVac", 1000, false, "d", playerid);
        }
    }
}
forward TromXeEx(playerid);
public TromXeEx(playerid)
{
    ClearAnimations(playerid);
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
}

#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_YES)
    {
		if(IsPlayerInRangeOfActor(playerid, npctrom[0]))
		{
			new string[128];
		    if(PlayerInfo[playerid][pJob] == 25 || PlayerInfo[playerid][pJob2] == 25)
		    {
		       // format(string,1024,"Sô nhà 23\nSô nhà 24\n Sô nhà 25");
		        format(string,sizeof(string),"So nha 10");
				ShowPlayerDialog(playerid, 2740, DIALOG_STYLE_LIST, "> Danh sach nha co the trom", string, "Tim", "Huy");
		    }
		    else if(PlayerInfo[playerid][pJob] != 25 && PlayerInfo[playerid][pJob2] != 25)
		    {
		        if(PlayerInfo[playerid][pLevel] >= 2)
		        {
			        format(string,1024,"Day la cong viec nguy hiem doi hoi su gan da");
					ShowPlayerDialog(playerid, 2741, DIALOG_STYLE_MSGBOX, "> Doi Thoai NPC", string, "Xin viec", "Khong gi");
				}
			}
			else
			{
			    format(string,1024,"Ban con qua tre chua thich hop lam cong viec nay");
				ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "> Doi Thoai NPC", string, "Okey", "");
			}
		}
	}
        new SlotTrom = GetPos_Trom(playerid);
	if (HOLDING( KEY_YES ) && SlotTrom > 0 && Player_TromItem[playerid] == 0 && PlayerInfo[playerid][pJob] == 25)
	{
	    new Float:posplayer[3],Float:pos[3];
	    GetPlayerPos(playerid,posplayer[0],posplayer[1],posplayer[2]);
	    GetDynamicObjectPos(Obj_Trom[SlotTrom],pos[0], pos[1], pos[2]);
		ApplyAnimation(playerid,"CARRY", "liftup", 4.1, 0, 1, 1, 1, 0, 1);
		Player_TromItem[playerid] = ObjModel_Trom[SlotTrom];
		SetDynamicObjectPos(Obj_Trom[SlotTrom],pos[0], pos[1], pos[2]-50);
		SetTimerEx("ResetTrom", 60000*3, 0, "dfff", Obj_Trom[SlotTrom], pos[0], pos[1], pos[2]-50);
		for(new i = 1; i < sizeof(TromData); i++)
		{
		    if(ObjModel_Trom[SlotTrom] == TromData[i][Trom_Model])
		    {
		        SetPlayerAttachedObject(playerid, 9, ObjModel_Trom[SlotTrom], 6, TromData[i][TromModel_X], TromData[i][TromModel_Y], TromData[i][TromModel_Z], TromData[i][TromModel_RX], TromData[i][TromModel_RY], TromData[i][TromModel_RZ], 0.850, 0.850, 0.850, 0, 0);
		        // await task_ms(1000);
                SetTimerEx("TromXeEx1", 1000, false, "d", playerid);
		    }
		}
	}
	return 1;
}
forward TromXeEx1(playerid);
public TromXeEx1(playerid)
{
    ClearAnimations(playerid);
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
}
hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	new vehicleid = GetPlayerVehicleID(playerid);
    if(newstate == PLAYER_STATE_DRIVER && IsATromCar(vehicleid))
    {
    	if(Money_Vehicles[vehicleid] > 0)
    	{
    	    //SetPlayerCheckpoint(playerid, -2449.1389,-122.1843,26.1367, 5.0);
    	    SetPlayerCheckpoint(playerid, 2602.37,-1360.20,35.29, 5.0);
     		CP[playerid] = 303010;
    	}
	}
	return 1;
}

hook OnPlayerExitVehicle(playerid, vehicleid)
{
	if(GetVehicleModel(vehicleid) == 499)
	{
	    SetPVarInt(playerid,"TromVehicle",vehicleid);
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2741)
	{
		ShowPlayerDialog(playerid, CHAPNHANCONGVIEC, DIALOG_STYLE_MSGBOX, "> Cong viec", "Ban co chac chan rang muon nhan cong viec nay hay khong", "Co", "Khong");
        return cmd_xinviec(playerid, "");
	}
	if(dialogid == 2740) // tim nha de trom
	{
	    new Float:X, Float:Y, Float: Z;
		if(response)
		{
		    switch(listitem)
		    {
		        case 0:
		        {
      			 	X = HouseInfo[10][hExteriorX], Y = HouseInfo[10][hExteriorY], Z = HouseInfo[10][hExteriorZ];
          			SetPlayerCheckpoint(playerid, X, Y, Z, 2.0);
          			CP[playerid] = 252000;
		        }
		        case 1:
		        {
          			X = HouseInfo[24][hExteriorX], Y = HouseInfo[24][hExteriorY], Z = HouseInfo[24][hExteriorZ];
          			SetPlayerCheckpoint(playerid, X, Y, Z, 2.0);
          			CP[playerid] = 252000;
		        }
		        case 2:
		        {
          			X = HouseInfo[25][hExteriorX], Y = HouseInfo[25][hExteriorY], Z = HouseInfo[25][hExteriorZ];
          			SetPlayerCheckpoint(playerid, X, Y, Z, 2.0);
          			CP[playerid] = 252000;
		        }
		    }
		}
	}
	return 1;
}

stock Player_Speed(playerid, bool:kmh)
{
    new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
    if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz); else GetPlayerVelocity(playerid,Vx,Vy,Vz);
    rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
    return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}

stock CheckTrom(playerid)
{
    new Float:speed = Player_Speed(playerid, false);
    new string[128];
	if(speed == 0)
	{
        format(string,128,"Di tu tu nhe~n~Waring: %d/100%",GetPVarInt(playerid,"Waring_Trom"));
	}
	if(speed >= 2 && speed <= 6)
	{
	   format(string,128,"Good~n~Waring: %d/100%",GetPVarInt(playerid,"Waring_Trom"));
	}
	if(speed >= 7)
	{
	    format(string,128,"~r~Di Cham Lai~w~~n~Waring: %d/100%",GetPVarInt(playerid,"Waring_Trom"));
	    SetPVarInt(playerid,"Waring_Trom",GetPVarInt(playerid,"Waring_Trom")+ 1);
	}
	if(GetPVarInt(playerid,"Waring_Trom") >= 100)
	{
	    format(string,128,"~r~Mau Chay Khoi Day~n~Truoc Khi Canh Sat Toi");
	    RemovePlayerAttachedObject(playerid, 9);
		Player_TromItem[playerid] = 0;
		//defer PlayerAnim(playerid,0);
		ClearAnimations(playerid);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		new Float:pos[3];
		GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
		PlayerPlaySound(playerid, 3401, pos[0],pos[1],pos[2]);
	//	new i = GetPVarInt(playerid,"HouseTrom");
	}
	GameTextForPlayer(playerid, string, 800, 6);
}
stock GiveMoneyTrom(playerid,vehicleid)
{
    for(new i = 1; i < sizeof(TromData); i++)
	{
		if(Player_TromItem[playerid] == TromData[i][Trom_Model])
		{
		    new string[6400];
		    Money_Vehicles[vehicleid] += TromData[i][TromMoney];
                    PlayerInfo[playerid][pTienBan] += 1;
                    format(string, sizeof(string), "Tong tien trom: %d(+%d) va 1 cuc tien ban.", Money_Vehicles[vehicleid],TromData[i][TromMoney]);
                    SendClientMessageEx(playerid,COLOR_WHITE,string);
		    return 1;
		}
 	}
 	return 0;
}
stock GetPos_Trom(playerid)
{
	new Float: Pos[3];
	for(new i = 1; i < sizeof(Obj_Trom); i++)
	{
		GetDynamicObjectPos(Obj_Trom[i], Pos[0], Pos[1], Pos[2]);
		if(IsPlayerInRangeOfPoint(playerid, 1.6, Pos[0], Pos[1], Pos[2]))
		{
		    return i;
		}
	}
	return 0;
}

stock IsATromCar(carid)
{
	for (new v = 0; v < sizeof(TromVehicles); v++) {
	    if(carid == TromVehicles[v]) return 1;
	}
	return 0;
}

forward ResetTrom(object, Float:x, Float:y, Float:z);
public ResetTrom(object, Float:x, Float:y, Float:z)
{
    SetDynamicObjectPos(object, x, y, z+50);
    return 1;
}
