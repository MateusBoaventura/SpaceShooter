/// @description Insert description here
// You can write your code in this editor

//Reiniciando o jogo APENAS se o jogo morreu
if (gameover_seq)
{
	//Criando o objeto transicao com o destino da room inicial
	var _transicao = instance_create_layer(0, 0, "player", obj_transicao);
	_transicao.destino = rm_inicio;
	
}
