/*
	Author: Sean Crowe

*/

private["_control","_loadoutNumber", "_loadoutName", "_serverLoadouts"];
disableSerialization;

if(!createDialog "LT_LoadoutMenuServer") exitWith {hint "Couldn't open the loadout menu?"};


//Fill the loadouts and list them.



_control = ((findDisplay 2590) displayCtrl 2592);

_serverLoadouts = missionNamespace getVariable ["LT_SERVER_LO", []];

_numberLoadouts = ((count _serverLoadouts) / 2) - 1;

for "_i" from 0 to _numberLoadouts do
{
	_selectNum = _i * 2;

	_control lbAdd format ["%1", _serverLoadouts select _selectNum];
	_control lbSetData[(lbSize _control)-1,((str _selectNum))];
};
