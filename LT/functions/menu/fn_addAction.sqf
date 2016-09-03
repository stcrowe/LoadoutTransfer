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

	(_this select 3) params
	[
		["_obj", objNull],
		["_load", [true, false, false], [true, []] ],
		["_transfer", true],
		["_arsenal", true],
		["_manageLoadouts", true],
		["_adminOptions", true]
	];

 	[_load, _transfer, _arsenal, _manageLoadouts, _adminOptions] spawn LT_fnc_mainMenuLoad;


 }, _this, 1.5, true, true, "", "_target distance _this < 5"];

