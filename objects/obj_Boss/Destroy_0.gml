/// @description Insert description here
// You can write your code in this editor

//Criando a animação de morte no mesmo local que eu estou
if (instance_exists(obj_player))
{
	draw_sprite_ext(spr_player, image_index, room_width/2, room_height/2, image_xscale, image_yscale, image_angle, c_white, 1);

}
layer_sequence_create("Morte_Boss", x, room_height/2 - 32, sq_BOSS_MORTE);

ganhando_pontos(200);
global.total_inimigos++;