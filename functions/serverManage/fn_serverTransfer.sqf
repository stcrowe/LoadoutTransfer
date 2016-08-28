if (!isDedicated) exitWith {};

_this spawn
{

	params [

		["_player", objNull],
		["_trasnferData", nil],
		["_transferName", nil]

	];

	if (isNull _player OR isNil "_trasnferData" OR isNil "_transferName") exitWith
	{
		"Serve Save Error - player or loadout is null" remoteExecCall ["systemChat", _player];
	};


	// Mutex lock
	waitUntil { !(missionNamespace getVariable ["LT_MUTEX_LOCK", false])};

	missionNamespace setVariable ["LT_MUTEX_LOCK", true, true];

	_serverLoadouts = profileNamespace getVariable ["bis_fnc_saveInventory_data", nil];


	if (isNil "_serverLoadouts") then
	{

		profileNamespace setVariable ["bis_fnc_saveInventory_data", [_transferName, _trasnferData]];

		"Server Loadout Created & Added" remoteExec ["systemChat", (owner _player)];
	}
	else
	{
		_numberLoadouts = ((count _serverLoadouts ) / 2) - 1;

		_overwrite = -1;

		for "_i" from 0 to _numberLoadouts do
		{
			_selectNum = _i * 2;

			_loadoutName = profileNamespace getVariable "bis_fnc_saveInventory_data" select _selectNum;

			if (_transferName == _loadoutName) then
			{
				_overwrite = _i;
			};

		};

		if (_overwrite != -1) then
		{
			_serverLoadouts set [_overwrite, _transferName];
			_serverLoadouts set [(_overwrite + 1), __trasnferData];

			"Server Loadout Overwritten" remoteExec ["systemChat", (owner _player)];
		}
		else
		{
			_serverLoadouts  append [_transferName];
			_serverLoadouts append [_trasnferData];

			"Server Loadout Added" remoteExec ["systemChat", (owner _player)];
		};

		profileNamespace setVariable ["bis_fnc_saveInventory_data", _serverLoadouts];
		[] spawn
		{
			sleep 1;
			saveProfileNamespace;
			sleep 1;
			[] call LT_fnc_serverInit;
		};
	};

	missionNamespace setVariable ["LT_MUTEX_LOCK", false, true];
	//Lock End

};
