from .modulos.juegos import Juegos
from .modulos.peliculas import Peliculas
from .modulos.series import Series


class Blockbuster:
    def __init__(self):
        self.productos = []

    # Esto es una acción interna
    def guardar(self, producto):
        self.productos.append(producto)

    def listar_productos(self):
        for producto in self.productos:
            print(producto.get_info())
