/// @description Insert description here
// You can write your code in this editor
if (is_changing_state) {
	if (image_index >= sprite_get_number(sprite_index) - 1) {
		sprite_index = is_open ? spr_door_1_closed : spr_door_1_open;
		image_index = 0;
		is_open = !is_open;
		is_changing_state = false;
	}
}