/// @description Insert description here
// rowou can write your code in this editor
window_set_size(room_width, room_height);
surface_resize(application_surface, room_width, room_height);
display_set_gui_size(room_width, room_height);

history = ds_stack_create();
game_finished = false;

current_state = [
	[{team: 1, type: imp}, {team: 1, type: shield}, {team: 1, type: archer}, {team: 1, type: phoenix}, {team: 1, type: king}, {team: 1, type: archer}, {team: 1, type: shield}, {team: 1, type: imp}],
	[{team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}, {team: 1, type: pawn}],
	[noone,noone,noone,noone,noone,noone,noone,noone],
	[noone,noone,noone,noone,noone,noone,noone,noone],
	[noone,noone,noone,noone,noone,noone,noone,noone],
	[noone,noone,noone,noone,noone,noone,noone,noone],
	[{team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}, {team: 0, type: pawn}],
	[{team: 0, type: imp}, {team: 0, type: shield}, {team: 0, type: archer}, {team: 0, type: phoenix}, {team: 0, type: king}, {team: 0, type: archer}, {team: 0, type: shield}, {team: 0, type: imp}],
	[noone,noone], // Eggs
	[], // Dead Pieces
	0, // Turn
	
];
//Indexes:
eggs = 8;
death_pieces = 9;
turn = 10;
//

ds_stack_push(history,variable_clone(current_state));

selected_tile = noone;

function complete_turn(){
	current_state[turn] = 1 - current_state[turn];
}

function kill(tile,killer){
	piece = current_state[tile.row][tile.col]
	array_push(current_state[death_pieces],piece);

	if(killer.type != archer and killer.type != phoenix and piece.type = phoenix){
		current_state[eggs][piece.team] = {row: tile.row, col: tile.col};
	}
}

function select(tile){
	if selected_tile {
		var _action = check_action(selected_tile,tile);
		if _action = Action.MOVE
		{
			ds_stack_push(history,variable_clone(current_state));

			if current_state[tile.row][tile.col] != noone
				kill(tile,selected_tile.piece)
			current_state[tile.row][tile.col] = current_state[selected_tile.row][selected_tile.col];
			current_state[selected_tile.row][selected_tile.col] = noone;
			
			for(var _i = 0;_i < 2;_i++){
				var _egg = current_state[eggs][_i];
				if _egg != noone and _egg.row = selected_tile.row and _egg.col == selected_tile.col
				{
					current_state[selected_tile.row][selected_tile.col] = {team: _i, type: phoenix}
					current_state[eggs][_i] = noone;
				}
			}
			
			complete_turn();
		}
		else if _action = Action.ATTACK
		{
			ds_stack_push(history,variable_clone(current_state));

			if current_state[tile.row][tile.col] != noone
				kill(tile,selected_tile.piece)
			current_state[tile.row][tile.col] = current_state[selected_tile.row][selected_tile.col];
			current_state[tile.row][tile.col] = noone;
			complete_turn();
		}
		else if(tile.piece != noone and tile.piece.team = current_state[turn]){
			selected_tile = tile;
		}
		else{
			selected_tile = noone;
		}
	}
	else {
		if tile.piece != noone
			selected_tile = tile;
	}
	
	if selected_tile != noone and selected_tile.piece != noone and selected_tile.piece.team != current_state[turn]
		selected_tile = noone;
}