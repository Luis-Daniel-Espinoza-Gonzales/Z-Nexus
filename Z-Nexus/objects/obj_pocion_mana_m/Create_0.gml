player = instance_find(obj_personaje, 0);

indicador_index = 0; // Frame inicial
indicador_speed = 0.2; // Velocidad de animación

cantidad = 1;
max_cantidad = 16;

consumible = true;

tipo = consumible;

equipar = false;

nombre = "Pocion de mana mediano";

function usar(ranura) {
    var inventario = instance_find(obj_inventario, 0); // Busca el inventario
	
    if (inventario != noone) {
		
        if (player != noone) {
            if (player.cant_mana < player.mana_maxima) {
                player.cant_mana += 4;
                if (player.cant_mana > player.mana_maxima) {
                    player.cant_mana = player.mana_maxima;
                }

                // Reduce la cantidad de pociones en el inventario
                inventario.objetos[ranura][1] -= 1;

                // Si la cantidad llega a 0, vacía la ranura
                if (inventario.objetos[ranura][1] <= 0) {
                    inventario.objetos[ranura][0] = 0; // Vacía la ranura
					inventario.objetos[ranura][1] = 0;
					inventario.objetos[ranura][2] = 0;
					inventario.objetos[ranura][3] = 0;
					inventario.objetos[ranura][4] = 0;
					inventario.objetos[ranura][5] = 0; 
                }

                // Opcional: Feedback visual/sonoro
                show_debug_message("Poción consumida. Maná restaurada.");
            } else {
                show_debug_message("Ya tienes la vida completa.");
            }
        }
    }
}