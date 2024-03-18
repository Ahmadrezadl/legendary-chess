/// @description Insert description here
// You can write your code in this editor
if ds_stack_size(obj_game_manager.history) == 1
{
	instance_destroy();
	return;
}
	

obj_game_manager.current_state = ds_stack_pop(obj_game_manager.history)