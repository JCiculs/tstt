#include <a_samp>
#include <YSI_Coding\y_hooks>

#define TRUCKOCEAN 2700.0334,-2384.8618,13.6428
#define TRUCKSANBAY 1940.0151,-2115.9575,13.6953
#define TRUCKAUDI 1552.2886,-1235.4938,17.4063
#define TRUCKFBI 479.9484,-1538.1844,19.3967
#define TRUCKBIENGIOI -81.4648,-1175.7629,2.0544
#define TRUCKLV 1706.8490,1040.1306,10.8203
#define TRUCKTHUYEN 2303.0713,-15.9847,26.4844
#define DIALOG_XINVIECTRUCK (2790)
#define DIALOG_DIEMLAYHANGTRUCK (2791)
#define LAYHANGTRUCK (2792)
#define MUAHANGTRUCK (2793)
#define BANHANGTRUCK (2794)
#define CHATHANGTRUCK (2795)
#define LAYTHUNGHANG (2796)
//#define LOG_STYLE_LIST  (2797)
#define  VITRI_XINVIEC 2211.2983, -2664.5122, 13.5469
enum Con_Cac_Trucker{
	veh_id,
}
new XeGiaoTrucker[MAX_PLAYERS][Con_Cac_Trucker];
new Text3D:Text3DTrucker[MAX_PLAYERS];
new CamHangTruck[MAX_PLAYERS];
new SlotTruck[MAX_PLAYERS][4];
new sohangtrenxe[MAX_PLAYERS];
/*enum
{
	DIALOG_XINVIECTRUCK,
	DIALOG_DIEMLAYHANGTRUCK,
	LAYHANGTRUCK,
	MUAHANGTRUCK,
	BANHANGTRUCK,
	CHATHANGTRUCK,
	LAYTHUNGHANG
}*/

enum TRUCKDATA
{
	TRUCKTRAICAY,
	TRUCKTRANGSUC,
	TRUCKLINHKIEN,
	TRUCKLUONGTHUC,
	TRUCKNYP,
	TRUCKQUANAO,
	TRUCKTHUOCMEN,
	TRUCKDGD,
	TRUCKHAISAN,
	TRUCKCAYCANH,
	TRUCKKHOTRAICAY,
	TRUCKKHOTRANGSUC,
	TRUCKKHOLINHKIEN,
	TRUCKKHOLUONGTHUC,
	TRUCKKHONYP,
	TRUCKKHOQUANAO,
	TRUCKKHOTHUOCMEN,
	TRUCKKHODGD,
	TRUCKKHOHAISAN,
	TRUCKKHOCAYCANH,
	TRUCKBAN,
	TRUCKMUA1,
	TRUCKMUA2,
	TRUCKMUA3,
	TRUCKMUA4,
	TRUCKTIENBAN,
	TRUCKTIENMUA1,
	TRUCKTIENMUA2,
	TRUCKTIENMUA3,
	TRUCKTIENMUA4,
	strtruck[4096]
}

new Text3D:TextTruck[10];
new MatHangTruck[10][TRUCKDATA];
new PlayerHang[MAX_PLAYERS][10];
new HangCamTay[MAX_PLAYERS];
new coroi[7];

enum ROTTRUCKDATA
{
	TRUCKHANG,
	Text3D:TRUCKTEXTROT,
	TRUCKOBJECTROT
}

new HangRotDat[100][ROTTRUCKDATA];
new sohangrot;

