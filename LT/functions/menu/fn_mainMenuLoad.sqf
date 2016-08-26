/*
	Author: Sean Crowe

*/

private["_modPosition"];

params
[
	["_load", [true, false, false], [true, []] ],
	["_transfer", true],
	["_arsenal", true],
	["_manageLoadouts", true],
	["_adminOptions", true]
];

_modPosition = 0;

disableSerialization;

if(!createDialog "LT_MainMenu") exitWith {hint "Couldn't open the loadout menu?"};

_showLoad = false;


if (typeName _load == typeName true) then
{
	if (_load) then
	{
		_load = [true, true, true];
	}
	else
	{
		_load = [false, false, false];
	};
};

{
	if (_x) then {_showLoad = true;};

	switch (_foreachIndex) do
	{
		case 0:
		{
			player setVariable ["LT_loadPersonal", _x];
		};
		case 1:
		{
			player setVariable ["LT_loadServer", _x];
		};
		case 2:
		{
			player setVariable ["LT_missionLoadouts", _x];
		};

	};
} forEach _load;


if (!(_showLoad)) then
{
	_control = ((findDisplay 2400) displayCtrl 2401);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;

}
else
{
	_control = ((findDisplay 2400) displayCtrl 2401);
	_control ctrlSetPosition [0.51, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;
};

if (!(_transfer)) then
{
	_control = ((findDisplay 2400) displayCtrl 2402);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;

}
else
{
	_control = ((findDisplay 2400) displayCtrl 2402);
	_control ctrlSetPosition [0.51, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;

};

if (!(_arsenal)) then
{
	_control = ((findDisplay 2400) displayCtrl 2403);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;
}
else
{
	_control = ((findDisplay 2400) displayCtrl 2403);
	_control ctrlSetPosition [0.51, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;

};

if (!(_manageLoadouts)) then
{
	_control = ((findDisplay 2400) displayCtrl 2404);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;
}
else
{
	_control = ((findDisplay 2400) displayCtrl 2404);
	_control ctrlSetPosition [0.51, 0.35];
	_pos = ctrlPosition _control;
	_posX = _pos select 0;
	_posY = (_pos select 1) - _modPosition;


	_control ctrlSetPosition [_posX, _posY];
	_control ctrlCommit 0;

};

if (!(_adminOptions) OR !(isMultiplayer)) then
{
	_control = ((findDisplay 2400) displayCtrl 2405);
	_control ctrlShow false;
	_modPosition = _modPosition + 0.05;
}
else
{
	if (serverCommandAvailable "#logout" AND isMultiplayer) then
	{
		_control = ((findDisplay 2400) displayCtrl 2405);
		_control ctrlSetPosition [0.51, 0.35];
		_pos = ctrlPosition _control;
		_posX = _pos select 0;
		_posY = (_pos select 1) - _modPosition;


		_control ctrlSetPosition [_posX, _posY];
		_control ctrlCommit 0;
	}
	else
	{
		_control = ((findDisplay 2400) displayCtrl 2405);
		_control ctrlShow false;
		_modPosition = _modPosition + 0.05;
	};
};
