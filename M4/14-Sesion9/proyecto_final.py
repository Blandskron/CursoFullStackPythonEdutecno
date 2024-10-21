import os

class Familia:
    def __init__(self, tipo, marca, precio):
        self.tipo = tipo
        self.marca = marca
        self.precio = precio

    def imprimir_producto(self):
        return f"{self.tipo}, {self.marca}, {self.precio}"
    
class Inventario(Familia):
    def __init__(self,tipo,marca,precio,cantidad):
        super().__init__(tipo,marca,precio)
        self.cantidad = cantidad
       
    def imprimir_producto(self):
        return f" tipo: {self.tipo}, marca: {self.marca}, precio: {self.precio}, cantidad: {self.cantidad}"
        
    

# Función para guardar más de un conjunto de datos en el archivo
def guardar_datos():
    while True:
        tipo = input("Ingrese un tipo de producto : ")
        cantidad = int(input("Ingrese cantidad de producto : "))
        marca = input ("Ingrese la marca : ")
        precio = int(input("Ingrese su valor : "))

        producto1 = Inventario(tipo,cantidad,marca,precio)
        # Agregar datos al archivo sin sobrescribir los existentes
        with open("datos_usuario.txt", "a") as archivo:
            archivo.write(f"{producto1.imprimir_producto()}")  # Guardamos en formato CSV

        print("Datos guardados en 'datos_usuario.txt'.")

        # Preguntar si quiere agregar otro producto
        continuar = input("¿Desea agregar otro producto? (si/no): ").strip().lower()
        if continuar != "si":
            break

# Función para leer los datos desde el archivo
def leer_datos():
    if os.path.exists("datos_usuario.txt"):
        with open("datos_usuario.txt", "r") as archivo:
            productos = archivo.readlines()
            if productos:
                print("\nDatos actuales:")
                for i, producto in enumerate(productos):
                    tipo, cantidad, marca, precio = producto.strip().split(",")
                    print(f"{i + 1}. {tipo}, {cantidad}, {marca}, {precio}")
            else:
                print("No hay datos guardados.")
    else:
        print("No hay datos guardados.")

# Función para eliminar datos de un producto específico
def eliminar_datos():
    if os.path.exists("datos_usuario.txt"):
        with open("datos_usuario.txt", "r") as archivo:
            productos = archivo.readlines()

        if not productos:
            print("No hay datos para eliminar.")
            return

        print("\nDatos actuales:")
        for i, producto in enumerate(productos):
            tipo, cantidad, marca, precio = producto.strip().split(",")
            print(f"{i + 1}. {tipo}, {cantidad}, {marca}, {precio}")

        try:
            seleccion = int(input("\nIngrese el número del producto que desea eliminar: ")) - 1
            if 0 <= seleccion < len(productos):
                # Confirmar la eliminación
                confirmacion = input(f"¿Está seguro de que desea eliminar a {productos[seleccion].strip()}? (si/no): ").strip().lower()
                if confirmacion == "si":
                    productos.pop(seleccion)  # Eliminar el producto seleccionado

                    # Reescribir el archivo con los datos restantes
                    with open("datos_usuario.txt", "w") as archivo:
                        archivo.writelines(productos)

                    print("Usuario eliminado.")
                else:
                    print("Operación cancelada.")
            else:
                print("Selección inválida.")
        except ValueError:
            print("Entrada inválida. Intente nuevamente.")
    else:
        print("No hay datos para eliminar.")

# Menú principal
def menu():
    while True:
        print("\n--- Menú Mantenedor ---")
        print("1. Crear/Guardar Datos")
        print("2. Leer Datos")
        print("3. Eliminar Datos")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            guardar_datos()
        elif opcion == "2":
            leer_datos()
        elif opcion == "3":
            eliminar_datos()
        elif opcion == "4":
            print("Saliendo...")
            break
        else:
            print("Opción inválida. Intente nuevamente.")

# Ejecutar el menú
menu()