#include <a_samp>

#define XEPHANG 7654
#define XEPHANG1 7653

CMD:bangxephang(playerid)
{
    ShowPlayerDialog(playerid, XEPHANG, DIALOG_STYLE_LIST,"Bang Xep Hang","Top Nguoi Giau\nTop Donator\nTop Online","Chon","Huy");
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new Cache:Result, 
    NamePlayer[MAX_PLAYER_NAME], 
    str[2000], str1[2000];
    new Credits, Money, Level;
    if(dialogid == XEPHANG && response)
    {
        switch(listitem)
        {
            case 0:
            {
                Result = mysql_query(MainPipeline, "SELECT `Money`, `Username` FROM `accounts` ORDER BY `Money` DESC LIMIT 100");
                if(cache_num_rows())
                {
                    for(new i = 0; i < cache_num_rows(); ++ i)
                    {
                        cache_get_field_content(i, "Username", NamePlayer);
                        Money = cache_get_field_content_int(i, "Money");
                        format(str, sizeof(str), "%d \t%s\t%s$\n", i+1, NamePlayer, number_format(Money));
                        strcat(str1, str, sizeof(str1));
                    }
                }
                format(str, sizeof(str), "TOP\tNguoi Dan\tSo Tai San\n%s", str1);
                cache_delete(Result);
                ShowPlayerDialog(playerid, XEPHANG1, DIALOG_STYLE_TABLIST_HEADERS, "Top Money", str, "OK","");
            }
            case 1:
            {
                Result = mysql_query(MainPipeline, "SELECT `Credits`, `Username` FROM `accounts` ORDER BY `Credits` DESC LIMIT 100");
                if(cache_num_rows())
                {
                    for(new i = 0; i < cache_num_rows(); ++ i)
                    {
                        cache_get_field_content(i, "Username", NamePlayer);
                        Credits = cache_get_field_content_int(i, "Credits");
                        format(str, sizeof(str), "%d \t%s\t%s\n", i+1, NamePlayer, number_format(Credits));
                        strcat(str1, str, sizeof(str1));
                    }
                }
                format(str, sizeof(str), "TOP\tNguoi Dan\tCredits\n%s", str1);
                cache_delete(Result);
                ShowPlayerDialog(playerid, XEPHANG1, DIALOG_STYLE_TABLIST_HEADERS, "Top Credits", str, "OK","");
            }
            case 2:
            {
                Result = mysql_query(MainPipeline, "SELECT `Level`, `Username` FROM `accounts` ORDER BY `Level` DESC LIMIT 100");
                if(cache_num_rows())
                {
                    for(new i = 0; i < cache_num_rows(); ++ i)
                    {
                        cache_get_field_content(i, "Username", NamePlayer);
                        Level = cache_get_field_content_int(i, "Level");
                        format(str, sizeof(str), "%d \t%s\t%s\n", i+1, NamePlayer, number_format(Level));
                        strcat(str1, str, sizeof(str1));
                    }
                }
                format(str, sizeof(str), "TOP\tNguoi Dan\tLevel\n%s", str1);
                cache_delete(Result);
                ShowPlayerDialog(playerid, XEPHANG1, DIALOG_STYLE_TABLIST_HEADERS, "Top Level", str, "OK","");
            }            
        }
    }
    return 1;
}
