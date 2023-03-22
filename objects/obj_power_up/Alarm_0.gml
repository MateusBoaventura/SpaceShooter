/// @description Insert description here
// You can write your code in this editor

//Diminuir o alpha em .1% e depois repetir o alarme em 1 segundo;
image_alpha -= .1;

//Me destruindo se meu alpha for menor ou igual a .5
if (image_alpha <= .3)
{
	instance_destroy(id, false);	
}

alarm[0] = room_speed;
