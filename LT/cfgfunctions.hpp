class LT
{
	tag = "LT";

	class admin
	{
		file = "LT\functions\admin";

		class checkPlayerMenu {};
		class trasferCheckPlayerLO {};
	};

	class arsenal
	{
		file = "LT\functions\arsenal";

		class openArsenal {};
	};

	class kron
	{
		file = "LT\functions\kron";

		class KRON_StrToArray {};
		class KRON_StrRight {};
		class KRON_StrLen {};
		class KRON_StrLeft {};
		class KRON_StrIndex {};
		class KRON_StrReplace {};
	};

	class limit
	{
		file = "LT\functions\limit";

		class addInvWhitelist {};
		class addInvGlobalBlacklist {};
		class getAll {};
		class limitCurrentGear {};

	};

	class load
	{
		file = "LT\functions\load";

		class loadoutMenu {};
		class loadLoadout {};
		class loadTypeMenu {};
	};

	class manage
	{
		file = "LT\functions\manage";

		class manageLoadouts {};
		class loadoutChange {};
		class loadoutModify {};
		class changeName {};
		class saveLoChange {};
		class modifyLoad {};

	};

	class mission
	{
		file = "LT\functions\mission";

		class loadMissionLoadout {};
		class loadoutMenuMission {};
		class registerMissionLoadout {};
		class unregisterMissionLoadout {};
	};

	class module
	{
		file = "LT\functions\module";

		class createActions {postInit = 1;};
	};

	class menu
	{
		file ="LT\functions\menu";

		class addAction {};
		class mainMenuLoad {};
		class LTaction {};
		class LTmenu {};
	};

	class respawn
	{
		file = "LT\functions\respawn";

		class respawnSetup {};
	};

	class save
	{
		file = "LT\functions\save";

		class saveLoad {};
		class saveGear {};
	};

	class server
	{
		file = "LT\functions\server";

		class loadoutMenuServer {};
		class loadServerLoadout {};
		class serverInit {preInit = 1;};
	};

	class serverManage
	{
		file = "LT\functions\serverManage";

		class serverDelete {};
		class serverModify {};
		class serverTransfer {};
	};

	class transfer
	{
		file = "LT\functions\transfer";

		class transferMenu {};
		class transferAction {};
		class transferNetwork {};
		class transferLoadout {};
	};


};
