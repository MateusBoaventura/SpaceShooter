/// @description Insert description here
// You can write your code in this editor

//Movendo a tela
//Tremendo os lados (o view_xport está 0 pq é a viewport que estou usando)
view_xport[0] = random_range(-shake, shake);
//Tremendo para cima e para baixo
view_yport[0] = random_range(-shake, shake);

//Diminuindo o valor do screenshake
//Ele perde 5% por step
shake *= .9;

if (shake < 0.5) instance_destroy();