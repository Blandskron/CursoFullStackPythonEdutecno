from libro import Libro

class Biblioteca:
    def __init__(self, nombre):
        self.nombre = nombre
        self.libros = []

    def agregar_libro(self, libro):
        self.libros.append(libro)

    def listar_libros(self):
        for libro in self.libros:
            print(libro.mostrar_info())

    def buscar_libro_por_titulo(self, titulo, isbn):
        for libro in self.libros:
            if libro.titulo == titulo:
                return libro.mostrar_info()
            elif libro.isbn == isbn:
                return libro.mostrar_info()
        return "Libro no encontrado"
    
    
    def eliminar_libro(self, isbn):
        for libro in self.libros:
            if libro.isbn == isbn:
                self.libros.remove(libro)
                return f"Libro con ISBN {isbn} eliminado"
        return "Libro no encontrado"

    def get_nombre(self):
        return f"El nombre de la Biblioteca es: {self.nombre}"
