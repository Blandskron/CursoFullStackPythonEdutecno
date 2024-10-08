from modulos.usuario import Usuario

class Cliente(Usuario):
    def __init__(self, nombre, apellido, edad, rut, direccion, idcliente):
        super().__init__(nombre, apellido, edad, rut, direccion)
        self.idcliente = idcliente

     # acciones vinculantes con la clase usuario
    def arrendar():
        pass

    def devolver():
        pass

    def comprar():
        pass

  