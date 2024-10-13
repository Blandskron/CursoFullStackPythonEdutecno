class Usuario:
    def __init__(self, **kwargs):
        self.nombre = kwargs.get('nombre', 'Anónimo')
        self.edad = kwargs.get('edad', None)
        self.email = kwargs.get('email', None)
        self.pais = kwargs.get('pais', 'Desconocido')

    def mostrar_informacion(self):
        print(f"Nombre: {self.nombre}")
        if self.edad is not None:
            print(f"Edad: {self.edad}")
        if self.email is not None:
            print(f"Email: {self.email}")
        print(f"País: {self.pais}")

# Creación de instancias con diferentes configuraciones
usuario1 = Usuario(nombre="Juan", edad=30, email="juan@example.com")
usuario2 = Usuario(nombre="Ana", pais="España")
usuario3 = Usuario()

# Mostrar la información de los usuarios
usuario1.mostrar_informacion()
print("------------------")
usuario2.mostrar_informacion()
print("------------------")
usuario3.mostrar_informacion()