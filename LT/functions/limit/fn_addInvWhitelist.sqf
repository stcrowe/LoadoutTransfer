params [

	["_ammo", objNull]
];

if (isNull _module) exitWith {};

if (_module getVariable ["LT_Mod_Init", false]) exitWith {};

_objects = synchronizedObjects _module;


_units = [];
_virtualAmmoBox = objNull;

{
	_object = _x;

	if ((typeOf _object) isKindOf "ThingX") then
	{
		_virtualAmmoBox = _object;
	};

	if ((typeOf _object) isKindOf "Man") then
	{
		_units append [_object];
	};

} forEach _objects;

if (isNull _virtualAmmoBox) exitWith {};

_virtualAmmoBox setPos [0, 0, 0];
_virtualAmmoBox hideObjectGlobal true;

{
	_x setVariable ["LT_WhiteList", _virtualAmmoBox, true];

	_x addEventHandler ["respawn",
	{
		_this setVariable ["LT_WhiteList", _virtualAmmoBox, true];
	}];
} forEach _units;

_module setVariable ["LT_Mod_Init", true, true];