function F_Player_Step_Stats()
{
	
	// Calculate Final Speed Multiplier
	V_Player_Stat_SpeedMult_Final = (V_Player_Stat_SpeedMult + V_Player_Stat_SpeedMult_Extra)
	
	// Calculate Final Acceleration
	V_Player_Stat_AccelerationMult_Final = (V_Player_Stat_AccelerationMult + V_Player_Stat_AccelerationMult_Extra)
	
	// Calculate Final Friction
	V_Player_Stat_FrictionMult_Final =  (V_Player_Stat_FrictionMult + V_Player_Stat_FrictionMult_Extra)
	
	// Calculate Final Gravity
	V_Player_Stat_GravityMult_Final =  (V_Player_Stat_GravityMult  + V_Player_Stat_GravityMult_Extra)

}