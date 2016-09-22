////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 5.24
//Produced on Sun Oct 11 01:09:09 2015 : Created on Sun Oct 11 01:09:09 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#include "LT\LTmenuMod.hpp"
//#include "Cfg3DEN.hpp" - commented out till I can get it working

class CfgPatches
{
	class lt_transfer
	{
		name = "Loadout Transfer";
		author = "Sean Crowe";
		url = "https://forums.bistudio.com/topic/184651-loadout-transfer/";
		requiredVersion = 1.60;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	#include "LT\cfgfunctionsMod.hpp"
};

class CfgVehicles
{
	#include "LT\modules\makeLTmenu.hpp"
};
