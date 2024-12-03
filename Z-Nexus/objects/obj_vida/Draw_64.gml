var espacio = 16;

for(var i = 0; i < obj_personaje.vida_maxima; i++){

	if(i <= obj_personaje.cant_vida){
		draw_sprite(spr_vida, 0, 16 + espacio * i, 16);
	}

}