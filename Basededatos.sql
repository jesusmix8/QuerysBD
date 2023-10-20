/* Aqui iran los querys de la creacion de la base de datos */
CREATE TABLE persona (
    RFC VARCHAR(13) PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
	numeroDeTelefono NUMERIC(10) NOT NULL,
	correo VARCHAR(50) NOT NULL,
    fechadeNacimiento DATE NOT NULL,
	genero VARCHAR(1) Not NULL,
	direccion_ID integer UNIQUE REFERENCES direccion(direccion_ID)
);


CREATE TABLE cliente (
    cliente_ID serial PRIMARY KEY NOT NULL,  
	usuario VARCHAR(10) NOT NULL,
	contraseña VARCHAR (10) NOT NULL
) INHERITS (persona);

CREATE TABLE empleado (
    empleado_ID serial PRIMARY KEY NOT NULL,
	puesto VARCHAR (50) NOT NULL,
	fechadecontratacion DATE NOT NULL
) INHERITS (persona);



CREATE TABLE cuenta(
	cuenta_ID SERIAL PRIMARY KEY NOT null
	cliente_ID integer UNIQUE REFERENCES cliente(cliente_ID),
	servicios_ID integer UNIQUE REFERENCES servicio(servicios_ID)
);


CREATE TABLE transaccion (
	transaccion_ID serial PRIMARY KEY NOT NULL,
	fechaDeTransaccion DATE NOT NULL,
	tipoDeMovimiento VARCHAR(50) NOT NULL,
	cuentaOrigen varchar (25) NOT NULL,
	cuentaDestino varchar (25) NOT NULL,
	monto float (2) NOT NULL,
	concepto varchar(50) NOT NULL,
	cuenta_ID integer REFERENCES cuenta(cuenta_ID)
);


CREATE TABLE servicio (
	serial_ID serial Primary key not null,
	nombreDeServicio Varchar (50) not null,
	cuenta_ID integer UNIQUE REFERENCES cuenta (cuenta_ID)
);



CREATE TABLE direccion(
	direccion_ID serial PRIMARY KEY NOT NULL,
	calle VARCHAR(30) NOT NULL,
	codigoPostal VARCHAR(5) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	colonia VARCHAR(30) NOT NULL
);

CREATE TABLE sucursal(
	sucursal_ID serial PRIMARY KEY NOT NULL,
	nomSucursal VARCHAR(25) NOT NULL,
	horario TIME NOT NULL,
	telefonoDeContacto NUMERIC(10) NOT NULL,
	direccion_ID integer UNIQUE REFERENCES direccion(direccion_ID),
	cliente_ID integer UNIQUE REFERENCES cliente(cliente_ID),
	empleado_ID integer UNIQUE REFERENCES empleado(empleado_ID)
);

CREATE TABLE estado(
	estado_ID serial PRIMARY KEY NOT NULL,
	nomEstado VARCHAR(30) NOT NULL
);

CREATE TABLE municipio(
	municipio_ID serial PRIMARY KEY NOT NULL,
	nomMunicipio VARCHAR(30) NOT NULL
);

CREATE TABLE caracteristica_servicio (
    concepto VARCHAR(255),
    cveInterbancaria NUMERIC(18),
    noTarjeta NUMERIC(16),
    lineaDeCredito FLOAT,
    fechaDeCredito DATE,
    fechaDeExpiracion DATE,
    cvv INTEGER,
    nip INTEGER,
    fechaDeApertura DATE ,
    pagoMinimo FLOAT ,
    pagoParaNoGenerarIntereses FLOAT,
    promociones VARCHAR(50),
    fechaDePago DATE,
    intereses FLOAT,
    saldo FLOAT,
    servicios_ID integer UNIQUE REFERENCES servicio(idSerial)
);