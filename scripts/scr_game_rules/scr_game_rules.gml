enum Action{
	NONE,
	ATTACK,
	MOVE
}

function check_action(piece_tile,dest_tile){
	//You can't move anything if game is over
	if obj_game_manager.game_finished
		return Action.NONE;

	//For avoiding possible null pointer exceptions
	if piece_tile = noone or dest_tile = noone or piece_tile.piece = noone
		return Action.NONE;
	
	//Piece can't move into own place;
	if piece_tile.row == dest_tile.row and piece_tile.col == dest_tile.col
		return Action.NONE;
	
	//Friendly fire is off =)
	if dest_tile.piece != noone and piece_tile.piece != noone and piece_tile.piece.team = dest_tile.piece.team
		return Action.NONE;
	
	//Check if shield is protecting piece
	if dest_tile.piece != noone and dest_tile.piece.type != shield {
		var _row = dest_tile.row;
		var _col = dest_tile.col;
		for(var _i = -1;_i <= 1;_i++){
			for(var _j = -1;_j <= 1;_j++){
				try{
					var _piece = obj_game_manager.current_state[_row + _i][_col + _j];
					if _piece != noone and _piece.type == shield and _piece.team = dest_tile.piece.team
						return Action.NONE;
				}
				catch(e){
				}
			}
		}
	}
	
		
	
	if piece_tile.piece.type = pawn {
		
		// Move 1 in any direction
		if dest_tile.piece == noone
		{
			if abs(piece_tile.row - dest_tile.row) <= 1 and abs(piece_tile.col - dest_tile.col) <= 1
			return Action.MOVE;
		}
		else{
			if abs(piece_tile.row - dest_tile.row) == 1 and abs(piece_tile.col - dest_tile.col) == 1{
				return Action.MOVE;
			}
		}
		
		// Move 2 forward
		if piece_tile.col == dest_tile.col {
			if piece_tile.piece.team == 0 and piece_tile.row - 2 == dest_tile.row and dest_tile.piece = noone and obj_game_manager.current_state[piece_tile.row - 1][piece_tile.col] == noone
				return Action.MOVE;
			
			if piece_tile.piece.team == 1 and piece_tile.row + 2 == dest_tile.row and dest_tile.piece = noone and obj_game_manager.current_state[piece_tile.row + 1][piece_tile.col] == noone
				return Action.MOVE;
		}
			
	}
	
	else if piece_tile.piece.type = king or piece_tile.piece.type = shield {
		// Move 1 in any direction
		if abs(piece_tile.row - dest_tile.row) <= 1 and abs(piece_tile.col - dest_tile.col) <= 1
			return Action.MOVE;
	}
	
	else if piece_tile.piece.type = archer {
		// Move 1 in any direction
		if abs(piece_tile.row - dest_tile.row) <= 1 and abs(piece_tile.col - dest_tile.col) <= 1
		{
			if dest_tile.piece != noone
				return Action.NONE;
			
			return Action.MOVE;
		}
			
		// Attack if distance <= 2
		if abs(piece_tile.row - dest_tile.row) <= 2 and abs(piece_tile.col - dest_tile.col) <= 2 and dest_tile.piece != noone and dest_tile.piece.team != piece_tile.piece.team
			return Action.ATTACK;
	}
	
	else if piece_tile.piece.type = phoenix {
		// Not in same line
		if piece_tile.row != dest_tile.row and piece_tile.col != dest_tile.col and (abs(piece_tile.col - dest_tile.col) != abs(piece_tile.row - dest_tile.row))
			return Action.NONE;
		
		// Phoenix can't jump ahead of pieces
		var _dx = sign(dest_tile.col - piece_tile.col);
		var _dy = sign(dest_tile.row - piece_tile.row);
		
		var _x = piece_tile.col;
		var _y = piece_tile.row;
		//Im lazy so for index out of bound, so I put my code into try catch
		try {
			while(1){
				_x += _dx;
				_y += _dy;
				if _x == dest_tile.col and _y == dest_tile.row
					return Action.MOVE;
				else if obj_game_manager.current_state[_y][_x] != noone
					return Action.NONE;
			}
		}
		catch(e){}
	}
	
	else if piece_tile.piece.type = imp {
		// Not in same line
		if piece_tile.row != dest_tile.row and piece_tile.col != dest_tile.col and (abs(piece_tile.col - dest_tile.col) != abs(piece_tile.row - dest_tile.row))
			return Action.NONE;
		

		// Imp can jump from pieces
		var _dx = sign(dest_tile.col - piece_tile.col);
		var _dy = sign(dest_tile.row - piece_tile.row);
		var _x = piece_tile.col;
		var _y = piece_tile.row;
		
		//Im lazy so for index out of bound, so I put my code into try catch
		try {
			while(1){
				_x += _dx;
				_y += _dy;
				if _x == dest_tile.col and _y == dest_tile.row
					return Action.MOVE;
				else if obj_game_manager.current_state[_y][_x] == noone
					return Action.NONE;
			}
		}
		catch(e){}
	}

	
	
	return Action.NONE;
}