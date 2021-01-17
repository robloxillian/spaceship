/// @description Insert description here
// You can write your code in this editor
room_area = 0;

scr_spaceship_room_calculate_area();
max_oxygen = room_area;
current_oxygen = max_oxygen;
step_net_oxygen_change = 0;

rooms_processed = ds_list_create();