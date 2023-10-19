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

CREATE TRIGGER BEFORE INSERT ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();
CREATE TRIGGER BEFORE UPDATE ON PERSONA FOR EACH ROW EXECUTE FUNCTION validar_correo();
