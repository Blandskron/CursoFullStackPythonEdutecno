import sqlite3

# Clase que representa un Usuario
class Usuario:
    def __init__(self, nombre, email):
        self.nombre = nombre
        self.email = email

    def __str__(self):
        return f"Usuario(nombre={self.nombre}, email={self.email})"

# Función para crear una conexión a la base de datos SQLite
def conectar_db():
    return sqlite3.connect('usuarios.db')

# Función para crear la tabla de usuarios si no existe
def crear_tabla():
    conn = conectar_db()
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE
        )
    ''')
    conn.commit()
    conn.close()

# Función para agregar un usuario a la base de datos
def agregar_usuario(usuario):
    conn = conectar_db()
    cursor = conn.cursor()
    try:
        cursor.execute('''
            INSERT INTO usuarios (nombre, email)
            VALUES (?, ?)
        ''', (usuario.nombre, usuario.email))
        conn.commit()
    except sqlite3.IntegrityError:
        print(f"Error: El correo {usuario.email} ya está en uso.")
    finally:
        conn.close()

# Función para obtener todos los usuarios de la base de datos
def obtener_usuarios():
    conn = conectar_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM usuarios')
    rows = cursor.fetchall()
    conn.close()
    return rows

# Ejecución del código
if __name__ == "__main__":
    crear_tabla()

    # Crear algunos usuarios
    usuario1 = Usuario("Ana", "ana@example.com")
    usuario2 = Usuario("Luis", "luis@example.com")
    usuario3 = Usuario("Pedro", "pedro@example.com")

    # Agregar usuarios a la base de datos
    agregar_usuario(usuario1)
    agregar_usuario(usuario2)
    agregar_usuario(usuario3)
    agregar_usuario(usuario1)  # Intento de agregar un usuario con un correo duplicado

    # Obtener y mostrar todos los usuarios
    usuarios = obtener_usuarios()
    for usuario in usuarios:
        print(usuario)
