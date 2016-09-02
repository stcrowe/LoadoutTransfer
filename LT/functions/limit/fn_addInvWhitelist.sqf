params [
	["_virtualAmmoBox", objNull]
];

if (isNull _virtualAmmoBox) exitWith {};

if (_virtualAmmoBox getVariable ["LT_Mod_Init", false]) exitWith {};

if (!((typeOf _virtualAmmoBox) isKindOf "ReammoBox_F")) exitWith {};

_virtualAmmoBox setPos [0, 0, 0];
_virtualAmmoBox hideObjectGlobal true;

_virtualAmmoBox setVariable ["LT_Mod_Init", true, true];