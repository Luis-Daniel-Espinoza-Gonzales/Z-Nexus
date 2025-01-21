player = instance_find(obj_personaje, 0);

indicador_index = 0; // Frame inicial
indicador_speed = 0.2; // Velocidad de animación

cantidad = 1;
max_cantidad = 1;

consumible = false;
tipo = "corta";

equipar = false;

nombre = "Tormenta gelida";

function usar(ranura) {
    var inventario = instance_find(obj_inventario, 0); // Busca el inventario
	
    if (inventario != noone) {
		
        if (player != noone) {
			
			if(player.equipo_corta == noone){
				player.equipo_corta = instance_create_layer(player.x, player.y, "arma corta", obj_espada_basica);
			}

            inventario.objetos[ranura][0] = 0; // Vacía la ranura, sprite del objeto
			inventario.objetos[ranura][2] = 0; // Vacía la ranura, metodo del objeto
            
        }
    }
}