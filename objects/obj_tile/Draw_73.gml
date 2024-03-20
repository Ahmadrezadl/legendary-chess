
if(piece != noone) {
	var _x = middle_x;
	var _y = middle_y;
	
	if mouse_check_button(1) and self = obj_game_manager.selected_tile{
		_x = mouse_x
		_y = mouse_y
	}
	if os_type == os_android
		draw_sprite_ext(piece.type,piece.team,_x,_y,0.9,0.9,obj_game_manager.current_state[10] * 180,c_white,1);
	else
		draw_sprite_ext(piece.type,piece.team,_x,_y,0.9,0.9,0,c_white,1);
}