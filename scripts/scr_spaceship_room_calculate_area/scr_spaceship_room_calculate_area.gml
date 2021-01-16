// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_room_calculate_area(){
	var area = 0;
	var bw = sprite_get_width(spr_block);
	var bh = sprite_get_height(spr_block);
	var tile_width = sprite_get_width(self.sprite_index) * self.image_xscale / bw;
	var tile_height = sprite_get_height(self.sprite_index) * self.image_yscale / bh;
	for (var ty = 0; ty < tile_height; ty++) {
		for (var tx = 0; tx < tile_width; tx++) {
			var tx1 = bbox_left + (bw * tx);
			var ty1 = bbox_top + (bh * ty);
			var blocker = collision_rectangle(tx1 + 1, 
				ty1 + 1, tx1 + bw - 1, ty1 + bh - 1, obj_block, true, true);
			if (blocker == noone) {
				blocker = collision_rectangle(tx1 + 1, 
					ty1 + 1, tx1 + bw - 1, ty1 + bh - 1, obj_door, true, true);
			}
			if (blocker == noone) {
				area++;	
			}
		}
	}
	room_area = area;
}