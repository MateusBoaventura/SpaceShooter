/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Checando se eu já passei do 1/3 da tela
if (y > room_height/3 && posso_me_mover_para_lado)
{
	//Checando de que lado da room eu estou
	if (x > room_width/3)
		{
			hspeed = -3
			posso_me_mover_para_lado = false;
		}
			else
			{
				hspeed = 3;
				posso_me_mover_para_lado = false;
			}
}