/*para acceder a la base de datos */
mysql -h localhost -u root -p
/*Crear BD*/
CREATE DATABASE PelayoProductions;

use PelayoProductions;



CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre_artista VARCHAR(30) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo_album VARCHAR(50) NOT NULL UNIQUE,
    id_artista INT, -- This is the foreign key column
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);


CREATE TABLE Grabaciones (
    id_grabaciones INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_artista INT,
    titulo_cancion VARCHAR(40) NOT NULL,
    titulo_album VARCHAR(50) NOT NULL,
    fecha_hora_grabacion DATETIME NOT NULL,
    FOREIGN KEY (titulo_album) REFERENCES Albumes(titulo_album)
);


CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo_album VARCHAR(50) NOT NULL,
    fecha_lanzamiento DATE,
    id_artista INT,
    genero VARCHAR(20),
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);


/*CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo_cancion VARCHAR(40) NOT NULL,
    id_artista INT,
    genero VARCHAR(20),
    duracion TIME,
    compositor VARCHAR(50),
    productores VARCHAR(50),
    letra TEXT, 
    id_artista INT FOREIGN KEY REFERENCES Artistas(id_artista)
);*/

CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titulo_cancion VARCHAR(40) NOT NULL,
    id_artista INT,
    genero VARCHAR(20),
    duracion TIME,
    compositor VARCHAR(50),
    productores VARCHAR(50),
    letra TEXT,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);


CREATE TABLE Contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_artista INT NOT NULL,
    fecha_hora_evento DATETIME,
    cantidad_horas INT NOT NULL,
    num_tel_cliente VARCHAR(20) NOT NULL, -- Specify the maximum length for VARCHAR
    info_pago TEXT, -- TEXT does not require a length specifier
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);


CREATE TABLE EventosEnVivo (
    id_evento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo_evento VARCHAR(100) NOT NULL,
    fecha_hora_evento DATETIME,
    lugar_evento VARCHAR(100),
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);
