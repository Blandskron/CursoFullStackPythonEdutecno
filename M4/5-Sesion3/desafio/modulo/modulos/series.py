class Series:
    def __init__(self, titulo, director, genero, year, capitulos, temporadas, pg):
        self.titulo = titulo
        self.director = director
        self.genero = genero
        self.year = year
        self.capitulos = capitulos
        self.temporadas = temporadas
        self.pg = pg

    def get_info_series(self):
        return f"Titulo: {self.titulo} - Director: {self.director} - Genero: {self.genero} - Año: {self.year} - Capitulos: {self.capitulos} - Temporadas: {self.temporadas} - Guia Parental: {self.pg}"
