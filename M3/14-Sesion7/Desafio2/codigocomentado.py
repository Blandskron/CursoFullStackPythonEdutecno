# Lista de ventas: (producto, cantidad)
# Lista         0               1               2               3
ventas = [("Laptops", 3), ("Celulares", 5), ("Monitores", 2), ("Teclados", 4)]

consulta = int(input("Las venta de que producto quiere conocer \n 1-Laptop \n 2-Celular \n 3-Monitor \n 4-Teclado: "))
print(consulta) # usuario ingresa 1
arreglo = consulta - 1 # se le resta 1 al valor ingresado por el usurario para convertirlo en la posicion real en la lista
print(arreglo) # aqui imprimimos el valor del usuario convertido al valor real del indice
# con enumerate en ventas asignar un valor que comienza en 0 a cada tuplata que esta en la lista 
for i, producto in enumerate(ventas):
    # i guarda el valor de enumarte
    print(i, producto)
    # el if compara el valor de enumerate con el valor ingresado por el usuario
    if i == arreglo:
        # si el valor del convertido del usuario es 0 y el valor del enumerate es 0 
        print(f"El total de {producto[0]} vendida@s fue de {producto[1]}")

# El total de "computadoras" vendidas fue de "5"