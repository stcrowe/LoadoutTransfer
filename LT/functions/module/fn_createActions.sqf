/*
	Author: Sean Crowe

	Description:
	Called at start of mission and calls LT_fnc_LTaction to all objects attached to module
*/

if(!isNil "LT_CALLED") exitWith {};
LT_CALLED = true;


_moduleMenu = allMissionObjects "LT_makeLTmenu";
_moduleSettings = allMissionObjects "LT_settings";


if (count _moduleMenu > 0) then
{
	{
	  _currentModule = _x;

	  {
	      [_x, [[_currentModule getVariable ["loadPersonal", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["loadMission", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["loadServer", true]] call LT_fnc_StrToBool], [_currentModule getVariable ["transfer", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["arsenal", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["manage", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["admin", true]] call LT_fnc_StrToBool] call LT_fnc_addAction;
	  } forEach (synchronizedObjects _currentModule);

	} forEach _moduleMenu;
};

if (count _moduleSettings > 0) then
{
	_currentModule = _moduleSettings select 0;

	LT_distance = _currentModule getVariable ["transferDistance", 20];

	_respawn = [_currentModule getVariable ["loadRespawn", false]] call LT_fnc_StrToBool;


	missionNamespace setVariable ["LT_RespawnSettings", [[[_currentModule getVariable ["loadPersonal", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["loadMission", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["loadServer", true]] call LT_fnc_StrToBool], [_currentModule getVariable ["transfer", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["arsenal", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["manage", true]] call LT_fnc_StrToBool, [_currentModule getVariable ["admin", true]] call LT_fnc_StrToBool]];

	if (_respawn) then
	{
		[] spawn LT_fnc_respawnSetup;
	};
};


