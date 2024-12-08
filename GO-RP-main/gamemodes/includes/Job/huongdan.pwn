#include <a_samp>
#include <YSI_Coding\y_hooks>


enum
{
	HUONGDAN,
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == HUONGDAN)
    {
		if(response)
	    {
			if(listitem == 0)
			{
				ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "PIZZA {00FF00}[HELP]", "{FFFFFF}B1: [/map] tim va den xin viec tai NPC ben canh tiem Pizza.\nB2: Den NPC o truoc tiem Pizza.\nB3: Bam N lay dong phuc va xe.\nB4: Xuong xe den NPC truoc tiem va lay banh.\nB5: Cam banh den gan xe Pizza cua minh va bam Y.\nB6: Sau khi lay du 3 banh len xe [/batdaugiaobanh].", "Dung xem","");
				return 1;
			}
			if(listitem == 1)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "TRUCKER {00FF00}[HELP]", "{FFFFFF}B1: [/map] tim va den NPC xin viec Trucker.\nB2: den Icon hinh banh xe va thue xe.\nB3: Mo cop xe [/xe cop] va di chuyen den nhung cai thung hang.\nB4: Chat thung hang len xe [H] va dong cop.\nB5: [/giaohang] va den checkpoint!", "Dung xem","");
				return 1;
			}
			if(listitem == 2)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "NGU DAN {00FF00}[HELP]", "{FFFFFF}B1: Di chuyen ra khu cau ca LS se thay thuyen danh ca.\nB2: Len thuyen va khong can xin viec.\nB3: [/map > Viec lam > Hop Phap > Ngu Dan] roi chon dia diem danh ca.\nB4: Den noi danh ca [/thaluoi].\nB5: Sau khi co ca [/map > Viec lam > Hop Phap > Ngu Dan] den khu ban ca.", "Dung xem","");
				return 1;
			}
			if(listitem == 3)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "KHOANG SAN {00FF00}[HELP]", "{FFFFFF}B1: [/map] va den nhan job tai NPC roi lay xe bobcat den checkpoint tren ban do.\nB2: Vao door den nhung cuc khoang san nho roi bam [Y] de dao.\nB3: Cam khoang san va den xe bobcat da lay roi bam [Y] de chat len xe.\nB4: Sau khi chat du [5/5] lai xe den nha may[/map => Viec lam => Miner => Dia diem che bien].\nB6: den dia diem che bien va nhan [Y] de che bien khoang san.\n-Khoang san se duoc loc ra va hien len tivi-\n-De cong khoang san vao tui do den tivi roi nhan [Y]-", "Dung xem","");
				return 1;
			}
			if(listitem == 4)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "BOC VAC {00FF00}[HELP]", "{FFFFFF}B1: [/map > Viec lam > Boc Vac] tim va den noi lam viec.\nB2: [/bocvac] va di chuyen den checkpoint nhan tien.", "Dung xem","");
				return 1;
			}
			if(listitem == 5)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "THO THU CONG {00FF00}[HELP]", "{FFFFFF}B1: [/map] va den NPC nhan viec.\nB2: Ban can phai co vat lieu va [/chetao].", "Dung xem","");
				return 1;
			}
			if(listitem == 6)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "TIEU PHU {00FF00}[HELP]", "{FFFFFF}B1: /map tim va den NPC [/work].\nB2: Den khu vuc nhung cai cay va [/cuacay].", "Dung xem","");
				return 1;
			}
			if(listitem == 7)
			{
			    ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "NGUOI VAN CHUYEN {00FF00}[HELP]", "{FFFFFF}B1: Ban can co 1 chiec xe rieng.\nB2: /map va tim den NPC NVC roi xin viec.\nB3: Len xe va [/batdaulamviec]", "Dung xem","");
				return 1;
			}
		}
	}
	return 1;
}
CMD:huongdan(playerid, params[])
{
	ShowPlayerDialog(playerid, HUONGDAN, DIALOG_STYLE_LIST, "HUONG DAN JOB", " Pizza Boy\n Trucker\n Ngu Dan\n Khoang San\n Boc Vac\n Tho Thu Cong\n Tieu Phu\n Nguoi Van Chuyen", "Xem", "Huy");
	return 1;
}
