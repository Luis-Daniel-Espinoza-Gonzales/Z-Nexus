// Configuración inicial del inventario
open = false;
cantidad = 10;
objetos = array_create(cantidad);
distancia = 16;

// Inicializar cada slot vacío (0)
for (var i = 0; i < cantidad; i++) {
    objetos[i] = [0];
}

ranura_seleccionada = 0;
iluminado = false;
