/// @description Insert description here
// You can write your code in this editor

// Herdando o evento do pai (os códigos)
event_inherited();

//Definindo a minha velocidade
speed = 6;
//Checando se o player existe no jogo
//Achando a direção para onde eu devo ir e movendo para ela
if(instance_exists(obj_player))
{
	direction = point_direction(x, y, obj_player.x, obj_player.y);
}
image_angle = direction+90;