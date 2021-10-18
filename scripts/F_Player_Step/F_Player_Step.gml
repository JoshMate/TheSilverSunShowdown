function F_Player_Step()
{
	
	
	// Reads what buttons this player is pressing in the given frame
	F_Player_Step_Controls()
	
	// Debug Escape
	if (keyboard_check_pressed(vk_escape)) 
	{
		game_end()
	}
	
	// Handle Steps
	F_Player_Step_Stats()
	
	// Handle Movement
	F_Player_Step_Movement()

}