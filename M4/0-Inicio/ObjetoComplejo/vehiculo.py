# vehiculo.py

import csv

# Clase base Vehiculo con atributos comunes
class Vehiculo:
    def __init__(self, marca, modelo, nro_ruedas):
        self.marca = marca
        self.modelo = modelo
        self.nro_ruedas = nro_ruedas

    # Método para representar la información del vehículo
    def __str__(self):
        return f"Marca {self.marca}, Modelo {self.modelo}, {self.nro_ruedas} ruedas"

    # Método para guardar los datos de un vehículo en un archivo CSV
    def guardar_datos_csv(self):
        try:
            with open('vehiculos.csv', 'a', newline='') as archivo:
                writer = csv.writer(archivo)
                writer.writerow([self.__class__, self.__dict__])
        except Exception as e:
            print(f"Error al guardar en CSV: {e}")

    # Método para leer los datos desde un archivo CSV
    @classmethod
    def leer_datos_csv(cls):
        vehiculos = {}
        try:
            with open('vehiculos.csv', 'r') as archivo:
                reader = csv.reader(archivo)
                for row in reader:
                    clase_str, atributos_str = row
                    clase_nombre = clase_str.split("'")[1].split(".")[-1]
                    atributos = eval(atributos_str)
                    if clase_nombre not in vehiculos:
                        vehiculos[clase_nombre] = []
                    vehiculos[clase_nombre].append(atributos)
        except FileNotFoundError:
            print("El archivo 'vehiculos.csv' no existe.")
        except Exception as e:
            print(f"Error al leer el CSV: {e}")
        return vehiculos

# Clase Automovil que hereda de Vehiculo, añade velocidad y cilindrada
class Automovil(Vehiculo):
    def __init__(self, marca, modelo, nro_ruedas, velocidad, cilindrada):
        super().__init__(marca, modelo, nro_ruedas)
        self.velocidad = velocidad
        self.cilindrada = cilindrada

    # Método para representar la información del automóvil
    def __str__(self):
        return (super().__str__() + f" {self.velocidad} Km/h, {self.cilindrada} cc")

# Clase Particular que hereda de Automovil, añade número de puestos
class Particular(Automovil):
    def __init__(self, marca, modelo, nro_ruedas, velocidad, cilindrada, nro_puestos):
        super().__init__(marca, modelo, nro_ruedas, velocidad, cilindrada)
        self.nro_puestos = nro_puestos

    def __str__(self):
        return (super().__str__() + f" Puestos: {self.nro_puestos}")

# Clase Carga que hereda de Automovil, añade el peso de carga
class Carga(Automovil):
    def __init__(self, marca, modelo, nro_ruedas, velocidad, cilindrada, peso_carga):
        super().__init__(marca, modelo, nro_ruedas, velocidad, cilindrada)
        self.peso_carga = peso_carga

    def __str__(self):
        return (super().__str__() + f" Carga: {self.peso_carga} Kg")

# Clase Bicicleta que hereda de Vehiculo, añade tipo de bicicleta
class Bicicleta(Vehiculo):
    def __init__(self, marca, modelo, nro_ruedas, tipo):
        super().__init__(marca, modelo, nro_ruedas)
        self.tipo = tipo

    def __str__(self):
        return (super().__str__() + f" Tipo: {self.tipo}")

# Clase Motocicleta que hereda de Bicicleta, añade motor, cuadro y número de radios
class Motocicleta(Bicicleta):
    def __init__(self, marca, modelo, nro_ruedas, tipo, motor, cuadro, nro_radios):
        super().__init__(marca, modelo, nro_ruedas, tipo)
        self.motor = motor
        self.cuadro = cuadro
        self.nro_radios = nro_radios

    def __str__(self):
        return (super().__str__() + f" Motor: {self.motor}, Cuadro: {self.cuadro}, Nro Radios: {self.nro_radios}")
