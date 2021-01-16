// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_press_button(){
	var button = argument[0];
	if (button.button_door_index != "") {
		var button_door = scr_find_door(button.button_door_index);
		if (button_door != noone) {
			scr_open_close_door(button_door);
		}
	}
}