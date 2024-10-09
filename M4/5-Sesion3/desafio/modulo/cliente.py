from .modulos.usuario import Usuario

class Cliente(Usuario):
    def __init__(self, nombre, apellido, edad, rut, direccion, idcliente):
        super().__init__(nombre, apellido, edad, rut, direccion)
        self.idcliente = idcliente
        self.arrendados = []

    # Acciones vinculantes con la clase usuario
    def arrendar(self, producto, blockbuster):
        blockbuster.guardar(producto)
        self.arrendados.append(producto)
        print(f"{self.nombre} ha arrendado {producto.titulo}")

    def devolver(self, producto, blockbuster):
        if producto in self.arrendados:
            self.arrendados.remove(producto)
            print(f"{self.nombre} ha devuelto {producto.titulo}")
        else:
            print(f"{self.nombre} no tiene este producto arrendado")

    def comprar(self, producto, blockbuster):
        print(f"{self.nombre} ha comprado {producto.titulo}")
