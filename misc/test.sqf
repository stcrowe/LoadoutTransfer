_unit = _this select 1;

systemChat format ["%1", player getVariable ["LT_WhiteList", false]];
systemChat format ["%1", player getVariable ["LT_GW_Override", false]];
systemChat format ["%1", player getVariable ["LT_GB_Override", false]];

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

			systemChat "All";
		}
		else
		{
			systemChat "Global Blacklist";
		};
	}
	else
	{
		systemChat "Global Whitelist";
	};
}
else
{
	systemChat "Local Whitelist";
};





format ["%1", profileNamespace getVariable ["bis_fnc_saveInventory_data", false]] remoteExecCall ["systemChat", -2];
format ["%1", profileNamespace getVariable ["LT_Server_Loadouts", false]] remoteExecCall ["systemChat", -2];
