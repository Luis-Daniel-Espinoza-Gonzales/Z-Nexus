right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
up = keyboard_check(ord("W")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
run = keyboard_check(vk_shift);

if(cant_mana < mana_maxima){
	tiempo ++;
	if(tiempo >= intervalo * 5){
		cant_mana ++;
		tiempo = 0;
	}
}

if(run && cant_estamina >= 0){
	velocidad = 8;
	image_speed = 2;
	tiempo ++;
	if(tiempo >= intervalo * 1){
		cant_estamina --;
		tiempo = 0;
	}
} else {
	velocidad = 4;
	image_speed = 1
	tiempo ++;
	if(cant_estamina < estamina_maxima){
		if(tiempo >= intervalo * 2){
			cant_estamina ++;
			tiempo = 0;
		}
	}
}

horizontal = right - left;
vertical = down - up;

if (horizontal != 0 || vertical != 0) {
    dir = point_direction(0, 0, horizontal, vertical);

    var moved = false; // Bandera para evitar múltiples movimientos
    for (angulo = 0; angulo <= 60; angulo += 10) {
        for (multiplicador = -1; multiplicador <= 1; multiplicador += 2) {
            new_dir = dir + angulo * multiplicador;
            x_to = x + lengthdir_x(velocidad, new_dir);
            y_to = y + lengthdir_y(velocidad, new_dir);

            if (place_free(x_to, y_to)) {
                x = x_to;
                y = y_to;
                moved = true;
                break;
            }
        }
        if (moved) break; // Salir del bucle completamente
    }
	// Cambiar el sprite según la dirección de movimiento
    if (horizontal > 0) {
        sprite_index = spr_personaje_right;  // Moverse a la derecha
		last_dir = 1;
    } else if (horizontal < 0) {
        sprite_index = spr_personaje_left;   // Moverse a la izquierda
		last_dir = -1;
	} else if (vertical > 0) {
		if (last_dir == 1) {
		sprite_index = spr_personaje_right;
		} else if (last_dir == -1) {
		sprite_index = spr_personaje_left;
		}
	} else if (vertical < 0) {
		if (last_dir == 1) {
		sprite_index = spr_personaje_right;
		} else if (last_dir == -1) {
		sprite_index = spr_personaje_left;
		}	
	}
} else {
	if (last_dir == 1) {
		sprite_index = spr_personaje_idle_right;
	} else if (last_dir == -1) {
		sprite_index = spr_personaje_idle_left;
	}
}