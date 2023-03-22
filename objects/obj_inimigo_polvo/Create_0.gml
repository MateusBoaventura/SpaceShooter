/// @description Criando velocidade
randomize();
vspeed = 3;

//Chance de dropar o item é = 10%
chance = 30;

inimigoAtirando = function()
{
	if (y >= 0)
	{
		instance_create_layer(x-3, y+sprite_height/3, "Tiros", obj_tiro_inimigo_polvo);
		//Som do tiro
		audio_play_sound(sfx_laser1, 1, false);
	}
}

randomize();
//Iniciando o alarme com um tempo aleatorio
alarm[0] = random_range(1, 3)*room_speed;

//Checando se eu estou colidindo com algum outro inimigo
if(place_meeting(x, y, obj_inimigo_polvo))
{
	//Não executando o efeito destroy
	instance_destroy(id, false);
}

pontos = 10;

///@method dropa_item(chance)
dropa_item = function(_chance)
{
	var _valor = random(100);
	if (_valor < chance && y > 96)
		{
			instance_create_layer(x, y, "Tiros", obj_power_up);
		}
}