// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_room_oxygen_update_confirm(){
	var ss_room = argument[0];
	if (obj_oxygen_manager.oxygen_timer % global.OXYGEN_UPDATE_STEPS != 0) {
		return;	
	}
	if (abs(ss_room.step_net_oxygen_change) > 0) {
		ss_room.current_oxygen = max(0, 
			min( ss_room.max_oxygen, 
				ss_room.current_oxygen + ss_room.step_net_oxygen_change));
	}
}