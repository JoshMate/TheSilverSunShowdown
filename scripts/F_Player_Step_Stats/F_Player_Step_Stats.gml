function F_Player_Step_Stats()
{
	
	// Calculate Final Speed
	V_Player_Stat_Speed_Final = (V_Player_Stat_Speed + V_Player_Stat_Speed_Extra)
	
	// Calculate Final Jump Height
	V_Player_Stat_JumpHeight_Final = (V_Player_Stat_JumpHeight + V_Player_Stat_JumpHeight_Extra)
	
	// Calculate Final Gravity
	V_Player_Stat_Gravity_Final = (global.G_Engine_Gravity_Amount *( V_Player_Stat_GravityMult + V_Player_Stat_GravityMult_Extra))

}