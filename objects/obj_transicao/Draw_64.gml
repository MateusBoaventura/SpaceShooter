/// @description Insert description here
// You can write your code in this editor

//Escurecendo a tela

//Pegando informações da GUI
var _x2 = display_get_gui_width();
var _y2 = display_get_gui_height();

//Desenhando o meu retangulo com o valor do meu alpha
draw_set_alpha(alpha)

//Deixando o retangulo preto
draw_set_color(c_black);

//Desenhando um retangulo preto na tela

draw_rectangle(0, 0, _x2, _y2, false); //Ele é false pq eu quero que ele preencha toda a tela;

draw_set_alpha(1);
draw_set_color(c_white);
