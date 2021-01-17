// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spaceship_room_oxygen_update(){
	var ss_room = argument[0];
	//TODO: replace 30 with a global
	if (obj_oxygen_manager.oxygen_timer % global.OXYGEN_UPDATE_STEPS != 0) {
		return;	
	}
	step_net_oxygen_change = 0;
	var oxy_ratio = scr_room_oxygen_ratio(self);
	var adj_rooms = scr_adjacent_spaceship_rooms(ss_room);
	if (!ds_list_empty(adj_rooms)) {
		for (var i = 0; i < ds_list_size(adj_rooms); i++) {
			var adj_r = adj_rooms[|i];
			if (ds_list_find_index(self.rooms_processed, adj_r) >= 0) {
				continue;	
			}
			if (scr_spaceship_rooms_oxygen_connected(ss_room, adj_r)) {
				//TODO: take into account min/max oxygen
				//however, what if we incorrectly ignore due to this?
				//example: at i = 5 we're at zero and try to -1, but at i = 6 we +1
				//idea: store a "net ignored" so we know for later?
				//other idea: figure out what to do with anything above maximum or below minimum at the end
				//			pretty sure we need a continuous network of connected rooms for this though
				//probably need to notepad it!
				var adj_r_oxy_ratio = scr_room_oxygen_ratio(adj_r);
				if (abs(adj_r_oxy_ratio - oxy_ratio) < 0.1) {
					// close enough, so don't move oxygen around	
				} else if (oxy_ratio > adj_r_oxy_ratio) {
					// we have more oxygen, so we lose some
					step_net_oxygen_change -= 1;
					adj_r.step_net_oxygen_change += 1;
				} else if (oxy_ratio < adj_r_oxy_ratio) {
					// we less more oxygen, so we gain some
					step_net_oxygen_change += 1;
					adj_r.step_net_oxygen_change -= 1;
				}
				ds_list_add(adj_r.rooms_processed, self);
			}
		}
	}
	var oxygen_leaked = scr_spaceship_room_oxygen_leaked(ss_room);
	step_net_oxygen_change -= oxygen_leaked;
	//step_net_oxygen_change = net_oxygen_change;
	//step_net_oxygen_change = ?
	//TODO: whiteboard and see how we might maintain same total oxygen
				// I'm starting to think we can do it as long as we solve the "accidental ignore" problem
				// maybe save total oxygen across all rooms in some control object?
				//TODO: oxygen seeks out equilibrium
				//TODO: how to keep flow steady between rooms?
	//TODO: store net oxygen change until end step event so we don't step on each others toes
	//TODO: calculate how much oxygen just goes into space
}