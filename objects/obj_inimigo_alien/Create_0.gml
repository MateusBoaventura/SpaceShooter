/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Criando a minha variável de controle para saber se eu posso me mover para os lados
posso_me_mover_para_lado = true;

inimigoAtirando = function()
{
	if (y >= 0) 
	{
	instance_create_layer(x, y+sprite_height/3, "Tiros", obj_tiro_inimigo_alien);
	//Som do tiro
	audio_play_sound(sfx_laser1, 1, false);
	}
}

pontos = 20;
chance = 50;