hook OnGameModeInit()
{
	sohangrot = 0;
	for(new i=0;i<100;i++){
		HangRotDat[i][TRUCKHANG] = -1;
	}
	for(new i=0;i<7;i++) coroi[i] = -1;

	for(new i=0;i<7;i++){

		MatHangTruck[i][TRUCKTRAICAY] = Random(30,60);
		MatHangTruck[i][TRUCKTRANGSUC] = Random(30,60);
		MatHangTruck[i][TRUCKLINHKIEN] = Random(30,60);
		MatHangTruck[i][TRUCKLUONGTHUC] = Random(30,60);
		MatHangTruck[i][TRUCKNYP] = Random(30,60);
		MatHangTruck[i][TRUCKQUANAO] = Random(30,60);
		MatHangTruck[i][TRUCKTHUOCMEN] = Random(30,60);
		MatHangTruck[i][TRUCKDGD] = Random(30,60);
		MatHangTruck[i][TRUCKHAISAN] = Random(30,60);
		MatHangTruck[i][TRUCKCAYCANH] = Random(30,60);

		MatHangTruck[i][TRUCKBAN] = random(10);
		for(new n=0;n<i;n++){
			if(coroi[n] == MatHangTruck[i][TRUCKBAN]){
				MatHangTruck[i][TRUCKBAN] = random(10);
				n=0;
			}
		}
		coroi[i] = MatHangTruck[i][TRUCKBAN];

		MatHangTruck[i][TRUCKTIENBAN] = Random(50,70);
		MatHangTruck[i][TRUCKTIENMUA1] = Random(120,150);
		MatHangTruck[i][TRUCKTIENMUA2] = Random(120,150);
		MatHangTruck[i][TRUCKTIENMUA3] = Random(120,150);
		MatHangTruck[i][TRUCKTIENMUA4] = Random(120,150);
		switch(MatHangTruck[i][TRUCKBAN])
		{
			case 0: MatHangTruck[i][TRUCKKHOTRAICAY] = MatHangTruck[i][TRUCKTRAICAY];
			case 1: MatHangTruck[i][TRUCKKHOTRANGSUC] = MatHangTruck[i][TRUCKTRANGSUC];
			case 2: MatHangTruck[i][TRUCKKHOLINHKIEN] = MatHangTruck[i][TRUCKLINHKIEN];
			case 3: MatHangTruck[i][TRUCKKHOLUONGTHUC] = MatHangTruck[i][TRUCKLUONGTHUC];
			case 4: MatHangTruck[i][TRUCKKHONYP] = MatHangTruck[i][TRUCKNYP];
			case 5: MatHangTruck[i][TRUCKKHOQUANAO] = MatHangTruck[i][TRUCKQUANAO];
			case 6: MatHangTruck[i][TRUCKKHOTHUOCMEN] = MatHangTruck[i][TRUCKTHUOCMEN];
			case 7: MatHangTruck[i][TRUCKKHODGD] = MatHangTruck[i][TRUCKDGD];
			case 8: MatHangTruck[i][TRUCKKHOHAISAN] = MatHangTruck[i][TRUCKHAISAN];
			case 9: MatHangTruck[i][TRUCKKHOCAYCANH] = MatHangTruck[i][TRUCKCAYCANH];
		}

		MatHangTruck[i][TRUCKMUA1] = random(10);
		while(MatHangTruck[i][TRUCKMUA1] == MatHangTruck[i][TRUCKBAN]) MatHangTruck[i][TRUCKMUA1] = random(10);

		MatHangTruck[i][TRUCKMUA2] = random(10);
		while(MatHangTruck[i][TRUCKMUA2] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA2] == MatHangTruck[i][TRUCKMUA1])
			MatHangTruck[i][TRUCKMUA2] = random(10);

		MatHangTruck[i][TRUCKMUA3] = random(10);
		while(MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKMUA1] || MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKMUA2])
			MatHangTruck[i][TRUCKMUA3] = random(10);

		MatHangTruck[i][TRUCKMUA4] = random(10);
		while(MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA1] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA2] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA3])
			MatHangTruck[i][TRUCKMUA4] = random(10);

		new diadiem[60];
		switch(i)
		{
			case 0: format(diadiem,60,"Ocean Docks Factory");
			case 1: format(diadiem,60,"NUDE & XXX Shop");
			case 2: format(diadiem,60,"Cua Hang Audi");
			case 3: format(diadiem,60,"AEBIS Shop");
			case 4: format(diadiem,60,"Cay Xang Bien Gioi");
			case 5: format(diadiem,60,"Kho Hang Las Venturas");
			case 6: format(diadiem,60,"Ngan Hang Palomino Creek");
		}
		new strban[30],strmua1[30],strmua2[30],strmua3[30],strmua4[30];
		switch(MatHangTruck[i][TRUCKBAN])
		{
			case 0: format(strban,30,"Trai cay");
			case 1: format(strban,30,"Trang suc");
			case 2: format(strban,30,"Linh kien");
			case 3: format(strban,30,"Luong thuc");
			case 4: format(strban,30,"Nhu yeu pham");
			case 5: format(strban,30,"Quan ao");
			case 6: format(strban,30,"Thuoc men");
			case 7: format(strban,30,"Do gia dung");
			case 8: format(strban,30,"Hai san");
			case 9: format(strban,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA1])
		{
			case 0: format(strmua1,30,"Trai cay");
			case 1: format(strmua1,30,"Trang suc");
			case 2: format(strmua1,30,"Linh kien");
			case 3: format(strmua1,30,"Luong thuc");
			case 4: format(strmua1,30,"Nhu yeu pham");
			case 5: format(strmua1,30,"Quan ao");
			case 6: format(strmua1,30,"Thuoc men");
			case 7: format(strmua1,30,"Do gia dung");
			case 8: format(strmua1,30,"Hai san");
			case 9: format(strmua1,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA2])
		{
			case 0: format(strmua2,30,"Trai cay");
			case 1: format(strmua2,30,"Trang suc");
			case 2: format(strmua2,30,"Linh kien");
			case 3: format(strmua2,30,"Luong thuc");
			case 4: format(strmua2,30,"Nhu yeu pham");
			case 5: format(strmua2,30,"Quan ao");
			case 6: format(strmua2,30,"Thuoc men");
			case 7: format(strmua2,30,"Do gia dung");
			case 8: format(strmua2,30,"Hai san");
			case 9: format(strmua2,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA3])
		{
			case 0: format(strmua3,30,"Trai cay");
			case 1: format(strmua3,30,"Trang suc");
			case 2: format(strmua3,30,"Linh kien");
			case 3: format(strmua3,30,"Luong thuc");
			case 4: format(strmua3,30,"Nhu yeu pham");
			case 5: format(strmua3,30,"Quan ao");
			case 6: format(strmua3,30,"Thuoc men");
			case 7: format(strmua3,30,"Do gia dung");
			case 8: format(strmua3,30,"Hai san");
			case 9: format(strmua3,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA4])
		{
			case 0: format(strmua4,30,"Trai cay");
			case 1: format(strmua4,30,"Trang suc");
			case 2: format(strmua4,30,"Linh kien");
			case 3: format(strmua4,30,"Luong thuc");
			case 4: format(strmua4,30,"Nhu yeu pham");
			case 5: format(strmua4,30,"Quan ao");
			case 6: format(strmua4,30,"Thuoc men");
			case 7: format(strmua4,30,"Do gia dung");
			case 8: format(strmua4,30,"Hai san");
			case 9: format(strmua4,30,"Cay canh");
		}
		new slban,slkhoban,slmua1,slkhomua1,slmua2,slkhomua2,slmua3,slkhomua3,slmua4,slkhomua4;
		switch(MatHangTruck[i][TRUCKBAN]){
			case 0:{
				slkhoban = MatHangTruck[i][TRUCKTRAICAY];
				slban = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhoban = MatHangTruck[i][TRUCKTRANGSUC];
				slban = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhoban = MatHangTruck[i][TRUCKLINHKIEN];
				slban = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhoban = MatHangTruck[i][TRUCKLUONGTHUC];
				slban = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhoban = MatHangTruck[i][TRUCKNYP];
				slban = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhoban = MatHangTruck[i][TRUCKQUANAO];
				slban = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhoban = MatHangTruck[i][TRUCKTHUOCMEN];
				slban = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhoban = MatHangTruck[i][TRUCKDGD];
				slban = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhoban = MatHangTruck[i][TRUCKHAISAN];
				slban = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhoban = MatHangTruck[i][TRUCKCAYCANH];
				slban = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA1])
		{
			case 0:{
				slkhomua1 = MatHangTruck[i][TRUCKTRAICAY];
				slmua1 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua1 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua1 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua1 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua1 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua1 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua1 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua1 = MatHangTruck[i][TRUCKNYP];
				slmua1 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua1 = MatHangTruck[i][TRUCKQUANAO];
				slmua1 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua1 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua1 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua1 = MatHangTruck[i][TRUCKDGD];
				slmua1 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua1 = MatHangTruck[i][TRUCKHAISAN];
				slmua1 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua1 = MatHangTruck[i][TRUCKCAYCANH];
				slmua1 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA2])
		{
			case 0:{
				slkhomua2 = MatHangTruck[i][TRUCKTRAICAY];
				slmua2 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua2 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua2 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua2 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua2 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua2 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua2 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua2 = MatHangTruck[i][TRUCKNYP];
				slmua2 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua2 = MatHangTruck[i][TRUCKQUANAO];
				slmua2 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua2 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua2 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua2 = MatHangTruck[i][TRUCKDGD];
				slmua2 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua2 = MatHangTruck[i][TRUCKHAISAN];
				slmua2 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua2 = MatHangTruck[i][TRUCKCAYCANH];
				slmua2 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA3])
		{
			case 0:{
				slkhomua3 = MatHangTruck[i][TRUCKTRAICAY];
				slmua3 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua3 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua3 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua3 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua3 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua3 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua3 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua3 = MatHangTruck[i][TRUCKNYP];
				slmua3 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua3 = MatHangTruck[i][TRUCKQUANAO];
				slmua3 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua3 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua3 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua3 = MatHangTruck[i][TRUCKDGD];
				slmua3 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua3 = MatHangTruck[i][TRUCKHAISAN];
				slmua3 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua3 = MatHangTruck[i][TRUCKCAYCANH];
				slmua3 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA4])
		{
			case 0:{
				slkhomua4 = MatHangTruck[i][TRUCKTRAICAY];
				slmua4 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua4 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua4 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua4 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua4 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua4 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua4 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua4 = MatHangTruck[i][TRUCKNYP];
				slmua4 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua4 = MatHangTruck[i][TRUCKQUANAO];
				slmua4 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua4 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua4 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua4 = MatHangTruck[i][TRUCKDGD];
				slmua4 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua4 = MatHangTruck[i][TRUCKHAISAN];
				slmua4 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua4 = MatHangTruck[i][TRUCKCAYCANH];
				slmua4 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		new giatienban = MatHangTruck[i][TRUCKTIENBAN];
		new giatienmua1 = MatHangTruck[i][TRUCKTIENMUA1];
		new giatienmua2 = MatHangTruck[i][TRUCKTIENMUA2];
		new giatienmua3 = MatHangTruck[i][TRUCKTIENMUA3];
		new giatienmua4 = MatHangTruck[i][TRUCKTIENMUA4];
		format(MatHangTruck[i][strtruck],4096,"Diem mua {A9E2F3}%s\n \n{A9E2F3}Dang ban\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\tSan xuat (moi gio)\n",diadiem);
		switch(random(4))
		{
			case 0:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1);
				MatHangTruck[i][TRUCKMUA2] = -1;
				MatHangTruck[i][TRUCKMUA3] = -1;
				MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 1:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2);
				MatHangTruck[i][TRUCKMUA3] = -1;
				MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 2:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3);
				MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 3:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3,strmua4,slmua4,slkhomua4,giatienmua4);
			}
		}
		switch(i)
		{
			case 0:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKOCEAN+1,30.0);
			}
			case 1:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKSANBAY+1,30.0);
			}
			case 2:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKAUDI+1,30.0);
			}
			case 3:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKFBI+1,30.0);
			}
			case 4:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKBIENGIOI+1,30.0);
			}
			case 5:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKLV+1,30.0);
			}
			case 6:{
				new str[128];
				format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung\n{00b33a}(/muahang){FFFFFF} de mua hang",strban,slban,slkhoban,giatienban);
				TextTruck[i] = CreateDynamic3DTextLabel(str,0xF7FE2EFF,TRUCKTHUYEN+1,30.0);
			}
		}

	}

	CreatePickup(1318,1,TRUCKOCEAN,0);
	CreatePickup(1318,1,TRUCKSANBAY,0);
	CreatePickup(1318,1,TRUCKAUDI,0);
	CreatePickup(1318,1,TRUCKFBI,0);
	CreatePickup(1318,1,TRUCKBIENGIOI,0);
	CreatePickup(1318,1,TRUCKLV,0);
	CreatePickup(1318,1,TRUCKTHUYEN,0);


	CreateActor(7, 2426.3901,-2114.2390,13.5522,325.8958);
	CreateDynamic3DTextLabel("{D7DF01}Trucker Job\n{FFFFFF}Nhan {0174DF}Y {FFFFFF}de lam viec",COLOR_YELLOW,2426.3901,-2114.2390,13.5522,10.0);

	new tmpobjid;
	tmpobjid = CreateObject(3095, 2429.309326, -2120.135498, 11.996866, 0.000000, 0.000000, -179.899963);
	SetObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = CreateObject(19360, 2432.093994, -2115.702636, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19411, 2432.196044, -2106.733642, 14.242234, 0.000000, 0.000000, -89.799934);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(3095, 2429.297119, -2111.165039, 11.996866, 0.000000, 0.000000, -179.899963);
	SetObjectMaterial(tmpobjid, 0, 12946, "ce_bankalley1", "sw_brick03", 0x00000000);
	tmpobjid = CreateObject(19411, 2426.025390, -2106.751953, 14.242234, 0.000000, 0.000000, -89.799934);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 12.549755, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 13.669757, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.639892, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2106.817626, 13.679764, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.707763, -2106.817626, 12.469746, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.802001, -2106.720703, 16.814565, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 12944, "ce_bankalley2", "sw_brick04", 0x00000000);
	tmpobjid = CreateObject(1502, 2430.615722, -2106.641357, 11.065073, 0.000000, 0.000000, -179.700103);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(1502, 2427.618408, -2106.720214, 11.035404, 0.000000, -1.000000, -0.100187);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(19360, 2433.714111, -2108.305175, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 14.779772, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 13.629755, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2433.681884, -2106.817626, 12.529758, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19360, 2433.714111, -2114.981201, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2111.676513, 12.989828, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2108.425048, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2111.586425, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2114.728271, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2117.909912, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2424.948242, -2121.060791, 14.246891, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2426.419677, -2124.602294, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2429.622314, -2124.578613, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2432.255126, -2124.556152, 14.246891, 0.000000, 0.000000, -89.599845);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19360, 2426.240722, -2115.744628, 14.246891, 0.000000, 0.000000, 90.400009);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.919921, -2123.795654, 14.256405, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.933349, -2122.183105, 14.256405, 0.000000, 0.000000, 0.599757);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2108.450195, 16.802446, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2111.901367, 16.778356, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2115.364746, 16.754161, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2118.865966, 16.729730, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2122.357177, 16.705373, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.710693, -2122.907714, 16.701517, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2431.981445, -2124.543212, 16.690107, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.488769, -2124.578857, 16.689849, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2425.526855, -2124.609619, 16.689636, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2431.888183, -2115.722167, 16.751703, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2428.968261, -2115.749023, 16.751502, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2425.565429, -2115.782958, 16.751256, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2432.003906, -2106.691894, 16.814767, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2426.159423, -2106.738525, 16.814432, 90.400154, -89.399948, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2433.739257, -2123.751220, 14.217487, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2117.594726, 16.738620, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2122.878417, 16.701749, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2119.415283, 16.725923, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(2639, 2433.344238, -2108.139648, 13.162235, 0.000000, 0.000000, 88.999984);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 13.619770, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2427.717773, -2115.743408, 12.509761, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 12.509761, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 13.649760, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(1214, 2430.619140, -2115.743408, 14.799765, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2113.961669, 16.763961, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2110.510009, 16.788055, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(19428, 2424.836181, -2108.559814, 16.801675, 90.400154, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 14668, "711c", "cj_white_wall2", 0x00000000);
	tmpobjid = CreateObject(1502, 2430.660156, -2115.679931, 11.065073, 0.000000, 0.000000, -179.700103);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(1502, 2427.682373, -2115.735839, 11.035404, 0.000000, -1.000000, -0.100187);
	SetObjectMaterial(tmpobjid, 0, 9514, "711_sfw", "staddoors1", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.832519, -2122.727783, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.935791, -2112.393066, 16.882783, -0.599996, -89.999984, -90.400024);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.889404, -2119.294433, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.947265, -2115.832519, 16.882049, -0.599996, -89.999984, -91.000015);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19447, 2428.956054, -2109.239990, 16.882783, -0.599996, -89.999984, -90.400024);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2426.428710, -2107.485107, 17.006484, 0.000000, 91.599952, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2432.318847, -2108.367431, 16.847869, 0.000000, 91.599952, 90.300003);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2429.780517, -2107.485107, 16.912948, 0.000000, 91.599952, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(19433, 2432.939453, -2108.366699, 16.847869, 0.000000, 91.599952, 90.300003);
	SetObjectMaterial(tmpobjid, 0, 13628, "8stad", "stadroof", 0x00000000);
	tmpobjid = CreateObject(11729, 2433.156005, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	SetObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateObject(1649, 2433.773437, -2111.621093, 14.326903, 0.000000, 0.000000, 90.399971);
	tmpobjid = CreateObject(1649, 2433.773437, -2111.621093, 14.326903, 0.000000, 0.000000, -90.599967);
	tmpobjid = CreateObject(2714, 2429.273437, -2106.556152, 16.893018, 0.000000, 0.000000, -179.000045);
	tmpobjid = CreateObject(2008, 2425.716796, -2113.708251, 12.572230, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19999, 2425.814208, -2114.887939, 12.552231, 0.000000, 0.000000, 146.200057);
	tmpobjid = CreateObject(2182, 2432.146240, -2114.103515, 12.552231, 0.000000, 0.000000, -90.200073);
	tmpobjid = CreateObject(2639, 2433.239501, -2112.429199, 13.162235, 0.000000, 0.000000, 88.599990);
	tmpobjid = CreateObject(2639, 2433.292236, -2110.270019, 13.162235, 0.000000, 0.000000, 88.599990);
	tmpobjid = CreateObject(16780, 2429.147460, -2111.364990, 16.797708, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(1893, 2427.966552, -2119.848144, 16.850215, 0.200003, -2.199999, -179.999984);
	tmpobjid = CreateObject(1893, 2431.255859, -2119.848144, 16.723911, 0.200003, -2.199999, -179.999984);
	tmpobjid = CreateObject(2991, 2426.063964, -2122.473144, 13.128541, 0.000000, 0.000000, -89.299980);
	tmpobjid = CreateObject(2991, 2426.001953, -2118.079345, 13.128541, 0.000000, 0.000000, -89.299980);
	tmpobjid = CreateObject(2912, 2425.452636, -2121.447998, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.218750, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.999511, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.770019, 13.726864, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.439697, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.589111, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2121.748535, 14.376868, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.178955, 15.056874, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2123.119873, 15.056874, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(2912, 2425.452636, -2122.689453, 15.686883, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(19825, 2429.054443, -2115.640625, 16.325563, 0.000000, 0.000000, -177.299926);
	tmpobjid = CreateObject(11729, 2431.154052, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2431.834716, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	tmpobjid = CreateObject(11729, 2432.485351, -2116.018798, 12.498532, 0.000000, 0.000000, 0.000000);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	for(new i=0;i<7;i++) PlayerHang[playerid][i] = 0;
	for(new i=0;i<4;i++) SlotTruck[playerid][i] = -1;
	XeGiaoTrucker[playerid][veh_id] = INVALID_VEHICLE_ID;
	CamHangTruck[playerid] = 0;
	HangCamTay[playerid] = -1;
	sohangtrenxe[playerid] = 0;
	return 1;
}

hook OnVehicleDeath(vehicleid)
{
	if(GetVehicleModel(vehicleid) == 414 || GetVehicleModel(vehicleid) == 422)
	{
		foreach(new i:Player)
		{
			if(vehicleid == XeGiaoTrucker[i][veh_id])
			{
			    DeletePVar(i,"DaLayXe");
			    DestroyVehicle(XeGiaoTrucker[i][veh_id]);
				XeGiaoTrucker[i][veh_id] = INVALID_VEHICLE_ID;
				DestroyDynamic3DTextLabel(Text3DTrucker[i]);
				Delete3DTextLabel(Text3DTrucker[i]);
				SendClientMessageEx(i,-1,"{C6E2FF}Trucker Delivery{FFFFFF}: Xe Trucker cua ban da bi no tung, hay di thue lai mot chiec xe khac, hang van con do !");
			}
		}
	}
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	if(GetPVarInt(playerid, "DaLayXe") != 0){
		DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
		//Delete3DTextLabel(Text3DTrucker[playerid]);
		//DestroyDynamic3DTextLabel(Text3DTrucker[playerid]);
		for(new i=0;i<4;i++){
			if(SlotTruck[playerid][i] != -1){
				if(sohangrot == 99) sohangrot = 0;
				HangRotDat[sohangrot][TRUCKHANG] = SlotTruck[playerid][i];
				new str[124];
				new Float:Pos[3];
				GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
				switch(SlotTruck[playerid][i])
				{
					case 0: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Trai Cay\nOID: %d",sohangrot);
					case 1: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Trang Suc\nOID: %d",sohangrot);
					case 2: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Linh Kien\nOID: %d",sohangrot);
					case 3: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Luong Thuc\nOID: %d",sohangrot);
					case 4: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Nhu Yeu Pham\nOID: %d",sohangrot);
					case 5: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Quan Ao\nOID: %d",sohangrot);
					case 6: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Thuoc Men\nOID: %d",sohangrot);
					case 7: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Do Gia Dung\nOID: %d",sohangrot);
					case 8: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Hai San\nOID: %d",sohangrot);
					case 9: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Cay Canh\nOID: %d",sohangrot);
				}
				switch(i)
				{
					case 0:{ Pos[0] += 0.5; Pos[1] += 0.5; }
					case 1:{ Pos[0] += 1; Pos[1] += 0.5; }
					case 2:{ Pos[0] += 0.5; Pos[1] += 1.5; }
					case 3:{ Pos[0] += 1; Pos[1] += 1; }
				}
				HangRotDat[sohangrot][TRUCKTEXTROT] = CreateDynamic3DTextLabel(str,0x1DB4EEFF,Pos[0],Pos[1],Pos[2],30.0);
				HangRotDat[sohangrot][TRUCKOBJECTROT] = CreateObject(2912,Pos[0],Pos[1],Pos[2]-1,0,0,0);
				sohangrot ++;
			}
		}
	}
	RemovePlayerAttachedObject(playerid,9);
	return 1;
}

stock UpdateLabelTruck(i)
{
	new slban,slkhoban,strban[30];
	switch(MatHangTruck[i][TRUCKBAN]){
		case 0:{
			MatHangTruck[i][TRUCKKHOTRAICAY] -- ;
			slkhoban = MatHangTruck[i][TRUCKTRAICAY];
			slban = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			MatHangTruck[i][TRUCKKHOTRANGSUC]--;
			slkhoban = MatHangTruck[i][TRUCKTRANGSUC];
			slban = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			MatHangTruck[i][TRUCKKHOLINHKIEN]--;
			slkhoban = MatHangTruck[i][TRUCKLINHKIEN];
			slban = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			MatHangTruck[i][TRUCKKHOLUONGTHUC]--;
			slkhoban = MatHangTruck[i][TRUCKLUONGTHUC];
			slban = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			MatHangTruck[i][TRUCKKHONYP]--;
			slkhoban = MatHangTruck[i][TRUCKNYP];
			slban = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			MatHangTruck[i][TRUCKKHOQUANAO]--;
			slkhoban = MatHangTruck[i][TRUCKQUANAO];
			slban = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			MatHangTruck[i][TRUCKKHOTHUOCMEN]--;
			slkhoban = MatHangTruck[i][TRUCKTHUOCMEN];
			slban = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			MatHangTruck[i][TRUCKKHODGD]--;
			slkhoban = MatHangTruck[i][TRUCKDGD];
			slban = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			MatHangTruck[i][TRUCKKHOHAISAN]--;
			slkhoban = MatHangTruck[i][TRUCKHAISAN];
			slban = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			MatHangTruck[i][TRUCKKHOCAYCANH]--;
			slkhoban = MatHangTruck[i][TRUCKCAYCANH];
			slban = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	new giatienban = MatHangTruck[i][TRUCKTIENBAN];
	switch(MatHangTruck[i][TRUCKBAN])
	{
		case 0: format(strban,30,"Trai cay");
		case 1: format(strban,30,"Trang suc");
		case 2: format(strban,30,"Linh kien");
		case 3: format(strban,30,"Luong thuc");
		case 4: format(strban,30,"Nhu yeu pham");
		case 5: format(strban,30,"Quan ao");
		case 6: format(strban,30,"Thuoc men");
		case 7: format(strban,30,"Do gia dung");
		case 8: format(strban,30,"Hai san");
		case 9: format(strban,30,"Cay canh");
	}
	new str[128];
	format(str,sizeof(str),"[{F7FE2E}%s{FFFFFF}]\nTrong kho: %d/%d thung\nGia ban: $%d/1thung",strban,slban,slkhoban,giatienban);
	UpdateDynamic3DTextLabelText(TextTruck[i],0xF7FE2EFF,str);
	return 1;
}

stock UpdateStringTruck(i)
{
	new diadiem[60];
	switch(i)
	{
		case 0: format(diadiem,60,"Ocean Docks Factory");
		case 1: format(diadiem,60,"NUDE & XXX Shop");
		case 2: format(diadiem,60,"Cua Hang Audi");
		case 3: format(diadiem,60,"AEBIS Shop");
		case 4: format(diadiem,60,"Cay Xang Bien Gioi");
		case 5: format(diadiem,60,"Kho Hang Las Venturas");
		case 6: format(diadiem,60,"Ngan Hang Palomino Creek");
	}
	new strban[30],strmua1[30],strmua2[30],strmua3[30],strmua4[30];
	switch(MatHangTruck[i][TRUCKBAN])
	{
		case 0: format(strban,30,"Trai cay");
		case 1: format(strban,30,"Trang suc");
		case 2: format(strban,30,"Linh kien");
		case 3: format(strban,30,"Luong thuc");
		case 4: format(strban,30,"Nhu yeu pham");
		case 5: format(strban,30,"Quan ao");
		case 6: format(strban,30,"Thuoc men");
		case 7: format(strban,30,"Do gia dung");
		case 8: format(strban,30,"Hai san");
		case 9: format(strban,30,"Cay canh");
	}
	switch(MatHangTruck[i][TRUCKMUA1])
	{
		case 0: format(strmua1,30,"Trai cay");
		case 1: format(strmua1,30,"Trang suc");
		case 2: format(strmua1,30,"Linh kien");
		case 3: format(strmua1,30,"Luong thuc");
		case 4: format(strmua1,30,"Nhu yeu pham");
		case 5: format(strmua1,30,"Quan ao");
		case 6: format(strmua1,30,"Thuoc men");
		case 7: format(strmua1,30,"Do gia dung");
		case 8: format(strmua1,30,"Hai san");
		case 9: format(strmua1,30,"Cay canh");
	}
	switch(MatHangTruck[i][TRUCKMUA2])
	{
		case 0: format(strmua2,30,"Trai cay");
		case 1: format(strmua2,30,"Trang suc");
		case 2: format(strmua2,30,"Linh kien");
		case 3: format(strmua2,30,"Luong thuc");
		case 4: format(strmua2,30,"Nhu yeu pham");
		case 5: format(strmua2,30,"Quan ao");
		case 6: format(strmua2,30,"Thuoc men");
		case 7: format(strmua2,30,"Do gia dung");
		case 8: format(strmua2,30,"Hai san");
		case 9: format(strmua2,30,"Cay canh");
	}
	switch(MatHangTruck[i][TRUCKMUA3])
	{
		case 0: format(strmua3,30,"Trai cay");
		case 1: format(strmua3,30,"Trang suc");
		case 2: format(strmua3,30,"Linh kien");
		case 3: format(strmua3,30,"Luong thuc");
		case 4: format(strmua3,30,"Nhu yeu pham");
		case 5: format(strmua3,30,"Quan ao");
		case 6: format(strmua3,30,"Thuoc men");
		case 7: format(strmua3,30,"Do gia dung");
		case 8: format(strmua3,30,"Hai san");
		case 9: format(strmua3,30,"Cay canh");
	}
	switch(MatHangTruck[i][TRUCKMUA4])
	{
		case 0: format(strmua4,30,"Trai cay");
		case 1: format(strmua4,30,"Trang suc");
		case 2: format(strmua4,30,"Linh kien");
		case 3: format(strmua4,30,"Luong thuc");
		case 4: format(strmua4,30,"Nhu yeu pham");
		case 5: format(strmua4,30,"Quan ao");
		case 6: format(strmua4,30,"Thuoc men");
		case 7: format(strmua4,30,"Do gia dung");
		case 8: format(strmua4,30,"Hai san");
		case 9: format(strmua4,30,"Cay canh");
	}
	new slban,slkhoban,slmua1,slkhomua1,slmua2,slkhomua2,slmua3,slkhomua3,slmua4,slkhomua4;
	switch(MatHangTruck[i][TRUCKBAN]){
		case 0:{
			slkhoban = MatHangTruck[i][TRUCKTRAICAY];
			slban = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			slkhoban = MatHangTruck[i][TRUCKTRANGSUC];
			slban = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			slkhoban = MatHangTruck[i][TRUCKLINHKIEN];
			slban = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			slkhoban = MatHangTruck[i][TRUCKLUONGTHUC];
			slban = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			slkhoban = MatHangTruck[i][TRUCKNYP];
			slban = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			slkhoban = MatHangTruck[i][TRUCKQUANAO];
			slban = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			slkhoban = MatHangTruck[i][TRUCKTHUOCMEN];
			slban = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			slkhoban = MatHangTruck[i][TRUCKDGD];
			slban = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			slkhoban = MatHangTruck[i][TRUCKHAISAN];
			slban = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			slkhoban = MatHangTruck[i][TRUCKCAYCANH];
			slban = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	switch(MatHangTruck[i][TRUCKMUA1])
	{
		case 0:{
			slkhomua1 = MatHangTruck[i][TRUCKTRAICAY];
			slmua1 = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			slkhomua1 = MatHangTruck[i][TRUCKTRANGSUC];
			slmua1 = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			slkhomua1 = MatHangTruck[i][TRUCKLINHKIEN];
			slmua1 = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			slkhomua1 = MatHangTruck[i][TRUCKLUONGTHUC];
			slmua1 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			slkhomua1 = MatHangTruck[i][TRUCKNYP];
			slmua1 = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			slkhomua1 = MatHangTruck[i][TRUCKQUANAO];
			slmua1 = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			slkhomua1 = MatHangTruck[i][TRUCKTHUOCMEN];
			slmua1 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			slkhomua1 = MatHangTruck[i][TRUCKDGD];
			slmua1 = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			slkhomua1 = MatHangTruck[i][TRUCKHAISAN];
			slmua1 = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			slkhomua1 = MatHangTruck[i][TRUCKCAYCANH];
			slmua1 = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	switch(MatHangTruck[i][TRUCKMUA2])
	{
		case 0:{
			slkhomua2 = MatHangTruck[i][TRUCKTRAICAY];
			slmua2 = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			slkhomua2 = MatHangTruck[i][TRUCKTRANGSUC];
			slmua2 = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			slkhomua2 = MatHangTruck[i][TRUCKLINHKIEN];
			slmua2 = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			slkhomua2 = MatHangTruck[i][TRUCKLUONGTHUC];
			slmua2 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			slkhomua2 = MatHangTruck[i][TRUCKNYP];
			slmua2 = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			slkhomua2 = MatHangTruck[i][TRUCKQUANAO];
			slmua2 = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			slkhomua2 = MatHangTruck[i][TRUCKTHUOCMEN];
			slmua2 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			slkhomua2 = MatHangTruck[i][TRUCKDGD];
			slmua2 = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			slkhomua2 = MatHangTruck[i][TRUCKHAISAN];
			slmua2 = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			slkhomua2 = MatHangTruck[i][TRUCKCAYCANH];
			slmua2 = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	switch(MatHangTruck[i][TRUCKMUA3])
	{
		case 0:{
			slkhomua3 = MatHangTruck[i][TRUCKTRAICAY];
			slmua3 = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			slkhomua3 = MatHangTruck[i][TRUCKTRANGSUC];
			slmua3 = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			slkhomua3 = MatHangTruck[i][TRUCKLINHKIEN];
			slmua3 = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			slkhomua3 = MatHangTruck[i][TRUCKLUONGTHUC];
			slmua3 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			slkhomua3 = MatHangTruck[i][TRUCKNYP];
			slmua3 = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			slkhomua3 = MatHangTruck[i][TRUCKQUANAO];
			slmua3 = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			slkhomua3 = MatHangTruck[i][TRUCKTHUOCMEN];
			slmua3 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			slkhomua3 = MatHangTruck[i][TRUCKDGD];
			slmua3 = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			slkhomua3 = MatHangTruck[i][TRUCKHAISAN];
			slmua3 = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			slkhomua3 = MatHangTruck[i][TRUCKCAYCANH];
			slmua3 = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	switch(MatHangTruck[i][TRUCKMUA4])
	{
		case 0:{
			slkhomua4 = MatHangTruck[i][TRUCKTRAICAY];
			slmua4 = MatHangTruck[i][TRUCKKHOTRAICAY];
		}
		case 1:{
			slkhomua4 = MatHangTruck[i][TRUCKTRANGSUC];
			slmua4 = MatHangTruck[i][TRUCKKHOTRANGSUC];
		}
		case 2:{
			slkhomua4 = MatHangTruck[i][TRUCKLINHKIEN];
			slmua4 = MatHangTruck[i][TRUCKKHOLINHKIEN];
		}
		case 3:{
			slkhomua4 = MatHangTruck[i][TRUCKLUONGTHUC];
			slmua4 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
		}
		case 4:{
			slkhomua4 = MatHangTruck[i][TRUCKNYP];
			slmua4 = MatHangTruck[i][TRUCKKHONYP];
		}
		case 5:{
			slkhomua4 = MatHangTruck[i][TRUCKQUANAO];
			slmua4 = MatHangTruck[i][TRUCKKHOQUANAO];
		}
		case 6:{
			slkhomua4 = MatHangTruck[i][TRUCKTHUOCMEN];
			slmua4 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
		}
		case 7:{
			slkhomua4 = MatHangTruck[i][TRUCKDGD];
			slmua4 = MatHangTruck[i][TRUCKKHODGD];
		}
		case 8:{
			slkhomua4 = MatHangTruck[i][TRUCKHAISAN];
			slmua4 = MatHangTruck[i][TRUCKKHOHAISAN];
		}
		case 9:{
			slkhomua4 = MatHangTruck[i][TRUCKCAYCANH];
			slmua4 = MatHangTruck[i][TRUCKKHOCAYCANH];
		}
	}
	new giatienban = MatHangTruck[i][TRUCKTIENBAN];
	new giatienmua1 = MatHangTruck[i][TRUCKTIENMUA1];
	new giatienmua2 = MatHangTruck[i][TRUCKTIENMUA2];
	new giatienmua3 = MatHangTruck[i][TRUCKTIENMUA3];
	new giatienmua4 = MatHangTruck[i][TRUCKTIENMUA4];
	format(MatHangTruck[i][strtruck],4096,"Diem mua {A9E2F3}%s\n \n{A9E2F3}Dang ban\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\tSan xuat (moi gio)\n",diadiem);
	if(MatHangTruck[i][TRUCKMUA1] != -1 && MatHangTruck[i][TRUCKMUA2] == -1 && MatHangTruck[i][TRUCKMUA3] == -1 && MatHangTruck[i][TRUCKMUA4] == -1)
	{
		format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d",
								MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1);
		MatHangTruck[i][TRUCKMUA2] = -1;
		MatHangTruck[i][TRUCKMUA3] = -1;
		MatHangTruck[i][TRUCKMUA4] = -1;
	}
	else if(MatHangTruck[i][TRUCKMUA1] != -1 && MatHangTruck[i][TRUCKMUA2] != -1 && MatHangTruck[i][TRUCKMUA3] == -1 && MatHangTruck[i][TRUCKMUA4] == -1)
	{
		format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
								MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2);
		MatHangTruck[i][TRUCKMUA3] = -1;
		MatHangTruck[i][TRUCKMUA4] = -1;
	}
	else if(MatHangTruck[i][TRUCKMUA1] != -1 && MatHangTruck[i][TRUCKMUA2] != -1 && MatHangTruck[i][TRUCKMUA3] != -1 && MatHangTruck[i][TRUCKMUA4] == -1)
	{
		format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
								MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3);
		MatHangTruck[i][TRUCKMUA4] = -1;
	}
	else if(MatHangTruck[i][TRUCKMUA1] != -1 && MatHangTruck[i][TRUCKMUA2] != -1 && MatHangTruck[i][TRUCKMUA3] != -1 && MatHangTruck[i][TRUCKMUA4] != -1)
	{
		format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
								MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3,strmua4,slmua4,slkhomua4,giatienmua4);
	}
	return 1;
}

stock truckkhomua(i,loaihang)
{
	if(loaihang == 1)
	{
		switch(MatHangTruck[i][TRUCKMUA1])
		{
			case 0:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 1:{
				MatHangTruck[i][TRUCKKHOTRANGSUC]++;
			}
			case 2:{
				MatHangTruck[i][TRUCKKHOLINHKIEN]++;
			}
			case 3:{
				MatHangTruck[i][TRUCKKHOLUONGTHUC]++;
			}
			case 4:{
				MatHangTruck[i][TRUCKKHONYP]++;
			}
			case 5:{
				MatHangTruck[i][TRUCKKHOTHUOCMEN]++;
			}
			case 6:{
				MatHangTruck[i][TRUCKKHODGD]++;
			}
			case 7:{
				MatHangTruck[i][TRUCKKHOCAYCANH]++;
			}
			case 8:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 9:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
		}
	}
	if(loaihang == 2)
	{
		switch(MatHangTruck[i][TRUCKMUA2])
		{
			case 0:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 1:{
				MatHangTruck[i][TRUCKKHOTRANGSUC]++;
			}
			case 2:{
				MatHangTruck[i][TRUCKKHOLINHKIEN]++;
			}
			case 3:{
				MatHangTruck[i][TRUCKKHOLUONGTHUC]++;
			}
			case 4:{
				MatHangTruck[i][TRUCKKHONYP]++;
			}
			case 5:{
				MatHangTruck[i][TRUCKKHOTHUOCMEN]++;
			}
			case 6:{
				MatHangTruck[i][TRUCKKHODGD]++;
			}
			case 7:{
				MatHangTruck[i][TRUCKKHOCAYCANH]++;
			}
			case 8:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 9:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
		}
	}
	if(loaihang == 3)
	{
		switch(MatHangTruck[i][TRUCKMUA3])
		{
			case 0:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 1:{
				MatHangTruck[i][TRUCKKHOTRANGSUC]++;
			}
			case 2:{
				MatHangTruck[i][TRUCKKHOLINHKIEN]++;
			}
			case 3:{
				MatHangTruck[i][TRUCKKHOLUONGTHUC]++;
			}
			case 4:{
				MatHangTruck[i][TRUCKKHONYP]++;
			}
			case 5:{
				MatHangTruck[i][TRUCKKHOTHUOCMEN]++;
			}
			case 6:{
				MatHangTruck[i][TRUCKKHODGD]++;
			}
			case 7:{
				MatHangTruck[i][TRUCKKHOCAYCANH]++;
			}
			case 8:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 9:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
		}
	}
	if(loaihang == 4)
	{
		switch(MatHangTruck[i][TRUCKMUA4])
		{
			case 0:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 1:{
				MatHangTruck[i][TRUCKKHOTRANGSUC]++;
			}
			case 2:{
				MatHangTruck[i][TRUCKKHOLINHKIEN]++;
			}
			case 3:{
				MatHangTruck[i][TRUCKKHOLUONGTHUC]++;
			}
			case 4:{
				MatHangTruck[i][TRUCKKHONYP]++;
			}
			case 5:{
				MatHangTruck[i][TRUCKKHOTHUOCMEN]++;
			}
			case 6:{
				MatHangTruck[i][TRUCKKHODGD]++;
			}
			case 7:{
				MatHangTruck[i][TRUCKKHOCAYCANH]++;
			}
			case 8:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
			case 9:{
				MatHangTruck[i][TRUCKKHOTRAICAY]++;
			}
		}
	}
	return 1;
}

stock truckbanhang(playerid,i)
{
	if(CamHangTruck[playerid] != 1) return ChatHoTro(playerid,255,"Ban ~r~khong ~w~cam thung hang nao tren tay",5000);
	if(HangCamTay[playerid] == MatHangTruck[i][TRUCKMUA1])
	{
		truckkhomua(i,1);
		HangCamTay[playerid] = -1;
		CamHangTruck[playerid] = 0;
		ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
		new str[128];
		new Float:ne = float(MatHangTruck[i][TRUCKTIENMUA1])/float(100);
		new tiennhanduoc = floatround(ne*95,floatround_round);
		new tienphi = floatround(ne*5,floatround_round);
		format(str,sizeof(str),"{C6E2FF}Trucker Delivery{FFFFFF}: {F7FE2E}Ban nhan duoc $%d (da tru ($%d) 5# tien thue xe) tu viec ban thung hang",tiennhanduoc,tienphi);
		SendClientMessageEx(playerid,0xF7FE2EFF,str);
		format(str,sizeof(str),"~g~+%d$",tiennhanduoc);
		GameTextForPlayer(playerid,str,1000,1);
		GivePlayerCash(playerid, tiennhanduoc);
		await task_ms(1500);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,9);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		UpdateStringTruck(i);
	}
	else if(HangCamTay[playerid] == MatHangTruck[i][TRUCKMUA2] && MatHangTruck[i][TRUCKMUA2] != -1)
	{
		truckkhomua(i,2);
		HangCamTay[playerid] = -1;
		CamHangTruck[playerid] = 0;
		ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
		new str[128];
		new Float:ne = float(MatHangTruck[i][TRUCKTIENMUA2])/float(100);
		new tiennhanduoc = floatround(ne*95,floatround_round);
		new tienphi = floatround(ne*5,floatround_round);
		format(str,sizeof(str),"{C6E2FF}Trucker Delivery{FFFFFF}: {F7FE2E}Ban nhan duoc $%d (da tru ($%d) 5# tien thue xe) tu viec ban thung hang",tiennhanduoc,tienphi);
		SendClientMessageEx(playerid,0xF7FE2EFF,str);
		format(str,sizeof(str),"~g~+%d$",tiennhanduoc);
		GameTextForPlayer(playerid,str,1000,1);
		GivePlayerCash(playerid, tiennhanduoc);
		await task_ms(1000);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,9);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		UpdateStringTruck(i);
	}
	else if(HangCamTay[playerid] == MatHangTruck[i][TRUCKMUA3] && MatHangTruck[i][TRUCKMUA3] != -1)
	{
		truckkhomua(i,3);
		HangCamTay[playerid] = -1;
		CamHangTruck[playerid] = 0;
		ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
		new str[128];
		new Float:ne = float(MatHangTruck[i][TRUCKTIENMUA3])/float(100);
		new tiennhanduoc = floatround(ne*95,floatround_round);
		new tienphi = floatround(ne*5,floatround_round);
		format(str,sizeof(str),"{C6E2FF}Trucker Delivery{FFFFFF}: {F7FE2E}Ban nhan duoc $%d (da tru ($%d) 5# tien thue xe) tu viec ban thung hang",tiennhanduoc,tienphi);
		SendClientMessageEx(playerid,0xF7FE2EFF,str);
		format(str,sizeof(str),"~g~+%d$",tiennhanduoc);
		GameTextForPlayer(playerid,str,1000,1);
		GivePlayerCash(playerid, tiennhanduoc);
		await task_ms(1000);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,9);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		UpdateStringTruck(i);
	}
	else if(HangCamTay[playerid] == MatHangTruck[i][TRUCKMUA4] && MatHangTruck[i][TRUCKMUA4] != -1)
	{
		truckkhomua(i,4);
		HangCamTay[playerid] = -1;
		CamHangTruck[playerid] = 0;
		ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
		new str[128];
		new Float:ne = float(MatHangTruck[i][TRUCKTIENMUA4])/float(100);
		new tiennhanduoc = floatround(ne*95,floatround_round);
		new tienphi = floatround(ne*5,floatround_round);
		format(str,sizeof(str),"{C6E2FF}Trucker Delivery{FFFFFF}: {F7FE2E}Ban nhan duoc $%d (da tru ($%d) 5# tien thue xe) tu viec ban thung hang",tiennhanduoc,tienphi);
		SendClientMessageEx(playerid,0xF7FE2EFF,str);
		format(str,sizeof(str),"~g~+%d$",tiennhanduoc);
		GameTextForPlayer(playerid,str,1000,1);
		GivePlayerCash(playerid, tiennhanduoc);
		await task_ms(1000);
		ClearAnimations(playerid);
		RemovePlayerAttachedObject(playerid,9);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
		UpdateStringTruck(i);
	}
	else ChatHoTro(playerid,255,"Noi nay khong thu mua hang cua ban",5000);
	return 1;
}

stock truckmuahang(playerid,i)
{
	switch(MatHangTruck[i][TRUCKBAN])
	{
		case 0:{
			if(MatHangTruck[i][TRUCKKHOTRAICAY] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 1:{
			if(MatHangTruck[i][TRUCKKHOTRANGSUC] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 2:{
			if(MatHangTruck[i][TRUCKKHOLINHKIEN] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 3:{
			if(MatHangTruck[i][TRUCKKHOLUONGTHUC] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 4:{
			if(MatHangTruck[i][TRUCKKHONYP] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 5:{
			if(MatHangTruck[i][TRUCKKHOQUANAO] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 6:{
			if(MatHangTruck[i][TRUCKKHOTHUOCMEN] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 7:{
			if(MatHangTruck[i][TRUCKKHODGD] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 8:{
			if(MatHangTruck[i][TRUCKKHOHAISAN] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
		case 9:{
			if(MatHangTruck[i][TRUCKKHOCAYCANH] <= 0) return ChatHoTro(playerid,255,"Ben nay da het hang, hay cho nhap hang them",5000);
		}
	}

	if(CamHangTruck[playerid] == 1) return ChatHoTro(playerid,255,"Ban dang cam mot thung hang khac!",5000);
	if(PlayerInfo[playerid][pCash] < MatHangTruck[i][TRUCKTIENBAN]) return ChatHoTro(playerid,255,"Ban ~r~khong du tien ~w~de nhap mat hang nay",5000);
	HangCamTay[playerid] = MatHangTruck[i][TRUCKBAN];
	UpdateLabelTruck(i);
	new str[20];
	format(str,20,"~r~-%d$",MatHangTruck[i][TRUCKTIENBAN]);
	GameTextForPlayer(playerid,str,1000,1);
	CamHangTruck[playerid] = 1;
	GivePlayerCash(playerid, -MatHangTruck[i][TRUCKTIENBAN]);
	SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
	ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 0, 0, 0, 0, 0);
	await task_ms(1500);
	ClearAnimations(playerid);
	//TogglePlayerControllable(playerid,1);

	PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
	return 1;
}

stock truckcamhang(playerid,i)
{
	if(HangCamTay[playerid] == -1){
		if(i<(sohangtrenxe[playerid]-1)){
			HangCamTay[playerid] = SlotTruck[playerid][i];
			for(new x=i;x<sohangtrenxe[playerid]-1;x++){
				SlotTruck[playerid][x] = SlotTruck[playerid][x+1];
			}
			SlotTruck[playerid][sohangtrenxe[playerid]-1] = -1;
		}
		else {
			HangCamTay[playerid] = SlotTruck[playerid][i];
			SlotTruck[playerid][i] = -1;
		}
		CamHangTruck[playerid] = 1;
		PlayerHang[playerid][HangCamTay[playerid]] --;
		SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
		TogglePlayerControllable(playerid, 1);
		ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 1, 0, 0, 0, 0);
		sohangtrenxe[playerid]--;
		await task_ms(1500);
		ClearAnimations(playerid);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
		new virtual = GetPlayerVirtualWorld(playerid);
		SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual+1);
		SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual);
	}
	else ChatHoTro(playerid,255,"Ban dang co hang tren tay!",5000);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext)
{
	if(dialogid == LAYTHUNGHANG)
	{
		if(response)
		{
			if(listitem == 0)
			{
				truckcamhang(playerid,0);
			}
			if(listitem == 1)
			{
				truckcamhang(playerid,1);
			}
			if(listitem == 2)
			{
				truckcamhang(playerid,2);
			}
			if(listitem == 3)
			{
				truckcamhang(playerid,3);
			}
		}
	}
	if(dialogid == CHATHANGTRUCK)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(HangCamTay[playerid] != -1){
					if(CamHangTruck[playerid] != 0){
						PlayerHang[playerid][HangCamTay[playerid]] ++;
						SlotTruck[playerid][sohangtrenxe[playerid]] = HangCamTay[playerid];
						sohangtrenxe[playerid]++;
						ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
						CamHangTruck[playerid] = 0;
						HangCamTay[playerid] = -1;
						await task_ms(1500);
						RemovePlayerAttachedObject(playerid,9);
						ClearAnimations(playerid);
						SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
						new virtual = GetPlayerVirtualWorld(playerid);
						SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual+1);
						SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual);
					}
				}
			}
			if(listitem == 1)
			{
				new str[300];
				new soluongtrenxe,ten[30],chingchong=0;
				for(new i=0;i<10;i++){
					if(PlayerHang[playerid][i] > 0)
					{
						soluongtrenxe = PlayerHang[playerid][i];
						switch(i)
						{
							case 0: format(ten,30,"Trai cay");
							case 1: format(ten,30,"Trang suc");
							case 2: format(ten,30,"Linh kien");
							case 3: format(ten,30,"Luong thuc");
							case 4: format(ten,30,"Nhu yeu pham");
							case 5: format(ten,30,"Quan ao");
							case 6: format(ten,30,"Thuoc men");
							case 7: format(ten,30,"Do gia dung");
							case 8: format(ten,30,"Hai san");
							case 9: format(ten,30,"Cay canh");
						}
						for(new n=0;n<soluongtrenxe;n++){
							if(chingchong == 0){
								format(str,sizeof(str),"%s",ten);
								chingchong = 1;
							}
							else format(str,sizeof(str),"%s\n%s",str,ten);
						}
					}
				}
				ShowPlayerDialog(playerid, LAYTHUNGHANG, DIALOG_STYLE_LIST,"Thung chua",str,"Lay","Dong");
			}
		}
	}
	if(dialogid == BANHANGTRUCK)
	{
		if(response)
		{
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKOCEAN))
			{
				truckbanhang(playerid,0);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKSANBAY))
			{
				truckbanhang(playerid,1);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKAUDI))
			{
				truckbanhang(playerid,2);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKFBI))
			{
				truckbanhang(playerid,3);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKBIENGIOI))
			{
				truckbanhang(playerid,4);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKLV))
			{
				truckbanhang(playerid,5);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKTHUYEN))
			{
				truckbanhang(playerid,6);
			}

		}
	}
	if(dialogid == MUAHANGTRUCK)
	{
		if(response)
		{
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKOCEAN))
			{
				truckmuahang(playerid,0);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKSANBAY))
			{
				truckmuahang(playerid,1);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKAUDI))
			{
				truckmuahang(playerid,2);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKFBI))
			{
				truckmuahang(playerid,3);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKBIENGIOI))
			{
				truckmuahang(playerid,4);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKLV))
			{
				truckmuahang(playerid,5);
			}
			if(IsPlayerInRangeOfPoint(playerid,5.0,TRUCKTHUYEN))
			{
				truckmuahang(playerid,6);
			}
		}
	}
	if(dialogid == LAYHANGTRUCK)
	{
		if(response)
		{
			switch(GetPVarInt(playerid,"chontruck"))
			{
				case 1:{
					SetPlayerCheckpoint(playerid,TRUCKOCEAN,3.0);
					CP[playerid] = 2;
				}
				case 2:{
					SetPlayerCheckpoint(playerid,TRUCKSANBAY,3.0);
					CP[playerid] = 2;
				}
				case 3:{
					SetPlayerCheckpoint(playerid,TRUCKAUDI,3.0);
					CP[playerid] = 2;
				}
				case 4:{
					SetPlayerCheckpoint(playerid,TRUCKFBI,3.0);
					CP[playerid] = 2;
				}
				case 5:{
					SetPlayerCheckpoint(playerid,TRUCKBIENGIOI,3.0);
					CP[playerid] = 2;
				}
				case 6:{
					SetPlayerCheckpoint(playerid,TRUCKLV,3.0);
					CP[playerid] = 2;
				}
				case 7:{
					SetPlayerCheckpoint(playerid,TRUCKTHUYEN,3.0);
					CP[playerid] = 2;
				}
			}
		}
		else{
			new str[263];
			format(str,sizeof(str),"#\tCua Hang\tTrang thai\n0\tOcean Docks Factory\t{2EFE2E}Mo\n1\tNUDE & XXX Shop\t{2EFE2E}Mo\n2\tCua Hang Audi\t{2EFE2E}Mo\n3\tAEBIS Shop\t{2EFE2E}Mo\n4\tCay Xang Bien Gioi\t{2EFE2E}Mo\n5\tKho Hang Las Venturas\t{2EFE2E}Mo\n6\tNgan Hang Palomino Creek\t{2EFE2E}Mo");
			ShowPlayerDialog(playerid, DIALOG_DIEMLAYHANGTRUCK, DIALOG_STYLE_TABLIST_HEADERS,"Diem mua thung hang",str,"Xem","Dong");
		}
	}
	if(dialogid == DIALOG_DIEMLAYHANGTRUCK)
	{
		if(response)
		{
			if(listitem == 0)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"Ocean Docks Factory",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",1);
			}
			if(listitem == 1)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"NUDE & XXX Shop",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",2);
			}
			if(listitem == 2)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"Cua Hang Audi",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",3);
			}
			if(listitem == 3)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"AEBIS Shop",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",4);
			}
			if(listitem == 4)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"Cay Xang Bien Gioi",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",5);
			}
			if(listitem == 5)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"Kho Hang Las Venturas",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",6);
			}
			if(listitem == 6)
			{
				ShowPlayerDialog(playerid, LAYHANGTRUCK, DIALOG_STYLE_MSGBOX,"Ngan Hang Palomino Creek",MatHangTruck[listitem][strtruck],"Mua","Dong");
				SetPVarInt(playerid,"chontruck",7);
			}
		}
	}
	if(dialogid == DIALOG_XINVIECTRUCK)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(PlayerInfo[playerid][pLevel] >= 2)
				{
					ShowPlayerDialog(playerid, CHAPNHANCONGVIEC, DIALOG_STYLE_MSGBOX, "Cong viec", "Ban co chac chan rang muon nhan cong viec nay hay khong", "Co", "Khong");
			        return cmd_xinviec(playerid, "");
			    }
			    else ChatHoTro(playerid,255,"Ban phai can ~r~Level 2 ~w~de lam cong viec nay !",5000);
			}
			if(listitem == 1)
			{
				if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
				{
					if(GetPVarInt(playerid, "DaLayXe") == 0)
					{
						SetPVarInt(playerid, "DaLayXe",1);
						XeGiaoTrucker[playerid][veh_id] = CreateVehicle(414,2458.2180,-2078.0378,13.6406,0.0402, -1, -1, -1, 0);
						new virtual = GetPlayerVirtualWorld(playerid);
						SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual+1);
						SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual);
//						new str[1280];
						//format(str,sizeof(str),"{C6E2FF}Trucker Delivery{FFFFFF}\nPhuong tien cua {C6E2FF}%s.", GetPlayerNameEx(playerid));
						//Text3DTrucker[playerid] = CreateDynamic3DTextLabel(str, 0xFFFFFFAA, 0, 0, 0.7, 30, .attachedvehicle = XeGiaoTrucker[playerid][veh_id]);
						//Attach3DTextLabelToVehicle(Text3DTrucker[playerid],XeGiaoTrucker[playerid][veh_id],0,0,0.7);
						VehicleFuel[XeGiaoTrucker[playerid][veh_id]] = 100.0;
						SendClientMessageEx(playerid,0xCEF6ECFF,"{C6E2FF}Trucker Delivery{FFFFFF}: Ban da lay xe thanh cong, phi thue xe la 5 phan tram so tien ban thung hang cua ban!");
					}
					else ChatHoTro(playerid,255,"Ban da co xe trucker roi, khong the thue them",5000);
				}
			}
			if(listitem == 2)
			{
					if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20)
					return ChatHoTro(playerid, 255, "Ban khong phai nguoi lam ben cong ty Trucker",5000);
					if(XeGiaoTrucker[playerid][veh_id] == INVALID_VEHICLE_ID) return ChatHoTro(playerid,255,"Ban khong co xe ~r~Trucker ~w~nao!",5000);
					DestroyVehicle(XeGiaoTrucker[playerid][veh_id]);
					DestroyDynamic3DTextLabel(Text3DTrucker[playerid]);	
					DeletePVar(playerid,"DalayXe");
					ChatHoTro(playerid,255,"Ban da tra xe cho cong ty",5000);
			}
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_WALK)
	{
		if(PlayerInfo[playerid][pJob] == 20 || PlayerInfo[playerid][pJob2] == 20)
		{
			if(CamHangTruck[playerid] != 1)
			{
				new Float:OPos[3];
				for(new i=0;i<100;i++)
				{
					GetObjectPos(HangRotDat[i][TRUCKOBJECTROT],OPos[0],OPos[1],OPos[2]);
					if(IsPlayerInRangeOfPoint(playerid,1.7,OPos[0],OPos[1],OPos[2]) && HangRotDat[i][TRUCKHANG] != -1)
					{
						if(CamHangTruck[playerid] == 1) return ChatHoTro(playerid,255,"Ban dang cam mot thung hang khac!",5000);

						HangCamTay[playerid] = HangRotDat[i][TRUCKHANG];
						DestroyObject(HangRotDat[i][TRUCKOBJECTROT]);
						DestroyDynamic3DTextLabel(HangRotDat[i][TRUCKTEXTROT]);
						HangRotDat[i][TRUCKHANG] = -1;

						CamHangTruck[playerid] = 1;
						SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.219000, 0.000000, 0.145000, -82.599922, 0.000000, 102.000038, 1.000000, 1.000000, 1.000000, 0, 0);
						ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.0999, 0, 0, 0, 0, 0);
						await task_ms(1500);

						ClearAnimations(playerid);
						//TogglePlayerControllable(playerid,1);
						ChatHoTro(playerid,255,"Ban vua nhat mot thung hang",5000);
						PlayerPlaySound(playerid,1149,0.0,0.0,0.0);
						SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
						break;
					}
				}
			}
			else if(CamHangTruck[playerid] == 1 && HangCamTay[playerid] != -1)
			{
				if(sohangrot == 99) sohangrot = 0;
				HangRotDat[sohangrot][TRUCKHANG] = HangCamTay[playerid];
				new str[124];
				new Float:Pos[3];
				GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
				switch(HangCamTay[playerid])
				{
					case 0: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Trai Cay\nOID: %d",sohangrot);
					case 1: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Trang Suc\nOID: %d",sohangrot);
					case 2: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Linh Kien\nOID: %d",sohangrot);
					case 3: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Luong Thuc\nOID: %d",sohangrot);
					case 4: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Nhu Yeu Pham\nOID: %d",sohangrot);
					case 5: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Quan Ao\nOID: %d",sohangrot);
					case 6: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Thuoc Men\nOID: %d",sohangrot);
					case 7: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Do Gia Dung\nOID: %d",sohangrot);
					case 8: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Hai San\nOID: %d",sohangrot);
					case 9: format(str,sizeof(str),"{1db4ee}Ten Hang: Hang Cay Canh\nOID: %d",sohangrot);
				}
				HangCamTay[playerid] = -1;
				CamHangTruck[playerid] = 0;
				HangRotDat[sohangrot][TRUCKTEXTROT] = CreateDynamic3DTextLabel(str,0x1DB4EEFF,Pos[0],Pos[1]+1,Pos[2],30.0);
				HangRotDat[sohangrot][TRUCKOBJECTROT] = CreateObject(2912,Pos[0],Pos[1]+1,Pos[2]-1,0,0,0);
				sohangrot ++;
				ApplyAnimation(playerid,"CARRY", "putdwn105", 8.1, 0, 1, 1, 1, 0, 1);
				RemovePlayerAttachedObject(playerid,9);
				await task_ms(500);
				ClearAnimations(playerid);
				SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
			}
		}
	}
	if(newkeys & KEY_YES)
	{
		new closestcar = GetClosestCar(playerid);
		if(closestcar == XeGiaoTrucker[playerid][veh_id] && XeGiaoTrucker[playerid][veh_id] != INVALID_VEHICLE_ID)
		{
			new Float:vpos[3];
			GetVehiclePos(closestcar,vpos[0],vpos[1],vpos[2]);
			new virtual = GetPlayerVirtualWorld(playerid);
			SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual+1);
			SetVehicleVirtualWorld(XeGiaoTrucker[playerid][veh_id],virtual);
			if(IsPlayerInRangeOfPoint(playerid,5.0,vpos[0],vpos[1],vpos[2]) && !IsPlayerInAnyVehicle(playerid))
			{
				new engine,lights,alarm,doors,bonnet,boot,objective;
				GetVehicleParamsEx(closestcar,engine,lights,alarm,doors,bonnet,boot,objective);
				if(boot == VEHICLE_PARAMS_OFF || boot == VEHICLE_PARAMS_UNSET)
				{
					ChatHoTro(playerid, 255, "Ban chua mo cop xe!",5000);
					return 1;
				}
				ShowPlayerDialog(playerid, CHATHANGTRUCK, DIALOG_STYLE_LIST,"? COP XE TRUCKER","Cat Hang\nLay Hang","Lua chon","Huy bo");
			}
		}
	}

	if(newkeys & KEY_YES)
	{
		if(IsPlayerInRangeOfPoint(playerid,5.0,2426.3901,-2114.2390,13.5522))
		{
			ShowPlayerDialog(playerid, DIALOG_XINVIECTRUCK, DIALOG_STYLE_LIST, "Cong viec", "Xin Viec[Lv2+]\nLay xe\nTra xe", "Chon","{FFFFFF}Huy");
		}
	}
	return 1;
}

