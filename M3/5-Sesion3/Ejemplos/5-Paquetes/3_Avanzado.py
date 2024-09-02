# Manejar paquetes en múltiples directorios y referencias internas
# mi_proyecto/
# ├── paquete1/
# │   ├── __init__.py
# │   └── modulo1.py
# └── paquete2/
#     ├── __init__.py
#     └── modulo2.py

# paquete1/__init__.py
from .modulo1 import funcion_modulo1

# paquete2/__init__.py
from .modulo2 import funcion_modulo2

# main.py
from paquete1 import funcion_modulo1
from paquete2 import funcion_modulo2

funcion_modulo1()
funcion_modulo2()
