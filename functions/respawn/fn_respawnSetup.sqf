if (hasInterface) then
{

	 waitUntil { !isNull player };
	 player addEventHandler ["RESPAWN", {
        [] spawn
        	{
               	private["_load","_transfer", "_arsenal", "_loadServer", "_modPosition"];



				_load = true;
				_transfer = true;
				_arsenal = true;
				_manageLoadouts = true;
				_loadServer = false;
				_adminOptions = true;

				if (count _this > 0) then
				{
					_load = _this select 0;
				};

				if (count _this > 1) then
				{
					_transfer = _this select 1;
				};

				if (count _this > 2) then
				{
					_arsenal = _this select 2;
				};

				if (count _this > 3) then
				{
					_manageLoadouts = _this select 3;
				};

				if (count _this > 4) then
				{
					if (isMultiplayer) then {_loadServer = _this select 4} else {_loadServer = false};
				};
				if (count _this > 5) then
				{
					_adminOptions = _this select 5;
				};


                waituntil {!isnull player};

                [_load, _transfer, _arsenal, _manageLoadouts, _loadServer, _adminOptions] spawn LT_fnc_LTmenu;
        	};
    }];
};