/// @description Insert description here
// You can write your code in this editor

//Iniciando alarme
alarm[0] = room_speed;

//Começando invisível
image_alpha = 0;

primeiro_tiro = false;

//Iniciando vida
vida = 10;

escala = 1;
aumento_escala = 0.01;

//Checando se eu colidi com outro minion
if (place_meeting(x, y, obj_Boss_minion))
{
	//Se eu colidir com outro minion, eu subo 128 pixels
	y -= 128;
}