/// @description Insert description here
// You can write your code in this editor

//Pegando a altura da nossa gui (o que mostra na tela)
var _altura_gui = display_get_gui_height();

//Desenhando uma navezinha para a vida
//Desenhar a quantidade de naves representando a quantidade de vida que eu tenho
//Repetindo o desenho na quantidade de vida que eu tenho
//Desenhando uma vida do lado da outra
var _multiplicador = 0;
var _espaco = 40;
repeat(vida)
{
	//Primeira fica no x 40, segunda no 40+20, terceira 40+40
	//1 = 40 + 20 * 0 = 40;
	//2 = 40 + 20 * 1 = 60;
	//3 = 40 + 20 * 2 = 80;
	draw_sprite_ext(spr_player, 0, 40 + _espaco*_multiplicador, _altura_gui - 55, 0.3, 0.3, 0, c_white, .3);
	//Depois de desenhar, aumente o valor do multiplicador;
	_multiplicador++;
}

//Resetando o valor do multiplicador
_multiplicador = 0;

repeat(qtd_escudos)
{
	//Desenhando os escudos
	draw_sprite_ext(spr_escudo, 2, 40 + _espaco * _multiplicador, _altura_gui - 100, 0.3, 0.3, 0, c_white, .3);
	_multiplicador++;
}