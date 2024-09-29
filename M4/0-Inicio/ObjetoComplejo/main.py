# main.py

from vehiculo import Particular, Carga, Bicicleta, Motocicleta, Vehiculo, Automovil

def main():
    # Crear instancias de vehículos
    particular = Particular("Ford", "Fiesta", "4", "180", "500", "5")
    carga = Carga("Daft Trucks", "G 38", "10", "120", "1000", "20000")
    bicicleta = Bicicleta("Shimano", "MT Ranger", 2, "Carrera")
    motocicleta = Motocicleta("BMW", "F800s", 2, "Deportiva", "2T", "Doble Viga", 21)

    # Guardar datos de los vehículos en el archivo CSV
    particular.guardar_datos_csv()
    carga.guardar_datos_csv()
    bicicleta.guardar_datos_csv()
    motocicleta.guardar_datos_csv()

    # Leer los datos desde el archivo CSV e imprimirlos por pantalla
    vehiculos = Vehiculo.leer_datos_csv()

    # Imprimir datos de vehículos por categoría
    for clase, lista_vehiculos in vehiculos.items():
        print(f"\nLista de Vehiculos {clase}")
        for veh in lista_vehiculos:
            print(veh)

    # Verificar relaciones de instancias para motocicleta
    print("\nVerificaciones de instancias:")
    print(f"Motocicleta es instancia con relación a Vehiculo: {isinstance(motocicleta, Vehiculo)}")
    print(f"Motocicleta es instancia con relación a Automovil: {isinstance(motocicleta, Automovil)}")
    print(f"Motocicleta es instancia con relación a Particular: {isinstance(motocicleta, Particular)}")
    print(f"Motocicleta es instancia con relación a Carga: {isinstance(motocicleta, Carga)}")
    print(f"Motocicleta es instancia con relación a Bicicleta: {isinstance(motocicleta, Bicicleta)}")
    print(f"Motocicleta es instancia con relación a Motocicleta: {isinstance(motocicleta, Motocicleta)}")

if __name__ == "__main__":
    main()
