/*
	Author: Sean Crowe

*/


if (hasInterface) then
{

	 waitUntil { !isNull player };
	 player addEventHandler ["RESPAWN", {
        [] spawn
        	{
               	missionNamespace getVariable ["LT_RespawnSettings", []] params
				[
					["_load", [true, false, false], [true, []] ],
					["_transfer", true],
					["_arsenal", true],
					["_manageLoadouts", true],
					["_adminOptions", true]
				];

                waituntil {!isnull player};

                [_load, _transfer, _arsenal, _manageLoadouts, _adminOptions] spawn LT_fnc_mainMenuLoad;
        	};
    }];
};