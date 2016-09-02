/*
	Author: Sean Crowe

*/


_this spawn
{
	private["_control","_targetUserData", "_index", "_targetUser", "_length", "_selectData"];
	disableSerialization;

	_control = ((findDisplay 2590) displayCtrl 2592);
	if(lbCurSel _control == -1) exitWith {};

	_loadoutNum = parseNumber (_control lbData (lbCurSel _control));

	_serverLoadouts = missionNamespace getVariable ["LT_SERVER_LO", []];

	_loadoutName = _serverLoadouts select _loadoutNum;
	_dataLoadout = _serverLoadouts  select (_loadoutNum + 1);

	// Mutex lock
	waitUntil { !(missionNamespace getVariable ["LT_MUTEX_LOCK", false])};

	missionNamespace setVariable ["LT_MUTEX_LOCK", true, true];

	_data = missionNamespace getVariable "bis_fnc_saveInventory_data";

	if (isNil "_data") then
	{

		missionNamespace setVariable ["bis_fnc_saveInventory_data", [("#LT_SERVERLO" + _loadoutName), _dataLoadout], true];
	}
	else
	{
		_data append ["#LT_SERVERLO" + _loadoutName];
		_data append [_dataLoadout];

		missionNamespace setVariable ["bis_fnc_saveInventory_data", _data, true];
	};

	missionNamespace setVariable ["LT_MUTEX_LOCK", false, true];

	//End Lock

	[player, [missionNamespace, ("#LT_SERVERLO" + _loadoutName)]] call bis_fnc_loadInventory;

	[player] call LT_fnc_limitCurrentGear;


	hintSilent format ["%1 loaded", _loadoutName];
	closeDialog 0;

};
