// Obtener las coordenadas del mouse en el GUI
var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);

var columnas = 2;

var ancho_sprite = sprite_get_width(spr_ranura_inventario);
var alto_sprite = sprite_get_height(spr_ranura_inventario);

if (mouse_check_button_pressed(mb_left)) {
	for (var i = 4; i < cantidad; i++) {
		show_debug_message(objetos);
		
		if(objetos[i][3] == 1){
		    var ranura = determinar_ranura(mouse_x_gui, mouse_y_gui); // Determina qué ranura se clickeó
			
			show_debug_message(ranura);
			
			if(ranura >= 0 && objetos[ranura][0] != 0){
				var objeto_sprite = objetos[ranura][0];		// Sprite del objeto
			    var uso_objeto = objetos[ranura][2];		// Uso del objeto
				var consumir_objeto = objetos[ranura][3];	// Consumir objeto true o false
				var tipo_objeto = objetos[ranura][4];		// Tipo de objeto
			    var cantidad_objeto = objetos[ranura][1];	// Cantidad de un objeto
				
				if (uso_objeto != undefined && is_callable(uso_objeto)) {
				    uso_objeto(ranura); // Llama al método `usar` del objeto
				} else {
				    show_debug_message("El objeto no tiene una función 'usar'.");
				}
			}
			
		} else {
			var ranura = determinar_ranura(mouse_x_gui, mouse_y_gui); // Determina qué ranura se clickeó
		
			show_debug_message(ranura);
		
			if (ranura >= 0 && objetos[ranura][0] != 0) { // Si hay un objeto en la ranura clickeada
			    var objeto_sprite = objetos[ranura][0];		// Sprite del objeto
			    var uso_objeto = objetos[ranura][2];		// Uso del objeto
				var consumir_objeto = objetos[ranura][3];	// Consumir objeto true o false
				var tipo_objeto = objetos[ranura][4];		// Tipo de objeto
			    var cantidad_objeto = objetos[ranura][1];	// Cantidad de un objeto

			    // Si el tipo es "corta"
			    if (tipo_objeto == "corta" && objetos[0][0] == 0) {
			        if (objetos[0][0] != 0) {
			            // Desequipar lo que ya está en la ranura 1
			            objetos[0][0] = 0;
			            objetos[0][2] = 0;
						objetos[0][3] = noone;
						objetos[0][4] = "";
			        }

			        // Mover el objeto a la ranura 1
			        objetos[0][0] = objeto_sprite;
			        objetos[0][1] = cantidad_objeto;
			        objetos[0][2] = uso_objeto;
					objetos[0][3] = consumir_objeto;
					objetos[0][4] = tipo_objeto

			        // Vaciar la ranura original
			        objetos[ranura][0] = 0;
			        objetos[ranura][1] = 0;
			        objetos[ranura][2] = 0;
					objetos[ranura][3] = 0;
					objetos[ranura][4] = 0;

			        show_debug_message("Espada equipada en la ranura 1.");
					show_debug_message("spr_dummy index: " + string(asset_get_index("spr_dummy")));
			    } else if(tipo_objeto == "larga" && objetos[1][0] == 0) {
			        if (objetos[1][0] != 0) {
			            // Desequipar lo que ya está en la ranura 1
			            objetos[1][0] = 0;
			            objetos[1][2] = 0;
						objetos[1][3] = noone;
						objetos[1][4] = "";
			        }

			        // Mover el objeto a la ranura 2
			        objetos[1][0] = objeto_sprite;
			        objetos[1][1] = cantidad_objeto;
			        objetos[1][2] = uso_objeto;
					objetos[1][3] = consumir_objeto;
					objetos[1][4] = tipo_objeto

			        // Vaciar la ranura original
			        objetos[ranura][0] = 0;
			        objetos[ranura][1] = 0;
			        objetos[ranura][2] = 0;
					objetos[ranura][3] = 0;
					objetos[ranura][4] = 0;

			        show_debug_message("Arco equipada en la ranura 2.");
			    } else if(tipo_objeto == "escudo" && objetos[2][0] == 0) {
			        if (objetos[2][0] != 0) {
			            // Desequipar lo que ya está en la ranura 1
			            objetos[2][0] = 0;
			            objetos[2][2] = 0;
						objetos[2][3] = noone;
						objetos[2][4] = "";
			        }

			        // Mover el objeto a la ranura 3
			        objetos[2][0] = objeto_sprite;
			        objetos[2][1] = cantidad_objeto;
			        objetos[2][2] = uso_objeto;
					objetos[2][3] = consumir_objeto;
					objetos[2][4] = tipo_objeto

			        // Vaciar la ranura original
			        objetos[ranura][0] = 0;
			        objetos[ranura][1] = 0;
			        objetos[ranura][2] = 0;
					objetos[ranura][3] = 0;
					objetos[ranura][4] = 0;

			        show_debug_message("Escudo equipado en la ranura 3|.");
			    } else if(tipo_objeto == "herramienta" && objetos[3][0] == 0) {
					if(objetos[3][0] != 0) {
						// Desequipar lo que ya está en la ranura 1
			            objetos[3][0] = 0;
			            objetos[3][2] = 0;
						objetos[3][3] = noone;
						objetos[3][4] = "";
					}
					
					// Mover el objeto a la ranura 3
			        objetos[3][0] = objeto_sprite;
			        objetos[3][1] = cantidad_objeto;
			        objetos[3][2] = uso_objeto;
					objetos[3][3] = consumir_objeto;
					objetos[3][4] = tipo_objeto

			        // Vaciar la ranura original
			        objetos[ranura][0] = 0;
			        objetos[ranura][1] = 0;
			        objetos[ranura][2] = 0;
					objetos[ranura][3] = 0;
					objetos[ranura][4] = 0;

			        show_debug_message("Arco equipada en la ranura 2.");
				}
			}
		}
	}
}
	
// Verificar si se hace clic derecho
// Elimina objeto del inventario
if (mouse_check_button_pressed(mb_right)) {
	for (var i = 4; i < cantidad; i++) {
	    var ranura = determinar_ranura(mouse_x_gui, mouse_y_gui); // Determina qué ranura se clickeó
		
		show_debug_message(ranura);
            
		// Si hay un objeto en la ranura
		if (ranura >= 0 && objetos[ranura][0] != 0) {
			
			var objeto_sprite = objetos[ranura][0];		// Sprite del objeto
			var uso_objeto = objetos[ranura][2];		// Uso del objeto
			var consumir_objeto = objetos[ranura][3];	// Consumir objeto true o false
			var tipo_objeto = objetos[ranura][4];		// Tipo de objeto
			var cantidad_objeto = objetos[ranura][1];	// Cantidad de un objeto

		    // Eliminar el objeto
		    if (cantidad_objeto > 1) {
		        objetos[i][1] -= 1; // Reducir la cantidad
		    } else {
		        // Vaciar la ranura original
				objetos[ranura][0] = 0;
				objetos[ranura][1] = 0;
				objetos[ranura][2] = 0;
				objetos[ranura][3] = 0;
				objetos[ranura][4] = 0;
		    }
		    show_debug_message("Objeto eliminado de la ranura " + string(ranura));
		}
		break; // Salir del bucle al encontrar la ranura correcta
	    
	}
}
