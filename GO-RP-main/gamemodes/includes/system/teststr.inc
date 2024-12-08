//#include <menu>

stock HexReturn(rr, gg, bb, aa)
{
	return (aa & 0xFF) | ((bb & 0xFF) << 8) | ((gg & 0xFF) << 16) | (rr << 24);
}

CMD:ya(playerid, params[])
{
    if(Menu_Showing(playerid))
        return 1;
    SendClientMessage(playerid,-1,"test");
    Menu_Add(playerid, "Item 1");
    Menu_Add(playerid, "Item 2");
    Menu_Add(playerid, "Item 3");
    Menu_Add(playerid, "Item 4");
    Menu_Add(playerid, "Item 5");
    Menu_Add(playerid, "Item 6");
    Menu_Add(playerid, "Item 7");
    TogglePlayerControllable(playerid, 0);
    Menu_SetColor(playerid, HexReturn(51, 153, 255, 200)); // Dodger Blue
    Menu_Show(playerid, 1, "HELLO YOOY!", "Interaction");
    for(new i = 0; i < 5; i ++) 
    {
        PlayerTextDrawShow(playerid, _@m_ptd[playerid][i]);
    }
    return 1;
} 

public OnMenuResponse(playerid, menuid, response, listitem)
{
    new 
        str[128];
    
    format(str, sizeof(str), "Menu=%d, Response=%d, Listitem=%d", menuid, response, listitem);
    SendClientMessage(playerid, -1, str);
    if(!response)
    {
        Menu_Hide(playerid);
        TogglePlayerControllable(playerid, 1);
    }
    return 1;
}