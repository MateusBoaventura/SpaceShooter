/// @description Insert description here
// You can write your code in this editor

//Só faz isso tudo se eu não estou no estado 5 ou nas condições do estado 4
if(estado_atual != "estado 5" && estado_atual != "estado 4" || x == room_width/2)
{
	perde_vida();
}