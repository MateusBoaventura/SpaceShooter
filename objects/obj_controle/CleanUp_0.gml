/// @description Roda quando o objeto sai da memória do PC

//Atualizando os pontos
//Checando se os pontos são a maior pontuacao
if (pontos > global.max_pontos)
{
	global.max_pontos = pontos;	
}

//Parando todos os sons
audio_stop_all();