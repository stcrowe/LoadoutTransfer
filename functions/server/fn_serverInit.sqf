if (isServer) then
{
	if (isDedicated) then
	{

		// Get loadouts on server
		_data = profileNamespace getVariable ["bis_fnc_saveInventory_data", []];

		missionNamespace setVariable ["LT_SERVER_LO", _data, true];
	}
	else
	{
		missionNamespace setVariable ["LT_SERVER_LO", [], true];
	};
}
else
{

};