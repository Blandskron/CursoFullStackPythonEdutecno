# Clase base que representa un Producto
class Producto:
    def __init__(self, titulo, precio):
        self.titulo = titulo
        self.precio = precio
    
    def alquilar(self):
        raise NotImplementedError("Este método debe ser implementado por las subclases")

# Subclase para películas
class Pelicula(Producto):
    def __init__(self, titulo, precio, duracion):
        super().__init__(titulo, precio)
        self.duracion = duracion
    
    def alquilar(self):
        return f"Alquilando la película '{self.titulo}' por {self.precio} USD. Duración: {self.duracion} minutos."

# Subclase para videojuegos
class Videojuego(Producto):
    def __init__(self, titulo, precio, plataforma):
        super().__init__(titulo, precio)
        self.plataforma = plataforma
    
    def alquilar(self):
        return f"Alquilando el videojuego '{self.titulo}' para {self.plataforma} por {self.precio} USD."

# Subclase para música
class Musica(Producto):
    def __init__(self, titulo, precio, artista):
        super().__init__(titulo, precio)
        self.artista = artista
    
    def alquilar(self):
        return f"Alquilando el álbum '{self.titulo}' de {self.artista} por {self.precio} USD."

# Polimorfismo en acción
def procesar_alquiler(producto):
    print(producto.alquilar())

# Crear instancias
pelicula = Pelicula("Inception", 4.99, 148)
videojuego = Videojuego("The Witcher 3", 6.99, "PC")
musica = Musica("Abbey Road", 2.99, "The Beatles")

# Procesar alquileres
productos = [pelicula, videojuego, musica]
for producto in productos:
    procesar_alquiler(producto)
