/// @description Diminuindo a escala do tiro

/*lerp é uma função de aproximação, eu faço o meu valor chegar em outro por
uma porcentagem.
lerp (valor que eu tenho, valor para chegar, porcentagem de aproximação)
Fazendo meu valor xscale chegar ao valor original que é 1*/
image_xscale = lerp(image_xscale, 1, 0.3);
image_yscale = lerp(image_yscale, 1, 0.3);