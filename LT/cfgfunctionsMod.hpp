class LT
{
	tag = "LT";

	class admin
	{
		file = "loadoutTransfer\LT\functions\admin";

		class checkPlayerMenu {};
		class trasferCheckPlayerLO {};
	};

	class arsenal
	{
		file = "loadoutTransfer\LT\functions\arsenal";

		class openArsenal {};
		class arsenal {};
	};

	class general
	{
		file = "loadoutTransfer\LT\functions\general";

		class StrToBool {};
	};

	class kron
	{
		file = "loadoutTransfer\LT\functions\kron";

		class KRON_StrToArray {};
		class KRON_StrRight {};
		class KRON_StrLen {};
		class KRON_StrLeft {};
		class KRON_StrIndex {};
		class KRON_StrReplace {};
	};

	class limit
	{
		file = "loadoutTransfer\LT\functions\limit";

		class addInvWhitelist {};
		class addInvGlobalBlacklist {};
		class addInvGlobalWhitelist {};
		class lockLoadout {};
		class limitCurrentGear {};


	};

	class load
	{
		file = "loadoutTransfer\LT\functions\load";

		class loadoutMenu {};
		class loadLoadout {};
	};

	class manage
	{
		file = "loadoutTransfer\LT\functions\manage";

		class manageLoadouts {};
		class loadoutChange {};
		class loadoutModify {};
		class changeName {};
		class saveLoChange {};
		class modifyLoad {};

	};

	class mission
	{
		file = "loadoutTransfer\LT\functions\mission";

		class loadMissionLoadout {};
		class loadoutMenuMission {};
		class registerMissionLoadout {};
		class unregisterMissionLoadout {};
	};

	class module
	{
		file = "loadoutTransfer\LT\functions\module";

		class createActions {postInit = 1;};
	};

	class menu
	{
		file ="loadoutTransfer\LT\functions\menu";

		class addAction {};
		class mainMenuLoad {};
		class loadTypeMenu {};
		class LTaction {};
		class LTmenu {};
	};

	class respawn
	{
		file = "loadoutTransfer\LT\functions\respawn";

		class respawnSetup {};
	};

	class save
	{
		file = "loadoutTransfer\LT\functions\save";

		class saveLoad {};
		class saveGear {};
	};

	class server
	{
		file = "loadoutTransfer\LT\functions\server";

		class loadoutMenuServer {};
		class loadServerLoadout {};
		class serverInit {preInit = 1;};
	};

	class serverManage
	{
		file = "loadoutTransfer\LT\functions\serverManage";

		class changeServerName {};
		class manageServerLoadouts {};
		class modifyServer {};
		class serverLOChange {};
		class serverModify {};
		class serverTransfer {};
		class serverUpdate {};
	};

	class transfer
	{
		file = "loadoutTransfer\LT\functions\transfer";

		class transferMenu {};
		class transferAction {};
		class transferNetwork {};
		class transferLoadout {};
	};


};
