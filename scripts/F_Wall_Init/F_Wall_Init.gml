function F_Wall_Init()
{
	//  Basic Information
	V_World_Info_Name												= "Wall"
	V_World_Info_Description											= "A solid block"
	
	V_World_Sprite														= SP_Wall
	
	
	// Stats
	V_World_Stat_HP													= 1000
	
	
	// Effects
	V_World_Effects_Blood_Mult										= 1.0
	V_World_Effects_Blood_Colour									= make_color_rgb(25,25,25)
	
	// Sounds
	V_World_Sound_On_Hit											= SD_NULL
	V_World_Sound_On_Break										= SD_NULL


	// Init the various attributes of the solid object
	V_World_Is_Standable												= true
	V_World_Is_ClimbUpable											= false
	V_World_Is_DropDownable										= false
	
	V_World_Is_PhysProp												= false
	V_World_Is_Breakable												= false
	V_World_Is_WallBangable											= false
	
	V_World_Is_Special_Slippery										= false
	V_World_Is_Special_Sticky										= false
	V_World_Is_Special_Bouncy										= false
	V_World_Is_Special_Hazard										= false
	V_World_Is_Special_BreakOnStand								= false
	
}