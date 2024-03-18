/// @description Insert description here
// rowou can write your code in this editor

piece = obj_game_manager.current_state[row][col];


//mark protected pieces
if piece != noone and piece.type = shield
{
	
	for(var _i = -1;_i <= 1;_i++){
		for(var _j = -1;_j <= 1;_j++){
			var _row = row + _i;
			var _col = col + _j;
			if 0 == _j and _i == 0
				continue;
			if _row >= 0 and _col >= 0 and _row < 8 and _col < 8
				obj_tile_manager.board[_row][_col].protected = true;
		}
	}
}
//todo: add vfx for protected pieces
