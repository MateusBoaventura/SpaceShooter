/// @description Insert description here
// You can write your code in this editor

instance_create_layer(x, y, "Tiros", obj_exposao_inimigo);

//Rodando o método de ganhar pontos apenas se objeto controle existir
ganhando_pontos(pontos);

//Dropando o item
dropa_item(chance);

//Criando o screenshake
screenshake(10);

//Aumentando o número de inimigos mortos
global.total_inimigos++;