/// @description Insert description here
// You can write your code in this editor
if (game_is_ending) {
	obj_graphics_manager.fade = 1;
	//TODO: any non-graphics things
} else {
	danger_counter++;
	if (danger_counter > global.GAME_FINISH_STEPS) {
		game_is_ending = true;
	}
}
