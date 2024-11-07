-- Modificar la tabla usando ALTER para agregar una nueva columna
ALTER TABLE Libros
ADD idioma VARCHAR(50);

-- Eliminar la tabla usando DROP
DROP TABLE IF EXISTS Libros;
