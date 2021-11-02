function F_Player_Step_Movement()
{
	
	/////////////////////////////////////////////////////
	// Player Input
   /////////////////////////////////////////////////////
	
	// Update Player Direction
	if (V_Player_Input_Move_Hor > 0) V_Player_State_Direction_Facing = 1
	if (V_Player_Input_Move_Hor < 0) V_Player_State_Direction_Facing = 0
	
	
	 /////////////////////////////////////////////////////
	// X Speed
   /////////////////////////////////////////////////////
	
	// Input Movement
	V_Temp_MaxInputSpeed = (global.G_Player_Stat_Speed * V_Player_Stat_SpeedMult_Final)
	V_Temp_MaxInputAcceleration = (global.G_Player_Stat_Mag_Acceleration_Gain * V_Player_Stat_AccelerationMult_Final)
	
	V_Player_Counter_Magnitude_Acceleration += V_Temp_MaxInputAcceleration
	while (V_Player_Counter_Magnitude_Acceleration >= global.G_Engine_Magnitude_Threshold)
	{
		V_Player_Counter_Magnitude_Acceleration -= global.G_Engine_Magnitude_Threshold
		
		if ( V_Player_Velocity_X < V_Temp_MaxInputSpeed and V_Player_Velocity_X > -V_Temp_MaxInputSpeed)
		{
			V_Player_Velocity_X += V_Player_Input_Move_Hor
			if (V_Player_Velocity_X > V_Temp_MaxInputSpeed) V_Player_Velocity_X = V_Temp_MaxInputSpeed
			if (V_Player_Velocity_X < -V_Temp_MaxInputSpeed) V_Player_Velocity_X = -V_Temp_MaxInputSpeed
		}

	}
	
	
	// Friction	
	V_Temp_FrictionGain = (global.G_Player_Stat_Mag_FrictionGain * (V_Player_Stat_FrictionMult_Final))
	
	V_Player_Counter_Magnitude_Friction += V_Temp_FrictionGain
	
	if (V_Player_Velocity_X == 0) V_Player_Counter_Magnitude_Friction = 0
	
	while (V_Player_Counter_Magnitude_Friction >= global.G_Engine_Magnitude_Threshold)
	{
		V_Player_Counter_Magnitude_Friction -= global.G_Engine_Magnitude_Threshold
		
		if (V_Player_Velocity_X > 0)
		{
			V_Player_Velocity_X -= 1
			if(V_Player_Velocity_X < 0) V_Player_Velocity_X = 0
		}
		if (V_Player_Velocity_X < 0)
		{
			V_Player_Velocity_X += 1
			if(V_Player_Velocity_X > 0) V_Player_Velocity_X = 0
		}

	}
	
	// Lose Momentum on changing direction
	if (V_Player_State_Direction_Facing != V_Player_State_Direction_Facing_Previously)
	{
		V_Player_State_Direction_Facing_Previously = V_Player_State_Direction_Facing
		V_Player_Velocity_X = 0
		V_Player_Counter_Magnitude_Friction = 0
		V_Player_Counter_Magnitude_Acceleration = 0
	}
	
	
	/////////////////////////////////////////////////////
	// Y Speed
   /////////////////////////////////////////////////////	
	
	// Gravity	
	if (V_Player_State_Grounded == 0)
	{
		V_Temp_GravityGain = (global.G_Player_Stat_Mag_GravityGain * (V_Player_Stat_GravityMult_Final))
	
		V_Player_Counter_Magnitude_Gravity += V_Temp_GravityGain
		while (V_Player_Counter_Magnitude_Gravity >= global.G_Engine_Magnitude_Threshold)
		{
			V_Player_Counter_Magnitude_Gravity -= global.G_Engine_Magnitude_Threshold
		
			if (V_Player_Velocity_Y < global.G_Engine_Gravity_Max and V_Player_State_Grounded == 0)  V_Player_Velocity_Y+= 1
			if (V_Player_Velocity_Y > global.G_Engine_Gravity_Max) G_Engine_Gravity_Max = global.G_Engine_Gravity_Max

		}	
	}
	else
	{
		V_Player_Counter_Magnitude_Gravity = 0
	}
	
	// Jump
	if (V_Player_Input_Jump) 
	{
		
		if(V_Player_State_Grounded == 1)
		{
			V_Player_State_Grounded = 0
			V_Player_Velocity_Y = -12
		}
		else
		{
			if(V_Player_Counter_DoubleJumpCount < V_Player_Stat_DoubleJumpAmount)
			{
				V_Player_State_Grounded = 0
				V_Player_Velocity_Y = -12
				V_Player_Counter_DoubleJumpCount += 1
			}
			
		}
		
		
		
		
		
	}
	
	
	/////////////////////////////////////////////////////
	// X Collision Checks
	/////////////////////////////////////////////////////
	
	V_TempCanMoveX	= 1
   
	// X Collisions (Sort through a list of all obstacles touching the player
	V_CollisionList_X = ds_list_create();
	V_CollisionList_X_Size = instance_place_list(x+V_Player_Velocity_X, y, OB_World,V_CollisionList_X,false);
		
	if(V_CollisionList_X_Size > 0)
	{
		for (i = 0; i < V_CollisionList_X_Size; i++;)
		{ 
			if(V_CollisionList_X[| i].V_World_Is_Standable == 1)
			{
				while(!place_meeting(x + sign(V_Player_Velocity_X), y, V_CollisionList_X[| i]))
				{
					x += sign(V_Player_Velocity_X);
				}
				V_TempCanMoveX	= 0
			}
		}
	}
		
	// Execute X movement
	if(V_TempCanMoveX) x += V_Player_Velocity_X
	
	
	/////////////////////////////////////////////////////
	// Y Collision Checks
	/////////////////////////////////////////////////////
	   
		V_TempCanMoveY	= 1
			
		// Y Collisions (Sort through a list of all obstacles touching the player)
		V_CollisionList_Y = ds_list_create();
		V_CollisionList_Y_Size = instance_place_list(x, y+V_Player_Velocity_Y, OB_World,V_CollisionList_Y,false);
	
		
		if(V_CollisionList_Y_Size > 0)
		{
			for (i = 0; i < V_CollisionList_Y_Size; i++;)
			{ 
				if(V_CollisionList_Y[| i].V_World_Is_Standable == 1)
				{
					while(!place_meeting(x , y+ sign(V_Player_Velocity_Y), V_CollisionList_Y[| i]))
					{
						y += sign(V_Player_Velocity_Y);
					}
					V_TempCanMoveY	= 0
					if (V_CollisionList_Y[| i].y > y) 
					{
						V_Player_State_Grounded = 1
						V_Player_Counter_DoubleJumpCount = 0
					}
					// Remove Upwards force if you hit your head
					else
					{
						V_Player_State_HitHeadOnRoof = 1
					}
					
					
				}
			}
		}
		else
		{
			V_Player_State_Grounded = 0
		}
		
		// Remove Head Hit Force
		if (V_Player_State_HitHeadOnRoof == 1)
		{
			V_Player_State_HitHeadOnRoof = 0
			V_Player_Velocity_Y = 0
		}
		
		// Execute y movement
		if(V_TempCanMoveY) 
		{
			y += V_Player_Velocity_Y
		}
		
}
