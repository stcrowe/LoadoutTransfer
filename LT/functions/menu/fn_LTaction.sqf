/*
	Author: Sean Crowe

*/
params
[
	["_obj", objNull]
];


if (isNull _obj) exitWith {};

_obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>",

{

	params
	[
		["_obj", objNull],
		["_load", [true, false, false], [true, []] ],
		["_transfer", true],
		["_arsenal", true],
		["_manageLoadouts", true],
		["_adminOptions", true]
	];


 	[_load, _transfer, _arsenal, _manageLoadouts, _adminOptions] spawn LT_fnc_mainMenuLoad;


 }, _this, 0, false];