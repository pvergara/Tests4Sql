DELIMITER //

CREATE PROCEDURE `sakila`.`sp_add_some_spanish_cities_hard_to_mantain_version`()
BEGIN

	/*
		List extracted from the wikipedia: 
			http://es.wikipedia.org/wiki/Anexo:Provincias_de_Espa%C3%B1a_por_c%C3%B3digo_postal
	*/
	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8700001) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8700001,
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
			city_id = 8700001;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8700002) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8700002,
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
			city_id = 8700002;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8700003) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8700003,
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
			city_id = 8700003;
	END IF;


	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8700004) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8700004,
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
			city_id = 8700004;
	END IF;

	IF NOT EXISTS(select * from `sakila`.`city` WHERE `sakila`.`city`.`city_id` = 8700005) THEN
		INSERT INTO
			`sakila`.`city`
		(
			city_id,
			city,
			country_id
		)
		VALUES
		(
			8700005,
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
			city_id = 8700005;
	END IF;

	/*... and so on*/
END //

DELIMITER ;