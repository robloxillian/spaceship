// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_room_oxygen_leaked(){
	var ssr = argument[0];
	var total_oxygen_leaked = 0;
	
	var cx_step = sprite_get_width(spr_block);
	var cy_step = sprite_get_height(spr_block);
	var cx1 = ssr.bbox_left - cx_step;
	var cy1 = ssr.bbox_top - cy_step;
	
	var cx2 = ssr.bbox_right + cx_step;
	var cy2 = ssr.bbox_bottom + cy_step;
	
	var adj_leak_points = ds_list_create();
	collision_rectangle_list(cx1, cy1, cx2, cy2, obj_oxygen_leak_point, true, true, adj_leak_points, false);
	for (var i = 0; i < ds_list_size(adj_leak_points); i++) {
		var lp = adj_leak_points[|i];
		var blocker = collision_rectangle(lp.bbox_left + 1, lp.bbox_top + 1, lp.bbox_right - 1, lp.bbox_bottom - 1, obj_block, true, true);
		if (blocker == noone) {
			var door = collision_rectangle(lp.bbox_left + 1, lp.bbox_top + 1, lp.bbox_right - 1, lp.bbox_bottom - 1, obj_door, true, true);
			if (door != noone && !door.is_open) {
				blocker = door;	
			}
		}
		if (blocker == noone) {
			total_oxygen_leaked += 1;	
		}
	}
	
	return total_oxygen_leaked;
}