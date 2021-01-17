/// @description Insert description here
// You can write your code in this editor
var oxy_bar_w = 10;
var oxy_bar_h = 2;
draw_healthbar(bbox_left - 4, bbox_top - 4, 
	bbox_left -4 + oxy_bar_w, bbox_top - 4 + oxy_bar_h,
	100*(current_oxygen/max_oxygen), c_white, c_blue, c_blue, 0, true, true);