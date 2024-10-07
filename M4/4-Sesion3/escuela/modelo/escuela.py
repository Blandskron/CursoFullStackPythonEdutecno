import sqlite3

class Escuela:
    """Modelo que representa una escuela."""

    def __init__(self, nombre):
        self.nombre = nombre

    @staticmethod
    def crear_tabla():
        """Crea la tabla de escuelas en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS escuelas (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT NOT NULL
                )
            ''')
            conn.commit()

    def guardar(self):
        """Guarda la información de la escuela en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('INSERT INTO escuelas (nombre) VALUES (?)', (self.nombre,))
            conn.commit()
