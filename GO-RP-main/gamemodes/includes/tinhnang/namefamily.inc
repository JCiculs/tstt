#include <a_samp>
#include <YSI_Coding\y_hooks>

new Text3D:tengang;
new nametag[MAX_PLAYERS];
hook OnPlayerConnect(playerid)
{
    nametag[playerid] = 0;
    return 1;
}
task OnPlayerUpdateNameTag[1000]()
{
    foreach(new i: Player)
    {
        if(nametag[i] == 1)
        {
            new str[64];
            //new Float:X,Float:Y,Float:Z;
            
            format(str,sizeof(str),"%s",FamilyInfo[PlayerInfo[i][pFMember]][FamilyName]);
            tengang = CreateDynamic3DTextLabel(str, -1,0.0,0.0,0.5, 0);
            Attach3DTextLabelToPlayer(tengang, i, 0.0,0.0,0.7);

        }
    }
}
CMD:shownametag(playerid)
{
	if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID)
    {
        if(nametag[playerid] == 0)
        {
            nametag[playerid] = 1;
            SendClientMessage(playerid, COLOR_YELLOW, "Ban da bat hien thi ten family");
        }
        else
        {
            nametag[playerid] = 0;
            SendClientMessage(playerid, -1, "Ban da tat hien thi ten family");
        }
    }
    else SendClientMessage(playerid, -1, "Ban khong o trong gang");
    return 1;
}
