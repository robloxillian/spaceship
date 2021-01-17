// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_adjacent_spaceship_rooms(){
	var ss_room = argument[0];
	var adjacent_rooms = ds_list_create();
	var bw = global.TILE_SIZE;
	var bh = global.TILE_SIZE;
	with (ss_room) {
		collision_rectangle_list(ss_room.bbox_left - bw - 1, ss_room.bbox_top - bh - 1,
			ss_room.bbox_right + bw + 1, ss_room.bbox_bottom + bh + 1,
			obj_spaceship_room, true, true, adjacent_rooms, false);
	}
	return adjacent_rooms;
}