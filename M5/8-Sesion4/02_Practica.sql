-- EXERCISE 1: CREANDO SENTENCIAS DDL
-- Crear una tabla "Maquinaria" con tipos de datos y agregar "PlantaProduccion" para simular relaciones
CREATE TABLE Maquinaria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE PlantaProduccion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    maquinaria_id INT,
    FOREIGN KEY (maquinaria_id) REFERENCES Maquinaria(id)
);

-- Alterar la tabla para cambiar el nombre de una columna
ALTER TABLE PlantaProduccion RENAME COLUMN maquinaria_id TO id_maquinaria;

-- Ejemplo de agregar columna
ALTER TABLE PlantaProduccion ADD COLUMN ubicacion VARCHAR(100) DEFAULT 'Desconocida';

-- Ejemplo de borrar una columna
ALTER TABLE PlantaProduccion DROP COLUMN ubicacion;

-- EXERCISE 2: PASANDO DE UN MODELO RELACIONAL A UNO FÍSICO
-- Creación de más tablas y relaciones (uno a muchos, muchos a uno)

CREATE TABLE Produccion (
    id SERIAL PRIMARY KEY,
    planta_prod_id INT,
    fecha_inicio DATE,
    fecha_termino DATE,
    FOREIGN KEY (planta_prod_id) REFERENCES PlantaProduccion(id) ON DELETE CASCADE
);

CREATE TABLE Bodega (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Receta (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE DetalleProduccion (
    id SERIAL PRIMARY KEY,
    produccion_id INT,
    bodega_id INT,
    receta_id INT,
    FOREIGN KEY (produccion_id) REFERENCES Produccion(id) ON DELETE CASCADE,
    FOREIGN KEY (bodega_id) REFERENCES Bodega(id),
    FOREIGN KEY (receta_id) REFERENCES Receta(id)
);

-- EXERCISE 3: CREANDO SENTENCIAS DML
-- Insertar datos en las tablas creadas

INSERT INTO Maquinaria (nombre) VALUES ('Maquina A'), ('Maquina B');
INSERT INTO PlantaProduccion (nombre, id_maquinaria) VALUES ('Planta 1', 1), ('Planta 2', 2);

INSERT INTO Produccion (planta_prod_id, fecha_inicio) VALUES (1, '2024-01-15');
INSERT INTO Bodega (nombre) VALUES ('Bodega Principal');
INSERT INTO Receta (nombre) VALUES ('Receta Especial');

-- Insertar en DetalleProduccion con referencias
INSERT INTO DetalleProduccion (produccion_id, bodega_id, receta_id)
VALUES (1, 1, 1);

-- Modificar un dato específico en una tabla usando UPDATE
UPDATE PlantaProduccion SET nombre = 'Planta Actualizada' WHERE id = 1;

-- Eliminar un registro específico con DELETE
DELETE FROM Maquinaria WHERE id = 2;

-- Condicional CASE para clasificar producción por fecha
SELECT nombre,
    CASE 
        WHEN fecha_inicio < '2024-01-01' THEN 'Producción Antigua'
        WHEN fecha_inicio >= '2024-01-01' THEN 'Producción Reciente'
        ELSE 'Sin Fecha'
    END AS clasificacion_fecha
FROM Produccion;
