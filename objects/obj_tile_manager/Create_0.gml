/// @description Creates board
board = [];
var _color = 1;
var _tile_width = sprite_get_height(spr_tile);
var _start_of_col = (room_width - (_tile_width * 8)) / 2;
var _start_of_row = (room_height - (_tile_width * 8)) / 2;

for(var _i = 0;_i < 8;_i++){
	new_row = [];
	for(var _j = 0;_j < 8;_j++){
		var _x = _start_of_col + _tile_width * _j;
		var _y = _start_of_row + _tile_width * _i;
		var _tile = instance_create_depth(_x,_y,0,obj_tile);
		_tile.image_index = _color;
		_tile.row = _i;
		_tile.col = _j;
		_color = 1 - _color;
		array_push(new_row,_tile);
		
	}
	array_push(board,new_row);
	_color = 1 - _color;
}

if os_type == os_android{
	instance_create_depth(room_width - sprite_get_width(spr_undo),_start_of_row + 8 * _tile_width,0,obj_undo_button);
	instance_create_depth(0,_start_of_row + 8 * _tile_width,0,obj_reset_button);
}
else{
	instance_create_depth(room_width - sprite_get_width(spr_undo),room_height - sprite_get_height(spr_undo),0,obj_undo_button);
	instance_create_depth(0,room_height - sprite_get_height(spr_reset),0,obj_reset_button);
}