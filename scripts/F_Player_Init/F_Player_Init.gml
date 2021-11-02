function F_Player_Init()
{
	// Tempt / Testing Data
	V_Player_Info_PlayerIndex													= 0
	V_Player_Info_UsingKeyboard												= false
	
	
	
	// Basic Info
	V_Player_Info_Name															= "Player"
	V_Player_Info_Description													= "A player controlled character"
	
	
	// Graphics
	V_Player_Art_Sprite																= SP_NULL
	
	
	// Sound
	V_Player_Sound_On_Jump													= SD_NULL
	V_Player_Sound_On_Hit														= SD_NULL
	V_Player_Sound_On_Death													= SD_NULL
	
	
	// Moveset
	V_Player_Ability_Jump															= F_NULL
	V_Player_Ability_Block															= F_NULL
	
	V_Player_Ability_Light															= F_NULL
	V_Player_Ability_Heavy														= F_NULL
	V_Player_Ability_Ranged														= F_NULL
	
	V_Player_Ability_DoubleJump												= F_NULL
	V_Player_Ability_GroundPound												= F_NULL
	
	V_Player_Ability_Special_Melee												= F_NULL
	V_Player_Ability_Special_Ranged											= F_NULL
	V_Player_Ability_Special_Utility												= F_NULL
	
	
	
	// Stats
	V_Player_Stat_HP_Max															= global.G_Player_Stat_HP_Max
	V_Player_Stat_HP_Max_Extra												= 0
	
	V_Player_Stat_HP_Current													= V_Player_Stat_HP_Max
	V_Player_Stat_HP_Current_Extra											= 0
	
	V_Player_Stat_SP_Max															= global.G_Player_Stat_SP_Max
	V_Player_Stat_SP_Max_Extra												= 0
	
	V_Player_Stat_SP_Current													= V_Player_Stat_SP_Max
	V_Player_Stat_SP_Current_Extra											= 0
	
	V_Player_Stat_AccelerationMult												= 1.0
	V_Player_Stat_AccelerationMult_Extra										= 0
	
	V_Player_Stat_SpeedMult														= 1.0
	V_Player_Stat_SpeedMult_Extra												= 0
	
	V_Player_Stat_DoubleJumpAmount											= 3
	V_Player_Stat_DoubleJumpAmount_Extra								= 0
	

	V_Player_Stat_JumpHeight													= global.G_Player_Stat_JumpHeight
	V_Player_Stat_JumpHeight_Extra											= 0
	
	V_Player_Stat_GravityMult													= global.G_Player_Stat_GravityMult
	V_Player_Stat_GravityMult_Extra											= 0
	
	V_Player_Stat_FrictionMult													= global.G_Player_Stat_FrictionMult
	V_Player_Stat_FrictionMult_Extra											= 0
	
	V_Player_Stat_DamageMult_Melee											= global.G_Player_Stat_DamageMult_Melee
	V_Player_Stat_DamageMult_Melee_Extra									= 0
	
	V_Player_Stat_DamageMult_Range											= global.G_Player_Stat_DamageMult_Range
	V_Player_Stat_DamageMult_Range_Extra								= 0
	
	V_Player_Stat_ResistMult_Melee											= global.G_Player_Stat_ResistMult_Melee
	V_Player_Stat_ResistMult_Melee_Extra									= 0
	
	V_Player_Stat_ResitsMult_Range											= global.G_Player_Stat_ResistMult_Range
	V_Player_Stat_ResistMult_Range_Extra									= 0
	
	// Values
	V_Player_Velocity_X															= 0
	V_Player_Velocity_Y															= 0
	
	// Counters
	V_Player_Counter_Magnitude_Acceleration								= 0
	V_Player_Counter_Magnitude_Gravity										= 0
	V_Player_Counter_Magnitude_Friction										= 0
	V_Player_Counter_DoubleJumpCount										= 0
	

	V_Player_Counter_Speed														= 0
	V_Player_Counter_GravitySpeed											= 0
	
	// States
	V_Player_State_Direction_Facing											= 0
	V_Player_State_Direction_Facing_Previously							= 0
	V_Player_State_Grounded														= 1
	V_Player_State_HitHeadOnRoof												= 0
	

}