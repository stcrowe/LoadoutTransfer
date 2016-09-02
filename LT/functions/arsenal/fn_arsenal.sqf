params [["_object", objNull]];

if (isNull _object) exitWith {};

if (_object getVariable ["LT_ArsenalAdded", false]) then
{

	_object addAction ["Arsenal", {[] spawn LT_fnc_openArsenal;}];

	_object setVariable ["LT_ArsenalAdded", true];
};
