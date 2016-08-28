/*
	Author: Sean Crowe

*/

private["_control","_loadoutNumber", "_loadoutName"];
disableSerialization;

if(!createDialog "LT_LoadoutMenu") exitWith {hint "Couldn't open the loadout menu?"};


//Get tags and list them
_control = ((findDisplay 2580) displayCtrl 2803);

_control lbAdd "All";
_control lbSetCurSel 0;

//Fill the loadouts and list them.

_data = profileNamespace getVariable "bis_fnc_saveInventory_data";

_control = ((findDisplay 2580) displayCtrl 2801);




_numberLoadouts = ((count _data) / 2) - 1;

for "_i" from 0 to _numberLoadouts do
{
	_selectNum = _i * 2;

	_control lbAdd format ["%1", _data select _selectNum];
	_control lbSetData[(lbSize _control)-1,((str _selectNum))];
};
