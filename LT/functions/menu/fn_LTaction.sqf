/*
	Author: Sean Crowe

*/

_obj = _this select 0;

if (count _this == 1) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [] spawn LT_fnc_LTmenu;}, [], 0, false];

};

if (count _this == 2) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0] spawn LT_fnc_LTmenu;}, [_this select 1], 0, false];

};

if (count _this == 3) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0, _this select 3 select 1] spawn LT_fnc_LTmenu;}, [_this select 1, _this select 2], 0, false];
};

if (count _this == 4) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0, _this select 3 select 1, _this select 3 select 2] spawn LT_fnc_LTmenu;}, [_this select 1, _this select 2, _this select 3], 0, false];
};

if (count _this == 5) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3] spawn LT_fnc_LTmenu;}, [_this select 1, _this select 2, _this select 3, _this select 4], 0, false];
};

if (count _this == 6) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4] spawn LT_fnc_LTmenu;}, [_this select 1, _this select 2, _this select 3, _this select 4, _this select 5], 0, false];
};

if (count _this == 7) then
{
    _obj addAction ["<t color='#9B00C1'>Loadout Transfer</t>", { [_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4, _this select 3 select 5] spawn LT_fnc_LTmenu;}, [_this select 1, _this select 2, _this select 3, _this select 4, _this select 5, _this select 6], 0, false];
};
