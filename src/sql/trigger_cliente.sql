--DROP FUNCTION comprobarDNI() CASCADE;
CREATE OR REPLACE FUNCTION comprobarDNI()
	RETURNS trigger AS
$$
BEGIN
	IF NEW.dni NOT SIMILAR TO '[0-9]{8}[A-Z]{1}' THEN
		RAISE EXCEPTION 'Formato incorrecto de DNI' USING ERRCODE='20808';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS dniCliente
  ON cliente;

CREATE TRIGGER dniCliente
	BEFORE INSERT ON cliente
	FOR EACH ROW
	EXECUTE PROCEDURE comprobarDNI();