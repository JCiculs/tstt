#include <a_samp>
#include <FCNPC>
#include <YSI_Coding\y_hooks>



new Float:x1 = 2299.9409, Float:y1 = -1740.3541, Float:z1 = 13.5469;
new Float:x2 = 2265.6443, Float:y2 = -1759.3188, Float:z2 = 13.5469;
new npcid;

hook OnGameModeInit()
{
    // Tạo con NPC
    npcid = FCNPC_Create("MyNPC");

    // Đặt vị trí ban đầu của NPC
    FCNPC_SetPosition(npcid, x1, y1, z1);

    // Di chuyển NPC đến vị trí mới
    FCNPC_GoTo(npcid, x2, y2, z2, 1, 5.0, 0);
    return 1;
}