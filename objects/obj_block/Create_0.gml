/// @description Insert description here
// You can write your code in this editor
//damage_percent = 0;
// start with unbroken from room editor
var lay_id = layer_get_id("Tiles_Walls");
var map_id = layer_tilemap_get_id(lay_id);

tilemap_cell_x = tilemap_get_cell_x_at_pixel(map_id, bbox_left, bbox_top);
tilemap_cell_y = tilemap_get_cell_y_at_pixel(map_id, bbox_left, bbox_top);
tilemap_data_unbroken = tilemap_get(map_id, tilemap_cell_x, tilemap_cell_y);
tilemap_data_broken = tilemap_get(TileSet1_broken, tilemap_cell_x, tilemap_cell_y);