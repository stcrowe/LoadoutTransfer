params
[
	["_unit", player]
];

private ["_whiteListBox", "_globalWhiteListBox", "_globalWhiteListBox", "_virtualBox"];

_whiteListBox = _unit getVariable ["LT_WhiteList", objNull];
_gb_override = _unit getVariable ["LT_GB_Override", false];
_gw_override = _unit getVariable ["LT_GW_Override", false];

_globalBlackListBox = missionNamespace getVariable ["LT_GlobalBlackList", objNull];
_globalWhiteListBox = missionNamespace getVariable ["LT_GlobalWhiteList", objNull];

_virtualBox = objNull;

if (isNull _whiteListBox) then
{
	if (isNull _globalWhiteListBox OR _gw_override) then
	{
		if (!(isNull _globalBlackListBox) AND !(_gb_override)) then
		{
			_virtualBox = _globalBlackListBox;
		};

	}
	else
	{
		_virtualBox = _globalWhiteListBox;
	};
}
else
{
	_virtualBox = _whiteListBox;
};

//hint format ["%1", _mode];

if (!(isNull _virtualBox)) then
{
	// Get items from the virtualBox
	_items = _virtualBox call BIS_fnc_getVirtualItemCargo;
	_weapons = _virtualBox call BIS_fnc_getVirtualWeaponCargo;
	_magazines = _virtualBox call BIS_fnc_getVirtualMagazineCargo;
	_backpacks = _virtualBox call BIS_fnc_getVirtualBackpackCargo;


	// Get unit's items
	_backItems = backpackItems _unit;
	_uniItems = uniformItems _unit;
	_vestItems = vestItems _unit;

	_primary = primaryWeapon _unit;
	_secondary = secondaryWeapon _unit;
	_handgun = handgunWeapon _unit;

	_primaryBase = [_primary] call BIS_fnc_baseWeapon;
	_secondaryBase = [_secondary] call BIS_fnc_baseWeapon;
	_handgunBase = [_handgun] call BIS_fnc_baseWeapon;


	_message = false;

	if (!(_primaryBase in _weapons)) then
	{
	 	_unit removeWeaponGlobal _primary;
	 	_message = true
	}
	else
	{
		_primaryItems = primaryWeaponItems _unit;

		{
			if (!(_x in _items)) then
			{
				_unit removePrimaryWeaponItem _x;
				_message = true
			};
		}
		forEach _primaryItems;
	};

	if (!(_secondaryBase in _weapons)) then
	{
		_unit removeWeaponGlobal _secondary;
		_message = true
	}
	else
	{
		_secondaryItems = secondaryWeaponItems _unit;

		{
			if (!(_x in _items)) then
			{
				_unit removeSecondaryWeaponItem _x;
				_message = true
			};
		}
		forEach _secondaryItems;
	};

	if (!(_handgunBase in _weapons)) then
	{
		_unit removeWeaponGlobal _handgun;
		_message = true


	}
	else
	{
		_handgunItems = handgunItems _unit;

		{
			if (!(_x in _items)) then
			{
				_unit removeHandgunItem _x;
				_message = true
			};
		}
		forEach _handgunItems;
	};



	{
		if (!(_x in _items) OR  !(_x in _weapons) OR !(_x in _magazines) OR !(_x in _backpacks)) then
		{
			_unit removeItemFromBackpack _x;
			_message = true
		};
	} forEach _backItems;

	{
		if (!(_x in _items) OR  !(_x in _weapons) OR !(_x in _magazines) OR !(_x in _backpacks)) then
		{
			_unit removeItemFromBackpack _x;
			_message = true
		};
	} forEach _uniItems;

	{
		if (!(_x in _items) OR  !(_x in _weapons) OR !(_x in _magazines) OR !(_x in _backpacks)) then
		{
			_unit removeItemFromBackpack _x;
			_message = true
		};
	} forEach _vestItems;

	if (!((vest _unit) in _items)) then
	{
		removeVest _unit;
		_message = true
	};

	if (!((uniform _unit) in _items)) then
	{
		removeUniform _unit;
		_message = true
	};

	if (!((backpack _unit) in _backpacks)) then
	{
		removeBackpack _unit;
		_message = true
	};

	if (!((headgear _unit) in _items)) then
	{
		removeHeadgear _unit;
		_message = true
	};

	if (!((goggles _unit) in _items)) then
	{
		removeGoggles _unit;
		_message = true
	};

	{
		if (!(_x in _items)) then
		{
			_unit removeItem _x;
			_message = true
		};
	} forEach (assignedItems _unit);


	if (_message) then
	{
		systemChat "Note: Ttem(s) removed due to whitelist or blacklist.";
	};
};