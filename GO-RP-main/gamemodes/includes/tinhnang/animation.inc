/********************************************************
 *                                                      *
 *   @Author:                   Los Santos World        *
 *   @Year started:             2020                    *
 *   @Main scripter:            Arashi                  *
 *   @Supporte scripter :       duydang.            	*
 *                              Ares                    *
 *                              zOn                     *
 *                              SAMP Community [VN]     *
 *   @Mapper:                   Nekko                   *
 *   @Other:                    update                  *
 *                                                      *
 *********************************************************/

#include <a_samp>

#include <YSI_Coding\y_hooks>

// #include <config_animation>

new bool:useAnimation[MAX_PLAYERS];
/*hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(GetPVarInt(playerid, "Injured") != 0) return;

	if(IsKeyJustDown(KEY_SPRINT,newkeys,oldkeys))
	{
		if(useAnimation[playerid] == true)
		{
			ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0, 1);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
       	 	DeletePVar(playerid, "namxuong");
			ClearAnimations(playerid);
		}
    }
}*/
CMD:stopanim(playerid)
{
	useAnimation[playerid] = false;
    ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0, 1);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return true;
}

CMD:hanhdong(playerid) {
    // SendClientMessage(playerid, -1, COLOR_GREY, "/360flip1 /360flip2 /adance1 /adance10 /adance11 /adance12 /adance13 /adance14 /adance15 /adance16");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/adance2 /adance3 /adance4 /adance5 /adance6 /adance7 /adance8 /adance9");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/deathn /achopper /aidle /babyanim1 /babyanim2 /backflip /backflip720 /backflips /beachselfie");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/biketrick1 /biketrick2 /biketrick3 /biketrick4 /bleedh /bleedi /bmxtrick1 /bmxtrick2 /bong");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/breakdance /burndie /ccskill /ccpass /ccskill2 /chsit /chsit2 /carhook1 /carhook2 /carhook3 /ccorpsep");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/claphand /comeatme /cflip /copaim /cophold /copcross /couchh /cover1 /cover2 /cover3 /cover4 /cover5");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/crossaseat /csaim /csaimgun /csaimrifle /csalerted /csangrypcall /csangrypcall2 /csbenchsit /csbleeding");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/csboxpractice /cscocainesnort/csdancebeat /csdancehiphop/csdesksit /csdjdance /csdjrdance /csdleave /cseatfood /csfemdance");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/csgang /csgetout /csgetup /  /csguncheck2 /cshandsuprela /csidletablecha /csinjured");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/csinterrogatio /csjapchick /csjazzdance /csjazzdance /cslaugh /csmeditate /csoldrelax /cspartyhard /csphonecall /cspoledance");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/cspopdance /cspopdance2 /csbenchtalk /csidlesit /csidlesit2 /cstalk /cssit /cstable");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/cswalkt /csrepair /csriptenpenn /csrobodance /cssadsitcha /cssertalk /csschat /csschat1 /cssdiscuss /csstalk /csswidechat /cssneakpeak");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/csstandcchat /cssttalk /cstalk2 /cstalkinj /cstasktalk /csknee /cssit2 /csmeditate1");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/csttt /csvideogame /cswarmup /cswhack /csyogi2 /csinspectwep /cutesit /dab2 /deadnewidle /deathback /deathfall /deathfront /deathspin");	
    // SendClientMessage(playerid, -1, COLOR_GREY, "/decentfuckyou /downbegger /drillmove /dcorpsep /emptycash /fgunwk /fgunwk2 /fidle1 /fidle2 /fidlestance");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/fnaughty /fplayerwk /fpose /fpose2 /fpose3 /fpose4 /fpose5 /fpose6 /fpose7 /fpose8 /fpose9");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/fsit /fsit2 /fsit3 /fsit4 /fsit5 /fwepcr /fwkperiod /frelaxed /fishidle /fishpull /fishstruggl");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/fishtoss /fishingidle /freewayidle /freewayidle /freewayidle /freewayidle /fuckoffpal");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/gearshift /gliderhang /gliderloop /golfhigh /golflow /golfmed /gs1 /gs2 /gs3 /gs4 /gs5 /gs6 /gs7 /gs8 /gs9 /gtcl /gtrk");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/gunaim /gunwalk /haccu /hbreak /hbehind /handair /handpisto /hstand");		
    // SendClientMessage(playerid, -1, COLOR_GREY, "/hstand1 /hstand2 /hstand3 /hstand4 /handsup /handsup /handsup /handsupk /handsups");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/hanghoo /hidle /hwalk /aimho /aimfo /holdm /holds /holdstr /hotw /holyshi /hoidle /hostrg /idass /idwh /idwp /idwr /idws");		
    // SendClientMessage(playerid, -1, COLOR_GREY, "/handback /itemdep /hitemch /kickupcig /kickfoot /knocked /lldown /llup /lsdown /lsup");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/leanobj /dab /lalive /marryme /mselfie /mselfie1 /mselfie2 /mselfie3 /mverc /mjmw /mopf /nazi");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/chsit3 /ngwalk /ngwalk1 /nigga /nrgtrick1 /nrgtrick2 /nrgtrick3 /nrgtrick4 /ohstand /olflip");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/pfroll /pcorpse /pkor1 /pkor2 /pkor3 /pkor4 /pkor5 /pkor6 /pkor7 /praylord /flipdance /psy");			
    // SendClientMessage(playerid, -1, COLOR_GREY, "/rlxsit /rlxf1 /rlxf2 /rlxf3 /rlxf4 /rlxf5 /rlxseat /dbflip /robocop /roundbb /roundb");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/salute /selfie /selfie2 /slapfh /sneeze /spdf /spdf1 /spdr /squat /squat2 /sths /swpar");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/tkap /thdn /thup /tossm /umbw /umbw1 /umbw2 /umbw3 /usdp /vccw /vchsit");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/vird /vird1 /vird2 /vird3 /vird4 /vird5 /vird55 /vird6 /vird7 /vird8 /vird9 /vird10");
    // SendClientMessage(playerid, -1, COLOR_GREY, "/wfat /wwsh /whback1 /whback2 /whback3 /wtou /wbflip /wfpar /wfflip /wsflip /wup /widecs /ze /zi /zr /zr2");
	// SendClientMessage(playerid, -1, COLOR_GREY, "/zw1 /zw2 /zw3 /zw4 /zw5 /zw6 /zw7 /zw8");
    SendClientMessage(playerid,  COLOR_GREY,  "/dancing /drunk /pickupphone /hangupphone /bomb /bye /deal /crack /smoking /sit /chat /taichi /sleeping /fallout");
	SendClientMessage(playerid,  COLOR_GREY, "/laugh /beach /vomit2 /eatfood /crack2 /medic /oralsex");
	SendClientMessage(playerid,  COLOR_GREY, "/dead /arms /gangster /taxi /traffic /haveshot /kiss /box /sword /police /elbow /roll /handsup2 /bat /shouttalk /see /cheer");
	SendClientMessage(playerid,  COLOR_GREY, "/sword /throw /basket /tired /dive /fight /stand");
	SendClientMessage(playerid,  COLOR_GREY, "/scratching /leanon /run /strip /dance /spray /sunbathe /rifle /mechanic /carry /console /cry /myhand /gunhit /discuss");
	SendClientMessage(playerid,  COLOR_GREY, "/camera /slap /billiard /finger /pink /vomit /nn");
	SendClientMessage(playerid,  COLOR_GREY, "/tired /seat /cumout /paymoney /hide /yes /fucku /casino /carstyle /hurt /wakeup /mmm /suck /office /dildosex /oralsexcar");
    return true;
}
/*alias:animation("animlist", "hanhdong")

// hook OnPlayerCmdPerformed(playerid, cmd[], params[], result, flags) {
//     new animation[32];
// 	for(new i; i < sizeof(UGMP_Anims); i++) {
// 		alm(animation, UGMP_Anims[i][UG_AnimCMD]);
// 		strdel(animation, 0, 1);
// 		if(strcmp(cmd, animation) == 0) {
// 			ClearAnimations(playerid);
// 			ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0, 1);
// 			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
// 			ApplyAnimation(playerid, "SAMP", UGMP_Anims[i][UG_AnimName], 4.1, false, true, true, 1, 10, 1);
// 			break;
// 		}
// 	}
//     return true;
// }*/

