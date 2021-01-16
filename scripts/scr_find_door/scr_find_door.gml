// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_find_door(){
	var find_door_index = argument[0];
	for (var i = 0; i < instance_number(obj_door); i++) {
		var door = instance_find(obj_door, i);
		if (door.door_index == find_door_index) {
			return door;	
		}
	}
	return noone;
}