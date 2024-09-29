# Diccionario global que actuará como inventario
inventario = {}

# Función para agregar un producto al inventario
def agregar_producto(nombre, cantidad, precio):
    if nombre in inventario:
        # Si el producto ya existe, actualizamos la cantidad
        inventario[nombre]['cantidad'] += cantidad
    else:
        # Si el producto no existe, lo agregamos al inventario
        inventario[nombre] = {'cantidad': cantidad, 'precio': precio}
    print(f"Producto '{nombre}' agregado/actualizado correctamente.")

# Función para eliminar un producto del inventario
def eliminar_producto(nombre):
    if nombre in inventario:
        del inventario[nombre]
        print(f"Producto '{nombre}' eliminado del inventario.")
    else:
        print(f"Error: El producto '{nombre}' no existe en el inventario.")

# Función para mostrar todos los productos en el inventario
def mostrar_inventario():
    if not inventario:
        print("El inventario está vacío.")
    else:
        print("Inventario actual:")
        for nombre, detalles in inventario.items():
            print(f"- {nombre}: {detalles['cantidad']} unidades, ${detalles['precio']} por unidad")

# Función para calcular el valor total del inventario
def calcular_valor_total():
    valor_total = 0
    for detalles in inventario.values():
        valor_total += detalles['cantidad'] * detalles['precio']
    return valor_total

# Menú interactivo para los usuarios
def menu():
    while True:
        print("\n--- GESTOR DE INVENTARIO ---")
        print("1. Agregar producto")
        print("2. Eliminar producto")
        print("3. Mostrar inventario")
        print("4. Calcular valor total")
        print("5. Salir")
        
        opcion = input("Elige una opción: ")
        
        if opcion == "1":
            nombre = input("Nombre del producto: ")
            cantidad = int(input("Cantidad: "))
            precio = float(input("Precio por unidad: "))
            agregar_producto(nombre, cantidad, precio)
        elif opcion == "2":
            nombre = input("Nombre del producto a eliminar: ")
            eliminar_producto(nombre)
        elif opcion == "3":
            mostrar_inventario()
        elif opcion == "4":
            total = calcular_valor_total()
            print(f"El valor total del inventario es: ${total:.2f}")
        elif opcion == "5":
            print("Saliendo del programa.")
            break
        else:
            print("Opción no válida, por favor intenta nuevamente.")

# Iniciar el programa
menu()
