/* Creacion de los triggers  para cada tabla*/ 

/*Triggers tabla persona*/


/*
 1.- Definir los triggers de que van a hacer

*/

/*
Tabla Persona
	Un trigger para que los usuarios sean mayores (ESTE PUEDE SER CONSTRAINT EN LA TABLA DE PERSONA)
*/
/*************************************/

CREATE OR REPLACE FUNCTION validar_correo()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.correo LIKE '%@%.%' THEN
		 RETURN NEW;
	END IF;

	RETURN NULL;
END;
$$

;;;

CREATE TRIGGER TG_CHECK_EMAIL_ON_INSERT BEFORE INSERT ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();
CREATE TRIGGER TG_CHECK_EMAIL_ON_UPDATE BEFORE UPDATE ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();


/*************************************/
/*
Tabla Cliente
	
*/
/*************************************/
CREATE OR REPLACE FUNCTION valida_correo_unico()
RETURNS TRIGGER -- AS $$
LANGUAGE PLPGSQL AS $$
BEGIN
    IF NEW.correo IS NOT NULL THEN
        IF EXISTS (SELECT 1 FROM persona WHERE correo = NEW.correo AND cliente_id <> NEW.cliente_id) THEN
            RAISE EXCEPTION 'El correo electrónico ya está en uso por otro cliente.';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 

CREATE TRIGGER correo_unico
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION valida_correo_unico();


/*
		->> CREACION DE TRIGGERS COMO LO HICIMOS EN EL LABORATORIO
CREATE OR REPLACE FUNCTION log_last_name_changes()
 RETURNS TRIGGER
 LANGUAGE PLPGSQL
 AS
$$
BEGIN
IF NEW.last_name <> OLD.last_name THEN
INSERT INTO employee_audits(employee_id,last_name,changed_on)
VALUES(OLD.id,OLD.last_name,now());
END IF;
RETURN NEW;
END;
$$
;


CREATE TRIGGER last_name_changes
 BEFORE UPDATE
 ON employees
 FOR EACH ROW
 EXECUTE PROCEDURE log_last_name_changes();
*/


/*************************************/
/*
Tabla Empleado
	
*/
/*************************************/




/*************************************/
/*
Tabla Cuenta
*/
/*************************************/


CREATE OR REPLACE FUNCTION evita_eliminacion_cuenta_con_transacciones()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM transaccion WHERE cuenta_id = OLD.cuenta_id) THEN
        RAISE EXCEPTION 'No se puede eliminar una cuenta con transacciones asociadas.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER evita_eliminacion_cuenta
BEFORE DELETE ON cuenta
FOR EACH ROW
EXECUTE FUNCTION evita_eliminacion_cuenta_con_transacciones();

/*************************************/
/*
Tabla Transaccion
	-->> Un trigger para asegurar que no exeda el saldo disponible del usuario en una transaccion 
	-->> Limite de transacciones por dia (mayores a 10 y menores a 15)
	-->> Limite de monto de retiro por dia (menos de 10k)
*/
/*************************************/




/*************************************/
/*
Tabla Servicio
	Un trigger para actualizar la cuenta asociada al servicio para cuando se inserta un nuevo servicio
*/
/*************************************/




/*************************************/
/*
Tabla Direccion
	-->> Al anadir un codigo postal que se verifique a que estado y municipio le pertence 
	y que se rellenen automaticamente estos datos
	
*/
/*************************************/




/*************************************/
/*
Tabla Sucursal
	
*/
/*************************************/




/*************************************/
/*
Tabla Estado
	
*/
/*************************************/


/*************************************/
/*
Tabla caracteristica_servicio
 	Un trigger para actualizar el saldo del usuario cuando da o recibe dinero
 	Un trigger para actualizar el ppng y pm de la tarjeta de credito cada vez que se raliza una transaccion 
	
*/
/*************************************/


CREATE OR REPLACE FUNCTION actualiza_cuenta_de_servicio()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE cuenta
    SET cuenta_id = NEW.cuenta_id
    WHERE idSerial = NEW.idSerial;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER actualiza_cuenta_servicio
BEFORE INSERT ON Servicio
FOR EACH ROW
EXECUTE FUNCTION actualiza_cuenta_de_servicio();


/*************************************/