# Clase base que representa una Persona en la familia
class Persona:
    def __init__(self, nombre, apellido=None):
        self.nombre = nombre
        self.apellido = apellido
    
    def presentarse(self):
        return f"Mi nombre es {self.nombre} {self.apellido}"

# Subclase Abuelo que hereda de Persona
class Abuelo(Persona):
    def __init__(self, nombre, apellido, oficio):
        super().__init__(nombre, apellido)
        self.oficio = oficio
    
    def presentarse(self):
        return f"Soy el abuelo {self.nombre} {self.apellido}, y fui {self.oficio}"

# Subclase Padre que hereda de Abuelo
class Padre(Abuelo):
    def __init__(self, nombre, oficio, profesion):
        # El apellido se hereda automáticamente del abuelo
        super().__init__(nombre, Abuelo.apellido, oficio)
        self.profesion = profesion
    
    def presentarse(self):
        return f"Soy el padre {self.nombre} {self.apellido}, soy {self.profesion}, y mi padre fue {self.oficio}"

# Subclase Hijo que hereda de Padre
class Hijo(Padre):
    def __init__(self, nombre, oficio, profesion, pasatiempo):
        # El apellido se hereda automáticamente del padre (y del abuelo)
        super().__init__(nombre, oficio, profesion)
        self.pasatiempo = pasatiempo
    
    def presentarse(self):
        return f"Soy el hijo {self.nombre} {self.apellido}, disfruto {self.pasatiempo}, mi padre es {self.profesion}, y mi abuelo fue {self.oficio}"

# Polimorfismo en acción: presentación de cada miembro de la familia
def presentacion_familiar(miembro):
    print(miembro.presentarse())

# Crear instancias de cada miembro de la familia
# Solo el abuelo especifica el apellido
abuelo = Abuelo("Juan", "Gómez", "carpintero")
Padre.apellido = abuelo.apellido  # El apellido se hereda automáticamente
padre = Padre("Carlos", abuelo.oficio, "ingeniero")
hijo = Hijo("Luis", padre.oficio, padre.profesion, "jugar al fútbol")

# Presentación polimórfica de cada miembro
familia = [abuelo, padre, hijo]
for miembro in familia:
    presentacion_familiar(miembro)
