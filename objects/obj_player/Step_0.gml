/// @description Insert description here
// You can write your code in this editor


// input processing
move_dir_x = -1 * obj_control_manager.input_left + obj_control_manager.input_right;
move_dir_y = -1 * obj_control_manager.input_up + obj_control_manager.input_down;
var is_interacting = obj_control_manager.input_interact;

// facing processing
if (move_dir_x != 0) { 
	facing_dir_x = move_dir_x;
	if (move_dir_y == 0) {
		facing_dir_y = 0;	
	}
} 
if (move_dir_x == 0 && move_dir_y != 0) {
	facing_dir_y = move_dir_y;
	if (move_dir_x == 0) {
		facing_dir_x = 0;	
	} 
}



// interact processing
if (is_interacting) {
	var pw = sprite_get_width(spr_player);
	var ph = sprite_get_height(spr_player);
	var ix1 = bbox_left;
	if (facing_dir_x != 0) {
		ix1 += 	facing_dir_x * pw;
	}
	var iy1 = bbox_top;
	if (facing_dir_y != 0) {
		iy1 += 	facing_dir_y * ph;
	}
	var iw = pw;
	var ih = ph;
	var interact_target = collision_rectangle(ix1, iy1, 
		ix1 + iw, iy1 + ih, obj_interactable, true, true);
	if (interact_target != noone) {
		if (interact_target.object_index == obj_button) {
			scr_press_button(interact_target);
		}
	}
	is_interacting = false;	
}

// speed processing
vx = move_dir_x * base_movespeed;
vy = move_dir_y * base_movespeed;
var blocker = instance_place(x+ vx, y + vy, obj_block);
if (blocker == noone) {
	var door = instance_place(x+ vx, y + vy, obj_door);	
	if (door != noone && (!door.is_open || door.is_changing_state)) {
		blocker = door;	
	}
}

if (blocker != noone) {
	vx = 0;
	vy = 0;
}

// movement processing
x += vx;
y += vy;

