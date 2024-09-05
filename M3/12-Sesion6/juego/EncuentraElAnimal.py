def seleccionar_animal():
    print("Selecciona una opción:")
    print("1. Mamíferos")
    print("2. Reptiles")
    print("3. Peces")
    print("4. Aves")
    print("5. Insectos")
    
    opcion = input("Ingresa el número de tu opción: ")

    if opcion == "1":
        print("Seleccionaste Mamíferos.")
        print("1. Domésticos")
        print("2. Salvajes")
        print("3. Acuáticos")
        opcion_mamifero = input("Ingresa el número de tu opción: ")

        if opcion_mamifero == "1":
            print("Seleccionaste Mamíferos Domésticos.")
            print("1. Perro")
            print("2. Gato")
            print("3. Conejo")
            opcion_domestico = input("Ingresa el número de tu opción: ")

            if opcion_domestico == "1":
                print("Has llegado a: Perro 🐕")
            elif opcion_domestico == "2":
                print("Has llegado a: Gato 🐈")
            elif opcion_domestico == "3":
                print("Has llegado a: Conejo 🐇")
            else:
                print("Opción no válida.")
        elif opcion_mamifero == "2":
            print("Seleccionaste Mamíferos Salvajes.")
            print("1. León")
            print("2. Elefante")
            print("3. Tigre")
            opcion_salvaje = input("Ingresa el número de tu opción: ")

            if opcion_salvaje == "1":
                print("Has llegado a: León 🦁")
            elif opcion_salvaje == "2":
                print("Has llegado a: Elefante 🐘")
            elif opcion_salvaje == "3":
                print("Has llegado a: Tigre 🐅")
            else:
                print("Opción no válida.")
        elif opcion_mamifero == "3":
            print("Seleccionaste Mamíferos Acuáticos.")
            print("1. Delfín")
            print("2. Ballena")
            print("3. Foca")
            opcion_acuatico = input("Ingresa el número de tu opción: ")

            if opcion_acuatico == "1":
                print("Has llegado a: Delfín 🐬")
            elif opcion_acuatico == "2":
                print("Has llegado a: Ballena 🐋")
            elif opcion_acuatico == "3":
                print("Has llegado a: Foca 🦭")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    elif opcion == "2":
        print("Seleccionaste Reptiles.")
        print("1. Domésticos")
        print("2. Salvajes")
        print("3. Acuáticos")
        opcion_reptil = input("Ingresa el número de tu opción: ")

        if opcion_reptil == "1":
            print("Seleccionaste Reptiles Domésticos.")
            print("1. Tortuga")
            print("2. Iguana")
            opcion_domestico_reptil = input("Ingresa el número de tu opción: ")

            if opcion_domestico_reptil == "1":
                print("Has llegado a: Tortuga 🐢")
            elif opcion_domestico_reptil == "2":
                print("Has llegado a: Iguana 🦎")
            else:
                print("Opción no válida.")
        elif opcion_reptil == "2":
            print("Seleccionaste Reptiles Salvajes.")
            print("1. Cocodrilo")
            print("2. Serpiente")
            print("3. Camaleón")
            opcion_salvaje_reptil = input("Ingresa el número de tu opción: ")

            if opcion_salvaje_reptil == "1":
                print("Has llegado a: Cocodrilo 🐊")
            elif opcion_salvaje_reptil == "2":
                print("Has llegado a: Serpiente 🐍")
            elif opcion_salvaje_reptil == "3":
                print("Has llegado a: Camaleón 🦎")
            else:
                print("Opción no válida.")
        elif opcion_reptil == "3":
            print("Seleccionaste Reptiles Acuáticos.")
            print("1. Lagarto Acuático")
            print("2. Serpiente de Mar")
            opcion_acuatico_reptil = input("Ingresa el número de tu opción: ")

            if opcion_acuatico_reptil == "1":
                print("Has llegado a: Lagarto Acuático 🦎")
            elif opcion_acuatico_reptil == "2":
                print("Has llegado a: Serpiente de Mar 🐍")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    elif opcion == "3":
        print("Seleccionaste Peces.")
        print("1. Tiburón")
        print("2. Pez Payaso")
        print("3. Manta Raya")
        opcion_pez = input("Ingresa el número de tu opción: ")

        if opcion_pez == "1":
            print("Has llegado a: Tiburón 🦈")
        elif opcion_pez == "2":
            print("Has llegado a: Pez Payaso 🐠")
        elif opcion_pez == "3":
            print("Has llegado a: Manta Raya 🏞️")
        else:
            print("Opción no válida.")

    elif opcion == "4":
        print("Seleccionaste Aves.")
        print("1. Aves Domésticas")
        print("2. Aves Salvajes")
        opcion_aves = input("Ingresa el número de tu opción: ")

        if opcion_aves == "1":
            print("Seleccionaste Aves Domésticas.")
            print("1. Gallina")
            print("2. Canario")
            opcion_domestico_ave = input("Ingresa el número de tu opción: ")

            if opcion_domestico_ave == "1":
                print("Has llegado a: Gallina 🐔")
            elif opcion_domestico_ave == "2":
                print("Has llegado a: Canario 🐤")
            else:
                print("Opción no válida.")
        elif opcion_aves == "2":
            print("Seleccionaste Aves Salvajes.")
            print("1. Águila")
            print("2. Buitre")
            opcion_salvaje_ave = input("Ingresa el número de tu opción: ")

            if opcion_salvaje_ave == "1":
                print("Has llegado a: Águila 🦅")
            elif opcion_salvaje_ave == "2":
                print("Has llegado a: Buitre 🦅")
            else:
                print("Opción no válida.")
        else:
            print("Opción no válida.")

    elif opcion == "5":
        print("Seleccionaste Insectos.")
        print("1. Hormiga")
        print("2. Mariposa")
        print("3. Escarabajo")
        opcion_insecto = input("Ingresa el número de tu opción: ")

        if opcion_insecto == "1":
            print("Has llegado a: Hormiga 🐜")
        elif opcion_insecto == "2":
            print("Has llegado a: Mariposa 🦋")
        elif opcion_insecto == "3":
            print("Has llegado a: Escarabajo 🪲")
        else:
            print("Opción no válida.")
    else:
        print("Opción no válida.")

# Ejecutamos el código
seleccionar_animal()
