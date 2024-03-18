/// @description Insert description here
// You can write your code in this editor



game_finished = false;

draw_set_color(c_white);
text = "";
for(var _i = 0;_i < array_length(current_state[death_pieces]);_i++){
	if(current_state[death_pieces][_i].type == king){
		if(current_state[death_pieces][_i].team == 0){
			game_finished = true;
			text = "Black Won"
		}
		else{
			game_finished = true;
			text = "White Won"
		}
	}
}

if text = ""
{
	if current_state[turn] == 0
		text = "White's Turn";
	else
		text = "Black's Turn";
		
}

draw_set_color(c_white)
if os_type == os_android
{
	draw_set_halign(1)
	draw_text_ext_transformed(room_width/2,room_height/5,text,0,1000,6,6,0);
}
else{
	draw_set_halign(0)
	draw_text_ext_transformed(10,0,text,0,1000,3,3,0);
}