/// @description Insert description here
// You can write your code in this editor

/*
Estado 1: parado dando o tiro 2
Estado 2: movendo dando o tiro 1
Estado 3: parado, intercalando entre o tiro 1 e 2
Estado 4: invocar exército de minions;
Estado Especial 1: ficar invulnerável enquanto cria 2 minions para recuperar a vida
*/
estado_atual = choose("estado 1", "estado 2", "estado 3");

//Iniciando o sistema de vida
vida_max = 3000;
vida_atual = vida_max;

delay_tiro = room_speed/2;
espera_tiro_boss = 0; //quero que ele dê o primeiro tiro na hora

delay_estado = room_speed*10;
espera_estado = delay_estado; //quero que ele espere 10 segundos antes de trocar de estado

velocidade_horizontal = choose(3, -3);

//Tremida do Boss
segundos_tremendo = room_speed * 2;

//Horda de inimigos
horda = true;

//Criei minions
criar_minions = true;

//Tocando a música do Boss
audio_play_sound(snd_BossFight, 0, true);

perde_vida = function()
{
	//Perdendo vida
	if(vida_atual > 0)
	{
		vida_atual -= 5;	
	}else
	{
		instance_destroy();	
	}
	
	instance_destroy(other);
}


tiro_02 = function()
{
	instance_create_layer(x, y+80, "Tiros", obj_tiro_inimigo_alien);
	//Som do tiro
	audio_play_sound(sfx_laser1, 1, false);
}

//Essa função pede um dado booleano, se for true, então a posicao no X é 160
//Se for falso, então a posição do X é -160. Isso automatiza as coisas para
//Saber se eu quero atirar pela asa direita ou esquerda.
///@method tiro_01(true_direita__false_esquerda)
tiro_01 = function(_direita)
{
	if(_direita)
	{
		var _posX = 160	
	}else
	{
		var _posX = -160;	
	}
		//Criando o tiro com posição X dependendo do true ou false
		instance_create_layer(x+_posX, y+10, "Tiros", obj_tiro_inimigo_polvo);
		//Som do tiro
		audio_play_sound(sfx_laser1, 1, false);
}

mudar_estado = function ()
{
	//Alternando os estados
	//Diminuindo a espera do estado
	espera_estado--;
	if(espera_estado <= 0)
	{
		//Vou escolher um outro estado
		//Eu escolho apenas esses estados por enquanto
		if(vida_atual > vida_max/2 && estado_atual != "estado 4")
		{
			estado_atual = choose("estado 1", "estado 2", "estado 3", "estado 4");	
		}else
			if(estado_atual != "estado 4" && vida_atual <= vida_max/2) // Se o estado 4 não está escolhido e a condição da vida não acontece...
			{
				//Eu posso escolher agora o estado 5 pois tenho menos vida
				estado_atual = choose("estado 1", "estado 2", "estado 3", "estado 4", "estado 5");
			}
			else //Se o estado 4 ESTÁ escolhido, ele não acontece novamente
			{
				estado_atual = choose("estado 1", "estado 2", "estado 3", "estado 5");
			}
		//Fazendo o espera estado ter um valor alto de novo
		//Se o estado escolhido for 4, dura mais tempo
		if (estado_atual != "estado 4")
		{
			espera_estado = delay_estado;
		}
		else
		{
			espera_estado = delay_estado * 2;
			segundos_tremendo = room_speed * 2;
		}
		//Pode criar minion
		criar_minions = true;
		//Pode fazer horda
		horda = true;
	}	
}

indo_para_o_meio = function ()
{
	//Indo para o meio da tela
	//Convertendo esse valor para 1, -1 ou 0
	//Se eu to na esquerda, esse número vai ser positivo, se direita, negativo e se to no meio, é 0
	x += sign(room_width /2 - x); //Se na função sign eu dou um valor positivo, QUALQUER valor ele retorna 1, se negativo, -1 e se eu dou 0 ele retorna 0	
}

//Método do estado_1
estado_01 = function()
{
	//Diminuindo o valor da espera do tiro
	espera_tiro_boss--;
	//Códigos do estado 1
	//Criando o tiro 2 SE a espera do tiro for menor ou igual a zero
	if (espera_tiro_boss <= 0)
	{
		tiro_02();
		//Vou mandar ele esperar
		espera_tiro_boss = delay_tiro;	
	}
}

estado_02 = function ()
{
	//Código do estado 2
	//Indo para a direita:
	x += velocidade_horizontal;
	//Invertendo a velocidade horizontal se eu toquei no limite da tela
	if (x >= 1632 || x <= 288) velocidade_horizontal *= -1;
	
	espera_tiro_boss--;
	if(espera_tiro_boss <= 0)
	{
		tiro_01(false);
		tiro_01(true);
		espera_tiro_boss = delay_tiro * 2;
	}	
}

estado_03 = function ()
{
	//Indo para a direita:
	x += velocidade_horizontal;
	//Invertendo a velocidade horizontal se eu toquei no limite da tela
	if (x >= 1632 || x <= 288) velocidade_horizontal *= -1;
	
	//Código do estado 3
	espera_tiro_boss--;
	//Criando o tiro 2 do canhão
	if(espera_tiro_boss <= 0)
	{
		tiro_02();
		espera_tiro_boss = delay_tiro * 2; // 1 segundo
	}
	//Criando o tiro 1 da esquerda
	if(espera_tiro_boss == delay_tiro + round(delay_tiro/2)) // Round arredonda divisões para entregarem valores inteiros
	{
		//Criando os tiros da esquerda e da direita
		tiro_01(false);
	}
	if(espera_tiro_boss == delay_tiro) // Meio segundo para o 0 que é quando ele cria o tiro 2
	{
		tiro_01(true);	
	}	
}

estado_04 = function ()
{
	//Código do estado 4
	if (x != room_width/2)
	{
		//Enquanto não estiver no meio da room, ele...
		indo_para_o_meio();
		//Ajustei enquanto ele vai pro meio, ele não toma dano
	}
	if (x == room_width/2)
	{
		//Tremendo a tela quando ele chegar no meio
		if (segundos_tremendo >= 0)
		{
			screenshake(5);
			segundos_tremendo--;
		}
		//Fazendo as coisas do estado 4
		//Criando a horda SE horda for true
		if (horda)
		{
			horda_inimiga();
		}
	}

}

estado_05 = function ()
{
	//Código do estado 4
	//Trocando de sprite
	sprite_index = spr_boss_escuro;
	
	indo_para_o_meio();
	
	//Criando os minions SE eu posso criar minions
	if (criar_minions)
	{
		//Esquerda
		instance_create_layer(64, 640, "Inimigos", obj_Boss_minion);
		//Direita
		instance_create_layer(1856, 640, "Inimigos", obj_Boss_minion);
		criar_minions = false;
	}	
}

horda_inimiga = function()
{
	randomize();
	var _repetir = 50;
	//Repetindo o mesmo código
	repeat(_repetir)
		{
		//Definindo a posição x e y do inimigo
		var _aparicaoX = irandom_range(64, room_width-64);
		//Aumentando o limite com base no level do jogo
		var _aparicaoY = irandom_range(-224, -2300);
		//Criando o inimigo com base no level
		//A chance de criar um inimigo mais forte depende do level
		var _inimigo = obj_inimigo_polvo;
		var _chance = random_range(0, 10);
		//Se o valor da chance for maior do que 2
		if (_chance > 8)
		{
			_inimigo = obj_inimigo_alien;
		}
		//Criando o inimigo na posição definida
		instance_create_layer(_aparicaoX, _aparicaoY, "Inimigos", _inimigo);
		}
	horda = false;
}