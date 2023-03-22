/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

//Alterando a velocidade
vspeed = 7;

//Achando a minha direção
//Checando se o Boss existe
if (instance_exists(obj_Boss))
{
	//Eu vou na direção dele
	direction = point_direction(x, y, obj_Boss.x, obj_Boss.y);
	//Olharem para o boss
	image_angle = direction + 90;
}