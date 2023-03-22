/// @description Insert description here
// You can write your code in this editor

//Desenhando o objeto
draw_self();

//Fazendo a placa de video fazer uma mistura entre nossa imagem e seu brilho
gpu_set_blendmode(bm_add);
//Código de desenhar o brilho
//Desenhando o brilho
draw_sprite_ext(brilho, image_index, x, y, image_xscale *.7, image_yscale *.7, image_angle, cores, 0.5);
//Voltando ao normal
gpu_set_blendmode(bm_normal);