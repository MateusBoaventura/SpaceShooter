/// @description Movimentos e afins

var _up, _down, _left, _right, _shield;
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_left = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));
_shield = keyboard_check_pressed(ord("E"));

//Movendo x e y com base no resultado da conta para saber o eixo correto
x += (_right - _left) * velocidade;
y += (_down - _up) * velocidade;

//Impedindo o player de sair da tela
//A função clamp vai checar se tal variável está dentro do intervalo, uma vez que sair ele avisa "deu problema!"
//Enquanto minha variável estiver dentro do intervalo, ele n faz nada, se ele sair, ele volta minha variável pra lá
x = clamp(x, 64, 1856);
y = clamp(y, 64, 1024);

//Criando o tiro
atirando();

//Criando o escuro se a quantidade for maior que 0 e se não tem nenhum escudo criado
if (_shield && qtd_escudos > 0 && !instance_exists(obj_escudo))
{
	var _escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
	//Eu sou o seu alvo
	_escudo.alvo = id;
	//Avisando que esse escudo é meu escudo
	meu_escudo = _escudo;
	//Diminuindo a quantidade de escudos
	qtd_escudos--;
}