// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_repair_block_update(){
	var block = argument[0];
	if (block.damage_percent > 0) {
		block.damage_percent -= 1; //TODO: maybe slower
		if (work_effect == noone) {
			work_effect = instance_create_layer(block.bbox_left, block.bbox_top, "Effect", obj_spark_effect);
		}	
	}
}