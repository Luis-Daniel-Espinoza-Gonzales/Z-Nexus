// Evento Dibujar (Draw) del objeto poción (o cualquier ítem)
draw_self(); // Dibuja el objeto por defecto (el sprite del ítem)
image_speed = 0.2;

// Verifica si el jugador está cerca para mostrar el sprite "presiona E"
if (distance_to_object(player) < 32) {
    var indicador = spr_indicador; // El sprite de "presiona E"
    
    // Ajuste de posición para centrarlo y colocarlo más arriba del objeto
    var e_x = x + (sprite_width / 2) - (sprite_get_width(indicador) / 2); // Centrado horizontalmente
    var e_y = y - sprite_height - 10; // Un poco más arriba del objeto (ajustable con -10)

    // Dibujar el sprite de "presiona E" centrado y más arriba
    draw_sprite(indicador, floor(indicador_index), e_x, e_y);
}