/*para acceder a la base de datos */
mysql -h localhost -u root -p
/*Para crear la base de datos*/
CREATE DATABASE blog;
/*designar  que base de datos vas a utilizar*/
use blog;
/*Crear la tabla de la base de datos*/
CREATE TABLE IF NOT EXISTS usuarios (
    usuarios_id INTEGER UNSIGNED AUTO_INCREMENT,
    login VARCHAR(30) NOT NULL,
    password  VARCHAR(30) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY (usuarios_id)
);


CREATE TABLE IF NOT EXISTS categorias (
    categorias_id INTEGER UNSIGNED AUTO_INCREMENT,
    categoria VARCHAR(30),
    PRIMARY KEY (categorias_id)
);

 CREATE TABLE posts ( 
    posts_id INTEGER PRIMARY KEY, 
    titulo VARCHAR(150), 
    fecha_publicacion TIMESTAMP, 
    contenido TEXT, 
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(usuarios_id);
    FOREIGN KEY (categorias_id) REFERENCES categorias(categorias_id);
 );

CREATE TABLE IF NOT EXISTS etiquetas (
    etiquetas_id INTEGER UNSIGNED AUTO_INCREMENT,
    nombre_etiqueta VARCHAR(30),
    PRIMARY KEY (etiquetas_id)
);

ALTER TABLE post FOREIGN KEY (usuarios_id) REFERENCES usuarios(usuarios_id);

CREATE TABLE IF NOT EXISTS posts_etiquetas (
    post_id INTEGER ;
);

ALTER TABLE posts_etiquetas ADD COLUMN etiquetas_id INT;
ALTER TABLE posts_etiquetas FOREIGN KEY (usuarios_id) REFERENCES usuarios(usuarios_id);

ALTER TABLE usuarios ADD name VARCHAR (30) NOT NULL;
ALTER TABLE usuarios ADD apellido VARCHAR (30) NOT NULL;
ALTER TABLE usuarios DROP COLUMN login;
ALTER TABLE usuarios ADD empresa VARCHAR(30) NOT NULL;
ALTER TABLE usuarios ADD telefono INT (10) NOT NULL;
ALTER TABLE usuarios ADD pais VARCHAR (30) NOT NULL;

ALTER TABLE posts MODIFY COLUMN contenido VARCHAR(250);
ALTER TABLE usuarios ADD Edad INT (3) NOT NULL CHECK (Edad>=18);

CREATE TABLE IF NOT EXISTS Mensajeria(
    mensajeria_id INTEGER PRIMARY KEY,
    emisor INT,
    receptor VARCHAR(30) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL
);