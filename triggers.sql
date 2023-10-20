/* Creacion de los triggers  para cada tabla*/ 

/*Triggers tabla persona*/


/*
 1.- Definir los triggers de que van a hacer
*/

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

/*
Tabla Persona
	Un trigger para que los usuarios sean mayores
*/
/*************************************/




/*************************************/
/*
Tabla Cliente

*/
/*************************************/




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




/*************************************/
/*
Tabla Transaccion
	Un trigger para asegurar que el monto no sea negativo
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
Tabla Municipio

*/
/*************************************/




/*************************************/
/*
Tabla caracteristica_servicio
 	Un trigger para actualizar el saldo del usuario cuando da o recibe dinero
 	Un trigger para actualizar el ppng y pm de la tarjeta de credito cada vez que se raliza una transaccion 
	
*/
/*************************************/




/*************************************/