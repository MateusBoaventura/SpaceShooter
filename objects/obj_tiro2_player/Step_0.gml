/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*Mudando a direção depois que me movi x pixels
Ver qual era a minha posição inicial
xstart = posicao inicial do x
ystart = posicao inicial do y*/

//Checando se eu me movi 50 pixels para a direita
// ou checando se eu me movi 50 pixels para a esquerda
if (x > xstart + 40 || x < xstart - 40)
{
	//Eu devo inverter a minha velocidade horizontal
	hspeed *= -1;
}