right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
up = keyboard_check(ord("W")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
run = keyboard_check(vk_shift);

if(cant_mana < mana_maxima){
	tiempo += 1;
	if(tiempo >= intervalo * 5){
		cant_mana += 1;
		tiempo = 0;
	}
}

if(run && cant_estamina >= 0){
	velocidad = 8;
	image_speed = 2;
	tiempo += 1;
	if(tiempo >= intervalo * 1){
		cant_estamina -= 1;
		tiempo = 0;
	}
} else {
	velocidad = 4;
	image_speed = 1
	tiempo += 1;
	if(cant_estamina < estamina_maxima){
		if(tiempo >= intervalo * 2){
			cant_estamina += 1;
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

if (mouse_check_button_pressed(mb_right)) {
    var click_x = mouse_x;
    var click_y = mouse_y;
    var clicked_object = noone;

    // Itera sobre todas las instancias de objetos activos
    with (all) {
        // Verifica si el clic está dentro de los límites del objeto
        if (point_in_rectangle(click_x, click_y, x, y, x + sprite_width, y + sprite_height)) {
            clicked_object = id;
            break; // Detener la búsqueda después de encontrar el primer objeto clickeado
        }
    }

    // Si se encuentra un objeto, muestra el nombre
    if (clicked_object != noone) {
        // Usa 'object_index' para obtener el objeto y luego su nombre
        show_debug_message("Has hecho clic en el objeto: " + string(object_get_name(clicked_object.object_index)));
		
		// Comprobar si la variable 'cant_vida' está definida en el objeto
        /*
		if (variable_instance_exists(clicked_object, "cant_vida")) {
            // Si la variable 'cant_vida' está definida, puedes modificarla
            clicked_object.cant_vida -= 5;  // Ejemplo: Disminuir vida en 5
        } else {
            // Si la variable 'cant_vida' no está definida, maneja el caso apropiadamente
            show_debug_message("El objeto no tiene la variable 'cant_vida'.");
        }
		*/
    }
}