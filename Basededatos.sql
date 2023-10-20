/* Aqui iran los querys de la creacion de la base de datos */
CREATE TABLE persona (
    RFC VARCHAR(12) PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
	numeroDeTelefono NUMERIC(10) NOT NULL,
	correo VARCHAR(35) NOT NULL,
    fechadeNacimiento DATE NOT NULL,
	genero VARCHAR(20) Not NULL,
	direccion_ID integer UNIQUE REFERENCES direccion(direccion_ID)
);


CREATE TABLE cliente (
    cliente_ID serial PRIMARY KEY NOT NULL,  
	usuario VARCHAR(25) NOT NULL,
	contraseña VARCHAR (100) NOT NULL
) INHERITS (persona);

CREATE TABLE empleado (
    empleado_ID serial PRIMARY KEY NOT NULL,
	puesto VARCHAR (50) NOT NULL,
	fechadecontratacion DATE NOT NULL
) INHERITS (persona);



CREATE TABLE cuenta(
	cuenta_ID SERIAL PRIMARY KEY NOT null
);


CREATE TABLE transaccion (
	transaccion_ID serial PRIMARY KEY NOT NULL,
	fechaDeTransaccion DATE NOT NULL,
	tipoDeMovimiento VARCHAR(50) NOT NULL,
	cuentaOrigen varchar (25) NOT NULL,
	cuentaDestino varchar (25) NOT NULL,
	monto float (2) NOT NULL,
	concepto varchar(50) NOT NULL,
	cuenta_ID integer REFERENCES cuenta(cuenta_id)
);


CREATE TABLE servicio (
	idSerial serial Primary key not null,
	nombreDeServicio Varchar (50) not null,
	cuenta_ID integer UNIQUE REFERENCES cuenta (cuenta_id)
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
	nomSucursal VARCHAR(24) NOT NULL,
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
    concepto VARCHAR(255) not null,
    cveInterbancaria NUMERIC(18) not null,
    noTarjeta NUMERIC(16) not null,
    lineaDeCredito FLOAT not null,
    fechaDeCredito DATE not null,
    fechaDeExpiracion DATE not null,
    cvv INTEGER not null,
    nip INTEGER not null,
    fechaDeApertura DATE not null,
    pagoMinimo FLOAT not null,
    pagoParaNoGenerarIntereses FLOAT not null,
    promociones VARCHAR(50),
    fechaDePago DATE not null,
    intereses FLOAT not null,
    saldo FLOAT not null,
    servicios_ID integer UNIQUE REFERENCES servicio(idSerial)
);