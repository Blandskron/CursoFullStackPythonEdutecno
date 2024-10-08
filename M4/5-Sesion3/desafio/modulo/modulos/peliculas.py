class Peliculas:
    def __init__(self, titulo, director, genero, year, duracion, pg):
        self.titulo = titulo
        self.director = director
        self.genero = genero
        self.year = year
        self.duracion = duracion
        self.pg = pg

    def get_info_peliculas(self):
        return f"Titulo: {self.titulo} - Director: {self.director} - Genero: {self.genero} - Año: {self.year} - Duracion: {self.duracion} - Guia Parental: {self.pg}"
