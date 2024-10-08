class Libro:
    def __init__(self, titulo, autor, genero, isbn):
        self.titulo = titulo
        self.autor = autor
        self.genero = genero
        self.isbn = isbn

    def mostrar_info(self):
        return f"Título: {self.titulo}, Autor: {self.autor}, Género: {self.genero}, ISBN: {self.isbn}"
