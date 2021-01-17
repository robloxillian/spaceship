/// @description Insert description here
// You can write your code in this editor
view_set_xport(view_current, obj_player.x);
view_set_yport(view_current, obj_player.y);
if (obj_danger_event_controller.game_is_ending) {
	screen_alpha = clamp(screen_alpha + (fade * 0.008),0,1);
	draw_set_color(c_white);
	draw_set_alpha(screen_alpha);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	
	if (shake_intensity > 0)
	{
		var vpx = view_get_xport(view_current);
		var vpy = view_get_yport(view_current);
		view_set_xport(view_current, vpx + 
			choose(random(shake_intensity), 
			random(-shake_intensity)));
		view_set_yport(view_current, vpy + 
			choose(random(shake_intensity), 
			random(-shake_intensity)));
	}
}