CMD:diemlayhang(playerid, params)
{
	if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20) return ChatHoTro(playerid,255,"Ban khong phai la nguoi ben cong ty Trucker",5000);
	new str[263];
	format(str,sizeof(str),"#\tCua Hang\tTrang thai\n0\tOcean Docks Factory\t{2EFE2E}Mo\n1\tNUDE & XXX Shop\t{2EFE2E}Mo\n2\tCua Hang Audi\t{2EFE2E}Mo\n3\tAEBIS Shop\t{2EFE2E}Mo\n4\tCay Xang Bien Gioi\t{2EFE2E}Mo\n5\tKho Hang Las Venturas\t{2EFE2E}Mo\n6\tNgan Hang Palomino Creek\t{2EFE2E}Mo");
	ShowPlayerDialog(playerid, DIALOG_DIEMLAYHANGTRUCK, DIALOG_STYLE_TABLIST_HEADERS,"Diem mua thung hang",str,"Xem","Dong");
	return 1;
}

CMD:muahang(playerid,params)
{
	if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20) return ChatHoTro(playerid,255,"Ban khong phai la nguoi ben cong ty Trucker",5000);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,TRUCKOCEAN) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKSANBAY) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKAUDI) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKFBI)
		&& !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKBIENGIOI) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKLV) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKTHUYEN))
		return ChatHoTro(playerid,255,"Ban ~r~khong ~w~ o diem mua hang nao (/diemlayhang de xem)",5000);
	if(sohangtrenxe[playerid] >= 4) return ChatHoTro(playerid,255,"Ban chi chua duoc 4 thung hang thoi !",5000);
	ShowPlayerDialog(playerid, MUAHANGTRUCK, DIALOG_STYLE_MSGBOX,"Mua hang","Ban co muon mua hang khong ?\nLuu y: Xe Truck chi co the chua toi da 4 thung hang!","Tiep tuc","Huy bo");
	return 1;
}