CMD:reload(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	ApplyAnimation(playerid, "UZI",	"UZI_reload", 4.0, 0, 1, 1, 0, 0, 1);
	useAnimation[playerid] = true;
	return true;
}

CMD:look(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	ApplyAnimation(playerid, "WUZI", "Wuzi_stand_loop", 4.0, 0, 1, 1, 0, 0, 1);
	useAnimation[playerid] = true;
	return true;
}

CMD:smoking(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/smoking [1-7]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, 	"SMOKING",	"M_smklean_loop",	4.0, 1, 0, 1, 0, 0, 1);
		case 2: ApplyAnimation(playerid, 	"SMOKING",	"M_smkstnd_loop",	4.0, 1, 0, 1, 0, 0, 1);
		case 3: ApplyAnimation(playerid, 	"SMOKING",	"M_smk_out",		4.0, 0, 1, 1, 0, 0, 1);
		case 4: ApplyAnimation(playerid, 	"SMOKING",	"M_smk_in",			4.0, 0, 1, 1, 0, 0, 1);
		case 5: ApplyAnimation(playerid, 	"GANGS", 	"smkcig_prtl",		4.0, 0, 1, 1, 0, 0, 1);
		case 6: ApplyAnimation(playerid, 	"SMOKING",	"M_smk_drag",		4.0, 0, 1, 1, 0, 0, 1);
		case 7: ApplyAnimation(playerid,	"SMOKING",	"F_smklean_loop",	4.0, 1, 0, 1, 0, 0, 1);
		default: SendClientMessage(playerid, -1, "/smoking [1-7]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:gangster(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	if (IsPlayerInAnyVehicle(playerid))
	{
		new animation;
		if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/gangster [1-9]");
		switch (animation)
		{
			case 1: ApplyAnimation(playerid, "GHANDS", 		"gsign2", 			4.0, 0, 0, 1, 0, 0, 1);
			case 2: ApplyAnimation(playerid, "GHANDS",		"gsign2LH",			4.0, 0, 0, 1, 0, 0, 1);
			case 3: ApplyAnimation(playerid, "GHANDS",		"gsign3",			4.0, 0, 0, 1, 0, 0, 1);
			case 4: ApplyAnimation(playerid, "GHANDS",		"gsign3LH",			4.0, 0, 0, 1, 0, 0, 1);
			case 5: ApplyAnimation(playerid, "GHANDS",		"gsign4",			4.0, 0, 0, 1, 0, 0, 1);
			case 6: ApplyAnimation(playerid, "GHANDS",		"gsign4LH",			4.0, 0, 0, 1, 0, 0, 1);
			case 7: ApplyAnimation(playerid, "GHANDS",		"gsign5",			4.0, 0, 0, 1, 0, 0, 1);
			case 8: ApplyAnimation(playerid, "GHANDS",		"gsign5LH",			4.0, 0, 0, 1, 0, 0, 1);
			case 9: ApplyAnimation(playerid, "LOWRIDER",		"prtial_gngtlkG",	4.0, 0, 0, 1, 0, 0, 1);
			default: SendClientMessage(playerid, -1, "/gangster [1-9]");
		}
		useAnimation[playerid] = true;
	}
	else
	{
		new animation;
		if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/gangster [1-16]");
		switch (animation)
		{
			case 1: ApplyAnimation(playerid, "RAPPING",		"RAP_A_Loop", 		4.0, 1, 0, 1, 0, 0, 1); //nosepuede en coche
			case 2: ApplyAnimation(playerid, "RAPPING",		"RAP_C_Loop", 		4.0, 1, 0, 1, 0, 0, 1); //nosepuede en coche
			case 3: ApplyAnimation(playerid, "GHANDS", 		"gsign2", 			4.0, 1, 1, 1, 1, 1, 1);
			case 4: ApplyAnimation(playerid, "GHANDS",		"gsign2LH",			4.0, 1, 1, 1, 1, 1, 1);
			case 5: ApplyAnimation(playerid, "GHANDS",		"gsign3",			4.0, 1, 1, 1, 1, 1, 1);
			case 6: ApplyAnimation(playerid, "GHANDS",		"gsign3LH",			4.0, 1, 1, 1, 1, 1, 1);
			case 7: ApplyAnimation(playerid, "GHANDS",		"gsign4",			4.0, 1, 1, 1, 1, 1, 1);
			case 8: ApplyAnimation(playerid, "GHANDS",		"gsign4LH",			4.0, 1, 1, 1, 1, 1, 1);
			case 9: ApplyAnimation(playerid, "GHANDS",		"gsign5",			4.0, 1, 1, 1, 1, 1, 1);
			case 10: ApplyAnimation(playerid, "GHANDS",		"gsign5LH",			4.0, 1, 1, 1, 1, 1, 1);
			case 11: ApplyAnimation(playerid, "benchpress",	"gym_bp_celebrate", 4.0, 0, 0, 1, 0, 0, 1);//nosepuede en coche
			case 12: ApplyAnimation(playerid, "LOWRIDER",		"prtial_gngtlkG",	4.0, 0, 0, 1, 0, 0, 1);
			case 13: ApplyAnimation(playerid, "RIOT",			"RIOT_ANGRY",		4.0, 0, 0, 1, 0, 0, 1);//nosepuede en coche
			case 14: ApplyAnimation(playerid, "RIOT",			"RIOT_challenge",	4.0, 0, 0, 1, 0, 0, 1);//nosepuede en coche
			case 15: ApplyAnimation(playerid, "RAPPING",		"RAP_B_Loop",		4.0, 1, 0, 1, 0, 0, 1);//nosepuede en coche
			case 16: ApplyAnimation(playerid, "SCRATCHING",	"scdrulp",			4.0, 1, 0, 1, 0, 0, 1);//nosepuede en coche
			default: SendClientMessage(playerid, -1, "/gangster [1-16]");
		}
		useAnimation[playerid] = true;
	}
	return true;
}

