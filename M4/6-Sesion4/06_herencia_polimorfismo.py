# Clase base que representa una Persona en la familia noble
class Noble:
    def __init__(self, nombre, titulo=None):
        self.nombre = nombre
        self.titulo = titulo
    
    def presentarse(self):
        return f"Soy {self.nombre}, {self.titulo}"

# Subclase Abuelo que hereda de Noble
class DuqueAbuelo(Noble):
    def __init__(self, nombre, titulo, logros):
        super().__init__(nombre, titulo)
        self.logros = logros
    
    def presentarse(self):
        return f"Soy {self.nombre}, {self.titulo}. Logros en mi vida: {self.logros}"

# Subclase Padre que hereda de DuqueAbuelo
class DuquePadre(DuqueAbuelo):
    def __init__(self, nombre, logros, responsabilidades):
        # El título se hereda automáticamente del abuelo
        super().__init__(nombre, DuqueAbuelo.titulo, logros)
        self.responsabilidades = responsabilidades
    
    def presentarse(self):
        return f"Soy {self.nombre}, {self.titulo}. Logros: {self.logros}, Responsabilidades actuales: {self.responsabilidades}"

# Subclase Hijo que hereda de DuquePadre
class DuqueHijo(DuquePadre):
    def __init__(self, nombre, logros, responsabilidades, intereses):
        # El título se hereda automáticamente del padre (y del abuelo)
        super().__init__(nombre, logros, responsabilidades)
        self.intereses = intereses
    
    def presentarse(self):
        return f"Soy {self.nombre}, {self.titulo}. Logros: {self.logros}, Responsabilidades: {self.responsabilidades}, Intereses: {self.intereses}"

# Polimorfismo en acción: presentación de cada miembro de la familia noble
def presentacion_familiar(noble):
    print(noble.presentarse())

# Crear instancias de cada miembro de la familia noble
# Solo el abuelo especifica el título
abuelo = DuqueAbuelo("Duque Alfonso", "Duque de Lancaster", "Expandí los territorios de la familia")
DuquePadre.titulo = abuelo.titulo  # El título se hereda automáticamente
padre = DuquePadre("Duque Bernardo", "Mantuve la paz en el reino", "Gestiono las tierras")
hijo = DuqueHijo("Duque Carlos", "Innové en la agricultura", "Responsable de las finanzas", "Filosofía y astronomía")

# Presentación polimórfica de cada miembro
familia = [abuelo, padre, hijo]
for noble in familia:
    presentacion_familiar(noble)
