#include <a_samp>
#include <YSI_Coding\y_hooks>



static
	AdminCheckAccount[MAX_PLAYERS][MAX_PLAYER_NAME];

forward OnAccountXacNhan(playerid);
public OnAccountXacNhan(playerid) {
	new query[128];
	format(query,128,"Ban da xac nhan dang ky Account %s", AdminCheckAccount[playerid]);
	SendClientMessage(playerid, -1, query);
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 2509 && response) {

		new
			Cache:inde,
			wName[MAX_PLAYER_NAME],
			wIP[16],
			string[128];

		inde = mysql_query(MainPipeline, "SELECT `IP`,`Username` FROM `accounts` WHERE `XacNhanDangKy` < 1 AND `Registered` < 1 ORDER BY `XacNhanDangKy` DESC LIMIT 100");
		if(cache_num_rows()) {
			for(new i = 0; i < cache_num_rows(); i++) {
				if(i == listitem) {
					cache_get_field_content(listitem, "Username", wName); // Nhan vat can xac nhan
					cache_get_field_content(listitem, "IP", wIP); // IP Login
					format(AdminCheckAccount[playerid],32,"%s",wName);
					format(string, 128, "Ten nhan vat :%s\nIP Log :%s", wName,wIP);
					ShowPlayerDialog(playerid, 2508, DIALOG_STYLE_MSGBOX, "Danh Sach Dang Ky", string, "Xac nhan", "Huy");
					cache_delete(inde);
					break;
				}
			}
		}
	}
	if(dialogid == 2508) {
		if(response) {
			new query[128], tmpName[24];

			mysql_escape_string(AdminCheckAccount[playerid], tmpName);
			format(query, sizeof(query), "UPDATE `accounts` SET `XacNhanDangKy`= 1, `Registered`= 1 WHERE `Username`='%s' ", tmpName);
			mysql_function_query(MainPipeline, query, false, "OnAccountXacNhan", "i", playerid);
		}
	}
    return 1;
}

CMD:dtk(playerid) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY,"Ban khong duoc phep su dung lenh nay!");
	    return 1;

	new
		Cache:inde,
		wName[MAX_PLAYER_NAME],
		wIP[16],
		string[1000];
	inde = mysql_query(MainPipeline, "SELECT `IP`,`Username` FROM `accounts` WHERE `XacNhanDangKy` < 1 AND `Registered` < 1 ORDER BY `XacNhanDangKy` DESC LIMIT 100");
	if(cache_num_rows()) {
		for(new i = 0; i < cache_num_rows(); i++) {
			cache_get_field_content(i, "Username", wName); // Nhan vat can xac nhan
			cache_get_field_content(i, "IP", wIP); // IP Login
			format(string, sizeof string, "%s\n%s | IP:%s", string,wName, wIP);
		}
	}
	ShowPlayerDialog(playerid, 2509, DIALOG_STYLE_LIST, "White List Account", string, "Xem","");
	cache_delete(inde);
	return 1;
}

CMD:xntk(playerid) {
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessageEx(playerid, COLOR_GREY,"Ban khong duoc phep su dung lenh nay!");

	new
		Cache:inde,
		wName[MAX_PLAYER_NAME],
		wIP[16],
		string[1000];
	inde = mysql_query(MainPipeline, "SELECT `IP`,`Username` FROM `accounts` WHERE `XacNhanDangKy` < 1 AND `Registered` < 1 ORDER BY `XacNhanDangKy` DESC LIMIT 100");
	if(cache_num_rows()) {
		for(new i = 0; i < cache_num_rows(); i++) {
			cache_get_field_content(i, "Username", wName); // Nhan vat can xac nhan
			cache_get_field_content(i, "IP", wIP); // IP Login
			format(string, sizeof string, "%s\n%s | IP:%s", string,wName, wIP);
		}
	}
	ShowPlayerDialog(playerid, 2509, DIALOG_STYLE_LIST, "White List Account", string, "Xem","");
	cache_delete(inde);
	return 1;
}