CMD:chat(playerid)
{
	new animation;
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "PED", 		"IDLE_chat", 		4.1, 1, 0, 0, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "MISC", 		"IDLE_CHAT_02", 	4.1, 1, 0, 0, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkA", 	4.1, 1, 0, 0, 1, 1, 1);
		case 4: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkB", 	4.1, 1, 0, 0, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkE", 	4.1, 1, 0, 0, 1, 1, 1);
		case 6: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkF", 	4.1, 1, 0, 0, 1, 1, 1);
		case 7: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkG", 	4.1, 1, 0, 0, 1, 1, 1);
		case 8: ApplyAnimation(playerid, "GANGS", 	"prtial_gngtlkH", 	4.1, 1, 0, 0, 1, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:walk(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/walk [1-12]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, 	"PED", 	"WALK_civi", 		4.1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, 	"PED", 	"WALK_gang1", 		4.1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, 	"PED", 	"WALK_gang2", 		4.1, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid, 	"PED", 	"WALK_old", 		4.1, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, 	"PED", 	"WALK_fatold",		4.1, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid, 	"PED", 	"WALK_fat",			4.1, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid, 	"PED", 	"WOMAN_walknorm",	4.1, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid, 	"PED", 	"WOMAN_walkbusy",	4.1, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid, 	"PED", 	"WOMAN_walkpro",	4.1, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid, "PED", 	"WOMAN_walksexy",	4.1, 1, 1, 1, 1, 1);
		case 11: ApplyAnimation(playerid, "PED", 	"WALK_drunk",		4.1, 1, 1, 1, 1, 1);
		case 12: ApplyAnimation(playerid, "PED", 	"Walk_Wuzi",		4.1, 1, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/walk [1-12]");
	}
	useAnimation[playerid] = true;
	return true;
}
CMD:namxuong(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
    SetPVarInt(playerid, "namxuong", 1);
    ApplyAnimation(playerid,"WUZI", "CS_Dead_Guy",4.0,0,0,1,1,0);
	useAnimation[playerid] = true;
	return true;
}
CMD:bye(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/bye [1-8]");
	if (anim < 1 || anim > 8) return SendClientMessage(playerid, -1, "/bye [1-8]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "KISSING", 		"BD_GF_Wave", 	4.0, 0, 0, 1, 0, 1);
		case 2: ApplyAnimation(playerid, "ON_LOOKERS", 	"wave_in", 		4.0, 0, 0, 1, 0, 1);
		case 3: ApplyAnimation(playerid, "ON_LOOKERS", 	"wave_loop", 	4.0, 0, 0, 1, 0, 1);
		case 4: ApplyAnimation(playerid, "ON_LOOKERS", 	"wave_out", 	4.0, 0, 0, 1, 0, 1);
		case 5: ApplyAnimation(playerid, "BD_FIRE",		"BD_GF_Wave", 	4.0, 0, 0, 1, 0, 1);
		case 6: ApplyAnimation(playerid, "ped", 			"endchat_01", 	4.0, 0, 0, 1, 0, 1);
		case 7: ApplyAnimation(playerid, "ped", 			"endchat_02", 	4.0, 0, 0, 1, 0, 1);
		case 8: ApplyAnimation(playerid, "ped", 			"endchat_03", 	4.0, 0, 0, 1, 0, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:carstyle(playerid, params[])
{
	if (!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban can phai o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/carstyle [1-19]");
	if (anim < 1 || anim > 19) return SendClientMessage(playerid, -1, "/carstyle [1-19]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, 	"KISSING", 		"GF_CarArgue_01", 	4.0, 0, 0, 1, 0, 0, 1);
		case 2: ApplyAnimation(playerid, 	"KISSING", 		"GF_CarArgue_02", 	4.0, 0, 0, 1, 0, 0, 1);
		case 3: ApplyAnimation(playerid, 	"KISSING", 		"GF_CarSpot", 		4.0, 0, 0, 1, 0, 0, 1);
		case 4: ApplyAnimation(playerid, 	"LOWRIDER", 	"lrgirl_hair",		4.0, 0, 0, 1, 1, 0, 1);
		case 5: ApplyAnimation(playerid, 	"LOWRIDER", 	"lrgirl_idleloop",	4.0, 1, 0, 1, 0, 0, 1);
		case 6: ApplyAnimation(playerid, 	"LOWRIDER", 	"Sit_relaxed",		4.0, 0, 0, 1, 1, 0, 1);
		case 7: ApplyAnimation(playerid, 	"LOWRIDER", 	"Tap_hand",			4.0, 0, 0, 0, 1, 0, 1);
		case 8: ApplyAnimation(playerid, 	"CAR_CHAT", 	"carfone_in", 		4.0, 0, 0, 0, 1, 0, 1);
		case 9: ApplyAnimation(playerid, 	"CAR_CHAT", 	"carfone_loopA", 	4.0, 0, 0, 0, 1, 0, 1);
		case 10: ApplyAnimation(playerid, "CAR_CHAT", 	"carfone_loopB", 	4.0, 0, 0, 0, 1, 0, 1);
		case 11: ApplyAnimation(playerid, "CAR_CHAT", 	"CAR_Sc1_BL", 		4.0, 0, 0, 0, 1, 0, 1);
		case 12: ApplyAnimation(playerid, "CAR_CHAT", 	"CAR_Sc3_FL", 		4.0, 0, 0, 0, 1, 0, 1);
		case 13: ApplyAnimation(playerid, "CAR_CHAT", 	"car_talkm_in", 	4.0, 0, 0, 0, 1, 0, 1);
		case 14: ApplyAnimation(playerid, "CAR_CHAT", 	"car_talkm_loop", 	4.0, 0, 0, 0, 1, 0, 1);
		case 15: ApplyAnimation(playerid, "CAR_CHAT", 	"car_talkm_out", 	4.0, 0, 0, 0, 1, 0, 1);
		case 16: ApplyAnimation(playerid, "ped", 			"CAR_sit_weak", 	4.0, 0, 0, 0, 1, 0, 1);
		case 17: ApplyAnimation(playerid, "ped", 			"CAR_LB_pro", 		4.0, 0, 0, 0, 1, 0, 1);
		case 18: ApplyAnimation(playerid, "ped", 			"CAR_sit", 			4.0, 0, 0, 0, 1, 0, 1);
		case 19: ApplyAnimation(playerid, "ped", 			"CAR_dead_RHS", 	4.0, 0, 0, 0, 1, 0, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:camera(playerid, params[])
{	
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/camera [1-14]");
	if (anim < 1 || anim > 14) return SendClientMessage(playerid, -1, "/camera [1-14]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "CAMERA", "camcrch_cmon", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "CAMERA", "camcrch_idleloop", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "CAMERA", "camcrch_stay", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "CAMERA", "camcrch_to_camstnd", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "CAMERA", "camstnd_cmon", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "CAMERA", "camstnd_idleloop", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "CAMERA", "camstnd_lkabt", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "CAMERA", "camstnd_to_camcrch", 4.0, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "CAMERA", "piccrch_in", 4.0, 0, 0, 0, 1, 1);
		case 10: ApplyAnimation(playerid, "CAMERA", "piccrch_out", 4.0, 0, 0, 0, 1, 1);
		case 11: ApplyAnimation(playerid, "CAMERA", "piccrch_take", 4.0, 0, 0, 0, 1, 1);
		case 12: ApplyAnimation(playerid, "CAMERA", "picstnd_in", 4.0, 0, 0, 0, 1, 1);
		case 13: ApplyAnimation(playerid, "CAMERA", "picstnd_out", 4.0, 0, 0, 0, 1, 1);
		case 14: ApplyAnimation(playerid, "CAMERA", "picstnd_take", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:discuss(playerid, params[])
{	
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/discuss [1-6]");
	if (anim < 1 || anim > 6) return SendClientMessage(playerid, -1, "/discuss [1-6]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "KISSING", "GF_StreetArgue_01", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "KISSING", "GF_StreetArgue_02", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "PAULNMAC", "PnM_Argue1_A", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "PAULNMAC", "PnM_Argue1_B", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "PAULNMAC", "PnM_Argue2_A", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "PAULNMAC", "PnM_Argue2_B", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:police(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/police [1-9]");
	if (anim < 1 || anim > 9) return SendClientMessage(playerid, -1, "/police [1-9]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "POLICE", "CopTraf_Away", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "POLICE", "CopTraf_Left", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "POLICE", "CopTraf_Stop", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "POLICE", "COP_getoutcar_LHS", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "POLICE", "Cop_move_FWD", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "POLICE", "Door_Kick", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "POLICE", "plc_drgbst_01", 4.0, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "POLICE", "plc_drgbst_02", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:sword(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/sword [1-2]");
	if (anim < 1 || anim > 2) return SendClientMessage(playerid, -1, "/sword [1-2]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "SWORD", "sword_block", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "SWORD", "sword_IDLE", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:crack(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/crack [1-10]");
	if (anim < 1 || anim > 10) return SendClientMessage(playerid, -1, "/crack [1-10]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "SWAT", "gnstwall_injurd", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "CRACK", "crckdeth1", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "CRACK", "crckdeth3", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "CRACK", "crckidle1", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "CRACK", "crckidle2", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "CRACK", "crckidle3", 4.0, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "CRACK", "crckidle4", 4.0, 0, 0, 0, 1, 1);
		case 10: ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:oralsex(playerid, params[])
{
	if (!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/oralsex [1-12]");
	if (anim < 1 || anim > 12) return SendClientMessage(playerid, -1, "/oralsex [1-12]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_START_W", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_START_P", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_P", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_END_W", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_END_P", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_START_W", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_START_P", 4.0, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_LOOP_W", 4.0, 0, 0, 0, 1, 1);
		case 10: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_LOOP_P", 4.0, 0, 0, 0, 1, 1);
		case 11: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_END_W", 4.0, 0, 0, 0, 1, 1);
		case 12: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_STAND_END_P", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:oralsexcar(playerid, params[])
{
	if (!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban can phai o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/oralsexcar [1-7]");
	if (anim < 1 || anim > 7) return SendClientMessage(playerid, -1, "/oralsexcar [1-7]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_START_W", 4.0, 0, 0, 0, 1, 0, 1);
		case 2: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_START_P", 4.0, 0, 0, 0, 1, 0, 1);
		case 3: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_LOOP_W", 4.0, 0, 0, 0, 1, 0, 1); //Una sola vez
		case 4: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_LOOP_W", 4.0, 1, 0, 0, 1, 0, 1); //Continuo
		case 5: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_LOOP_P", 4.0, 0, 0, 0, 1, 0, 1);
		case 6: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_END_W", 4.0, 0, 0, 0, 1, 0, 1);
		case 7: ApplyAnimation(playerid, "BLOWJOBZ", "BJ_CAR_END_P", 4.0, 0, 0, 0, 1, 0, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:dildosex(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/dildosex [1-8]");
	if (anim < 1 || anim > 8) return SendClientMessage(playerid, -1, "/dildosex [1-8]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "SNM", "SPANKING_IDLEW", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "SNM", "SPANKING_IDLEP", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "SNM", "SPANKINGW", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "SNM", "SPANKINGP", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "SNM", "SPANKEDW", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "SNM", "SPANKEDP", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "SNM", "SPANKING_ENDW", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "SNM", "SPANKING_ENDP", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:gunhit(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/gunhit [1-7]");
	if (anim < 1 || anim > 8) return SendClientMessage(playerid, -1, "/gunhit [1-7]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "SHOP", "SHP_Gun_Aim", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "PYTHON", "python_crouchreload", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "SHOP", "SHP_Gun_Grab", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "SHOP", "SHP_Gun_Threat", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "ped", "gang_gunstand", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:office(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/office [1-10]");
	if (anim < 1 || anim > 10) return SendClientMessage(playerid, -1, "/office [1-10]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "INT_OFFICE", "FF_Dam_Fwd", 4.0, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_2Idle_180", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Bored_Loop", 4.0, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Crash", 4.0, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Drink", 4.0, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Idle_Loop", 4.0, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_In", 4.0, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Read", 4.0, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Type_Loop", 4.0, 0, 0, 0, 1, 1);
		case 10: ApplyAnimation(playerid, "INT_OFFICE", "OFF_Sit_Watch", 4.0, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:sunbathe(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if(sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/sunbathe [1-4]");
	if(anim < 1 || anim > 4) return SendClientMessage(playerid, -1, "/sunbathe [1-4]");
	switch(anim)
	{
		case 1: ApplyAnimation(playerid, "SUNBATHE", "ParkSit_W_idleA", 4.000000, 0, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "SUNBATHE", "Lay_Bac_in", 4.0, 0, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "SUNBATHE", "Lay_Bac_out", 4.0, 0, 0, 0, 0, 1);
		case 4: ApplyAnimation(playerid, "SUNBATHE", "SitnWait_in_W", 4.000000, 0, 0, 0, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:suck(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true; ApplyAnimation(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 1, 1); return true; }
CMD:cumout(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 0, 1); return true; }
CMD:piss(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PAULNMAC", "Piss_in", 4.0, 0, 0, 0, 0, 1); return true; }
CMD:paymoney(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "DEALER", "shop_pay", 4.000000, 0, 1, 1, 0, 1); return true; } //comerciar
//CMD:fight(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "ped", "FIGHTIDLE", 4.000000, 0, 1, 1, 1, 1); return true; } //pelea
CMD:sleeping(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R", 4.1, 0, 0, 0, 1, 1); return true; } //dormir
CMD:taxi(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "IDLE_taxi", 4.1, 0, 1, 1, 1, 1); return true; }
CMD:vomit(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "FOOD", "EAT_Vomit_SK", 4.1, 0, 1, 1, 1, 1); return true; } //asco
CMD:mmm(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_think", 4.1, 0, 0, 0, 0, 1); return true; }
CMD:fucku(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "ped", "fucku", 4.0, 0, 1, 1, 1, 1); return true; } //fokear
CMD:myhand(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 1, 1, 0, 4001); return true; } //cruzarbrazos
CMD:hide(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "ped", "cower", 4.0, 1, 0, 0, 0, 1); return true; } //cubrirme
CMD:vomit2(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 1); return true; } //vomitar
CMD:hurt(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");useAnimation[playerid] = true;ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 1); return true; } //agonizar
CMD:stand(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "ped", "getup_front", 4.000000, 0, 0, 0, 0, 1); return true; } //depie
CMD:yes(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "GANGS", "Invite_Yes", 4.0, 0, 0, 0, 0, 1); return true; } //s
CMD:no(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "GANGS", "Invite_No", 4.0, 0, 0, 0, 0, 1); return true; }
CMD:wakeup(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "ped", "SEAT_up", 4.000000, 0, 0, 1, 0, 1); return true; } //levantarme
CMD:tired2(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "WOMAN_runfatold", 4.1, 7, 5, 1, 1, 1); return true; } //cansarme
CMD:carry(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 1, 1, 1, 1); return true; } //carga
CMD:cry(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "GRAVEYARD", "mrnF_loop", 4.1, 1, 1, 1, 1, 1); return true; } //llorar
//CMD:slap(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "MISC", "bitchslap", 4.1, 1, 0, 0, 1, 1); return true; } //bofetada
CMD:facepalm(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "MISC", "plyr_shkhead", 4.1, 0, 0, 0, 0, 1); return true; }
CMD:see(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "BD_FIRE", "BD_Panic_Loop", 4.1, 1, 1, 1, 1, 1); return true; }
CMD:rifle(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "BUDDY", "buddy_reload", 4.1, 0, 1, 1, 1, 1); return true; }
CMD:drunk(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1); return true; } //bebido
CMD:bomb(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 1, 0, 0, 1, 1); return true; } //bomba
CMD:laugh(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 1, 1, 1, 1, 1); return true; } //reir
CMD:eatfood(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 1, 1, 1, 1); return true; }
CMD:deal(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 1, 1, 1, 1); return true; } //trato
CMD:sit(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 1, 1, 1); return true; }
CMD:taichi(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop", 4.0, 1, 1, 1, 1, 1); return true; }
CMD:falout(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "KO_skid_front", 4.1, 0, 1, 1, 1, 1); return true; } //caer
CMD:dead(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "FLOOR_hit_f", 4.0, 0, 1, 1, 1, 1); return true; } //muerto
CMD:scratching(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "MISC", "Scratchballs_01", 4.1, 1, 1, 1, 1, 1); return true; }
CMD:spray(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "SPRAYCAN", "spraycan_full", 4.0, 1, 1, 1, 1, 1); return true; }
CMD:medic(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 0, 1); return true; } //medico
CMD:haveshot(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "KO_shot_face", 4.0, 0, 1, 1, 1, 1); return true; }
CMD:dive(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "EV_dive", 4.0, 0, 1, 1, 1, 1); return true; } //saltovital
CMD:elbow(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "BIKE_elbowL", 4.0, 0, 0, 0, 0, 1); return true; } //tortazo
CMD:roll(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "PED", "BIKE_fallR", 4.0, 0, 1, 1, 1, 1); return true; } //rodar
CMD:handsup2(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "POLICE", "crm_drgbst_01", 4.0, 0, 1, 1, 1, 1); return true; }
CMD:gymbox(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 1, 1, 1, 1); return true; } //boxear
CMD:cheer(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "RIOT", "RIOT_CHANT", 4.0, 1, 1, 1, 1, 1); return true; }
CMD:finger(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "RIOT", "RIOT_FUKU", 4.0, 0, 0, 0, 0, 1); return true; } //dedo
CMD:shouttalk(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "RIOT", "RIOT_shout", 4.0, 1, 1, 1, 1, 1); return true; } //gritando
CMD:throw(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.0, 0, 1, 1, 1, 1); return true; } //lanzar
CMD:casino(playerid) { if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien."); useAnimation[playerid] = true;ApplyAnimation(playerid, "CASINO", "cards_loop", 4.0, 0, 1, 1, 1, 1); return true; }	

CMD:pickupphone(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung hanh dong khi dang o tren phuong tien.");
	if (GetPVarInt(playerid, "playerEvent") == 1) return SendClientMessage(playerid, -1, "Ban khong the lam viec nay khi dang o trong su kien.");
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	useAnimation[playerid] = true;
	return true;
}

CMD:hangupphone(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung hanh dong khi dang o tren phuong tien.");
	if (GetPVarInt(playerid, "playerEvent") == 1) return SendClientMessage(playerid, -1, "Ban khong the lam viec nay khi dang o trong su kien.");
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	useAnimation[playerid] = true;
	return true;
}

CMD:handsup(playerid)
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung hanh dong khi dang o tren phuong tien.");
	if (GetPVarInt(playerid, "playerEvent") == 1) return SendClientMessage(playerid, -1, "Ban khong the lam viec nay khi dang o trong su kien.");
	if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) { SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP); useAnimation[playerid] = true;}
	return true;
}

