/// @description Garantir que eu rodo depois do player
//Se não tiver alvo OU se a instancia do alvo não existe, se mata
if (!alvo || !instance_exists(alvo)) instance_destroy();

//Voce vai ter que ficar na mesma posição que seu alvo
//Conferir se o meu alvo existe no jogo
x = alvo.x;
y = alvo.y;


