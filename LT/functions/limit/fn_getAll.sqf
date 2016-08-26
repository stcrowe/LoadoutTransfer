// Take from preload from bis_fnc_arsenal

_outputCargo = [[],[],[],[]];

_configArray = ("isclass _x" configClasses (configFile >> "cfgvehicles"));

_configArray = (
	("isclass _x" configclasses (configfile >> "cfgweapons")) +
	("isclass _x" configclasses (configfile >> "cfgvehicles")) +
	("isclass _x" configclasses (configfile >> "cfgglasses"))
);


_itemType =["Uniform","Vest", "Headgear", "Glasses", "NVGoggles", "Binocular","LaserDesignator", "Map","GPS","UAVTerminal","Radio", "Compass", "Watch","Medikit","MineDetector","Toolkit", "FirstAidKit", "AccessoryMuzzle", "AccessoryPointer", "AccessorySights"];

_weaponType = ["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun","Launcher","MissileLauncher","RocketLauncher","Handgun"];

_backpackType = ["Backpack"];


{
	_class = _x;
	_className = configName _x;
	_scope = if (isnumber (_class >> "scopeArsenal")) then {getnumber (_class >> "scopeArsenal")} else {getnumber (_class >> "scope")};
	_isBase = if (isarray (_x >> "muzzles")) then {(_className call bis_fnc_baseWeapon == _className)} else {true};
	if (_scope == 2 && {gettext (_class >> "model") != ""} && _isBase) then {

		_itemClassType = (_className call bis_fnc_itemType);
		_itemTypeCategory = _itemClassType  select 0;
		if (_itemTypeCategory != "VehicleWeapon") then {
			private ["_weaponTypeSpecific","_weaponTypeID"];
			_itemTypeSpecific = _itemClassType select 1;

			if (_itemTypeSpecific in _itemType) then
			{
				(_outputCargo select 0) append [_className];
			};

			if (_itemTypeSpecific in _weaponType) then
			{
				(_outputCargo select 1) append [_className];
			};

			if (_itemTypeSpecific in _backpackType) then
			{
				(_outputCargo select 3) append [_className];
			};

		};

	};
} forEach _configArray;


{
	private ["_weapons","_magazines"];
	_weapon = _x;
	_magazines = [];
	{
		{
			private ["_mag"];
			_mag = _x;
			if ({_x == _mag} count _magazines == 0) then {
				private ["_cfgMag"];
				_magazines set [count _magazines,_mag];
				_cfgMag = configfile >> "cfgmagazines" >> _mag;
				if (getnumber (_cfgMag >> "scope") == 2 || getnumber (_cfgMag >> "scopeArsenal") == 2) then {
					private ["_items"];
					(_outputCargo select 2) append [configName _cfgMag];
				};
			};
		} foreach getarray (_x >> "magazines");
	} foreach ("isclass _x" configclasses (configfile >> "cfgweapons" >> _weapon));
} foreach ["throw", "put"];


/*//--- Insignia
				{
					private ["_items"];
					_scope = if (isnumber (_x >> "scope")) then {getnumber (_x >> "scope")} else {2};
					if (_scope == 2) then {
						_items = _data select IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA;
						_items set [count _items,configname _x];
					};
				} foreach ("isclass _x" configclasses (configfile >> "cfgunitinsignia"));*/

_outputCargo


