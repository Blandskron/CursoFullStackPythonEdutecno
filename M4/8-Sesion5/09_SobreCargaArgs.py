class Saludo:
    def saludar(self, *args):
        if len(args) == 0:
            print("Hola!")
        elif len(args) == 1:
            print(f"Hola, {args[0]}!")
        elif len(args) == 2:
            print(f"Hola, {args[0]} y {args[1]}!")
        else:
            print("Hola a todos!")

saludo = Saludo()
# Saludar sin argumentos
saludo.saludar()  # Hola!
# Saludar con un argumento
saludo.saludar("Juan")  # Hola, Juan!
# Saludar con dos argumentos
saludo.saludar("Juan", "Ana")  # Hola, Juan y Ana!
# Saludar con más de dos argumentos
saludo.saludar("Juan", "Ana", "Luis")  # Hola a todos!