signos = {
    'Acuario': 'Los acuario son personas amables, inteligentes y llenas de curiosidad por el mundo.',
    'Piscis': 'Los piscis son personas sensibles y emocionales, con una gran capacidad de empatía.',
    'Aries': 'Los aries son personas enérgicas, decididas y llenas de coraje, siempre listas para nuevos desafíos.',
    'Tauro': 'Los tauro son personas prácticas, pacientes y con una gran determinación para alcanzar sus metas.',
    'Géminis': 'Los géminis son personas versátiles, comunicativas y llenas de energía intelectual.',
    'Cáncer': 'Los cáncer son personas protectoras, emocionales y muy conectadas con su hogar y sus seres queridos.',
    'Leo': 'Los leo son personas carismáticas, generosas y con una gran capacidad para liderar y brillar en cualquier situación.',
    'Virgo': 'Los virgo son personas organizadas, detallistas y muy prácticas, siempre buscando la perfección en lo que hacen.',
    'Libra': 'Los libra son personas equilibradas, diplomáticas y con un gran sentido de la justicia y la armonía.',
    'Escorpio': 'Los escorpio son personas intensas, apasionadas y con una gran capacidad de transformación personal.',
    'Sagitario': 'Los sagitario son personas optimistas, aventureras y llenas de ganas de explorar y aprender.',
    'Capricornio': 'Los capricornio son personas disciplinadas, responsables y muy enfocadas en sus objetivos a largo plazo.'
}

while True:

    salir = int(input("Quieres salir ingresa 1 \n saber tu signo 2: "))

    if salir == 1:
        break
    else:
        mes = int(input("Ingresa el mes (1-12): "))
        dia = int(input("Ingresa el día (1-31): "))

        if (mes == 1 and dia >= 20) or (mes == 2 and dia <= 18):
            for signo, descripcion in signos.items():
                if signo == "Acuario":
                    print(signo, descripcion)
        elif (mes == 2 and dia >= 19) or (mes == 3 and dia <= 20):
            for signo, descripcion in signos.items():
                if signo == "Piscis":
                    print(signo, descripcion)
        elif (mes == 3 and dia >= 21) or (mes == 4 and dia <= 19):
            for signo, descripcion in signos.items():
                if signo == "Aries":
                    print(signo, descripcion)
        elif (mes == 4 and dia >= 20) or (mes == 5 and dia <= 20):
            for signo, descripcion in signos.items():
                if signo == "Tauro":
                    print(signo, descripcion)
        elif (mes == 5 and dia >= 21) or (mes == 6 and dia <= 20):
            for signo, descripcion in signos.items():
                if signo == "Géminis":
                    print(signo, descripcion)
        elif (mes == 6 and dia >= 21) or (mes == 7 and dia <= 22):
            for signo, descripcion in signos.items():
                if signo == "Cáncer":
                    print(signo, descripcion)
        elif (mes == 7 and dia >= 23) or (mes == 8 and dia <= 22):
            for signo, descripcion in signos.items():
                if signo == "Leo":
                    print(signo, descripcion)
        elif (mes == 8 and dia >= 23) or (mes == 9 and dia <= 22):
            for signo, descripcion in signos.items():
                if signo == "Virgo":
                    print(signo, descripcion)
        elif (mes == 9 and dia >= 23) or (mes == 10 and dia <= 22):
            for signo, descripcion in signos.items():
                if signo == "Libra":
                    print(signo, descripcion)
        elif (mes == 10 and dia >= 23) or (mes == 11 and dia <= 21):
            for signo, descripcion in signos.items():
                if signo == "Escorpión":
                    print(signo, descripcion)
        elif (mes == 11 and dia >= 22) or (mes == 12 and dia <= 21):
            for signo, descripcion in signos.items():
                if signo == "Sagitario":
                    print(signo, descripcion)
        elif (mes == 12 and dia >= 22) or (mes == 1 and dia <= 19):
            for signo, descripcion in signos.items():
                if signo == "Capricornio":
                    print(signo, descripcion)
        else:
            signo = 'Desconocido'
            descripcion = 'Fecha fuera del rango de signos zodiacales.'
            print(f"Tu signo es: {signo} descripcion {descripcion}")
 