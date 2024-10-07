import sqlite3

class Curso:
    """Modelo que representa un curso."""

    def __init__(self, nombre, profesor_id):
        self.nombre = nombre
        self.profesor_id = profesor_id

    @staticmethod
    def crear_tabla():
        """Crea la tabla de cursos en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS cursos (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT NOT NULL,
                    profesor_id INTEGER,
                    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
                )
            ''')
            conn.commit()

    def guardar(self):
        """Guarda la información del curso en la base de datos."""
        with sqlite3.connect('escuela.db') as conn:
            cursor = conn.cursor()
            cursor.execute('INSERT INTO cursos (nombre, profesor_id) VALUES (?, ?)', (self.nombre, self.profesor_id))
            conn.commit()
