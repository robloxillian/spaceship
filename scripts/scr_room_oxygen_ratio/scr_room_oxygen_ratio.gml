// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_oxygen_ratio(){
	var ss_room = argument[0];
	return ss_room.current_oxygen / ss_room.max_oxygen;
}