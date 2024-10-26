CREATE TABLE Tipo (
    tipo_id INT PRIMARY KEY,
    nombre_tipo VARCHAR(100) UNIQUE
);

CREATE TABLE Entrenador (
    entrenador_id INT PRIMARY KEY,
    nombre_entrenador VARCHAR(100),
    region VARCHAR(100)
);

CREATE TABLE Pokemon (
    pokemon_id INT PRIMARY KEY,
    nombre_pokemon VARCHAR(100) UNIQUE,
    tipo_id INT,
    altura DECIMAL(5, 2),
    peso DECIMAL(5, 2),
    FOREIGN KEY (tipo_id) REFERENCES Tipo(tipo_id)
);

CREATE TABLE Movimiento (
    movimiento_id INT PRIMARY KEY,
    nombre_movimiento VARCHAR(100) UNIQUE,
    tipo_id INT,
    potencia INT,
    precision DECIMAL(5, 2),
    FOREIGN KEY (tipo_id) REFERENCES Tipo(tipo_id)
);

CREATE TABLE EntrenadorPokemon (
    entrenador_pokemon_id INT PRIMARY KEY,
    entrenador_id INT,
    pokemon_id INT,
    nivel INT,
    FOREIGN KEY (entrenador_id) REFERENCES Entrenador(entrenador_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);

CREATE TABLE PokemonMovimiento (
    pokemon_movimiento_id INT PRIMARY KEY,
    pokemon_id INT,
    movimiento_id INT,
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (movimiento_id) REFERENCES Movimiento(movimiento_id)
);

INSERT INTO Tipo (tipo_id, nombre_tipo) VALUES
(1, 'Fuego'),
(2, 'Agua'),
(3, 'Planta');

INSERT INTO Entrenador (entrenador_id, nombre_entrenador, region) VALUES
(1, 'Ash Ketchum', 'Kanto'),
(2, 'Misty', 'Kanto'),
(3, 'Brock', 'Kanto');

INSERT INTO Pokemon (pokemon_id, nombre_pokemon, tipo_id, altura, peso) VALUES
(1, 'Charmander', 1, 0.6, 8.5),
(2, 'Squirtle', 2, 0.5, 9.0),
(3, 'Bulbasaur', 3, 0.7, 6.9);

INSERT INTO Movimiento (movimiento_id, nombre_movimiento, tipo_id, potencia, precision) VALUES
(1, 'Lanzallamas', 1, 90, 1.0),
(2, 'Burbuja', 2, 40, 1.0),
(3, 'Latigo Cepa', 3, 45, 1.0);

INSERT INTO EntrenadorPokemon (entrenador_pokemon_id, entrenador_id, pokemon_id, nivel) VALUES
(1, 1, 1, 10),
(2, 2, 2, 12),
(3, 3, 3, 8);

INSERT INTO PokemonMovimiento (pokemon_movimiento_id, pokemon_id, movimiento_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

SELECT * FROM entrenador
SELECT * FROM pokemon
SELECT * FROM movimiento
SELECT * FROM entrenadorpokemon
SELECT * FROM pokemonmovimiento
-- entrenador_id - pokemon_id - movimiento_id
-- nombre_entrenador - nombre_pokemon - nombre_movimiento
SELECT nombre_entrenador, nombre_pokemon
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id

SELECT nombre_pokemon, nombre_movimiento
FROM pokemonmovimiento PM
JOIN movimiento MV ON PM.movimiento_id = MV.movimiento_id
JOIN pokemon PK ON PM.pokemon_id = PK.pokemon_id

SELECT nombre_entrenador AS Entrenador, nombre_pokemon AS Pokemon, nombre_movimiento AS Movimiento
FROM entrenadorpokemon EP
JOIN entrenador ET ON EP.entrenador_id = ET.entrenador_id
JOIN pokemon PK ON EP.pokemon_id = PK.pokemon_id
JOIN movimiento MT ON PK.tipo_id = MT.tipo_id
