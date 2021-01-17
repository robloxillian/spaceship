// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_rooms_oxygen_connected(){
	var ssr1 = argument[0];
	var ssr2 = argument[1];
	var cx1 = 0;
	var cy1 = 0;
	var cx_step = global.TILE_SIZE;
	var cy_step = global.TILE_SIZE;
	var cx2 = 0;
	var cy2 = 0;
	if (ssr1.bbox_left >= ssr2.bbox_right) {
		cx1 = ssr2.bbox_right;
		cy1 = max(ssr1.bbox_top, ssr2.bbox_top);
		cx2 = cx1 + cx_step;
		cy2 = min(ssr1.bbox_bottom, ssr2.bbox_bottom);
	} else if (ssr1.bbox_right <= ssr2.bbox_left) {
		cx1 = ssr1.bbox_right;
		cy1 = max(ssr1.bbox_top, ssr2.bbox_top);
		cx2 = cx1 + cx_step;
		cy2 = min(ssr1.bbox_bottom, ssr2.bbox_bottom);
	} else if (ssr1.bbox_top >= ssr2.bbox_bottom) {
		cx1 = max(ssr1.bbox_left, ssr2.bbox_left);
		cy1 = ssr2.bbox_bottom;
		cx2 = min(ssr1.bbox_right, ssr2.bbox_right);
		cy2 = cy1 + cy_step;
	} else if (ssr1.bbox_bottom <= ssr2.bbox_top) {
		cx1 = max(ssr1.bbox_left, ssr2.bbox_left);
		cy1 = ssr1.bbox_bottom;
		cx2 = min(ssr1.bbox_right, ssr2.bbox_right);
		cy2 = cy1 + cy_step;
	} else {
		// TODO: this seems like an error	
		return true;
	}
	for (var cy = cy1; cy < cy2; cy += cy_step) {
		for (var cx = cx1; cx < cx2; cx += cx_step) {
			var blocker = collision_rectangle(cx + 1, cy + 1, cx + cx_step - 1, cy + cy_step - 1, obj_block, true, true);
			if (blocker == noone) {
				var door = collision_rectangle(cx + 1, cy + 1, cx + cx_step - 1, cy + cy_step - 1, obj_door, true, true);
				if (door != noone && !door.is_open) {
					blocker = door;	
				}
			}
			if (blocker == noone) {
				return true;	
			}
		}
	}
	return false;
}