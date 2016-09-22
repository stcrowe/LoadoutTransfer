_this spawn
{
	params ["_unit", "_name", ["_limit", -1]];

	// Mutex lock
	waitUntil { !(missionNamespace getVariable ["LT_MUTEX_LOCK", false])};

	missionNamespace setVariable ["LT_MUTEX_LOCK", true, true];

	if (count (missionNamespace getVariable [("#LT_MISLO" +  _name), []]) == 0) then
	{

		[_unit, [missionNamespace, ("#LT_MISLO" + _name)] ] call BIS_fnc_saveInventory;

		_loadoutData = missionNamespace getVariable ["bis_fnc_saveInventory_data", []];

		missionNamespace setVariable ["bis_fnc_saveInventory_data", _loadoutData, true];

		missionNamespace setVariable [("#LT_MISLO" +  _name), [_limit, _limit], true];
	};

	missionNamespace setVariable ["LT_MUTEX_LOCK", false, true];

	deleteVehicle _unit;

};