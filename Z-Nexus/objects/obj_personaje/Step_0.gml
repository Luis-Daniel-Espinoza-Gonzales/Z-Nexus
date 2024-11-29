right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
up = keyboard_check(ord("W")) || keyboard_check(vk_up);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);

horizontal = right - left;
vertical = down - up;

if (horizontal != 0 || vertical != 0){
	dir = point_direction(0, 0, horizontal, vertical);
	for(angulo = 0; angulo < 60; angulo += 10){
		for(multiplicador = -1; multiplicador <= 1; multiplicador += 2){
			new_dir = dir + angulo * multiplicador;
			x_to = x + lengthdir_x(velocidad, new_dir);
			y_to = y + lengthdir_y(velocidad, new_dir);	
			
			if (place_free(x_to, y_to)){
				x = x_to;
				y = y_to;
			}
		}
	}
}