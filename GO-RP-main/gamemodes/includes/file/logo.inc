   

#include <YSI_Coding\y_hooks>
new Text: logo[0];
new Text: logo1[0];
hook OnGameModeInit()
{

    logo = TextDrawCreate(529.529235, 0.416656, "VIETNAMSE");
    TextDrawLetterSize(logo, 0.400000, 1.600000);
    TextDrawAlignment(logo, 1);
    TextDrawColor(logo, 255);
    TextDrawSetShadow(logo, 1);
    TextDrawSetOutline(logo, 0);
    TextDrawBackgroundColor(logo, 16777215);
    TextDrawFont(logo, 2);
    TextDrawSetProportional(logo, 1);
    TextDrawSetShadow(logo, 1);

    logo1 = TextDrawCreate(4.823446, 430.333312, "Los_Santos");
    TextDrawLetterSize(logo1, 0.398588, 1.611666);
    TextDrawAlignment(logo1, 1);
    TextDrawColor(logo, -1061109505);
    TextDrawSetShadow(logo1, 0);
    TextDrawSetOutline(logo1, -1);
    TextDrawBackgroundColor(logo1, 41215);
    TextDrawFont(logo1, 0);
    TextDrawSetProportional(logo1, 1);
    TextDrawSetShadow(logo1, 0);  
}
