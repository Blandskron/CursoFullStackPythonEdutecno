def seleccionar_animal():
    print("Bienvenido al juego de selección de animales.")
    print("Usa las teclas de dirección (arriba, abajo, izquierda, derecha) para moverte.")
    print("Tu objetivo es llegar al animal correcto.")
    
    # Nivel 1
    print("\nEstás en el inicio.")
    direccion = input("Ingresa la dirección: ")

    if direccion == "derecha":

        direccion_mamifero = input("Ingresa la dirección: ")

        if direccion_mamifero == "arriba":

            direccion_domestico = input("Ingresa la dirección: ")

            if direccion_domestico == "derecha":
                print("Has llegado a: Perro 🐕")
            elif direccion_domestico == "abajo":
                print("Has llegado a: Gato 🐈")
            elif direccion_domestico == "izquierda":
                print("Has llegado a: Conejo 🐇")
            else:
                print("Opción no válida.")
        elif direccion_mamifero == "abajo":

            direccion_salvaje = input("Ingresa la dirección: ")

            if direccion_salvaje == "arriba":
                print("Has llegado a: León 🦁")
            elif direccion_salvaje == "derecha":
                print("Has llegado a: Elefante 🐘")
            elif direccion_salvaje == "izquierda":
                print("Has llegado a: Tigre 🐅")
            else:
                print("Opción no válida.")
        elif direccion_mamifero == "derecha":

            direccion_acuatico = input("Ingresa la dirección: ")

            if direccion_acuatico == "derecha":
                print("Has llegado a: Delfín 🐬")
            elif direccion_acuatico == "abajo":
                print("Has llegado a: Ballena 🐋")
            elif direccion_acuatico == "izquierda":
                print("Has llegado a: Foca 🦭")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    elif direccion == "abajo":

        direccion_reptil = input("Ingresa la dirección: ")

        if direccion_reptil == "arriba":
  
            direccion_domestico_reptil = input("Ingresa la dirección: ")

            if direccion_domestico_reptil == "derecha":
                print("Has llegado a: Tortuga 🐢")
            elif direccion_domestico_reptil == "abajo":
                print("Has llegado a: Iguana 🦎")
            else:
                print("Opción no válida.")
        elif direccion_reptil == "derecha":

            direccion_salvaje_reptil = input("Ingresa la dirección: ")

            if direccion_salvaje_reptil == "arriba":
                print("Has llegado a: Cocodrilo 🐊")
            elif direccion_salvaje_reptil == "derecha":
                print("Has llegado a: Serpiente 🐍")
            elif direccion_salvaje_reptil == "izquierda":
                print("Has llegado a: Camaleón 🦎")
            else:
                print("Opción no válida.")
        elif direccion_reptil == "abajo":
    
            direccion_acuatico_reptil = input("Ingresa la dirección: ")

            if direccion_acuatico_reptil == "derecha":
                print("Has llegado a: Lagarto Acuático 🦎")
            elif direccion_acuatico_reptil == "abajo":
                print("Has llegado a: Serpiente de Mar 🐍")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    elif direccion == "izquierda":

        direccion_pez = input("Ingresa la dirección: ")

        if direccion_pez == "arriba":
            print("Has llegado a: Tiburón 🦈")
        elif direccion_pez == "derecha":
            print("Has llegado a: Pez Payaso 🐠")
        elif direccion_pez == "abajo":
            print("Has llegado a: Manta Raya 🏞️")
        else:
            print("Opción no válida.")

    elif direccion == "arriba":

        direccion_ave = input("Ingresa la dirección: ")

        if direccion_ave == "derecha":
    
            direccion_domestico_ave = input("Ingresa la dirección: ")

            if direccion_domestico_ave == "derecha":
                print("Has llegado a: Gallina 🐔")
            elif direccion_domestico_ave == "abajo":
                print("Has llegado a: Canario 🐤")
            else:
                print("Opción no válida.")
        elif direccion_ave == "izquierda":
   
            direccion_salvaje_ave = input("Ingresa la dirección: ")

            if direccion_salvaje_ave == "derecha":
                print("Has llegado a: Águila 🦅")
            elif direccion_salvaje_ave == "abajo":
                print("Has llegado a: Buitre 🦅")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    else:
        print("Opción no válida.")

# Ejecutamos el código
seleccionar_animal()