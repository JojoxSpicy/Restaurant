-- Creación de la tabla Personal

CREATE TABLE
    Personal (
        ID_Personal INT PRIMARY KEY AUTO_INCREMENT,
        Nombre VARCHAR(50),
        Apellido VARCHAR(50),
        Puesto VARCHAR(50),
        Telefono VARCHAR(15),
        Correo_Electronico VARCHAR(100),
        Contrasena VARCHAR(255) -- Almacenar la contraseña como un hash
    );

CREATE TABLE
    clientes (
        id_cliente INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        telefono VARCHAR(20),
        email VARCHAR(100),
        PRIMARY KEY (id_cliente)
    );

CREATE TABLE
    reservas (
        id_reserva INT NOT NULL AUTO_INCREMENT,
        id_cliente INT NOT NULL,
        fecha_reserva DATE NOT NULL,
        hora_reserva TIME NOT NULL,
        num_personas INT NOT NULL,
        PRIMARY KEY (id_reserva),
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );

CREATE TABLE
    mesas (
        id_mesa INT NOT NULL AUTO_INCREMENT,
        capacidad INT NOT NULL,
        PRIMARY KEY (id_mesa)
    );

CREATE TABLE
    mesas_reservas (
        id_reserva INT NOT NULL,
        id_mesa INT NOT NULL,
        PRIMARY KEY (id_reserva, id_mesa),
        FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
        FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
    );

CREATE TABLE
    platos (
        id_plato INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(100) NOT NULL,
        descripcion TEXT,
        precio DECIMAL(10, 2) NOT NULL,
        PRIMARY KEY (id_plato)
    );

CREATE TABLE
    categorias (
        id_categoria INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        PRIMARY KEY (id_categoria)
    );

CREATE TABLE
    platos_categorias (
        id_plato INT NOT NULL,
        id_categoria INT NOT NULL,
        PRIMARY KEY (id_plato, id_categoria),
        FOREIGN KEY (id_plato) REFERENCES platos(id_plato),
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
    );

CREATE TABLE
    ordenes (
        id_orden INT NOT NULL AUTO_INCREMENT,
        id_cliente INT NOT NULL,
        fecha_orden DATE NOT NULL,
        hora_orden TIME NOT NULL,
        total DECIMAL(10, 2) NOT NULL,
        PRIMARY KEY (id_orden),
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );

CREATE TABLE
    ordenes_platos (
        id_orden INT NOT NULL,
        id_plato INT NOT NULL,
        cantidad INT NOT NULL,
        PRIMARY KEY (id_orden, id_plato),
        FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
        FOREIGN KEY (id_plato) REFERENCES platos(id_plato)
    );