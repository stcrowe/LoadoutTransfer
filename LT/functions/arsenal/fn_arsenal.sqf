params [["_object", objNull]];

if (isNull _object) exitWith {};

if (!(_object getVariable ["LT_ArsenalAdded", false])) then
{

	_object addAction ["Arsenal", {[] spawn LT_fnc_openArsenal;}, nil, 1.5, true, true, "", "_target distance _this < 5"];

	_object setVariable ["LT_ArsenalAdded", true];
};
