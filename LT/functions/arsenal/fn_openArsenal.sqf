
_globalBlackListBox = missionNamespace getVariable ["LT_GlobalBlackList", objNull];
_globalWhiteListBox = missionNamespace getVariable ["LT_GlobalWhiteList", objNull];

_whiteListBox = player getVariable ["LT_WhiteList", objNull];
_gb_override = player getVariable ["LT_BG_Override", false];
_gw_override = player getVariable ["LT_BW_Override", false];

if (isNull _whiteListBox) then
{
	if (isNull _globalWhiteListBox OR _gw_override) then
	{

		if (isNull _globalBlackListBox OR _gb_override) then
		{

			["Open",[true,objNull,player]] call bis_fnc_arsenal;
		}
		else
		{
			["Open",[nil,_globalBlackListBox,player]] call bis_fnc_arsenal;
		};
	}
	else
	{
		["Open",[nil,_globalWhiteListBox,player]] call bis_fnc_arsenal;
	};
}
else
{
	["Open",[nil,_whiteListBox,player]] call bis_fnc_arsenal;
};