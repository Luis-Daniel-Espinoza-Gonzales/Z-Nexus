var espacio = 16;

for(var i = 0; i < obj_personaje.estamina_maxima; i++){

	if(i <= obj_personaje.cant_estamina){
		draw_sprite(spr_estamina, 0, 16 + espacio * i, 64);
	}

}

if (obj_personaje.cant_estamina > obj_personaje.estamina_maxima) {
    var exceso = obj_personaje.cant_estamina - obj_personaje.estamina_maxima;
    draw_text(340, 62, "+" + string(exceso));
}
