/// @description Insert description here
// You can write your code in this editor


// figure out which way we're moving
move_dir_x =  obj_control_manager.input_left - obj_control_manager.input_right;
move_dir_y = obj_control_manager.input_up - obj_control_manager.input_down;

vx = move_dir_x * base_movespeed;
vy = move_dir_y * base_movespeed;

if (place_meeting(x + vx, y + vy, obj_block)) {
	vx = 0;
	vy = 0;
}

x += vx;
y += vy;

