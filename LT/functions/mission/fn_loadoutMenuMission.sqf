/*
	Author: Sean Crowe

*/

private["_control","_loadoutNumber", "_loadoutName", "_missionLoadouts", "_loadoutData"];
disableSerialization;

if(!createDialog "LT_LoadoutMenuMission") exitWith {hint "Couldn't open the loadout menu?"};


//Fill the loadouts and list them.



_control = ((findDisplay 2595) displayCtrl 2597);

_missionLoadouts = missionNamespace getVariable "bis_fnc_saveInventory_data";

_loadoutData = [];

{
	if ((typeName _x) == "STRING") then
	{
		if (([_x, "#LT_MISLO"] call LT_fnc_KRON_StrIndex) != -1) then
		{
			_lo_name = [_x, "#LT_MISLO", ""] call LT_fnc_KRON_StrReplace;

			_loadoutData append [_lo_name];
			_loadoutData append [_missionLoadouts select (_forEachIndex + 1)];
		};
	};

} forEach _missionLoadouts;

_numberLoadouts = ((count _loadoutData) / 2) - 1;

for "_i" from 0 to _numberLoadouts do
{
	_selectNum = _i * 2;

	_control lbAdd format ["%1", _loadoutData select _selectNum];
	_control lbSetData[(lbSize _control)-1,(_loadoutData select _selectNum)];
};
