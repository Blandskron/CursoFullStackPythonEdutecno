-- Insertar datos en la tabla usando INSERT
INSERT INTO Libros (id, titulo, autor, publicado, genero, cantidad)
VALUES (1, '1984', 'George Orwell', 1949, 'Distopia', 3);

INSERT INTO Libros (id, titulo, autor, publicado, genero, cantidad)
VALUES (2, 'Orgullo y Prejuicio', 'Jane Austen', 1813, 'Romance', 5);

-- Actualizar datos en la tabla usando UPDATE
UPDATE Libros
SET cantidad = 4
WHERE titulo = '1984';

-- Eliminar datos de la tabla usando DELETE
DELETE FROM Libros
WHERE titulo = 'Orgullo y Prejuicio';
