right = 0;
left = 0;
up = 0;
down = 0;
run = 0;

velocidad = 4;

vida_maxima = 20;
cant_vida = vida_maxima - 19;

estamina_maxima = 20;
cant_estamina = estamina_maxima - 19;

mana_maxima = 20;
cant_mana = mana_maxima - 19;

horizontal = 0;
vertical = 0;

dir = 0;
x_to = 0;
y_to = 0;

angulo = 0;
multiplicador = 0;
new_dir = 0;

game_set_speed(60, 30); // 60 FPS Y 30 UPS globalmente
tiempo = 0;

tiempo_vida = 0;
tiempo_mana = 0;
tiempo_estamina = 0;

intervalo = 1 * 90;

last_dir = 1;

dano = 1;

equipo_corta = 0;
equipo_larga = 0;
equipo_escudo = 0;
equipo_herramienta = 0;