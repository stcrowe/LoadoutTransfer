if (!isDedicated) exitWith {};

_this spawn
{
	params ["_player"];

	// Mutex lock
	waitUntil { !(missionNamespace getVariable ["LT_MUTEX_LOCK", false])};

	missionNamespace setVariable ["LT_MUTEX_LOCK", true, true];

	_data = missionNamespace getVariable ["LT_SERVER_LO", []];


	if ((count _data) > 0) then
	{
		profileNamespace setVariable ["bis_fnc_saveInventory_data", _data];

		[] spawn
		{
			sleep 1;
			saveProfileNamespace;
			"Server Loadouts Updated" remoteExec ["systemChat", (owner _player)];
			sleep 1;
			[] call LT_fnc_serverInit;
		};
	};

	missionNamespace setVariable ["LT_MUTEX_LOCK", false, true];

};