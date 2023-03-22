/// @description Insert description here
// You can write your code in this editor
//Randomizando o jogo
randomize();

//Iniciando alarme
alarm[0] = room_speed;

//Iniciando o sistema de pontos
pontos = 0;

//Iniciando o sistema de leveis
level = 1;
proximo_level = 50;

//Variável de controle para invocar o boss
criar_boss = true;

level_completo = false;

//Criando um método para ganhar pontos
///@method ganhaPontos(pontos)
ganhaPontos = function(_pontos)
{
	pontos += _pontos * level;
	//Ganhando level se os pontos forem maior do que o proximo level
	if (pontos > proximo_level)
		{
			level++;
			proximo_level *= 2;
		}
}

//Criando o método para gerar inimigos
criando_inimigos = function()
{
	randomize();
	//Definindo a posição x e y do inimigo
	var _aparicaoX = irandom_range(64, room_width-64);
	//Aumentando o limite com base no level do jogo
	var _aparicaoY = irandom_range(-96, -1650 - (level * 800));

	//Criando o inimigo com base no level
	//A chance de criar um inimigo mais forte depende do level
	var _inimigo = obj_inimigo_polvo;
	var _chance = random_range(0, level);
	//Se o valor da chance for maior do que 2
	if (_chance > 2)
	{
		_inimigo = obj_inimigo_alien;
	}
	//Criando o inimigo na posição definida
	instance_create_layer(_aparicaoX, _aparicaoY, "Inimigos", _inimigo);	
}

//Variável de controle para o Game Over
gameover_seq = noone;