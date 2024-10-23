-- Modelo relacional
CREATE TABLE Otec (
    otec_id INT PRIMARY KEY,
    nombre_otec VARCHAR(100) NOT NULL
);

CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY,
    nombre_curso VARCHAR(50) NOT NULL
);

CREATE TABLE Profesores (
    profesor_id INT PRIMARY KEY,
    nombre_profesor VARCHAR(50) NOT NULL,
	apellido_profesor VARCHAR(50) NOT NULL,
    email_profesor VARCHAR(100) UNIQUE
);

CREATE TABLE Alumnos (
    alumno_id INT PRIMARY KEY,
    nombre_alumno VARCHAR(50) NOT NULL,
	apellido_alumno VARCHAR(50) NOT NULL,
    email_alumno VARCHAR(100) UNIQUE
);

-- Relación
CREATE TABLE Otec_Cursos (
    otec_curso_id INT PRIMARY KEY,
    otec_id INT,
    curso_id INT,
    fecha_inicio DATE,
    FOREIGN KEY (otec_id) REFERENCES Otec(otec_id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

CREATE TABLE Asignacion_Curso (
	asignacion_curso_id INT PRIMARY KEY,
	otec_curso_id INT,
	profesor_id INT,
	FOREIGN KEY (otec_curso_id) REFERENCES Otec_Cursos(otec_curso_id),
	FOREIGN KEY (profesor_id) REFERENCES Profesores(profesor_id)
);

CREATE TABLE Curso_Alumnos (
	curso_alumno_id INT PRIMARY KEY,
	asignacion_curso_id INT,
	alumno_id INT,
	FOREIGN KEY (asignacion_curso_id) REFERENCES Asignacion_Curso(asignacion_curso_id),
	FOREIGN KEY (alumno_id) REFERENCES Alumnos(alumno_id)
);

-- Insercion de Data
-- Insertar datos en la tabla Otec
INSERT INTO Otec (otec_id, nombre_otec)
VALUES (1, 'Edutecno');

-- Insertar datos en la tabla Cursos
INSERT INTO Cursos (curso_id, nombre_curso)
VALUES 
(1, 'Fullstack Python'),
(2, 'Fullstack Java'),
(3, 'UX-UI');

-- Insertar datos en la tabla Profesores
INSERT INTO Profesores (profesor_id, nombre_profesor, apellido_profesor, email_profesor)
VALUES 
(1, 'Bastian', 'Landskron', 'bastian.landskron@edutecno.com'),
(2, 'Alejandro', 'Jhonson', 'alejandro.jhonson@edutecno.com');

-- Insertar datos en la tabla Alumnos
INSERT INTO Alumnos (alumno_id, nombre_alumno, apellido_alumno, email_alumno)
VALUES 
(1, 'Aldo Roberto', 'Frez Vásquez', 'aldo.frez@edutecno.com'),
(2, 'Bastián Fernando', 'Araya Chacón', 'bastian.araya@edutecno.com'),
(3, 'Christian Antonio', 'López Fernández', 'christian.lopez@edutecno.com'),
(4, 'Daniel Bernardo', 'Ugalde Muñoz', 'daniel.ugalde@edutecno.com'),
(5, 'Daniela Constanza', 'Miranda Martínez', 'daniela.miranda@edutecno.com'),
(6, 'Diego Ignacio', 'González Baeza', 'diego.gonzalez@edutecno.com'),
(7, 'Erick Gustavo', 'Milla Carrizo', 'erick.milla@edutecno.com'),
(8, 'Fernando Andrés', 'Quezada Puño', 'fernando.quezada@edutecno.com'),
(9, 'Francisco Andrés', 'Jiménez Alcántara', 'francisco.jimenez@edutecno.com'),
(10, 'Gastón Guillermo', 'Iglesias Rojas', 'gaston.iglesias@edutecno.com'),
(11, 'Ignacio Alejandro', 'Arteaga Vega', 'ignacio.arteaga@edutecno.com'),
(12, 'Ignacio Andrés', 'Sepúlveda Chacana', 'ignacio.sepulveda@edutecno.com'),
(13, 'Maximiliano Francisco', 'Luksic Rosales', 'maximiliano.luksic@edutecno.com'),
(14, 'Natalia Paz', 'Meza Ramos', 'natalia.meza@edutecno.com'),
(15, 'Persida Febe', 'Aguilera Gatica', 'persida.aguilera@edutecno.com'),
(16, 'Rodrigo Esteban', 'Péndola Cortez', 'rodrigo.pendola@edutecno.com'),
(17, 'Ruth Andrea', 'Quilamán Olivares', 'ruth.quilaman@edutecno.com'),
(18, 'Solange Lissette', 'Castillo Briceño', 'solange.castillo@edutecno.com'),
(19, 'Carlos Enrique', 'Vasquez Colimilla', 'carlos.vasquez@edutecno.com'),
(20, 'Carlos', 'Cárdenas', 'carlos.cardenas@edutecno.com'),
(21, 'Juan Camilo', 'Barrientos Gonzalez', 'juan.barrientos@edutecno.com'),
(22, 'Allan', 'Acosta', 'allan.acosta@edutecno.com'),
(23, 'Fernando', 'De La Barra', 'fernando.delabarra@edutecno.com'),
(24, 'Hector', 'Vargas', 'hector.vargas@edutecno.com'),
(25, 'Cristhian', 'Borquez', 'cristi.borquez@edutecno.com'),
(26, 'Luis', 'Abarca', 'luis.abarca@edutecno.com'),
(27, 'Matias', 'Bustos', 'matias.bustos@edutecno.com'),
(28, 'Victor', 'Acuña', 'victor.acuna@edutecno.com'),
(29, 'Damian', 'Sasia', 'damian.sasia@edutecno.com');

-- Insersion de Relacion
-- Insertar datos en la tabla Otec_Cursos
INSERT INTO Otec_Cursos (otec_curso_id, otec_id, curso_id, fecha_inicio)
VALUES 
(1, 1, 1, '2025-11-01'), -- Fullstack Python
(2, 1, 2, '2025-12-01'), -- Fullstack Java
(3, 1, 3, '2025-01-01'); -- UX-UI

-- Insertar datos en la tabla Asignacion_Curso
INSERT INTO Asignacion_Curso (asignacion_curso_id, otec_curso_id, profesor_id)
VALUES 
(1, 1, 1), -- Bastian: Fullstack Python
(2, 2, 2), -- Alejandro: Fullstack Java
(3, 3, 2); -- Alejandro: UX-UI

-- Insertar alumnos en la tabla Curso_Alumnos
INSERT INTO Curso_Alumnos (curso_alumno_id, asignacion_curso_id, alumno_id)
VALUES
-- Fullstack Python con Bastian (10 alumnos)
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),

-- Fullstack Java con Alejandro (10 alumnos)
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),

-- UX-UI con Alejandro (9 alumnos)
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 3, 25),
(26, 3, 26),
(27, 3, 27),
(28, 3, 28),
(29, 3, 29);

-- Consulta Cursos
SELECT nombre_curso
FROM Cursos;

-- Consulta Profesores
SELECT nombre_profesor, apellido_profesor, email_profesor
FROM Profesores;

-- Consulta Alumnos
SELECT nombre_alumno, apellido_alumno, email_alumno
FROM Alumnos;

-- Consulta Asiganacion Curso
SELECT profesor_id, otec_curso_id
FROM Asignacion_Curso;

-- Consulta Asiganacion Otec - Curso
SELECT curso_id, fecha_inicio
FROM Otec_Cursos;

-- Consulta Asignacion Alumnos Cursos
SELECT asignacion_curso_id, alumno_id
FROM Curso_Alumnos;
