/// @description Insert description here
// You can write your code in this editor

var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
var cx = obj_player.x - cw/2;
var cy = obj_player.y - ch/2;
camera_set_view_pos(view_camera[0], cx, cy);

if (shake_intensity > 0)
	{
		camera_set_view_pos(view_camera[0], cx + 
			choose(random(shake_intensity), 
			random(-shake_intensity)), cy+ 
			choose(random(shake_intensity), 
			random(-shake_intensity)));
	}

if (obj_danger_event_controller.game_is_ending) {
	screen_alpha = clamp(screen_alpha + (fade * 0.008),0,1);
	draw_set_color(c_white);
	draw_set_alpha(screen_alpha);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	if (end_message_chars > 0) {
		var end_message_chars_1 = min(end_message_chars, 7); //TODO: globalize the 7
		var display_text_1 = string_copy(global.END_MESSAGE, 1, end_message_chars_1);
		draw_set_font(font_end);
		draw_set_color(c_black);
		draw_text(cx + cw/2 - 50, cy + cy/2 - 30, display_text_1);
		if (end_message_chars >= 9) {
			var display_text_2 = string_copy(global.END_MESSAGE, 9, end_message_chars - 8);	
			draw_text(cx + cw/2 - 50, cy + cy/2 - 10, display_text_2);
		}
	}
}

