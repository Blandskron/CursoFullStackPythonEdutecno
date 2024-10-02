# Clase Vehiculo con sus comportamientos implementados
class Vehiculo:
    modelo = ''
    marca = ''
    color = ''
    velocidad = 0
    nro_puertas = 0
    kilometraje = 0
    arrancando = False

    # Método para encender el vehículo
    def encender(self):
        if not self.arrancando:  # Si el vehículo no está encendido
            print('Encendiendo el vehículo')
            self.arrancando = True  # Cambiamos el estado a encendido
        else:
            print('El vehículo ya está encendido')

    # Método para apagar el vehículo
    def apagar(self):
        if self.arrancando:  # Si el vehículo está encendido
            print('Apagando el vehículo')
            self.arrancando = False  # Cambiamos el estado a apagado
        else:
            print('El vehículo ya está apagado')

    # Método para acelerar el vehículo
    def acelerar(self):
        if self.arrancando:  # Solo podemos acelerar si el vehículo está encendido
            self.velocidad += 1  # Aumentamos la velocidad en 1 unidad
            print(f'El vehículo ha acelerado. Velocidad actual: {self.velocidad} km/h')
        else:
            print('No puedes acelerar un vehículo apagado')

    # Método para frenar el vehículo
    def frenar(self):
        if self.velocidad > 0:  # Si la velocidad es mayor a 0, podemos frenar
            self.velocidad -= 1  # Reducimos la velocidad en 1 unidad
            print(f'El vehículo ha frenado. Velocidad actual: {self.velocidad} km/h')
        else:
            print('El vehículo ya está detenido')

    # Método para obtener la velocidad actual
    def get_velocidad(self):
        return self.velocidad  # Retornamos la velocidad actual

    # Método para obtener el kilometraje
    def get_kilometraje(self):
        return self.kilometraje  # Retornamos el kilometraje actual

    # Método para establecer el kilometraje
    def set_kilometraje(self, kilometraje):
        self.kilometraje = kilometraje  # Establecemos un nuevo valor de kilometraje
        print(f'Kilometraje actualizado a: {self.kilometraje} km')

# Crear instancias de la clase Vehiculo
obj_carro1 = Vehiculo()  # Crear el primer objeto de tipo Vehiculo
obj_carro2 = Vehiculo()  # Crear el segundo objeto de tipo Vehiculo

# Asignar valores a los atributos del primer vehículo
obj_carro1.marca = 'Fiat'
obj_carro1.modelo = 'Uno'
obj_carro1.kilometraje = 100

# Imprimir los valores iniciales
print(f'Marca: {obj_carro1.marca}, Modelo: {obj_carro1.modelo}, Kilometraje: {obj_carro1.kilometraje} km')

# Actualizar el kilometraje usando el método set_kilometraje
obj_carro1.set_kilometraje(500)

# Obtener el kilometraje actualizado
print(f'Kilometraje actualizado: {obj_carro1.get_kilometraje()} km')
