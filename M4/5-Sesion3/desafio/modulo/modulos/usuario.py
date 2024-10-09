class Usuario:
    def __init__(self, nombre, apellido, edad, rut, direccion):
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
        self.rut = rut
        self.direccion = direccion

    def get_info(self):
        return f"nombre: {self.nombre} - apellido: {self.apellido} - edad: {self.edad} - Rut: {self.rut} - direccion: {self.direccion}"
