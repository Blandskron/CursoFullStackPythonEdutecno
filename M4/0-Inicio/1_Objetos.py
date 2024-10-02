# Definimos una clase base llamada "Vehiculo"
class Vehiculo:
    # Constructor de la clase que inicializa los atributos del objeto
    def __init__(self, marca, modelo, color):
        self.marca = marca        # Atributo de la clase
        self.modelo = modelo      # Atributo de la clase
        self.color = color        # Atributo de la clase

    # Método que define el comportamiento de acelerar
    def acelerar(self):
        return f"El {self.marca} {self.modelo} está acelerando."

    # Método que define el comportamiento de frenar
    def frenar(self):
        return f"El {self.marca} {self.modelo} está frenando."


# Herencia: La clase "Auto" hereda de "Vehiculo"
class Auto(Vehiculo):
    def __init__(self, marca, modelo, color, puertas):
        # Llamamos al constructor de la clase padre
        super().__init__(marca, modelo, color)
        self.puertas = puertas  # Atributo adicional solo para Auto

    # Polimorfismo: El método frenar se redefine para Auto
    def frenar(self):
        return f"El auto {self.marca} {self.modelo} con {self.puertas} puertas está frenando."

    # Encapsulamiento: Método privado para ocultar detalles internos
    def __detalles(self):
        return f"Detalles internos del auto: {self.marca}, {self.modelo}, {self.color}, {self.puertas}"

# Creamos un objeto de la clase "Auto"
mi_auto = Auto("Toyota", "Corolla", "Azul", 4)

# Accedemos a los métodos
print(mi_auto.acelerar())    # Salida: El Toyota Corolla está acelerando.
print(mi_auto.frenar())      # Salida: El auto Toyota Corolla con 4 puertas está frenando.

# Excepción: Ejemplo simple de manejo de errores
try:
    numero = int(input("Introduce un número: "))
    print(f"El número es: {numero}")
except ValueError:  # Controla el error si el usuario no ingresa un número
    print("Error: No es un número válido.")

