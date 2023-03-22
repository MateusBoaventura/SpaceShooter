/// @description Info Boss

//Convertendo o valor da vida atual do Boss em um número entre 0 e 100
//Vida atual divido por vida max vai retornar um valor entre 0 e 1 enquanto vida atual for menor ou igual do que vida max
//Depois ao multiplicar esse resultado por 100, recebe um valor entre 100 e 0
var _vida = (vida_atual / vida_max) * 100;
//Desenhando a barra de vida
draw_healthbar(200, 20, 1080, 30, _vida, c_black, c_red, c_lime, 0, false, true);
