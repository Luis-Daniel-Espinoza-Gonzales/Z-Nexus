// Configuración inicial del inventario
open = false;
cantidad = 10;
objetos = array_create(cantidad);
distancia = 16;

inventario_lleno = false;

// Inicializar cada slot vacío (0)
for(var i = 0; i < cantidad; i++) {
    objetos[i] = [0, 0, 0, 0, 0, 0];
}

ranura_seleccionada = -1;
iluminado = false;

player = instance_find(obj_personaje, 0);

consumir = 0;
tipo_objeto = 0;

function agregar_objeto(objeto, consumible, tipo, equipa){
	consumir = consumible;

	for(var i = 4; i < cantidad; i++){
		
		if(consumir){
			if(objetos[i][0] == 0){
				objetos[i][0] = objeto.sprite_index;
				objetos[i][1] = objeto.cantidad;
				objetos[i][2] = objeto.usar;
				objetos[i][3] = objeto.consumible;
				objetos[i][4] = objeto.tipo;
				objetos[i][5] = objeto.nombre;
			
				instance_destroy(objeto);
				return;
			} else if(objetos[i][0] == objeto.sprite_index && objetos[i][1] < objeto.max_cantidad){
				var cantidad_actual = objetos[i][1];
				var cantidad_agregar = objeto.cantidad;
				var nueva_cantidad = cantidad_actual + cantidad_agregar;
			
				if(nueva_cantidad <= objeto.max_cantidad){
					objetos[i][1] = nueva_cantidad;
					instance_destroy(objeto);
					return;
				} else {
					objetos[i][1] = objeto.max_cantidad;
					objeto.cantidad = nueva_cantidad - objeto.max_cantidad;
				}
			}
		} else {
			if(tipo == "corta"){
				if(objetos[i][0] == 0){
					objetos[i][0] = objeto.sprite_index;
					objetos[i][1] = objeto.cantidad;
					objetos[i][2] = objeto.usar;
					objetos[i][3] = objeto.consumible;
					objetos[i][4] = objeto.tipo;
					objetos[i][5] = objeto.nombre;
			
					instance_destroy(objeto);
					return;
				}
				
			} else if(tipo == "larga"){
				if(objetos[i][0] == 0){
					objetos[i][0] = objeto.sprite_index;
					objetos[i][1] = objeto.cantidad;
					objetos[i][2] = objeto.usar;
					objetos[i][3] = objeto.consumible;
					objetos[i][4] = objeto.tipo
			
					instance_destroy(objeto);
					return;
				}
			} else if(tipo == "escudo"){
				if(objetos[i][0] == 0){
					objetos[i][0] = objeto.sprite_index;
					objetos[i][1] = objeto.cantidad;
					objetos[i][2] = objeto.usar;
					objetos[i][3] = objeto.consumible;
					objetos[i][4] = objeto.tipo
			
					instance_destroy(objeto);
					return;
				}
			} else if(tipo == "herramienta"){
				if(objetos[i][0] == 0){
					objetos[i][0] = objeto.sprite_index;
					objetos[i][1] = objeto.cantidad;
					objetos[i][2] = objeto.usar;
					objetos[i][3] = objeto.consumible;
					objetos[i][4] = objeto.tipo
			
					instance_destroy(objeto);
					return;
				}
			}
		}
	}
	
	inventario_lleno = true;
}

columnas = 2;

ancho_sprite = sprite_get_width(spr_ranura_inventario);
alto_sprite = sprite_get_height(spr_ranura_inventario);

espacio_x = 72;
espacio_y = 72;

posicion = 0;

function determinar_ranura(mouse_x_gui, mouse_y_gui) {
    for (var i = 0; i < cantidad; i++) {
		
		columnas = 2;
		
        var ranura_x = 16 + (i mod columnas) * espacio_x;
        var ranura_y = 112 + floor(i / columnas) * espacio_y;
		
		if (i < 4) {
			columnas = 4;
			ranura_x = 16 + (i mod columnas) * espacio_x;
			ranura_y = 122;
		}

        if (mouse_x_gui > ranura_x && mouse_x_gui < ranura_x + ancho_sprite &&
            mouse_y_gui > ranura_y && mouse_y_gui < ranura_y + alto_sprite) {
            posicion = i;
			return posicion; // Devuelve el índice de la ranura clickeada
        }
    }
    return -1; // No se encontró ninguna ranura
}
