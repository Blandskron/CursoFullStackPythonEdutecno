from modulos.juegos import Juegos
from modulos.peliculas import Peliculas
from modulos.series import Series
from modulos.usuario import Usuario

class Blockbuster:
    def __init__(self):
        self.productos = []

    # esto es una accion interna
    def guardad(self, producto):
        self.productos.append(producto)

    # accion interna
    def listar_productos():
        pass
    