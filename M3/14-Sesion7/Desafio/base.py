# Lista de ventas: (producto, cantidad)
ventas = [("Laptop", 3), ("Celular", 5), ("Monitor", 2), ("Teclado", 4)]

# Recorrer la lista e imprimir cada venta
for venta in ventas:
    print(venta)

# Contar total de unidades vendidas
total_unidades = 0
for venta in ventas:
    total_unidades += venta[1]

print(f"Total de unidades vendidas: {total_unidades}")
