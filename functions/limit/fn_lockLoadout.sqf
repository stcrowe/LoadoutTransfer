params [["_unit", objNull], ["_whitebox", objNull], ["_overRide", nil]];

if (isNull _unit) exitWith {};

waitUntil {alive _unit};

if (typeName _whitebox == "STRING") then
{

	_overRide = _whitebox;
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

