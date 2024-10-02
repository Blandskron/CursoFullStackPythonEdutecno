# Clase base que representa a un miembro de la selección de fútbol
class MiembroSeleccion:
    # Constructor que inicializa los atributos comunes
    def __init__(self, nombre, edad, nacionalidad):
        self.nombre = nombre          # Atributo: nombre del miembro
        self.edad = edad              # Atributo: edad del miembro
        self.nacionalidad = nacionalidad  # Atributo: nacionalidad del miembro

    # Método que muestra la información básica del miembro
    def mostrar_info(self):
        print(f"Nombre: {self.nombre}, Edad: {self.edad}, Nacionalidad: {self.nacionalidad}")

# Subclase que representa a un futbolista, hereda de MiembroSeleccion
class Futbolista(MiembroSeleccion):
    def __init__(self, nombre, edad, nacionalidad, posicion, numero_camiseta):
        super().__init__(nombre, edad, nacionalidad)  # Inicializa atributos de la clase padre
        self.posicion = posicion      # Atributo específico: posición en el campo
        self.numero_camiseta = numero_camiseta  # Atributo específico: número de camiseta

    # Método que simula que el futbolista anota un gol
    def anotar_gol(self):
        print(f"{self.nombre} ha anotado un gol!")

    # Método que muestra la información específica del futbolista
    def mostrar_info(self):
        super().mostrar_info()  # Llama al método de la clase padre
        print(f"Posición: {self.posicion}, Número de camiseta: {self.numero_camiseta}")

# Subclase que representa a un entrenador, hereda de MiembroSeleccion
class Entrenador(MiembroSeleccion):
    def __init__(self, nombre, edad, nacionalidad, estrategia):
        super().__init__(nombre, edad, nacionalidad)  # Inicializa atributos de la clase padre
        self.estrategia = estrategia  # Atributo específico: estrategia del entrenador

    # Método que simula que el entrenador da una charla
    def dar_charla(self):
        print(f"{self.nombre} está dando una charla sobre la estrategia: {self.estrategia}")

    # Método que muestra la información específica del entrenador
    def mostrar_info(self):
        super().mostrar_info()  # Llama al método de la clase padre
        print(f"Estrategia: {self.estrategia}")

# Subclase que representa a un masajista, hereda de MiembroSeleccion
class Masajista(MiembroSeleccion):
    def __init__(self, nombre, edad, nacionalidad, especialidad):
        super().__init__(nombre, edad, nacionalidad)  # Inicializa atributos de la clase padre
        self.especialidad = especialidad  # Atributo específico: especialidad del masajista

    # Método que simula que el masajista da un masaje
    def dar_masaje(self):
        print(f"{self.nombre} está dando un masaje.")

    # Método que muestra la información específica del masajista
    def mostrar_info(self):
        super().mostrar_info()  # Llama al método de la clase padre
        print(f"Especialidad: {self.especialidad}")

# Creamos instancias de las clases Futbolista, Entrenador y Masajista
futbolista1 = Futbolista("Lionel Messi", 35, "Argentino", "Delantero", 10)
entrenador1 = Entrenador("Lionel Scaloni", 43, "Argentino", "Ofensiva")
masajista1 = Masajista("Juan Pérez", 50, "Argentino", "Rehabilitación")

# Mostramos la información de cada miembro de la selección
print("Información del Futbolista:")
futbolista1.mostrar_info()
futbolista1.anotar_gol()  # Simulación de anotar un gol

print("\nInformación del Entrenador:")
entrenador1.mostrar_info()
entrenador1.dar_charla()  # Simulación de dar una charla

print("\nInformación del Masajista:")
masajista1.mostrar_info()
masajista1.dar_masaje()  # Simulación de dar un masaje
