params [

	["_module", objNull]
];

if (isNull _module) exitWith {};

//if (_module getVariable ["LT_Mod_Init", false]) exitWith {};

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

missionNamespace setVariable ["LT_GlobalWhiteList", _virtualAmmoBox, true];


{
	_x setVariable ["LT_GW_Override", true, true];

	_x addEventHandler ["respawn",
	{
		_this setVariable ["LT_GW_Override", true, true];
	}];

} forEach _units;

_module setVariable ["LT_Mod_Init", true, true];