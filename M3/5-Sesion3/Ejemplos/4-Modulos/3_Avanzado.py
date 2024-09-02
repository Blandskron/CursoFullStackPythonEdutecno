# Importar un módulo como script y manejar rutas de búsqueda
# my_module.py
def saludar():
    print("Hola desde el módulo!")

# main.py
import sys
sys.path.append('/ruta/al/modulo')
import my_module

my_module.saludar()
