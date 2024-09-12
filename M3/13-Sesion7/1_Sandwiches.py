# Harcodeada
# Número de sándwiches necesarios
cantidad_sandwiches = 500

# Hacer sándwiches utilizando un ciclo
for i in range(cantidad_sandwiches):
    print(f"Sándwich {i + 1}: Agregar pan, jamón, queso y cerrar.")

# Codigo Interactivo
# Número de sándwiches necesarios
cantidad_sandwiches = int(input("Ingrese la cantidad de sándwiches: "))

# Hacer sándwiches utilizando un ciclo
for i in range(cantidad_sandwiches):
    print("Extra = palta, carne, queso extra y tomate.")
    ingrediente_extra = input(f"Ingrese el ingrediente extra para el sándwich {i + 1}: ")
    print(f"Sándwich {i + 1}: Agregar pan, jamón, queso, Ingrediente extra {ingrediente_extra}")
    