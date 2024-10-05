class Persona:
    def __init__(self, nombre, edad, rut):
        self.__nombre = nombre  # Atributo privado para el nombre
        self.__edad = edad  # Atributo privado para la edad
        self.__rut = rut  # Atributo privado para el RUT

    # Métodos Get para obtener los atributos
    def get_nombre(self):
        return self.__nombre

    def get_edad(self):
        return self.__edad

    def get_rut(self):
        return self.__rut

    # Métodos Set para modificar el nombre y la edad
    def set_nombre(self, nombre):
        self.__nombre = nombre

    def set_edad(self, edad):
        if edad >= 0:
            self.__edad = edad
        else:
            print("La edad no puede ser negativa.")

# Clase Cliente que hereda de Persona
class Cliente(Persona):
    def __init__(self, nombre, edad, rut, servicio_contratado):
        super().__init__(nombre, edad, rut)  # Llama al constructor de la clase base
        self.servicio_contratado = servicio_contratado  # Servicio contratado por el cliente

    # Método para mostrar los detalles del servicio contratado
    def mostrar_servicio(self):
        return f"El cliente {self.get_nombre()} ha contratado el servicio de: {self.servicio_contratado}"

# Clase Conductor que hereda de Persona
class Conductor(Persona):
    def __init__(self, nombre, edad, rut, servicio_vendido):
        super().__init__(nombre, edad, rut)  # Llama al constructor de la clase base
        self.servicio_vendido = servicio_vendido  # Servicio vendido por el conductor

    # Método para mostrar los detalles del servicio vendido
    def mostrar_venta(self):
        return f"El conductor {self.get_nombre()} ha vendido el servicio de: {self.servicio_vendido}"

# Crear instancia de Cliente
cliente = Cliente("Pedro", 35, "12.345.678-9", "Transporte Privado")
# Crear instancia de Conductor
conductor = Conductor("Juan", 40, "9.876.543-1", "Transporte Ejecutivo")

# Mostrar información
print(cliente.mostrar_servicio())  # Salida: El cliente Pedro ha contratado el servicio de: Transporte Privado
print(conductor.mostrar_venta())   # Salida: El conductor Juan ha vendido el servicio de: Transporte Ejecutivo