CMD:banhang(playerid,params)
{
	if(PlayerInfo[playerid][pJob] != 20 && PlayerInfo[playerid][pJob2] != 20) return ChatHoTro(playerid,255,"Ban khong phai la nguoi ben cong ty Trucker",5000);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,TRUCKOCEAN) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKSANBAY) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKAUDI) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKFBI)
		&& !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKBIENGIOI) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKLV) && !IsPlayerInRangeOfPoint(playerid,5.0,TRUCKTHUYEN))
		return ChatHoTro(playerid,255,"Ban ~r~khong ~w~ o diem mua hang nao (/diemlayhang de xem)",5000);
	if(HangCamTay[playerid] == -1) return ChatHoTro(playerid,255,"Ban khong cam thung hang nao tren tay",5000);
	ShowPlayerDialog(playerid, BANHANGTRUCK, DIALOG_STYLE_MSGBOX,"Ban hang","Ban co muon ban hang khong ?","Tiep tuc","Huy bo");
	return 1;
}

stock UpdateTrucker()
{
	for(new i=0;i<7;i++) coroi[i] = -1;

	for(new i=0;i<7;i++){

		MatHangTruck[i][TRUCKTIENBAN] = Random(150,300);
		MatHangTruck[i][TRUCKTIENMUA1] = Random(500,700);
		MatHangTruck[i][TRUCKTIENMUA2] = Random(500,700);
		MatHangTruck[i][TRUCKTIENMUA3] = Random(500,700);
		MatHangTruck[i][TRUCKTIENMUA4] = Random(500,700);

		MatHangTruck[i][TRUCKMUA1] = random(10);
		while(MatHangTruck[i][TRUCKMUA1] == MatHangTruck[i][TRUCKBAN]) MatHangTruck[i][TRUCKMUA1] = random(10);

		MatHangTruck[i][TRUCKMUA2] = random(10);
		while(MatHangTruck[i][TRUCKMUA2] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA2] == MatHangTruck[i][TRUCKMUA1])
			MatHangTruck[i][TRUCKMUA2] = random(10);

		MatHangTruck[i][TRUCKMUA3] = random(10);
		while(MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKMUA1] || MatHangTruck[i][TRUCKMUA3] == MatHangTruck[i][TRUCKMUA2])
			MatHangTruck[i][TRUCKMUA3] = random(10);

		MatHangTruck[i][TRUCKMUA4] = random(10);
		while(MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKBAN] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA1] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA2] || MatHangTruck[i][TRUCKMUA4] == MatHangTruck[i][TRUCKMUA3])
			MatHangTruck[i][TRUCKMUA4] = random(10);

		new diadiem[60];
		switch(i)
		{
			case 0: format(diadiem,60,"Ocean Docks Factory");
			case 1: format(diadiem,60,"NUDE & XXX Shop");
			case 2: format(diadiem,60,"Cua Hang Audi");
			case 3: format(diadiem,60,"AEBIS Shop");
			case 4: format(diadiem,60,"Cay Xang Bien Gioi");
			case 5: format(diadiem,60,"Kho Hang Las Venturas");
			case 6: format(diadiem,60,"Ngan Hang Palomino Creek");
		}
		new strban[30],strmua1[30],strmua2[30],strmua3[30],strmua4[30];
		switch(MatHangTruck[i][TRUCKBAN])
		{
			case 0: format(strban,30,"Trai cay");
			case 1: format(strban,30,"Trang suc");
			case 2: format(strban,30,"Linh kien");
			case 3: format(strban,30,"Luong thuc");
			case 4: format(strban,30,"Nhu yeu pham");
			case 5: format(strban,30,"Quan ao");
			case 6: format(strban,30,"Thuoc men");
			case 7: format(strban,30,"Do gia dung");
			case 8: format(strban,30,"Hai san");
			case 9: format(strban,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA1])
		{
			case 0: format(strmua1,30,"Trai cay");
			case 1: format(strmua1,30,"Trang suc");
			case 2: format(strmua1,30,"Linh kien");
			case 3: format(strmua1,30,"Luong thuc");
			case 4: format(strmua1,30,"Nhu yeu pham");
			case 5: format(strmua1,30,"Quan ao");
			case 6: format(strmua1,30,"Thuoc men");
			case 7: format(strmua1,30,"Do gia dung");
			case 8: format(strmua1,30,"Hai san");
			case 9: format(strmua1,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA2])
		{
			case 0: format(strmua2,30,"Trai cay");
			case 1: format(strmua2,30,"Trang suc");
			case 2: format(strmua2,30,"Linh kien");
			case 3: format(strmua2,30,"Luong thuc");
			case 4: format(strmua2,30,"Nhu yeu pham");
			case 5: format(strmua2,30,"Quan ao");
			case 6: format(strmua2,30,"Thuoc men");
			case 7: format(strmua2,30,"Do gia dung");
			case 8: format(strmua2,30,"Hai san");
			case 9: format(strmua2,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA3])
		{
			case 0: format(strmua3,30,"Trai cay");
			case 1: format(strmua3,30,"Trang suc");
			case 2: format(strmua3,30,"Linh kien");
			case 3: format(strmua3,30,"Luong thuc");
			case 4: format(strmua3,30,"Nhu yeu pham");
			case 5: format(strmua3,30,"Quan ao");
			case 6: format(strmua3,30,"Thuoc men");
			case 7: format(strmua3,30,"Do gia dung");
			case 8: format(strmua3,30,"Hai san");
			case 9: format(strmua3,30,"Cay canh");
		}
		switch(MatHangTruck[i][TRUCKMUA4])
		{
			case 0: format(strmua4,30,"Trai cay");
			case 1: format(strmua4,30,"Trang suc");
			case 2: format(strmua4,30,"Linh kien");
			case 3: format(strmua4,30,"Luong thuc");
			case 4: format(strmua4,30,"Nhu yeu pham");
			case 5: format(strmua4,30,"Quan ao");
			case 6: format(strmua4,30,"Thuoc men");
			case 7: format(strmua4,30,"Do gia dung");
			case 8: format(strmua4,30,"Hai san");
			case 9: format(strmua4,30,"Cay canh");
		}
		new slban,slkhoban,slmua1,slkhomua1,slmua2,slkhomua2,slmua3,slkhomua3,slmua4,slkhomua4;
		switch(MatHangTruck[i][TRUCKBAN]){
			case 0:{
				MatHangTruck[i][TRUCKKHOTRAICAY] += 5;
				slkhoban = MatHangTruck[i][TRUCKTRAICAY];
				slban = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				MatHangTruck[i][TRUCKKHOTRANGSUC] += 5;
				slkhoban = MatHangTruck[i][TRUCKTRANGSUC];
				slban = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				MatHangTruck[i][TRUCKKHOLINHKIEN] +=5;
				slkhoban = MatHangTruck[i][TRUCKLINHKIEN];
				slban = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				MatHangTruck[i][TRUCKKHOLUONGTHUC] += 5;
				slkhoban = MatHangTruck[i][TRUCKLUONGTHUC];
				slban = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				MatHangTruck[i][TRUCKKHONYP] += 5;
				slkhoban = MatHangTruck[i][TRUCKNYP];
				slban = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				MatHangTruck[i][TRUCKKHOQUANAO] += 5;
				slkhoban = MatHangTruck[i][TRUCKQUANAO];
				slban = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				MatHangTruck[i][TRUCKKHOTHUOCMEN] += 5;
				slkhoban = MatHangTruck[i][TRUCKTHUOCMEN];
				slban = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				MatHangTruck[i][TRUCKKHODGD] += 5;
				slkhoban = MatHangTruck[i][TRUCKDGD];
				slban = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				MatHangTruck[i][TRUCKKHOHAISAN] += 5;
				slkhoban = MatHangTruck[i][TRUCKHAISAN];
				slban = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				MatHangTruck[i][TRUCKKHOCAYCANH] += 5;
				slkhoban = MatHangTruck[i][TRUCKCAYCANH];
				slban = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA1])
		{
			case 0:{
				slkhomua1 = MatHangTruck[i][TRUCKTRAICAY];
				slmua1 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua1 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua1 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua1 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua1 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua1 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua1 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua1 = MatHangTruck[i][TRUCKNYP];
				slmua1 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua1 = MatHangTruck[i][TRUCKQUANAO];
				slmua1 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua1 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua1 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua1 = MatHangTruck[i][TRUCKDGD];
				slmua1 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua1 = MatHangTruck[i][TRUCKHAISAN];
				slmua1 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua1 = MatHangTruck[i][TRUCKCAYCANH];
				slmua1 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA2])
		{
			case 0:{
				slkhomua2 = MatHangTruck[i][TRUCKTRAICAY];
				slmua2 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua2 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua2 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua2 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua2 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua2 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua2 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua2 = MatHangTruck[i][TRUCKNYP];
				slmua2 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua2 = MatHangTruck[i][TRUCKQUANAO];
				slmua2 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua2 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua2 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua2 = MatHangTruck[i][TRUCKDGD];
				slmua2 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua2 = MatHangTruck[i][TRUCKHAISAN];
				slmua2 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua2 = MatHangTruck[i][TRUCKCAYCANH];
				slmua2 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA3])
		{
			case 0:{
				slkhomua3 = MatHangTruck[i][TRUCKTRAICAY];
				slmua3 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua3 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua3 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua3 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua3 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua3 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua3 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua3 = MatHangTruck[i][TRUCKNYP];
				slmua3 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua3 = MatHangTruck[i][TRUCKQUANAO];
				slmua3 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua3 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua3 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua3 = MatHangTruck[i][TRUCKDGD];
				slmua3 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua3 = MatHangTruck[i][TRUCKHAISAN];
				slmua3 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua3 = MatHangTruck[i][TRUCKCAYCANH];
				slmua3 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		switch(MatHangTruck[i][TRUCKMUA4])
		{
			case 0:{
				slkhomua4 = MatHangTruck[i][TRUCKTRAICAY];
				slmua4 = MatHangTruck[i][TRUCKKHOTRAICAY];
			}
			case 1:{
				slkhomua4 = MatHangTruck[i][TRUCKTRANGSUC];
				slmua4 = MatHangTruck[i][TRUCKKHOTRANGSUC];
			}
			case 2:{
				slkhomua4 = MatHangTruck[i][TRUCKLINHKIEN];
				slmua4 = MatHangTruck[i][TRUCKKHOLINHKIEN];
			}
			case 3:{
				slkhomua4 = MatHangTruck[i][TRUCKLUONGTHUC];
				slmua4 = MatHangTruck[i][TRUCKKHOLUONGTHUC];
			}
			case 4:{
				slkhomua4 = MatHangTruck[i][TRUCKNYP];
				slmua4 = MatHangTruck[i][TRUCKKHONYP];
			}
			case 5:{
				slkhomua4 = MatHangTruck[i][TRUCKQUANAO];
				slmua4 = MatHangTruck[i][TRUCKKHOQUANAO];
			}
			case 6:{
				slkhomua4 = MatHangTruck[i][TRUCKTHUOCMEN];
				slmua4 = MatHangTruck[i][TRUCKKHOTHUOCMEN];
			}
			case 7:{
				slkhomua4 = MatHangTruck[i][TRUCKDGD];
				slmua4 = MatHangTruck[i][TRUCKKHODGD];
			}
			case 8:{
				slkhomua4 = MatHangTruck[i][TRUCKHAISAN];
				slmua4 = MatHangTruck[i][TRUCKKHOHAISAN];
			}
			case 9:{
				slkhomua4 = MatHangTruck[i][TRUCKCAYCANH];
				slmua4 = MatHangTruck[i][TRUCKKHOCAYCANH];
			}
		}
		new giatienban = MatHangTruck[i][TRUCKTIENBAN];
		new giatienmua1 = MatHangTruck[i][TRUCKTIENMUA1];
		new giatienmua2 = MatHangTruck[i][TRUCKTIENMUA2];
		new giatienmua3 = MatHangTruck[i][TRUCKTIENMUA3];
		new giatienmua4 = MatHangTruck[i][TRUCKTIENMUA4];
		format(MatHangTruck[i][strtruck],4096,"Diem mua {A9E2F3}%s\n \n{A9E2F3}Dang ban\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\tSan xuat (moi gio)\n",diadiem);
		switch(random(4))
		{
			case 0:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1);
				MatHangTruck[i][TRUCKMUA2] = -1;
				MatHangTruck[i][TRUCKMUA3] = -1;
				MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 1:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2);
				MatHangTruck[i][TRUCKMUA3] = -1;
				MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 2:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3);
                MatHangTruck[i][TRUCKMUA4] = -1;
			}
			case 3:
			{
				format(MatHangTruck[i][strtruck],4096,"%s{FFFFFF}%s\t%d thung (%d)\t$%d\t+5 thung\n \n{A9E2F3}Dang mua:\n{BDBDBD}Mat hang\tTrong kho (Toi da)\tGia\n{FFFFFF}%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d\n%s\t%d thung (%d)\t$%d",
										MatHangTruck[i][strtruck],strban,slban,slkhoban,giatienban,strmua1,slmua1,slkhomua1,giatienmua1,strmua2,slmua2,slkhomua2,giatienmua2,strmua3,slmua3,slkhomua3,giatienmua3,strmua4,slmua4,slkhomua4,giatienmua4);
			}
		}
		UpdateLabelTruck(i);

	}
	return 1;
}

task ResetTruckne[60000*60]()
{
	UpdateTrucker();
	foreach(new i:Player)
	{
		if(PlayerInfo[i][pJob] == 20 || PlayerInfo[i][pJob2] == 20)
		{
			SendClientMessageEx(i,-1,"{C6E2FF}Trucker Delivery{FFFFFF}: Cac cua hang da doi don mua hang moi, mau den xem");
		}
	}
}