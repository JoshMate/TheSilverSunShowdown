function F_World_Init()
{
	//  Basic Information
	V_World_Name														= "World Object"
	V_World_Description												= "A basic object that exists in the world"
	
	
	// Stats
	V_World_HP															= 1000
	
	
	// Effects
	V_World_Effects_Debris_Mult									= 1.0
	V_World_Effects_Debris_Colour									= make_color_rgb(25,25,25)


	// Init the various attributes of the solid object
	V_World_Is_Standable												= true
	V_World_Is_ClimbUpable											= true
	V_World_Is_DropDownable										= true
	V_World_Is_WallBangable											= false
	V_World_Is_Breakable												= false


	// Special attributes
	V_World_Is_Special_Slippery										= false
	V_World_Is_Special_Sticky										= false
	V_World_Is_Special_Bouncy										= false
	V_World_Is_Special_Hazard										= false
	V_World_Is_Special_BreakOnStand								= false
	
}