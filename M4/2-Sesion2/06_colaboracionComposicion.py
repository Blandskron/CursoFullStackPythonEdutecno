# Colaboración entre clases
class Motor:
    def __init__(self, tipo):
        self.tipo = tipo  # Inicialización del atributo tipo

    def encender(self):
        print(f"El motor {self.tipo} está encendido.")  # Método para encender el motor

# Composición: Un vehículo tiene un motor
class Vehiculo:
    def __init__(self, color, ruedas, motor):
        self.color = color
        self.ruedas = ruedas
        self.motor = motor  # El objeto Vehiculo contiene un objeto Motor

    def arrancar(self):
        self.motor.encender()  # Llama al método encender del motor
        print("El vehículo ha arrancado.")

# Creación de objetos y colaboración entre ellos
motor_v8 = Motor("V8")
mi_carro = Vehiculo("Rojo", 4, motor_v8)
mi_carro.arrancar()  # Inicia el vehículo encendiendo el motor
