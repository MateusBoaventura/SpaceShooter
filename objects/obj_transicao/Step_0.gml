/// @description Insert description here
// You can write your code in this editor

//Deixar a tela escura se eu ainda não troquei de room
if (!troquei_room)
{
	alpha += 0.015;
}
else
{
	//Troquei de room
	alpha -= 0.015;
}

if(alpha <= 0)
{
	instance_destroy();	
}

//Checar se a tela ta totalmente escura
//Mudar de room se eu ainda não troquei de room
if (alpha >= 1 && !troquei_room)
{
	room_goto(destino);
	troquei_room = true;
}