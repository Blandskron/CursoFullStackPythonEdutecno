# Solucion 1
ventas = [("Laptops", 3), ("Celulares", 5), ("Monitores", 2), ("Teclados", 4)]

consulta = int(input("Las venta de que producto quiere conocer \n 1-Laptop \n 2-Celular \n 3-Monitor \n 4-Teclado: "))
arreglo = consulta - 1 

for i, producto in enumerate(ventas):
    if i == arreglo:
        print(f"El total de {producto[0]} vendida@s fue de {producto[1]}")


# Solucion 2
ventas = [("Laptops", 3), ("Celulares", 5), ("Monitores", 2), ("Teclados", 4)]

consulta = int(input("Las venta de que producto quiere conocer \n 1-Laptop \n 2-Celular \n 3-Monitor \n 4-Teclado: "))
arreglo = consulta - 1

for venta in ventas:
  if venta == ventas[arreglo]:
    print(f"El total de {venta[0]} vendida@s fue de {venta[1]}")
    break
