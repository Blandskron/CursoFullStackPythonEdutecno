# Lista de ventas: (producto, cantidad)
# Lista         0               1               2               3
ventas = [("Laptops", 3), ("Celulares", 5), ("Monitores", 2), ("Teclados", 4)]

consulta = int(input("Las venta de que producto quiere conocer \n 1-Laptop \n 2-Celular \n 3-Monitor \n 4-Teclado: "))
arreglo = consulta - 1

for venta in ventas:
  if venta == ventas[arreglo]:
    print(f"El total de {venta[0]} vendida@s fue de {venta[1]}")
    break

# El total de "computadoras" vendidas fue de "5"