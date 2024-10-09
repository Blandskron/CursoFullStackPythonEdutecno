# Definir la clase Libro
class Libro:
    pass

# Crear las instancias libro_1 y libro_2
libro_1 = Libro()
libro_2 = Libro()

# Asignar atributos de instancia utilizando la notación de puntos
libro_1.autor = 'Dan Brown'
libro_1.titulo = 'Infierno'

libro_2.autor = 'Dan Brown'
libro_2.titulo = 'El Código Da Vinci'
libro_2.ann_de_publicacion = 2003

# Imprimir los atributos de cada objeto usando __dict__
print("Atributos de libro_1:", libro_1.__dict__)
print("Atributos de libro_2:", libro_2.__dict__)
