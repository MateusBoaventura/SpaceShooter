/// @description Insert description here
// You can write your code in this editor
randomize();
//Criando uma chance entre 0 e 100 para ele decidir qual vai ser o upgrade
chance = irandom(100); //Chance vai ficar entre 0 e 100

//Se o valor de chance for 90 ou mais, ela cria o power up do tiro;
//Se o valor de chance for 45 ou mais e menor que 90, ela cria o power up da velocidade;
//Se não, ela cria o power up do espera_tiro

//Se destruindo caso se encontre com outro power_up quando surgir
if(place_meeting(x, y, obj_power_up))
{
	//Não executando o efeito destroy
	instance_destroy(id, false);
}

//Fazendo ele se mover
speed = 2;
direction = irandom(359);

//Dependendo da chance, ele vai ter uma cor diferente;
if (chance >= 90) cor = c_navy;
else if (chance >= 80) cor = c_teal;
else if (chance >= 60) cor = c_red;
else if (chance >= 30) cor = c_yellow;
else cor = c_lime;

//Iniciando o alarme
alarm[0] = room_speed;