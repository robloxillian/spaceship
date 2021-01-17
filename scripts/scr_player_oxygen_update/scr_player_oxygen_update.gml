// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_oxygen_update(){
	var player = argument[0];
	if (player.is_dying) {
		player.lung_oxygen = 0;
		return;
	}
	var ambient_oxygen = 0;
	var collide_room 
		= collision_rectangle(player.bbox_left - global.TILE_SIZE, 
			player.bbox_top - global.TILE_SIZE, 
			player.bbox_right + global.TILE_SIZE, 
			player.bbox_bottom + global.TILE_SIZE,
			obj_spaceship_room, true, true);
	if (collide_room != noone) {
		ambient_oxygen = floor(100*(collide_room.current_oxygen/collide_room.max_oxygen));	
	}
	if (abs(player.lung_oxygen - ambient_oxygen) <= 1) {
		player.lung_oxygen = ambient_oxygen;
	} else {
		var target_oxygen = lerp(player.lung_oxygen, ambient_oxygen, 0.1);
		var oxygen_change 
			= sign(target_oxygen - player.lung_oxygen) 
				* (min(abs(target_oxygen - player.lung_oxygen), 0.1));
		player.lung_oxygen += oxygen_change;
	}
	if (player.lung_oxygen == 0) {
		player.is_dying = true;	
	}
}