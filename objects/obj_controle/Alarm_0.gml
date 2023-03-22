/// @description Criando os inimigos

//Verificando se existe inimigo na room
if (!instance_exists(obj_inimigo_polvo) && !instance_exists(obj_Boss))
{
	var _repetir = 10*level;
	//Só criar inimigos se eu ainda não cheguei no level 10
	if (level < 10)
	{
	//Repetindo o mesmo código
		repeat(_repetir)
			{
				//Criando inimigos
				criando_inimigos();
			}
	}else if(criar_boss)
	{
	//Criar o boss (a animação de entrada do boss)
	//Garantir que eu só estou criando ela 1 vez
		layer_sequence_create("BossEntrada", 960, 512, sq_BOSS_ENTRADA);
		criar_boss = false;
		//Parando de tocar a música
		audio_stop_all();
	}
}

//Reiniciando o alarme
alarm[0] = room_speed*5;

