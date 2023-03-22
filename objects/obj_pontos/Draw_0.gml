/// @description Insert description here
// You can write your code in this editor


//Definindo a fonte
draw_set_font(fnt_pontos);

//Variável segurando o valor dos pontos
var _pontos = round(pontos);

//Desenhando pontos
draw_text(120, 200, "Maior pontuacao: " + string(_pontos));
//Desenhando mortes de inimigos
draw_text(120, 350, "Inimigos mortos: " + string(global.total_inimigos));
//Desenhando mortes do player
draw_text(120, 500, "Total de mortes: " + string(global.total_mortes));
	
//Resetando a fonte
draw_set_font(-1);

//Fazendo pontos chegar até o valor do max pontos
//Se pontos for menor do que max pontos, eu aumento o valor dele
//Nao vamos usar o lerp pq fica sem graça
//Pegando 5% do max pontos e adicionando esse valor em pontos enquanto ele...
//...for menor do que max pontos
if (pontos < global.max_pontos)
{
	//Aumentando o valor de pontos em meio porcento do max pontos
	var _incrementa_pontos = global.max_pontos * 0.005; //é meio porcento do max pontos
	pontos += _incrementa_pontos;
}