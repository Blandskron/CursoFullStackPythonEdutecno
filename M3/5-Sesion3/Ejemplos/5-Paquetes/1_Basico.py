# Estructura de un paquete básico con __init__.py
# mi_paquete/
# ├── __init__.py
# └── modulo.py

# __init__.py
from .modulo import saludar

# modulo.py
def saludar():
    print("Hola desde el paquete!")
