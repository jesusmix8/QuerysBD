/* Aqui iran los querys de la creacion de la base de datos */


CREATE TABLE Persona (
    RFC VARCHAR(12) PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
	numeroDeTelefono numeric(10) NOT NULL,
	correo VARCHAR(35) NOT NULL,
    fechadeNacimiento DATE
);


CREATE TABLE cliente (
    cliente_id serial PRIMARY KEY NOT NULL,  
	usuario VARCHAR(25) NOT NULL,
	contraseña VARCHAR (100) NOT NULL
) INHERITS (persona);

CREATE TABLE empleado (
    empleado_id serial PRIMARY KEY NOT NULL,
	puesto VARCHAR (50) NOT NULL,
	fechadecontratacion DATE NOT NULL
) INHERITS (persona);




CREATE TABLE cuenta(
	cuenta_id SERIAL PRIMARY KEY NOT null
);


CREATE TABLE transaccion (
	transaccion_ID serial PRIMARY KEY NOT NULL,
	fechaDeTransaccion DATE NOT NULL,
	tipoDeMovimiento VARCHAR(50) NOT NULL,
	cuentaDestino varchar (25) NOT NULL,
	monto float (2) NOT NULL,
	concepto varchar(50) NOT NULL,
	cuenta_id integer REFERENCES cuenta(cuenta_id)
);


CREATE TABLE Servicio (
	idSerial serial Primary key not null,
	nombreDeServicio Varchar (50) not null,
	cuenta_id integer UNIQUE REFERENCES cuenta (cuenta_id)
);
