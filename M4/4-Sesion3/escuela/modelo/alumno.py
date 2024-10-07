import sqlite3

class Alumno:
    """Modelo que representa a un alumno."""

    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    @staticmethod
    def crear_tabla():
        """Crea la tabla de alumnos en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS alumnos (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT NOT NULL,
                    edad INTEGER NOT NULL
                )
            ''')
            conn.commit()

    def guardar(self):
        """Guarda la información del alumno en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('INSERT INTO alumnos (nombre, edad) VALUES (?, ?)', (self.nombre, self.edad))
            conn.commit()
