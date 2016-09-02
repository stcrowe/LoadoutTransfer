/*
	Author: Sean Crowe

*/

disableSerialization;

_control = ((findDisplay 2520) displayCtrl 2523);
if(lbCurSel _control == -1) exitWith {};
_modifyButton = _control lbData (lbCurSel _control);

_control = ((findDisplay 2520) displayCtrl 2521);
if(lbCurSel _control == -1) exitWith {};
_loadoutPosition = _control lbData (lbCurSel _control);

_loadoutPosition = parseNumber _loadoutPosition;

_dataLoadout = missionNamespace getVariable ["LT_SERVER_LO", []];

_numberLoadouts = ((count _dataLoadout) / 2) - 1;
_loadoutNumber = (_loadoutPosition / 2);




switch (_modifyButton) do
{
	case "up":
	{
		if (_loadoutPosition != 0) then
		{

			_newData = [];


			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{

					if (_i == _loadoutNumber - 1) then
					{
						_newData = _newData + [_dataLoadout select _loadoutPosition];
						_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];

					}
					else
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];
					};
				};


			};

			missionNamespace setVariable ["LT_SERVER_LO", _newData, true];
			[(_loadoutNumber - 1)] call LT_fnc_modifyServer;
		};
	};

	case "down":
	{
		if (_loadoutPosition != (_numberLoadouts * 2)) then
		{
			_newData = [];


			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{

					if (_i == _loadoutNumber + 1) then
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];

						_newData = _newData + [_dataLoadout select _loadoutPosition];
						_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

					}
					else
					{
						_newData = _newData + [_dataLoadout select _selectNum];
						_newData = _newData + [_dataLoadout select (_selectNum + 1)];
					};
				};


			};

			missionNamespace setVariable ["LT_SERVER_LO", _newData, true];
			[(_loadoutNumber + 1)] call LT_fnc_modifyServer;
		};
	};

	case "top":
	{
		_newData = [];

		_newData = _newData + [_dataLoadout select _loadoutPosition];
		_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

		for "_i" from 0 to _numberLoadouts do
		{
			_selectNum = _i * 2;

			if (_i != _loadoutNumber) then
			{
				_newData = _newData + [_dataLoadout select _selectNum];
				_newData = _newData + [_dataLoadout select (_selectNum + 1)];
			};
		};

		missionNamespace setVariable ["LT_SERVER_LO", _newData, true];
		[0] call LT_fnc_modifyServer;

	};

	case "bottom":
	{
		_newData = [];

		for "_i" from 0 to _numberLoadouts do
		{
			_selectNum = _i * 2;

			if (_i != _loadoutNumber) then
			{
				_newData = _newData + [_dataLoadout select _selectNum];
				_newData = _newData + [_dataLoadout select (_selectNum + 1)];
			};
		};

		_newData = _newData + [_dataLoadout select _loadoutPosition];
		_newData = _newData + [_dataLoadout select (_loadoutPosition + 1)];

		missionNamespace setVariable ["LT_SERVER_LO", _newData, true];
		[_numberLoadouts] call LT_fnc_modifyServer;
	};

	case "delete":
	{

		_loadoutName = missionNamespace getVariable ["LT_SERVER_LO", []] select _loadoutPosition;

		if(!createDialog "LT_prompt") exitWith {hint "LT_prompt ERROR";};

		waitUntil {!isNull (findDisplay 2550)};

		((findDisplay 2550) displayCtrl 2551) ctrlSetStructuredText parseText format["<t align='center'><t size='0.8px'>Are you sure you want to delete the loadout:</t></t><br/><t align='center'><t size='0.7px'>%1</t></t>", _loadoutName];

		((findDisplay 2550) displayCtrl 2552) ctrlSetText "Yes";

		((findDisplay 2550) displayCtrl 2553) ctrlSetText "No";

		waitUntil {!isNil "lt_prompt_choice"};
		if(lt_prompt_choice) then
		{
			_newData = [];

			for "_i" from 0 to _numberLoadouts do
			{
				_selectNum = _i * 2;

				if (_i != _loadoutNumber) then
				{
					_newData = _newData + [_dataLoadout select _selectNum];
					_newData = _newData + [_dataLoadout select (_selectNum + 1)];
				};
			};

			missionNamespace setVariable ["LT_SERVER_LO", _newData, true];
			[0] call LT_fnc_modifyServer;

		};

		lt_prompt_choice = nil;
		_control = ((findDisplay 2520) displayCtrl 2523);
		_control lbSetCurSel -1;

	};

	default
	{
		/* STATEMENT */
	};
};