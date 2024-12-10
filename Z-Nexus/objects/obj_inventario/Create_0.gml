// Configuración inicial del inventario
open = false;
cantidad = 10;
objetos = array_create(cantidad);
distancia = 16;

inventario_lleno = false;

// Inicializar cada slot vacío (0)
for (var i = 0; i < cantidad; i++) {
    objetos[i] = [0];
}

ranura_seleccionada = 0;
iluminado = false;

player = instance_find(obj_personaje, 0);

function agregar_objeto(objeto){
	for(var i = 4; i < cantidad; i++){
		if(objetos[i][0] == 0){
			objetos[i][0] = objeto.sprite_index;
			objetos[i][1] = objeto.cantidad;
			
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
	}
	
	inventario_lleno = true;
	
}
