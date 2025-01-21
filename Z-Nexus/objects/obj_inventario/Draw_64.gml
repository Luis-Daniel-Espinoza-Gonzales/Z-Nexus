ranura_seleccionada = -1;

if(open){
    var espacio_x = 72;
    var espacio_y = 72;
    var columna = 2;

    // Obtener la posición de la cámara
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    // Usar las coordenadas de la GUI para el mouse
    var mouse_gui_x = device_mouse_x_to_gui(0);  // Posición X del mouse en términos de la GUI
    var mouse_gui_y = device_mouse_y_to_gui(0);  // Posición Y del mouse en términos de la GUI

    for(var i = 0; i < cantidad; i++){
		columna = 2;
        var posicion_x = 16 + (i mod columna) * espacio_x;
        var posicion_y = 112 + floor(i / columna) * espacio_y;

        var ancho_sprite = sprite_get_width(spr_ranura_inventario);
        var alto_sprite = sprite_get_height(spr_ranura_inventario);

        // Dibujar el sprite
		if(i < 4){
			columna = 4;
			posicion_x = 16 + (i mod columna) * espacio_x;
			posicion_y = 122;
			
			// Verificar si el mouse está encima de la ranura
	        if(mouse_gui_x > posicion_x && mouse_gui_x < posicion_x + ancho_sprite &&
	           mouse_gui_y > posicion_y && mouse_gui_y < posicion_y + alto_sprite){
	            draw_set_color(c_white);
	            draw_set_alpha(1);
	        } else {
	            draw_set_color(c_gray);
	            draw_set_alpha(0.5);
	        }
			
			if(i == 0){
				draw_sprite(spr_ranura_espada, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 1){
				draw_sprite(spr_ranura_distancia, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 2){
				draw_sprite(spr_ranura_escudo, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 3){
				draw_sprite(spr_ranura_herramienta, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			}
		} else {
			// Verificar si el mouse está encima de la ranura
	        if(mouse_gui_x > posicion_x && mouse_gui_x < posicion_x + ancho_sprite &&
	           mouse_gui_y > posicion_y && mouse_gui_y < posicion_y + alto_sprite){
	            draw_set_color(c_white);
	            draw_set_alpha(1);
	        } else {
	            draw_set_color(c_gray);
	            draw_set_alpha(0.5);
	        }
			draw_sprite(spr_ranura_inventario, 0, posicion_x, posicion_y);
			
			if (objetos[i][0] != 0) {	
	            var obj_sprite = objetos[i][0];
			    var obj_cantidad = objetos[i][1];
    
			    // Verificar si el sprite es válido
			    if (sprite_exists(obj_sprite)) {
					
			        var object_scale = 0.6;
			        var obj_width = sprite_get_width(obj_sprite);
			        var obj_height = sprite_get_height(obj_sprite);

			        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

			        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
			        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

			        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

			        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
			    }
			} 
		}
    }

    draw_set_color(c_white);
    draw_set_alpha(1);
} else {
	var espacio_x = 72;
    var espacio_y = 72;
    var columna = 2;

    // Obtener la posición de la cámara
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    // Usar las coordenadas de la GUI para el mouse
    var mouse_gui_x = device_mouse_x_to_gui(0);  // Posición X del mouse en términos de la GUI
    var mouse_gui_y = device_mouse_y_to_gui(0);  // Posición Y del mouse en términos de la GUI

    for(var i = 0; i < cantidad - 6; i++){
		columna = 2;
        var posicion_x = 16 + (i mod columna) * espacio_x;
        var posicion_y = 112 + floor(i / columna) * espacio_y;

        var ancho_sprite = sprite_get_width(spr_ranura_inventario);
        var alto_sprite = sprite_get_height(spr_ranura_inventario);

        // Dibujar el sprite
		if(i < 4){
			columna = 4;
			posicion_x = 16 + (i mod columna) * espacio_x;
			posicion_y = 122;
			
			// Verificar si el mouse está encima de la ranura
	        if(mouse_gui_x > posicion_x && mouse_gui_x < posicion_x + ancho_sprite &&
	           mouse_gui_y > posicion_y && mouse_gui_y < posicion_y + alto_sprite){
	            draw_set_color(c_white);
	            draw_set_alpha(1);
	        } else {
	            draw_set_color(c_gray);
	            draw_set_alpha(0.5);
	        }
			
			if(i == 0){
				draw_sprite(spr_ranura_espada, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 1){
				draw_sprite(spr_ranura_distancia, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 2){
				draw_sprite(spr_ranura_escudo, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			} else if(i == 3){
				draw_sprite(spr_ranura_herramienta, 0, posicion_x, posicion_y);
				
				if (objetos[i][0] != 0) {	
		            var obj_sprite = objetos[i][0];
				    var obj_cantidad = objetos[i][1];
    
				    // Verificar si el sprite es válido
				    if (sprite_exists(obj_sprite)) {
				        var object_scale = 0.6;
				        var obj_width = sprite_get_width(obj_sprite);
				        var obj_height = sprite_get_height(obj_sprite);

				        var scale = min(ancho_sprite / obj_width, alto_sprite / obj_height) * object_scale;

				        var obj_x = posicion_x + (ancho_sprite - (obj_width * scale)) / 2;
				        var obj_y = posicion_y + (alto_sprite - (obj_height * scale)) / 2;

				        draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);

				        draw_text(posicion_x + 45, posicion_y + 40, "x" + string(obj_cantidad));
				    }
				}
			}
		}
    }

    draw_set_color(c_white);
    draw_set_alpha(1);
}