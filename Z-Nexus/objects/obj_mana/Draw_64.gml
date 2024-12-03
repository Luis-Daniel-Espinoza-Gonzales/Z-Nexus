var espacio = 16;

for(var i = 0; i < obj_personaje.mana_maxima; i++){

	if(i <= obj_personaje.cant_mana){
		draw_sprite(spr_mana, 0, 16 + espacio * i, 56);
	}

}

if (obj_personaje.cant_mana > obj_personaje.mana_maxima) {
    var exceso = obj_personaje.cant_mana - obj_personaje.mana_maxima;
    draw_text(340, 62, "+" + string(exceso));
}