CMD:tired(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "i", animation)) return SendClientMessage(playerid, -1, "/tired [1 - 2]");
	if (animation == 1) return useAnimation[playerid] = true, ApplyAnimation(playerid, "PED", "IDLE_tired", 4.0, 1, 0, 1, 1, 1);
	else if (animation == 2) return useAnimation[playerid] = true, ApplyAnimation(playerid, "FAT", "IDLE_tired", 4.0, 1, 0, 1, 1, 1);
	else return SendClientMessage(playerid, -1, "/tired [1 - 2]");
}

CMD:dancing(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "i", animation)) return SendClientMessage(playerid, -1, "/dancing [1 - 13]");
	if (animation == 1) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "bd_clap",4.0,1,0,0,0,1);
	else if (animation == 2) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "bd_clap1",4.0,1,0,0,0,1);
	else if (animation == 3) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dance_loop",4.0,1,0,0,0,1);
	else if (animation == 4) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "DAN_Down_A",4.0,1,0,0,0,1);
	else if (animation == 5) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "DAN_Left_A",4.0,1,0,0,0,1);
	else if (animation == 6) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "DAN_Loop_A",4.0,1,0,0,0,1);
	else if (animation == 7) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "DAN_Right_A",4.0,1,0,0,0,1);
	else if (animation == 8) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "DAN_Up_A",4.0,1,0,0,0,1);
	else if (animation == 9) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dnce_M_a",4.0,1,0,0,0,1);
	else if (animation == 10) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dnce_M_b",4.0,1,0,0,0,1);
	else if (animation == 11) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dnce_M_c",4.0,1,0,0,0,1);
	else if (animation == 12) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dnce_M_d",4.0,1,0,0,0,1);
	else if (animation == 13) return useAnimation[playerid] = true, ApplyAnimation(playerid, "DANCING", "dnce_M_e",4.0,1,0,0,0,1);
	else return SendClientMessage(playerid, -1, "/dancing [1 - 13]");
}

