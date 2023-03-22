/// @description Insert description here
// You can write your code in this editor

//Perdendo 1 de vida se eu ainda tenho vida
if (vida > 0)
{
	vida --;
	screenshake(5);
	//Diminuindo a transparencia
	if(image_alpha >= 0.7)
	image_alpha -= 0.08;
	//Aumentando o aumento da escala em 15%
	aumento_escala *= 1.15;
}
else
{
	instance_destroy();
}

//Destruindo o tiro
instance_destroy(other);