// Obtener las coordenadas del mouse en el GUI
var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);

var columnas = 2;

var ancho_sprite = sprite_get_width(spr_ranura_inventario);
var alto_sprite = sprite_get_height(spr_ranura_inventario);

// Verificar si se hace clic izquierdo
if (mouse_check_button_pressed(mb_left)) {
    for (var i = 4; i < cantidad; i++) {
        var ranura_x = 16 + (i mod columnas) * ancho_sprite;
        var ranura_y = 112 + floor(i / columnas) * alto_sprite;

        // Verificar si el mouse está sobre esta ranura
        if (mouse_x_gui > ranura_x && mouse_x_gui < ranura_x + ancho_sprite &&
            mouse_y_gui > ranura_y && mouse_y_gui < ranura_y + alto_sprite) {
            
             // Si hay un objeto en la ranura
            if (objetos[i][0] != 0 && objetos[i][1] > 0) {
                var item_obj = objetos[i][2]; // Referencia al objeto

                // Verificar que no sea null y que tenga el método `usar`
		        if (item_obj != undefined && is_callable(item_obj)) {
		            item_obj(i); // Llama al método `usar` del objeto
		        } else {
		            show_debug_message("El objeto no tiene una función 'usar'.");
		        }
            }
            break; // Salir del bucle al encontrar la ranura correcta
        }
    }
}

// Verificar si se hace clic derecho
if (mouse_check_button_pressed(mb_right)) {
    for (var i = 4; i < cantidad; i++) {
        var ranura_x = 16 + (i mod columnas) * ancho_sprite;
        var ranura_y = 112 + floor(i / columnas) * alto_sprite;

        // Verificar si el mouse está sobre esta ranura
        if (mouse_x_gui > ranura_x && mouse_x_gui < ranura_x + ancho_sprite &&
            mouse_y_gui > ranura_y && mouse_y_gui < ranura_y + alto_sprite) {
            
            // Si hay un objeto en la ranura
            if (objetos[i][0] != 0 && objetos[i][1] > 0) {
                var obj_cantidad = objetos[i][1];

                // Eliminar el objeto
                if (obj_cantidad > 1) {
                    objetos[i][1] -= 1; // Reducir la cantidad
                } else {
                    objetos[i][0] = 0;  // Vaciar la ranura si solo quedaba un objeto
                    objetos[i][1] = 0;
                    objetos[i][2] = noone; // Eliminar referencia al objeto
                }
                show_debug_message("Objeto eliminado de la ranura " + string(i));
            }
            break; // Salir del bucle al encontrar la ranura correcta
        }
    }
}
