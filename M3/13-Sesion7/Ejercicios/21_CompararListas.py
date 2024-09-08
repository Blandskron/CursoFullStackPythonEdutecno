lista1 = [1, 2, 3]
lista2 = [4, 2, 1]
for i in range(len(lista1)):
    if lista1[i] == lista2[i]:
        print(f"Los elementos en la posición {i} son iguales: {lista1[i]}")
    else:
        print(f"Los elementos en la posición {i} son diferentes.")
