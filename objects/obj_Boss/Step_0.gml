/// @description Insert description here
// You can write your code in this editor

//Checando se eu não estou no estado 4
if(estado_atual != "estado 5")
{
	//Usando a sprite original
	sprite_index = spr_boss_combate;
}

mudar_estado();

//Iniciando o estado 1
if (estado_atual == "estado 1")
{
	estado_01();
}
else if(estado_atual == "estado 2")
{
	estado_02();
	
}
else if(estado_atual == "estado 3")
{
	estado_03();
}
else if(estado_atual == "estado 4")
{
	estado_04();
}
else if(estado_atual == "estado 5")
{
	estado_05();
}