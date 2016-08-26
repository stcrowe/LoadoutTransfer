/*
	Author: Sean Crowe
	Inspired by: Bryan "Tonic" Boardwine

	Description:
	Sends the transfer request to the selected user.
*/

_this spawn
{

	private["_control","_targetUserData", "_index", "_targetUser", "_length", "_selectData"];
	disableSerialization;
	_control = ((findDisplay 2570) displayCtrl 2701);
	if(lbCurSel _control == -1) exitWith {};
	_targetUserData = _control lbData (lbCurSel _control);


	_index = [_targetUserData, "&??&"] call LT_fnc_KRON_StrIndex;
	_targetUser = [_targetUserData, (_index)] call LT_fnc_KRON_StrLeft;
	_length = [_targetUserData] call LT_fnc_KRON_StrLen;
	_selectData = [_targetUserData, (_length - (_index + 4)) ] call LT_fnc_KRON_StrRight;

	//hint format ["Data %1", _targetUserData];


	// Check to see if the target user is the server
	if (_targetUser == "***SERVER***") then
	{
		_dataLoadout = profileNamespace getVariable "bis_fnc_saveInventory_data" select ( (parseNumber _selectData)  + 1);

		_loadoutName = _control lbText (lbCurSel _control);

		[player, _dataLoadout, _loadoutName] remoteExec ["LT_fnc_serverTransfer", 2];

	}
	else
	{

		//Fetch the users actual object.
		if(_targetUser == "") exitWith {hint "Bad Unit"};

		{
			if(str(_x) == _targetUser) exitWith {_targetUser = _x;};

		} forEach allUnits;

		if(isNull _targetUser) exitWith {hint "Bad Unit"};

		//hintC format ["%1 | %2 | %3", _selectData, _targetUser, _targetUserData];

		_loadoutName = "LT" + str ((random 100) + (random 100) + (random 100)+(random 100));

		// Mutex lock
		waitUntil { !(missionNamespace getVariable ["LT_MUTEX_LOCK", false])};

		missionNamespace setVariable ["LT_MUTEX_LOCK", true, true];

		_dataLoadout = profileNamespace getVariable "bis_fnc_saveInventory_data" select ( (parseNumber _selectData)  + 1);

		_data = missionNamespace getVariable "bis_fnc_saveInventory_data";

		if (isNil "_data") then
		{

			missionNamespace setVariable ["bis_fnc_saveInventory_data", [_loadoutName, _dataLoadout], true];
		}
		else
		{
			_data append [_loadoutName];
			_data append [_dataLoadout];

			missionNamespace setVariable ["bis_fnc_saveInventory_data", _data, true];
		};

		missionNamespace setVariable ["LT_MUTEX_LOCK", false, true];

		//hint format ["%1", _dataLoadout];

		if (isPlayer _targetUser) then
		{
			[player, _loadoutName] remoteExec ["LT_fnc_transferNetwork", _targetUser];
			// [[player, _loadoutName],"LT_fnc_transferNetwork", _targetUser,false] spawn BIS_fnc_MP;
		}
		else
		{
			[_targetUser, [missionNamespace, _loadoutName]] call bis_fnc_loadInventory;

			sleep 0.5;

			[_targetUser] call LT_fnc_limitCurrentGear;
		};

		hintSilent format ["Loadout Transfered to %1", name _targetUser];
	};

	closeDialog 0;

};