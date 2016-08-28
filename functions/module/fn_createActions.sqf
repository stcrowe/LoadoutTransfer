/*
	Author: Sean Crowe

	Description:
	Called at start of mission and calls LT_fnc_LTaction to all objects attached to module
*/

if(!isServer) exitWith {};

if(!isNil "LT_CALLED") exitWith {};
LT_CALLED = true;


_moduleMenu = allMissionObjects "LT_makeLTmenu";
_moduleSettings = allMissionObjects "LT_settings";


if (count _moduleMenu > 0) then
{
	{
	  _currentModule = _x;

	  {
	      [_x, _currentModule getVariable ["load", true], _currentModule getVariable ["transfer", true], _currentModule getVariable ["arsenal", true], _currentModule getVariable ["manage", true], _currentModule getVariable ["server", false], _currentModule getVariable ["admin", true]] call LT_fnc_LTaction;
	  } forEach (synchronizedObjects _x);

	} forEach _moduleMenu;
};

if (count _moduleSettings > 0) then
{
	_currentModule = _moduleSettings select 0;

	LT_distance = _currentModule getVariable ["transferDistance", 20];

	_respawn = _currentModule getVariable ["loadRespawn", false];

	if (_respawn) then
	{
		[_currentModule getVariable ["load", true], _currentModule getVariable ["transfer", true], _currentModule getVariable ["arsenal", true], _currentModule getVariable ["manage", true], _currentModule getVariable ["server", false], _currentModule getVariable ["admin", true]] remoteExec ['LT_fnc_respawnSetup',[0,-2] select (isMultiplayer && isDedicated),true];
	};
};


