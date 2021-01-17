// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_oxygen_update(){
	var total_oxygen = 0;
	for (var i = 0; i < instance_number(obj_spaceship_room); i++) {
		var ss_room = instance_find(obj_spaceship_room, i);
		total_oxygen += ss_room.current_oxygen;
	}
	//scr_adjacent_spaceship_rooms(ss_room)
	//scr_spaceship_rooms_oxygen_connected(ss_room_1, ss_room_2);
	//TODO: global oxygen update that maintains the same total oxygen
}