/// @description Insert description here
// You can write your code in this editor

//Se o player NÃO existe, cria a sequencia
//E o level não foi completo
//Se eu ainda não criei minha sequence...
if(!instance_exists(obj_player) && !gameover_seq && !level_completo)
{
	//Criando minha sequencia
	//Criando apenas UMA sequencia
	gameover_seq = layer_sequence_create("Sequences", room_width/2, room_height/2, sq_GAME_OVER);
	//Som do GameOver
	audio_play_sound(sfx_lose, 0, false);
}



