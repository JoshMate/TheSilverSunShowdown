// This is the global Config that init's all other config in the game
function F_Config()
{
	
	// Run the Engine Config
	F_Config_Engine()
	
	// Run the Audio Config
	F_Config_Audio()

	// Run the Interface Config
	F_Config_Graphics()

	// Run the World Config
	F_Config_World()
	
	// Run the Player Config
	F_Config_Player()
	
	// Run the Controls Config
	F_Config_Controls()
	

}