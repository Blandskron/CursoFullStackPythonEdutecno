# Clase base para Usuario
class Usuario:
    def __init__(self, nombre, email):
        self.nombre = nombre
        self.email = email
    
    def obtener_info(self):
        return f"Usuario: {self.nombre}, Email: {self.email}"

# Subclase Cliente que hereda de Usuario
class Cliente(Usuario):
    def __init__(self, nombre, email, numero_cliente):
        super().__init__(nombre, email)
        self.numero_cliente = numero_cliente
    
    def obtener_info(self):
        return f"Cliente {self.nombre} (ID: {self.numero_cliente}), Email: {self.email}"

# Subclase Empleado que hereda de Usuario
class Empleado(Usuario):
    def __init__(self, nombre, email, puesto):
        super().__init__(nombre, email)
        self.puesto = puesto
    
    def obtener_info(self):
        return f"Empleado: {self.nombre}, Puesto: {self.puesto}, Email: {self.email}"

# Ejemplo de uso
cliente = Cliente("Ana Pérez", "ana@example.com", "C123")
empleado = Empleado("Carlos García", "carlos@example.com", "Gerente de Ventas")

# Mostrar información
print(cliente.obtener_info())
print(empleado.obtener_info())
