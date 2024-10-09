class Juegos:
    def __init__(self, titulo, consola, genero, year, pg):
        self.titulo = titulo
        self.consola = consola
        self.genero = genero
        self.year = year
        self.pg = pg

    def get_info(self):
        return f"Titulo: {self.titulo} - Consola: {self.consola} - Genero: {self.genero} - Año: {self.year} - Guia Parental: {self.pg}"
