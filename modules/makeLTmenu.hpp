class Logic;
class Module_F: Logic
{
	class ArgumentsBaseUnits
	{
		class Units;
	};
	class ModuleDescription
	{
		class AnyBrain;
	};
};

class LT_settings: Module_F
{
	author = "Sean Crowe";
	scope = 2;
	icon = "\loadoutTransfer\LT\images\LT.paa";
	displayName = "Loadout Transfer Settings";

	class Eventhandlers
	{
		init = "";
	};

	class Arguments
	{
	      class transferDistance
	      {
	        	displayName = "Transfer Distance";
	  			description = "How far (in meters) do two player need to be to show up in the transfer menu?";
	  			typeName = "NUMBER";
				defaultValue = 20;
	      };

	      class loadRespawn
	      {
	        displayName = "Show Loadout Menu At Respawn";
	  			description = "If enabled, then after a player respawns they can choose a loadout to load.";
	  			typeName = "BOOL";

	  			class values
	  			{
	  				class disable
	  				{
	  					name = "Disable";
	  					value = false;
	  					default = 1;
	  				};

	  				class enable
	  				{
	  					name = "Enable";
	  					value = true;
	  				};
	  			};
	      };

      	class load
		{
			displayName = "Allow Loading";
			description = "Menu will allow the player to load their personal loadouts.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

      class transfer
      {
        displayName = "Allow Transfer";
  			description = "Menu will allow the player to transfer their personal loadouts to other players.";
  			typeName = "BOOL";

  			class values
  			{
  				class disable
  				{
  					name = "Disable";
  					value = false;
  				};

  				class enable
  				{
  					name = "Enable";
  					value = true;
  					default = 1;
  				};
  			};
      };


		class arsenal
		{
			displayName = "Allow Arsenal";
			description = "Menu will allow players to access to the arsenal.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class manage
		{
			displayName = "Allow Manage Loadouts";
			description = "Menu will allow players to mangae their personal loadouts (also gives them access to arsenal).";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class server
		{
			displayName = "Allow Server Loadouts";
			description = "Menu will allow players to load loadouts saved to the server.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class admin
		{
			displayName = "Allow Admin Menu";
			description = "Menu will allow the server admin to access the admin menu.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};
    };

    class ModuleDescription: ModuleDescription
	{
		description = "Modify transfer settings";
	};
};

class LT_makeLTmenu: Module_F
{
	author = "Sean Crowe";
	scope = 2;
	icon = "\loadoutTransfer\LT\images\LT.paa";
	displayName = "Loadout Transfer Menu";

	class Eventhandlers
	{
		init = "";
	};

	class Arguments
	{

		class load
		{
			displayName = "Allow Loading";
			description = "Menu will allow the player to load their personal loadouts.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

      class transfer
      {
        displayName = "Allow Transfer";
  			description = "Menu will allow the player to transfer their personal loadouts to other players.";
  			typeName = "BOOL";

  			class values
  			{
  				class disable
  				{
  					name = "Disable";
  					value = false;
  				};

  				class enable
  				{
  					name = "Enable";
  					value = true;
  					default = 1;
  				};
  			};
      };


		class arsenal
		{
			displayName = "Allow Arsenal";
			description = "Menu will allow players to access to the arsenal.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class manage
		{
			displayName = "Allow Manage Loadouts";
			description = "Menu will allow players to mangae their personal loadouts (also gives them access to arsenal).";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class server
		{
			displayName = "Allow Server Loadouts";
			description = "Menu will allow players to load loadouts saved to the server.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

		class admin
		{
			displayName = "Allow Admin Menu";
			description = "Menu will allow the server admin to access the admin menu.";
			typeName = "BOOL";

			class values
			{
				class disable
				{
					name = "Disable";
					value = false;
				};

				class enable
				{
					name = "Enable";
					value = true;
					default = 1;
				};
			};
		};

	};
	class ModuleDescription: ModuleDescription
	{
		description = "Set player(s) as commanders, giving them the ability to control groups of AI";
		sync[] = {"Anything"};

		class Anything
		{
			description = "Any object";
			displayName = "Any object";
			position = 1;
			direction = 1;
			optional = 1;
			duplicate = 1;
		};
	};
};
