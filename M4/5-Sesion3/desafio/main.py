from modulo.blockbuster import Blockbuster
from modulo.cliente import Cliente
from modulo.modulos.juegos import Juegos
from modulo.modulos.peliculas import Peliculas
from modulo.modulos.series import Series

def main():
    # Instanciar Blockbuster y Cliente
    blockbuster = Blockbuster()
    cliente1 = Cliente("Juan", "Pérez", 30, "12345678-9", "Calle Falsa 123", "C001")

    # Crear productos
    juego1 = Juegos("The Legend of Zelda", "Nintendo Switch", "Aventura", 2017, "E")
    pelicula1 = Peliculas("Inception", "Christopher Nolan", "Ciencia Ficción", 2010, 148, "PG-13")
    serie1 = Series("Breaking Bad", "Vince Gilligan", "Drama", 2008, 62, 5, "TV-MA")

    # Cliente arrienda productos
    cliente1.arrendar(juego1, blockbuster)
    cliente1.arrendar(pelicula1, blockbuster)

    # Listar productos en Blockbuster
    print("\nProductos en Blockbuster:")
    blockbuster.listar_productos()

    # Cliente devuelve un producto
    print("\nDevolviendo producto:")
    cliente1.devolver(juego1, blockbuster)

    # Cliente devuelve un producto
    print("\nComprar producto:")
    cliente1.comprar(serie1, blockbuster)

    # Listar productos en Blockbuster nuevamente
    print("\nProductos en Blockbuster después de la devolución:")
    blockbuster.listar_productos()

if __name__ == "__main__":
    main()
