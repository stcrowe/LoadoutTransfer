/*
	Author: Sean Crowe

*/


params ["_name"];

_missionLoadouts = missionNamespace getVariable "bis_fnc_saveInventory_data";

_newMissionLoadouts = [];

_skipIndex = -1;

{
	if ((typeName _x) == "STRING") then
	{
		if (_x == ("#LT_MISLO" + _name)) then
		{
			_skipIndex = (_forEachIndex + 1);
		}
		else
		{
			_newMissionLoadouts append [_x];
		};
	}
	else
	{
		if (_skipIndex != _forEachIndex) then
		{

			_newMissionLoadouts append [_x];
		};
	};

} forEach _missionLoadouts;

