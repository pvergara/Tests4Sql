DROP PROCEDURE `sakila`.`sp_add_some_spanish_cities_hard_to_mantain_version`;
DELIMITER //

CREATE PROCEDURE `sakila`.`sp_add_some_spanish_cities_hard_to_mantain_version`()
BEGIN

	/*
		List extracted from the wikipedia: 
			http://es.wikipedia.org/wiki/Anexo:Provincias_de_Espa%C3%B1a_por_c%C3%B3digo_postal
	*/
	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8701) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8701,
			'Álava (Vitoria)',
			87
		);
	ELSE
		UPDATE
			`sakila`.`city`
		SET
			city = 'Álava (Vitoria)',
			country_id = 87
		WHERE
			city_id = 8701;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8702) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8702,
			'Albacete',
			87
		);
	ELSE
		UPDATE
			`sakila`.`city`
		SET
			city = 'Albacete',
			country_id = 87
		WHERE
			city_id = 8702;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8703) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8703,
			'Alicante',
			87
		);
	ELSE
		UPDATE
			`sakila`.`city`
		SET
			city = 'Alicante',
			country_id = 87
		WHERE
			city_id = 8703;
	END IF;


	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8704) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8704,
			'Almería',
			87
		);
	ELSE
		UPDATE
			`sakila`.`city`
		SET
			city = 'Almería',
			country_id = 87
		WHERE
			city_id = 8704;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8705) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8705,
			'Ávila',
			87
		);
	ELSE
		UPDATE
			`sakila`.`city`
		SET
			city = 'Ávila',
			country_id = 87
		WHERE
			city_id = 8705;
	END IF;

	/*... and so on*/
END //

DELIMITER ;