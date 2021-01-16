// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_open_close_door(){
	var door = argument[0];
	if (door.is_changing_state) {
		return;	
	}
	if (door.is_open) {
		door.sprite_index = spr_door_1_closing;
		door.is_changing_state = true;	
	} else {
		door.sprite_index = spr_door_1_opening;
		door.is_changing_state = true;	
	}
	door.image_index = 0;
}