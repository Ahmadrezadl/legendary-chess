obj_game_manager.selected_tile = noone;

while ds_stack_size(obj_game_manager.history) == 1
	return;

obj_game_manager.current_state = ds_stack_pop(obj_game_manager.history);
