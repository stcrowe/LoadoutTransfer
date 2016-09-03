params [["_unit", objNull], ["_whitebox", objNull]];

if (isNull _unit) exitWith {};

waitUntil {alive _unit};

if (typeName _whitebox == "STRING") then
{

	_overRide = toLower _whitebox;

	if (_whitebox == "blacklist") then
	{
		_unit setVariable ["LT_GB_Override", true];
	};

	if (_whitebox == "whitelist") then
	{
		_unit setVariable ["LT_GW_Override", true];
	};

	if (_whitebox == "both") then
	{
		_unit setVariable ["LT_GB_Override", true];
		_unit setVariable ["LT_GW_Override", true];
	};
}
else
{
	if (!(isNull _whitebox)) then
	{
		_unit setVariable ["LT_WhiteList", _whitebox];
	};
};



[_unit, [missionNamespace, ("#LT_" + (name _unit))] ] call BIS_fnc_saveInventory;


_unit addEventHandler ["respawn", {
	_unit = _this select 0;

	waitUntil {alive _unit};
	[_unit, [missionNamespace, ("#LT_" + (name _unit))] ] call BIS_fnc_loadInventory;

}];

