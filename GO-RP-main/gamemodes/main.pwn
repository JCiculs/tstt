#pragma warning disable 208, 213, 201, 217, 219, 239, 214
#pragma option -d3
#define PP_SYNTAX_AWAIT
#define PP_SYNTAX_FOR_POOL
#define PP_SYNTAX_FOR_LIST
#define PP_SYNTAX_FOR_MAP
//native SendClientMessagez(playerid, color, AmxString:message)=SendClientMessage;
native MessageStr(playerid, color, AmxString:message) = SendClientMessage;
#define SERVER_GM_TEXT "GO:RP Version 1.0.0"
#define YSI_NO_HEAP_MALLOC
#define YSI_NO_MODE_CACHE
//#define YSI_NO_CACHE_MESSAGE
//#define YSI_NO_OPTIMISATION_MESSAGE
//#define YSI_NO_VERSION_CHECK
#include <a_samp>
#include <a_actor>
#include <s_actor>
#include <a_mysql>
#include <streamer>
#include <yom_buttons>
#include <zcmd>
#include <sscanf2>
//#include <strlib>
//#include <string>
#include <progress2>
//#include <progress>
//#include <nex-ac>
//#include <foreach>
#include <YSF>
#include <YSI_Coding\y_timers>
#include <YSI_Core\y_utils>
#include <crashdetect>
#include <dininew>
#include <pawnplus>
#include <compat>
#include <colandreas>
//#include <OnPlayerTeleport>
//#include <weapon-config>
//#include <MenuStore>
#if defined SOCKET_ENABLED
#include <socket>
#endif
//=======================================================================================================================================//

/* -------------------------------- MAIN -------------------------------- */
#include "./includes/Main/defines.pwn"
#include "./includes/Main/enums.pwn"
#include "./includes/Main/variables.pwn"
#include "./includes/Main/timers.pwn"
#include "./includes/Main/functions.pwn"
#include "./includes/Main/commands.pwn"
#include "./includes/Main/admin_cmd.pwn"
#include "./includes/Main/mysql.pwn"
#include "./includes/Main/OnPlayerLoad.pwn"
#include "./includes/Main/callbacks.pwn"
#include "./includes/Main/streamer.pwn"
#include "./includes/Main/Biz247.pwn"
#include "./includes/Main/textdraws.pwn"
#include "./includes/Main/OnDialogResponse.pwn"
#include "./includes/Main/Spec.pwn"
	
/* -------------------------------- JOB -------------------------------- */
#include "./includes/Job/daumo.pwn"
#include "./includes/Job/bocvac.inc"

#include "./includes/Job/giaohang.pwn"
#include "./includes/Job/ngudan.inc"
#include "./includes/Job/khaithacthan.inc"
//#include "./includes/Job/truckernew.inc"
#include "./includes/Job/lumberjack1.pwn"
#include "./includes/Job/daoda.inc"
#include "./includes/Job/tromnha.inc"
#include "./includes/Job/pizzajob.inc"
//#include "./includes/Job/timxejob.inc"
#include "./includes/Job/giaovatlieu.pwn"

#include "./includes/buonlau/trongcansa.inc"
#include "./includes/buonlau/haican.pwn"
#include "./includes/buonlau/Loading.pwn"

#include "./includes/Job/nuoibo.pwn"
#include "./includes/job/trucker.inc"
//#include "./includes/test/noithat.pwn"

/* -------------------------------- ANTI CHEAT -------------------------------- */
#include "./includes/cheat/anti_teleport.inc"

/* -------------------------------- ANTI CHEAT -------------------------------- */
#include "./includes/file/Administrator.pwn"
#include "./includes/file/animlist.pwn"

/* -------------------------------- MAPPING-------------------------------- */
 #include "./includes/map/mapping.inc"
// #include "./includes/map/removelspd.inc"
 #include "./includes/map/shopxe.inc"

/* -------------------------------- SYSTEM -------------------------------- */
#include "./includes/tinhnang/damage.inc"
#include "./includes/tinhnang/thucan.inc"
#include "./includes/tinhnang/fixcar.inc"
#include "./includes/tinhnang/thuexe.pwn"
#include "./includes/tinhnang/mask.pwn"
#include "./includes/tinhnang/speedo.pwn"
#include "./includes/tinhnang/thibanglai.inc"
#include "./includes/tinhnang/bekhoa.inc"
#include "./includes/tinhnang/Main.pwn"
//#include "./includes/tinhnang/Doikhattd.pwn"
#include "./includes/tinhnang/hungerstat.pwn"
#include "./includes/tinhnang/nametag.pwn"

#include "./includes/system/ads.inc"

#include "./includes/system/buycar.inc"
#include "./includes/system/chiemdong.pwn"
#include "./includes/system/Flymode.pwn"
#include "./includes/system/Bugging.pwn"
#include "./includes/system/thangthua.pwn"
//#include "./includes/system/vukhi.inc"

/* -------------------------------- SYSTEM -------------------------------- */
#include "./includes/Faction/factionew.pwn"
/* -------------------------------- CASINO -------------------------------- */
#include "./includes/casino/taixiu.pwn"


//=======================================================================================================================================//
main() {}

public OnGameModeInit()
{
	//LoadSong();
	regaccount = 1;
 	buonlau_lock = 1;
	//ShowNameTags(true);
	ShowNameTags(0);
	DisableNameTagLOS();
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}
