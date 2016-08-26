private["_modPosition", "_missionLoadouts", "_loadPersonal", "_loadServer", "_missionLoadoutsExist", "_serverLoadoutsExist"];

params
[
	["_loadPersonal", nil],
	["_loadServer", nil],
	["_missionLoadouts", nil]
];



if (isNil "_loadPersonal" OR isNil "_loadServer" OR isNil "_missionLoadouts") then
{
	_loadPersonal = player getVariable ["LT_loadPersonal", false];
	_loadServer = player getVariable ["LT_loadServer", false];
	_missionLoadouts = player getVariable ["LT_missionLoadouts", false];
};

// Check if mission loadouts exist
_missionLoadoutsExist = false;

{
	if ((typeName _x) == "STRING") then
	{
		if (([_x, "#LT_MISLO"] call LT_fnc_KRON_StrIndex) != -1) then
		{
			_missionLoadoutsExist = true;
		};
	};

	if (_missionLoadoutsExist) exitWith {};

} forEach (missionNamespace getVariable "bis_fnc_saveInventory_data");


// Check if server needs to be initialized and if server loadouts exist
_serverLoadoutsExist = false;
if (_loadServer) then
{
	if (isNil "LT_SERVER_LO") then
	{
		remoteExecCall ["LT_fnc_serverInit", 2];

		waitUntil {!isNil "LT_SERVER_LO"};
	};

	if (!isNil "LT_SERVER_LO") then
	{
		if (count LT_SERVER_LO > 0) then
		{
			_serverLoadoutsExist = true;
		};
	};
};

_modPosition = 0;

if ((!_loadServer AND !_serverLoadoutsExist) AND (!_missionLoadouts AND !_missionLoadoutsExist)) exitWith {[] spawn LT_fnc_loadoutMenu;};

disableSerialization;

if(!createDialog "LT_LoadoutSelectionMenu") exitWith {hint "Couldn't open the loadout menu?"};


if (!(_loadPersonal)) then
{
	_control = ((findDisplay 2410) displayCtrl 2411);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;

}
else
{
	_control = ((findDisplay 2410) displayCtrl 2411);
	_control ctrlSetPosition [0.43, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;
};

if (!(_missionLoadouts) OR !(_missionLoadoutsExist)) then
{
	_control = ((findDisplay 2410) displayCtrl 2412);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;

}
else
{
	_control = ((findDisplay 2410) displayCtrl 2412);
	_control ctrlSetPosition [0.43, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;

};

if (!(_loadServer) OR !(_serverLoadoutsExist)) then
{
	_control = ((findDisplay 2410) displayCtrl 2413);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;
}
else
{
	_control = ((findDisplay 2410) displayCtrl 2413);
	_control ctrlSetPosition [0.43, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;

};
