/*
	Author: Sean Crowe

*/

private ["_whiteListBox", "_globalWhiteListBox", "_globalWhiteListBox", "_virtualBox", "_showDialog", "_control", "_data", "_numberLoadouts"];

_whiteListBox = player getVariable ["LT_WhiteList", objNull];
_gb_override = player getVariable ["LT_GB_Override", false];
_gw_override = player getVariable ["LT_BW_Override", false];

_globalBlackListBox = missionNamespace getVariable ["LT_GlobalBlackList", objNull];
_globalWhiteListBox = missionNamespace getVariable ["LT_GlobalWhiteList", objNull];

_showDialog = true;

if (isNull _whiteListBox) then
{
	if (isNull _globalWhiteListBox OR _gw_override) then
	{
		if (!(isNull _globalBlackListBox) AND !(_gb_override)) then
		{
			_showDialog = false;
		};

	}
	else
	{
		_showDialog = false;
	};
}
else
{
	_showDialog = false;
};


if (!(_showDialog)) exitWith {hint "Sorry. You can't manage loadouts while your character is under a blacklist or whitelist.";};

disableSerialization;

if(!createDialog "LT_Modify_Diag") exitWith {hint "Couldn't open the loadout menu?"};

_control = ((findDisplay 2510) displayCtrl 2511);
lbClear _control;

_data = profileNamespace getVariable "bis_fnc_saveInventory_data";
_numberLoadouts = ((count _data) / 2) - 1;

for "_i" from 0 to _numberLoadouts do
{
	_selectNum = _i * 2;

	_control lbAdd format ["%1", _data select _selectNum];
	_control lbSetData[(lbSize _control)-1,((str _selectNum))];
};

if (count _this > 0) then
{
	_control lbSetCurSel (_this select 0);
};

_control = ((findDisplay 2510) displayCtrl 2513);
_control lbSetCurSel -1;
