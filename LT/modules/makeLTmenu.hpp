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
	isGlobal = 1;
	is3DEN = 0;

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

			class respawn_infor
			{
			    displayName = "";
			    class values
			    {
			            class divider
			            {
			                    name = "----- Options Ror Resawn Menu ------------------------------------------------";
			                    value = "";
			            };
			    };
			};

      	class loadPersonal
		{
			displayName = "Allow Loading Personal";
			description = "Menu will allow the player to load their personal loadouts.";

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

		class loadMission
		{
			displayName = "Allow Loading Mission";
			description = "Menu will allow the player to load mission loadouts (if any are defined).";

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

		class loadServer
		{
			displayName = "Allow Loading Server";
			description = "Menu will allow the player to load server loadouts (if any are defined).";

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
			displayName = "Allow Admin Options";
			description = "Menu will allow the server admin to access the admin menu.";

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
	isGlobal = 1;
	is3DEN = 0;

	class Eventhandlers
	{
		init = "";
	};

	class Arguments
	{

		class loadPersonal
		{
			displayName = "Allow Loading Personal";
			description = "Menu will allow the player to load their personal loadouts.";

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

		class loadMission
		{
			displayName = "Allow Loading Mission";
			description = "Menu will allow the player to load mission loadouts (if any are defined).";

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

		class loadServer
		{
			displayName = "Allow Loading Server";
			description = "Menu will allow the player to load server loadouts (if any are defined).";

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
		description = "Adds a Loadout Transfer menu to synced objects.";
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
