/// @description Insert description here
// You can write your code in this editor


if (tilemap_cell_x < 0 || tilemap_cell_y < 0) {
tilemap_cell_x = tilemap_get_cell_x_at_pixel(TileSet1, bbox_left, bbox_top);
tilemap_cell_y = tilemap_get_cell_y_at_pixel(TileSet1, bbox_left, bbox_top);
tilemap_data_unbroken = tilemap_get(TileSet1, tilemap_cell_x, tilemap_cell_y);
tilemap_data_broken = tilemap_get(TileSet1_broken, tilemap_cell_x, tilemap_cell_y);
}

if (damage_percent > 0) {
	tilemap_set_at_pixel(TileSet1, tilemap_data_unbroken, bbox_left, bbox_top); 
} else if (damage_percent > 0) {
	tilemap_set_at_pixel(TileSet1, tilemap_data_broken, tilemap_cell_x, tilemap_cell_y); 
}


/*
if (damage_percent <= 0) {
	sprite_index = spr_block;	
} else if (damage_percent < 25) {
	sprite_index = spr_block_damaged_1;	
} else if (damage_percent < 50) {
	sprite_index = spr_block_damaged_2;	
} else {
	sprite_index = spr_block_damaged_3;	
}
*/