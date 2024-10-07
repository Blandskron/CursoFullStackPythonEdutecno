import sqlite3

class Profesor:
    """Modelo que representa a un profesor."""

    def __init__(self, nombre, asignatura):
        self.nombre = nombre
        self.asignatura = asignatura

    @staticmethod
    def crear_tabla():
        """Crea la tabla de profesores en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS profesores (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT NOT NULL,
                    asignatura TEXT NOT NULL
                )
            ''')
            conn.commit()

    def guardar(self):
        """Guarda la información del profesor en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('INSERT INTO profesores (nombre, asignatura) VALUES (?, ?)', (self.nombre, self.asignatura))
            conn.commit()
