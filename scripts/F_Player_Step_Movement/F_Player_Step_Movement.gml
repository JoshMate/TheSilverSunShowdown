function F_Player_Step_Movement()
{
	
	// Horizontal 
	// Movement
	if (V_Player_Input_Move_Hor != 0) {V_Player_Counter_Speed += V_Player_Stat_Speed_Final}
	
	while (V_Player_Counter_Speed >= global.G_Engine_Magnitude_Threshold)
	{
		
		V_Player_Counter_Speed -= global.G_Engine_Magnitude_Threshold
		
		V_Player_Counter_SpeedX = (V_Player_Input_Move_Hor)

		if (place_meeting(x + V_Player_Counter_SpeedX, y, OB_World))
		{
			while(!place_meeting(x + sign(V_Player_Counter_SpeedX), y, OB_World))
			{
				x += sign(V_Player_Counter_SpeedX);
			}
			V_Player_Counter_SpeedX = 0;
		}

		x += V_Player_Counter_SpeedX;
		
	}
	
	
	// Vertical
	
	// Gravity
	V_Player_Counter_SpeedY = V_Player_Stat_Gravity_Final
	
	// Jump
	if (V_Player_Input_Jump and V_Player_State_Grounded == 1) 
	{
		V_Player_State_Grounded = 0
		V_Player_Counter_SpeedY = 0
		V_Player_Counter_SpeedY -= V_Player_Stat_JumpHeight_Final
	}
	
	
	if (place_meeting(x , y + V_Player_Counter_SpeedY, OB_World))
	{
		//Only Reset Jump on landing, not heading
		if(V_Player_Counter_SpeedY == 0) 
		{
			V_Player_State_Grounded = 1;
		}
	
		while(!place_meeting(x , y + sign(V_Player_Counter_SpeedY), OB_World))
		{
			y += sign(V_Player_Counter_SpeedY);
		}
	
		V_Player_Counter_SpeedY = 0;
	}

	y += V_Player_Counter_SpeedY;
	
	
	
	
	
	
}