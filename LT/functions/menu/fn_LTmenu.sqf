/*
	Author: Sean Crowe
	// Wrapper function for backwards combatiblity

*/

private["_modPosition"];

params
[
	["_load", [true, true, true], [true, []] ],
	["_transfer", true],
	["_arsenal", true],
	["_manageLoadouts", true],
	["_adminOptions", true]
];


[_load, _transfer, _arsenal, _manageLoadouts, _adminOptions] spawn LT_fnc_mainMenuLoad;