/*
	Author: Sean Crowe

*/

private["_control","_targetUserData", "_index", "_targetUser", "_length", "_selectData"];
disableSerialization;

_control = ((findDisplay 2595) displayCtrl 2597);
if(lbCurSel _control == -1) exitWith {};




_loadoutName = _control lbData (lbCurSel _control);

_loadoutName = "#LT_MISLO" + _loadoutName;

[player, [missionNamespace, _loadoutName]] call bis_fnc_loadInventory;

[player] call LT_fnc_limitCurrentGear;


hintSilent format ["%1 loaded", _control lbData (lbCurSel _control)];
closeDialog 0;
