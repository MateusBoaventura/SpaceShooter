/// @description Desenhando um texto

//Desenhando um texto em mim
draw_self();
draw_set_color(c_black);
//Definindo a minha fonte
draw_set_font(fnt_botoes);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, texto);
draw_set_font(-1);
draw_set_color(c_white);
draw_set_halign(-1);
draw_set_valign(-1);