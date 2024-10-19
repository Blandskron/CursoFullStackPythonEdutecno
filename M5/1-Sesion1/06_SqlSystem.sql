-- Ejemplo 1: SQL básico para gestionar una base de datos de empleados.
INSERT INTO Empleados (empleado_id, nombre, salario)
VALUES (1, 'Carlos Gómez', 3000.00),
       (2, 'Lucía Martínez', 3500.50);

-- Actualizamos el salario de un empleado
UPDATE Empleados
SET salario = 3200.00
WHERE empleado_id = 1;

-- Eliminamos un empleado
DELETE FROM Empleados
WHERE empleado_id = 2;

-- Ejemplo 2: SQL básico para gestionar una base de datos de libros.
INSERT INTO Libros (libro_id, titulo, autor, precio)
VALUES (1, 'Cien años de soledad', 'Gabriel García Márquez', 15.99),
       (2, 'Don Quijote', 'Miguel de Cervantes', 18.50);

-- Consultamos todos los libros
SELECT * FROM Libros;

-- Actualizamos el precio de un libro
UPDATE Libros
SET precio = 17.99
WHERE libro_id = 2;

-- Eliminamos un libro
DELETE FROM Libros
WHERE libro_id = 1;
