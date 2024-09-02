contador = 0

def incrementar():
    global contador  # Referencia a la variable global
    contador += 1

incrementar()
print(contador)  # Salida: 1
