def imprimir_nombres(nombres):
    for nombre in nombres:
        print(nombre)

def hacer_grandioso(nombres):
    """Agrega ‘El gran’ al principio de cada nombre."""
    grandiosos = []

    while nombres:
        mago = nombres.pop()
        grandiosos.append('El gran ' + mago)

    for gran_mago in grandiosos:
        nombres.append(gran_mago)

nombres = ['Harry Houdini', 'Newton', 'David Blaine', 'Hawking', 'Messi', 'Teller', 'Einstein', 'Pele', 'Juanes']
magos = ['Harry Houdini', 'David Blaine','Teller']
cientificos = ['Newton', 'Hawking', 'Einstein']

es_mago, es_cientifico, es_otro = list(), list(), list()

for nombre in nombres :
    if nombre in magos:
        es_mago.append(nombre)
    elif nombre in cientificos:
        es_cientifico.append(nombre)
    else:
        es_otro.append(nombre)

imprimir_nombres(nombres)

print("\n")
hacer_grandioso(es_mago)
print('Magos:')
imprimir_nombres(es_mago)

print("\n")
print('Cientificos:')
imprimir_nombres(es_cientifico)

print("\n")
print('Otros:')
imprimir_nombres(es_otro)