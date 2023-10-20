/* Aqui iran los querys de la creacion de la base de datos */
CREATE TABLE persona (
    RFC VARCHAR(13) PRIMARY KEY NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
	numeroDeTelefono NUMERIC(10) NOT NULL,
	correo VARCHAR(50) NOT NULL,
    fechadeNacimiento DATE NOT NULL,
	genero VARCHAR(1) NOT NULL,
	direccion_ID integer UNIQUE REFERENCES direccion(direccion_ID)
--  direcion_ID INTEGER CONSTRAINT direccion_ID_fkey REFERENCES direccion(direcion_ID),
    CONSTRAINT genero_IN CHECK (genero IN ('M', 'H'))
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
	cuenta_ID SERIAL PRIMARY KEY NOT NULL,
	cliente_ID integer UNIQUE REFERENCES cliente(cliente_ID),
	servicios_ID integer UNIQUE REFERENCES servicio(servicios_ID)
--  servicios_ID INTEGER CONSTRAINT servicios_ID_fkey REFERENCES servicio(servicios_ID)
);

/*
    ¿Los atributos no deben ser en singular? es decir 
    servicio_ID no servicios_ID
*/


CREATE TABLE transaccion (
	transaccion_ID serial PRIMARY KEY NOT NULL,
	fechaDeTransaccion DATE NOT NULL,
	tipoDeMovimiento VARCHAR(50) NOT NULL,
	cuentaOrigen varchar (25) NOT NULL,
	cuentaDestino varchar (25) NOT NULL,
	monto float (2) NOT NULL,
	concepto varchar(50) NOT NULL,
	cuenta_ID integer REFERENCES cuenta(cuenta_ID),
--  cuenta_ID INTEGER CONSTRAINT cuenta_ID_fkey REFERENCES cuenta(cuenta_ID),
    CONSTRAINT monto_positive CHECK(monto > 0)
);
    


CREATE TABLE servicio (
	serial_ID serial PRIMARY KEY NOT NULL,
	nombreDeServicio VARCHAR (50) NOT NULL,
	cuenta_ID INTEGER UNIQUE REFERENCES cuenta (cuenta_ID)
--  cuenta_ID INTEGER CONSTRAINT cuenta_ID_fkey REFERENCES cuenta(cuenta_ID)
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
--  direccion_ID INTEGER CONSTRAINT direccion_ID_fkey REFERENCES direccion(direccion_ID),
--  cliente_ID INTEGER CONSTRAINT cliente_ID_fkey REFERENCES cliente(cliente_ID),
--  empleado_ID INTEGER CONSTRAINT empelado_ID_fkey REFERENCES empleado(empleado_ID)
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
--  servicios_ID INTEGER CONSTRAINT servicios_ID_fkey REFERENCES servicio(idSerial)
);