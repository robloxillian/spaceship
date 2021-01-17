/// @description Insert description here
// You can write your code in this editor

//TODO: a lot more screen shake right as the game is ending

var shake_ratio = danger_counter > global.GAME_SHOW_END_MESSAGE_STEPS ?
	max(0, global.MAX_SHAKE_INTENSITY 
		- global.MAX_SHAKE_INTENSITY*(danger_counter - global.GAME_SHOW_END_MESSAGE_STEPS)/global.GAME_STOP_SHAKING_STEPS)
		: danger_counter/global.GAME_FINISH_STEPS;
obj_graphics_manager.shake_intensity = lerp(0, global.MAX_SHAKE_INTENSITY, shake_ratio);
if (obj_player.is_dying) {
	game_is_ending = false;
	player_death_counter++;
	if (player_death_counter > global.SHOW_DEATH_MESSAGE_STEPS) {
		obj_graphics_manager.death_message_chars 
			= floor((player_death_counter - global.SHOW_DEATH_MESSAGE_STEPS)/10);
	}
}
if (game_is_ending) {
	obj_graphics_manager.fade = 1;
	if (danger_counter > global.GAME_SHOW_END_MESSAGE_STEPS) {
		obj_graphics_manager.end_message_chars 
			= floor((danger_counter - global.GAME_SHOW_END_MESSAGE_STEPS)/10);
	}
	//TODO: any non-graphics things
} else {
	
	if (danger_counter > global.GAME_FINISH_STEPS) {
		game_is_ending = true;
	}
}
danger_counter++;
