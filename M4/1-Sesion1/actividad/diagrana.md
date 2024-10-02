                   +------------------------+
                   |    MiembroDeEscuela     |
                   +------------------------+
                   | - nombre: str          |
                   | - edad: int            |
                   | - sexo: str            |
                   +------------------------+
                   | + imprimir_genero()    |
                   | + obtener_edad()       |
                   +------------------------+
                             ^
                             |
                 +-----------+-----------+
                 |                       |
     +----------------------+   +--------------------+
     |      Estudiante       |   |      Profesor      |
     +----------------------+   +--------------------+
     | - curso: str          |   | - salario_anual: int|
     +----------------------+   | - cursos_impartidos: |
     | + pagar_matricula()   |   |   list[str]         |
     | + imprimir_genero()   |   +--------------------+
     +----------------------+   | + consultar_salario_anual() |
                                 | + mostrar_cursos()         |
                                 +----------------------------+
