sprite_index = spr_pocion_estamina;
image_alpha = 1;

if (distance_to_object(player) < 32) { 
    if (keyboard_check_pressed(ord("R"))) {
        var inventario = instance_find(obj_inventario, 0); // Busca la primera instancia de ObjInventario
        if (inventario != noone) {
            inventario.agregar_objeto(id); // Llama a la función pasando la instancia del objeto
        }
    }
}

indicador_index += indicador_speed;
if (indicador_index >= sprite_get_number(spr_indicador)) {
    indicador_index = 0; // Reinicia la animación cuando alcance el último frame
}