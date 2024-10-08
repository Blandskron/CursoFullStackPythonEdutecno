from modulo.biblioteca import Biblioteca
from modulo.libro import Libro

def main():
    biblioteca = Biblioteca("Alejandria")
    print(biblioteca.get_nombre())
    # Crear libros
    libro1 = Libro("1984", "George Orwell", "Distopía", "123456789")
    libro2 = Libro("El señor de los anillos", "J.R.R. Tolkien", "Fantasía", "987654321")
    
    # Agregar libros a la biblioteca
    biblioteca.agregar_libro(libro1)
    biblioteca.agregar_libro(libro2)
    
    # Listar libros
    print("Libros en la biblioteca:")
    biblioteca.listar_libros()

    # Buscar un libro por título
    print("\nBuscar libro por título:")
    print(biblioteca.buscar_libro_por_titulo("1974", "123456789"))

    # Eliminar un libro por ISBN
    print("\nEliminar libro:")
    print(biblioteca.eliminar_libro("123456789"))
    
    # Listar libros nuevamente
    print("\nLibros en la biblioteca después de eliminar:")
    biblioteca.listar_libros()

if __name__ == "__main__":
    main()
