-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear tablas "Libros" y "Autores" con restricciones y valores por defecto

CREATE TABLE Autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50),
    fecha_nacimiento DATE
);

CREATE TABLE Libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    fecha_publicacion DATE,
    genero VARCHAR(50),
    stock INT CHECK (stock >= 0) DEFAULT 0,  -- El stock no puede ser negativo, con valor por defecto 0
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id) ON DELETE SET NULL
);

-- Crear tablas adicionales para miembros y empleados
CREATE TABLE Miembros (
    miembro_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(20) UNIQUE,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Empleados (
    empleado_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2) CHECK (salario >= 0)
);

-- Crear tabla Prestamos que relacione libros y miembros
CREATE TABLE Prestamos (
    prestamo_id SERIAL PRIMARY KEY,
    libro_id INT,
    miembro_id INT,
    fecha_prestamo DATE DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    devuelto BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (libro_id) REFERENCES Libros(libro_id) ON DELETE CASCADE,
    FOREIGN KEY (miembro_id) REFERENCES Miembros(miembro_id) ON DELETE CASCADE
);

-- Crear tabla Facturacion para cada multa generada por un retraso
CREATE TABLE Multas (
    multa_id SERIAL PRIMARY KEY,
    prestamo_id INT,
    fecha_multa DATE DEFAULT CURRENT_DATE,
    monto DECIMAL(10, 2) CHECK (monto >= 0),
    FOREIGN KEY (prestamo_id) REFERENCES Prestamos(prestamo_id) ON DELETE CASCADE
);

-- Alterar la tabla Empleados para agregar una columna de turno
ALTER TABLE Empleados ADD COLUMN turno VARCHAR(10) DEFAULT 'Diurno';

-- Renombrar la columna "turno" a "horario" en la tabla Empleados
ALTER TABLE Empleados RENAME COLUMN turno TO horario;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Crear relaciones adicionales y añadir restricciones en las tablas de Prestamos y Multas

-- Agregar restricción para asegurar que no haya más de un préstamo de un mismo libro al mismo miembro
ALTER TABLE Prestamos
ADD CONSTRAINT prestamo_unico UNIQUE (libro_id, miembro_id, fecha_prestamo);

-- Agregar una restricción para limitar el número máximo de préstamos activos por miembro a 3
ALTER TABLE Prestamos
ADD CONSTRAINT max_prestamos_activos CHECK (
    (SELECT COUNT(*) FROM Prestamos WHERE miembro_id = Prestamos.miembro_id AND devuelto = FALSE) <= 3
);

-- Desactivar temporalmente la restricción de préstamos únicos
ALTER TABLE Prestamos DISABLE CONSTRAINT prestamo_unico;

-- Reactivar la restricción
ALTER TABLE Prestamos ENABLE CONSTRAINT prestamo_unico;

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas Autores, Libros, y Miembros

INSERT INTO Autores (nombre, nacionalidad, fecha_nacimiento)
VALUES 
    ('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
    ('Jane Austen', 'Británica', '1775-12-16');

INSERT INTO Libros (titulo, fecha_publicacion, genero, stock, autor_id)
VALUES 
    ('Cien Años de Soledad', '1967-06-05', 'Realismo Mágico', 5, 1),
    ('Orgullo y Prejuicio', '1813-01-28', 'Romance', 3, 2);

INSERT INTO Miembros (nombre, direccion, telefono)
VALUES 
    ('Carlos Pérez', 'Av. Principal 123', '+56987654321'),
    ('Ana Torres', 'Calle Secundaria 456', '+56987651234');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, cargo, salario)
VALUES 
    ('Luisa García', 'Bibliotecaria', 2000),
    ('Juan Fernández', 'Auxiliar', 1500);

-- Registrar préstamos de libros para miembros
INSERT INTO Prestamos (libro_id, miembro_id, fecha_prestamo)
VALUES 
    (1, 1, '2024-02-01'),
    (2, 2, '2024-02-10');

-- Generar una multa para un préstamo específico
INSERT INTO Multas (prestamo_id, monto)
VALUES 
    (1, 20.00);  -- Multa de 20.00 por retraso

-- Modificar el salario de un empleado en la tabla Empleados
UPDATE Empleados
SET salario = salario * 1.05  -- Aumento de 5%
WHERE nombre = 'Luisa García';

-- Eliminar un libro específico de la tabla Libros
DELETE FROM Libros
WHERE titulo = 'Orgullo y Prejuicio';

-- Ejemplo de uso de condicional CASE para clasificar libros según su disponibilidad
SELECT titulo, stock,
    CASE 
        WHEN stock = 0 THEN 'No Disponible'
        WHEN stock <= 2 THEN 'Bajo Stock'
        ELSE 'Disponible'
    END AS estado_disponibilidad
FROM Libros;

-- Crear una vista para mostrar el historial de préstamos y multas de cada miembro
CREATE VIEW Historial_Prestamos AS
SELECT m.nombre AS miembro, l.titulo AS libro, p.fecha_prestamo, p.fecha_devolucion, multa.monto AS multa
FROM Miembros m
JOIN Prestamos p ON m.miembro_id = p.miembro_id
JOIN Libros l ON p.libro_id = l.libro_id
LEFT JOIN Multas multa ON p.prestamo_id = multa.prestamo_id;

-- Consultar la vista Historial_Prestamos
SELECT * FROM Historial_Prestamos;

-- Ejemplo de eliminación de la tabla Multas para finalizar
DROP TABLE IF EXISTS Multas CASCADE;
