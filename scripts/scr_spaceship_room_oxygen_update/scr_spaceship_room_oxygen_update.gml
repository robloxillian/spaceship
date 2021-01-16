// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_room_oxygen_update(){
	var ss_room = argument[0];
	var adj_rooms = scr_adjacent_spaceship_rooms(ss_room);
	if (!ds_list_empty(adj_rooms)) {
		for (var i = 0; i < ds_list_size(adj_rooms); i++) {
			var adj_r = adj_rooms[|i];
			if (scr_spaceship_rooms_oxygen_connected(ss_room, adj_r)) {
				var stophere = 0;
				//TODO: oxygen seeks out equilibrium
				//TODO: how to keep flow steady between rooms?
			}
		}
	}
}