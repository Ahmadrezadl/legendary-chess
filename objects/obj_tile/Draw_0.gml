/// @description Insert description here
// rowou can write your code in this editor


draw_self();



//Check if shield is protecting piece
var _row = row;
var _col = col;





var _action_on_this_tile = check_action(obj_game_manager.selected_tile,self);

if _action_on_this_tile == Action.ATTACK or _action_on_this_tile == Action.MOVE {
	draw_set_alpha(0.5);
	if piece == noone {
		draw_set_color(c_black);
		draw_circle(middle_x,middle_y,sprite_width / 4,0);
	}
	else {
		draw_set_color(c_red);
		draw_circle(middle_x,middle_y,sprite_width / 4,0);

	}
	draw_set_alpha(1);
}
	

if(obj_game_manager.selected_tile = self){
	draw_set_color(c_yellow);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
}