CMD:arms(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/arms [1-6]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "CASINO", "cards_in",4.1,0,1,1,1,1);
		case 2: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_shake",4.1,0,1,1,1,1);
		case 3: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_think",4.1,0,1,1,1,1);
		case 4: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_watch",4.1,0,1,1,1,1);
		case 5: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE",4.1,0,1,1,1,1);
		case 6: ApplyAnimation(playerid, "GRAVEYARD", "prst_loopa",4.1,0,1,1,1,1);
		default: SendClientMessage(playerid, -1, "/arms [1-6]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:crack2(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/crack2 [1-9]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid,"CRACK","crckdeth1",4.1,0,1,1,1,1);
		case 2: ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,1,0,0,1,1);
		case 3: ApplyAnimation(playerid,"CRACK","crckdeth3",4.1,0,1,1,1,1);
		case 4: ApplyAnimation(playerid,"CRACK","crckdeth4",4.1,0,1,1,1,1);
		case 5: ApplyAnimation(playerid,"CRACK","crckidle1",4.1,1,1,1,1,1);
		case 6: ApplyAnimation(playerid,"CRACK","crckidle2",4.1,1,0,0,1,1);
		case 7: ApplyAnimation(playerid,"CRACK","crckidle3",4.1,0,1,1,1,1);
		case 8: ApplyAnimation(playerid,"CRACK","crckidle4",4.1,1,0,0,1,1);
		case 9: ApplyAnimation(playerid,"SWEET","Sweet_injuredloop",4.1,1,0,0,1,1);
		default: SendClientMessage(playerid, -1, "/crack2 [1-9]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:seat(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new anim;
	if (sscanf(params, "d", anim)) return SendClientMessage(playerid, -1, "/seat [1-9]");
	if (anim < 1 || anim > 9) return SendClientMessage(playerid, -1, "/seat [1-9]");
	switch (anim)
	{
		case 1: ApplyAnimation(playerid, "Attractors", "Stepsit_in", 4.1, 0, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "Attractors", "Stepsit_out", 4.1, 0, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "FOOD", "FF_Sit_Eat3", 4.1, 0, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "FOOD", "FF_Sit_In", 4.1, 0, 0, 0, 1, 1);
		case 5: ApplyAnimation(playerid, "FOOD", "FF_Sit_In_L", 4.1, 0, 0, 0, 1, 1);
		case 6: ApplyAnimation(playerid, "FOOD", "FF_Sit_In_R", 4.1, 0, 0, 0, 1, 1);
		case 7: ApplyAnimation(playerid, "PED", "SEAT_down", 4.1, 0, 0, 0, 1, 1);
		case 8: ApplyAnimation(playerid, "INT_HOUSE", "LOU_In", 4.1, 0, 0, 0, 1, 1);
		case 9: ApplyAnimation(playerid, "MISC", "SEAT_LR", 4.1, 0, 1, 1, 1, 1);
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:bat(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/bat [1-2]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "CRACK", "Bbalbat_Idle_01", 4.1, 0, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "CRACK", "Bbalbat_Idle_02", 4.1, 0, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/bat [1-2]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:basket(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/basket [1-7]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "BSKTBALL", "BBALL_run", 4.1, 1, 1, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "BSKTBALL", "BBALL_idleloop", 4.1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.1, 0, 0, 0, 0, 1);
		case 4: ApplyAnimation(playerid, "BSKTBALL", "BBALL_def_loop", 4.1, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.1, 0, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid, "BSKTBALL", "BBALL_idle", 4.1, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid, "BSKTBALL", "BBALL_idle2", 4.1, 1, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/basket [1-7]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:traffic(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/traffic [1-4]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "POLICE", "CopTraf_Away", 4.1, 1, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.1, 1, 0, 0, 1, 1);
		case 3: ApplyAnimation(playerid, "POLICE", "CopTraf_Left", 4.1, 1, 0, 0, 1, 1);
		case 4: ApplyAnimation(playerid, "POLICE", "CopTraf_Stop", 4.1, 1, 0, 0, 1, 1);
		default: SendClientMessage(playerid, -1, "/traffic [1-4]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:leanon(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if  (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/leanon [1-2]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "GANGS", "leanIDLE", 4.0, 1, 0, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "MISC", "Plyrlean_loop", 4.0, 1, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/leanon [1-2]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:billiard(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/billiard [1-3]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "POOL", "POOL_Idle_Stance", 4.1, 0, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "POOL", "POOL_Med_Start", 4.1, 0, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "POOL", "POOL_Med_Shot", 4.1, 0, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/billiard [1-3]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:run(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/run [1-6]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "PED", "run_civi", 4.1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "PED", "run_gang1", 4.1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "PED", "run_old", 4.1, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid, "PED", "run_fat", 4.1, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "PED", "woman_run", 4.1, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid, "PED", "WOMAN_runsexy", 4.1, 1, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/run [1-6]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:strip(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/strip [1-7]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid, "STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid, "STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid, "STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/strip [1-7]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:beach(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/beach [1-5]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "BEACH", "bather", 4.1, 0, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "BEACH", "Lay_Bac_Loop", 4.1, 0, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "BEACH", "BD_Fire3", 4.1, 0, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid, "BEACH", "ParkSit_W_loop", 4.1, 0, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid, "BEACH", "SitnWait_loop_W", 4.1, 0, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/beach [1-5]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:mechanic(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/mechanic [1-2]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "CAR", "Fixn_Car_Loop", 4.1, 1, 0, 0, 1, 1);
		case 2: ApplyAnimation(playerid, "CAR", "Fixn_Car_Out", 4.1, 0, 0, 0, 1, 1);
		default: SendClientMessage(playerid, -1, "/mechanic [1-2]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:console(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung lenh nay khi dang o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/console [1-3]");
	switch (animation)
	{
		case 1: ApplyAnimation(playerid, "CRIB", "PED_Console_Loop", 4.1, 0, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "CRIB", "PED_Console_Loose", 4.1, 0, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "CRIB", "PED_Console_Win", 4.1, 0, 1, 1, 1, 1);
		default: SendClientMessage(playerid, -1, "/console [1-3]");
	}
	useAnimation[playerid] = true;
	return true;
}

CMD:dance(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "Ban khong the su dung hanh dong nay khi o tren phuong tien.");
	new animation;
	if (sscanf(params, "d", animation)) return SendClientMessage(playerid, -1, "/dance [1-4]");
	switch (animation)
	{
		case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
		default: SendClientMessage(playerid, -1, "/dance [1-4]");
	}
	useAnimation[playerid] = true;
	return true;
}