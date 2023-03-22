/// @description Insert description here
// You can write your code in this editor

//Criando o tiro
instance_create_layer(x, y, "Tiros", obj_tiro_minion_Boss);

//Reiniciando o alarme
alarm[0] = room_speed/2;

//Avisando que eu já sei o primeiro tiro
primeiro_tiro = true;