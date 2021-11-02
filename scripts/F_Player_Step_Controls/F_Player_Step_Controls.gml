function F_Player_Step_Controls()
{
	
	if (V_Player_Info_UsingKeyboard == true)
	{
		
	}
	else
	{
		
		V_Player_Input_Move_Hor					= gamepad_axis_value(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Move_Hor)
		V_Player_Input_Move_Ver						= gamepad_axis_value(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Move_Ver)
		
		V_Player_Input_Jump							= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Jump)
		V_Player_Input_Block							= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Block)
		
		V_Player_Input_LightAttack					= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_LightAttack)
		V_Player_Input_HeavyAttack					= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_HeavyAttack)
		V_Player_Input_RangedAttack				= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_RangedAttack)
		
		V_Player_Input_SpecialAttack_Meele		= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_SpecialAttack_Meele)
		V_Player_Input_SpecialAttack_Ranged	= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_SpecialAttack_Ranged)
		V_Player_Input_SpecialAttack_Utility		= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_SpecialAttack_Utility)
		
		V_Player_Input_Menu_Start					= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Menu_Start)
		V_Player_Input_Menu_Select					= gamepad_button_check_pressed(V_Player_Info_PlayerIndex, global.G_Controls_Controller_Bind_Menu_Select)
		
		
		// Resolve Joystick Directions
		// Horizontal
		if 
		(
			V_Player_Input_Move_Hor		> -global.G_Controls_Controller_Config_Deadzone
			and
			V_Player_Input_Move_Hor		<  global.G_Controls_Controller_Config_Deadzone
		) 
		{
			V_Player_Input_Move_Hor = 0
		}
		// Verticle
		if 
		(
			V_Player_Input_Move_Ver		> -global.G_Controls_Controller_Config_Deadzone
			and
			V_Player_Input_Move_Ver		<  global.G_Controls_Controller_Config_Deadzone
		) 
		{
			V_Player_Input_Move_Ver = 0
		}
		

		

		
		
	}
	

}