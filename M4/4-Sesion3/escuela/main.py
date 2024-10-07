from modelo.alumno import Alumno
from modelo.profesor import Profesor
from modelo.curso import Curso
from modelo.escuela import Escuela

def main():
    # Crear tablas
    Alumno.crear_tabla()
    Profesor.crear_tabla()
    Curso.crear_tabla()
    Escuela.crear_tabla()

    # Ingresar información de alumnos
    num_alumnos = int(input("¿Cuántos alumnos desea ingresar? "))
    for _ in range(num_alumnos):
        nombre = input("Ingrese el nombre del alumno: ")
        edad = int(input("Ingrese la edad del alumno: "))
        alumno = Alumno(nombre, edad)
        alumno.guardar()
        print(f"Alumno '{nombre}' guardado exitosamente.")

    # Ingresar información de profesores
    num_profesores = int(input("¿Cuántos profesores desea ingresar? "))
    for _ in range(num_profesores):
        nombre = input("Ingrese el nombre del profesor: ")
        asignatura = input("Ingrese la asignatura del profesor: ")
        profesor = Profesor(nombre, asignatura)
        profesor.guardar()
        print(f"Profesor '{nombre}' guardado exitosamente.")

    # Ingresar información de cursos
    num_cursos = int(input("¿Cuántos cursos desea ingresar? "))
    for _ in range(num_cursos):
        nombre_curso = input("Ingrese el nombre del curso: ")
        profesor_id = int(input("Ingrese el ID del profesor: "))  # Supongamos que ya se conocen los IDs
        curso = Curso(nombre_curso, profesor_id)
        curso.guardar()
        print(f"Curso '{nombre_curso}' guardado exitosamente.")

    # Ingresar información de la escuela
    nombre_escuela = input("Ingrese el nombre de la escuela: ")
    escuela = Escuela(nombre_escuela)
    escuela.guardar()
    print(f"Escuela '{nombre_escuela}' guardada exitosamente.")

    print("Todos los datos han sido guardados exitosamente en la base de datos.")

if __name__ == "__main__":
    main()
