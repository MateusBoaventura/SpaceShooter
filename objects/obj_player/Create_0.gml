/// @description Criando

/* Ganhos Power Up!
Velocidade = .5		 - Limite: 10  // Chance de pegar: 45%
Espera_tiro = 10%    - Limite: 20  // Chance de pegar: 45%
level_tiro = 1       - Limite: 5   // Chance de pegar: 10%
*/

velocidade = 5;
espera_tiro = room_speed;
level_tiro = 1;

//Sistema de vida
vida = 3;

//Escudo
qtd_escudos = 3;
meu_escudo = noone;

//Método para criar o tiro 2
tiro2 = function()
{
	var _y_height = y-sprite_height/3;
	//Criando o segundo tiro da asa esquerda
	var _tiro1 = instance_create_layer(x-60, _y_height+10, "Tiros", obj_tiro2_player);
	//Mandando o tiro 1 ir para a esquerda
	_tiro1.hspeed = -5;
			
	//Criando o segundo tiro da asa direita
	var _tiro2 = instance_create_layer(x+60, _y_height+10, "Tiros", obj_tiro2_player);
	//Mandando o tiro 2 ir para a direita
	_tiro2.hspeed = 5;
}

tiro4 = function()
{
	var _direcao = 75;
	var _y_height = y-sprite_height/3;
		repeat(3)
			{
			var _meu_tiro = instance_create_layer(x, _y_height + 10, "Tiros", obj_tiro_player);
			//Definir a direção dele
			_meu_tiro.direction = _direcao;
			//Fazer o meu tiro olhar para a direção que ele está indo
			_meu_tiro.image_angle = _meu_tiro.direction - 90;
				
			//Aumentar a direcao em 15
			_direcao += 15;	
			}
}

//Criando um método de atirar
atirando = function()
{
	var _fire = keyboard_check(vk_space);
	var _y_height = y-sprite_height/3;
	//Criando objeto tiro
	//Criar o tiro na hora que eu apertei espaço e depois só atirar novamente em 1 segundo
	if (_fire && alarm[0] == -1)
	{
		//Ativando o alarme
		alarm[0] = espera_tiro;
		
		//Som do tiro
		audio_play_sound(sfx_laser2, 1, false);
		
		//Meu código de criar o tiro
		//Criar uma condição para atirar dependendo do level do tiro
		//Tiro do level 1:
		if(level_tiro == 1)
		{
			//Criando o primeiro tiro
			instance_create_layer(x, _y_height,"Tiros", obj_tiro_player);
		}
		//Tiro do level 2:
		else if(level_tiro == 2)
		{
			tiro2();
		}else if(level_tiro == 3)
		{
			instance_create_layer(x, _y_height,"Tiros", obj_tiro_player);
			tiro2();
		}else if(level_tiro == 4)
		{
			tiro4();
		}else if(level_tiro == 5)
		{
			tiro2();
			tiro4();
		}
	}
}

//Criando o sistema de power up do player:
///@method level_up(chance)
level_up = function(_chance)
{
if (_chance >= 90 && vida < 3)
{
	vida++;
}else if (_chance >= 80 && qtd_escudos < 3)
		{
			//Se ele tirar de 80 a 90, então ele recebe 1 escudo
			qtd_escudos++;
		}
		else if (_chance >= 60)
			{
				 //Aumentando o level do tiro SE o level do tiro for menor do que 5
				if(level_tiro < 5)
				{
					level_tiro++;
				}
				 //Se não, caso eu esteja já no level maximo, eu ganho pontos;
				else
				{
					//Checando se o controle existe
					if (instance_exists(obj_controle))
						{
							//Ganhar pontos
							ganhando_pontos(100);
						}
				}
				}else if (_chance >= 30)
					{
						if(espera_tiro > 20)
						{
							espera_tiro *= 0.9;
						}
						else
						{
							ganhando_pontos(10);	
						}
					}else
					{
						if(velocidade < 10)
						{
							velocidade += .5;
						}
						else
						{
							ganhando_pontos(10);	
						}
		}
}

///@method perde_vida();
perde_vida = function()
{
	//Só perco vida se meu escudo é noone
	if(!meu_escudo)
	{
		if(vida>0)
		{
		vida --;
		screenshake(5);
		}
		else //Eu morri ao levar o tiro
		{
			instance_destroy();
			screenshake(20);
		}
	}
}