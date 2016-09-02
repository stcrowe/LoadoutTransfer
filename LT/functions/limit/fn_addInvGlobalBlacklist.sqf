params [

	["_virtualAmmoBox", objNull]
];

if (isNull _virtualAmmoBox) exitWith {};

if (_virtualAmmoBox getVariable ["LT_Mod_Init", false]) exitWith {};

if (!((typeOf _virtualAmmoBox) isKindOf "ReammoBox_F")) exitWith {};

_items = _virtualAmmoBox call BIS_fnc_getVirtualItemCargo;
_weapons = _virtualAmmoBox call BIS_fnc_getVirtualWeaponCargo;
_magazines = _virtualAmmoBox call BIS_fnc_getVirtualMagazineCargo;
_backpacks = _virtualAmmoBox call BIS_fnc_getVirtualBackpackCargo;


[_virtualAmmoBox, _items, true] call BIS_fnc_removeVirtualItemCargo;
[_virtualAmmoBox, _weapons, true] call BIS_fnc_removeVirtualWeaponCargo;
[_virtualAmmoBox, _magazines , true] call BIS_fnc_removeVirtualMagazineCargo;
[_virtualAmmoBox, _backpacks, true] call BIS_fnc_removeVirtualBackpackCargo;


// Return array [<items>, <weapons>, <mags>, <backpacks>]
_allInventory = [] call LT_fnc_getAll;

if (!("%All" in _items)) then
{
	_items = (_allInventory select 0) - _items;
};

if (!("%All" in _weapons)) then
{
	_weapons = (_allInventory select 1) - _weapons;
};

if (!("%All" in _magazines)) then
{
	_magazines = (_allInventory select 2) - _magazines;
};

if (!("%All" in _backpacks)) then
{
	_backpacks = (_allInventory select 3) - _backpacks;
};


[_virtualAmmoBox, _items, true, false] call BIS_fnc_addVirtualItemCargo;
[_virtualAmmoBox, _weapons, true, false] call BIS_fnc_addVirtualWeaponCargo;
[_virtualAmmoBox, _magazines, true, false] call BIS_fnc_addVirtualMagazineCargo;
[_virtualAmmoBox, _backpacks, true, false] call BIS_fnc_addVirtualBackpackCargo;

_sendIt = _virtualAmmoBox getVariable "bis_addVirtualWeaponCargo_cargo";
_virtualAmmoBox setVariable ["bis_addVirtualWeaponCargo_cargo", _sendIt, true];


_virtualAmmoBox setPos [0, 0, 0];
_virtualAmmoBox hideObjectGlobal true;

missionNamespace setVariable ["LT_GlobalBlackList", _virtualAmmoBox, true];
_virtualAmmoBox setVariable ["LT_Mod_Init", true, true];