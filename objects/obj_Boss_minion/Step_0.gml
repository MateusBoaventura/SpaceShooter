/// @description Insert description here
// You can write your code in this editor

//Ficando visível em 1 segundo se eu ainda não estou visível E se...
//...o meu alarme ainda não rodou
if (image_alpha < 1 && primeiro_tiro == false)
{
	image_alpha += 1 / room_speed;
}

direction = point_direction(x, y, obj_Boss.x, obj_Boss.y);
image_angle = direction + 90;

//Aumetando a escala enquanto ela for menor do que 1.5
//Fazendo ele também inverter o sinal da escala se ela for menor do que 0.5
if (escala > 1.5 || escala < 1)
aumento_escala *= -1;

//Aumentando a escala pelo valor do aumento
escala += aumento_escala;