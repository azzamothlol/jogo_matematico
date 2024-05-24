//calcular input do player 1
var _xmove = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ymove = keyboard_check(ord("S")) - keyboard_check(ord("W"));
//calcular velocidade em geral 
if (_xmove != 0) or (_ymove != 0){
	velocidade = clamp(velocidade + aceleracao , 0, velocidade_maxima);
}else{
	velocidade = clamp(velocidade - friccao, 0, velocidade_maxima)
}
var _velocidade_x = _xmove * velocidade;
var _velocidade_y = _ymove * velocidade;
//colisao foda e sensacional
if (place_meeting(x + _velocidade_x, y, obj_colisao)){
	while(!place_meeting(x + sign(_velocidade_x), y, obj_colisao)){
		x = x + sign(_velocidade_x);
	}
	_velocidade_x = 0;
}
if (place_meeting(x , y + _velocidade_y, obj_colisao)){
	while(!place_meeting(x , y + sign(_velocidade_y), obj_colisao)){
		y = y + sign(_velocidade_y);
	}
	_velocidade_y = 0;
}
if (_velocidade_y != 0) and (_velocidade_x != 0){
	var _direcao = point_direction(x, y, x + _velocidade_x, y + _velocidade_y);
	show_debug_message(_direcao);
	_velocidade_x = lengthdir_x(velocidade, _direcao);
	_velocidade_y = lengthdir_y(velocidade, _direcao);
}
x = x + _velocidade_x;
y = y + _velocidade_y;