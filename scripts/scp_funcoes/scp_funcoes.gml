// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake(_shake){
	//Criando o screenshake
	var _screen = instance_create_layer(0, 0, layer, obj_screenshake);
	_screen.shake = _shake;
}

//Função para ganhar pontos
function ganhando_pontos(_pontos)
{
	if (instance_exists(obj_controle))
	{
		obj_controle.ganhaPontos(_pontos);	
	}
}

//Destruindo a sequence
function destroy_seq()
{
	//Tentando pegar a sequence da minha layer
	var elementos = layer_get_all_elements("BossEntrada");
	layer_sequence_destroy(elementos[0]);
	
	//Criando o Boss
	instance_create_layer(960, 256, "Boss", obj_Boss);
}

//Criando a sequencia do Player
function cria_seq()
{
	
	layer_sequence_create("Sequences", room_width/2, room_height/2, sq_VENCEU_O_JOGO);
	
	//Destruindo o player
	instance_destroy(obj_player, false);
	
	//Impedindo que o controle crie o game over
	//Avisando que o level foi completo
	if(instance_exists(obj_controle))
	{
		obj_controle.level_completo = true;	
	}
}

function criar_transicao()
{
	var _transicao = instance_create_layer(0, 0, "Player", obj_transicao);
	_transicao.destino = rm_inicio;
}