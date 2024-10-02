# Definición de la clase Persona para entender el uso de 'self'
class Persona:
    nombre = ''  # Atributo nombre
    alto = False # Atributo alto, inicializado como False

    # Método que imprime información del objeto que llama al método
    def saludar(self):  # 'self' es el propio objeto
        print("Soy un objeto de la clase Persona")
        print(self)  # Imprime la dirección en memoria del objeto que llama

# Crear una instancia de la clase Persona
persona = Persona()

# Llamar al método saludar
persona.saludar()   # Imprime información sobre el objeto
print(persona.alto) # Salida: False
