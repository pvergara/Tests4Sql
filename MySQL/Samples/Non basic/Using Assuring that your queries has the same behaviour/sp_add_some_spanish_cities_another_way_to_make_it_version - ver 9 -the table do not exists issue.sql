DROP PROCEDURE `sakila`.`sp_add_some_spanish_cities_another_way_to_make_it_version`;

DELIMITER //
CREATE PROCEDURE `sakila`.`sp_add_some_spanish_cities_another_way_to_make_it_version`()
BEGIN

	/*
		List extracted from the wikipedia: 
			http://es.wikipedia.org/wiki/Anexo:Provincias_de_Espa%C3%B1a_por_c%C3%B3digo_postal
	*/
	CREATE TABLE in_memory_aux_table ENGINE = MEMORY
	select 8701 as id, 'Álava (Vitoria)' as name, 87 as country_id
		UNION ALL
	select 8702 as id, 'Albacete' as name, 87 as country_id
		UNION ALL
	select 8703 as id, 'Alicante' as name, 87 as country_id
		UNION ALL
	select 8704 as id, 'Almería' as name, 87 as country_id
		UNION ALL
	select 8705 as id, 'Ávila' as name, 87 as country_id
	;
	/*... and so on*/

	UPDATE 
		`sakila`.`city`
			INNER JOIN
		in_memory_aux_table as qry
			ON (`sakila`.`city`.`city_id` = qry.id)
	SET
		`sakila`.`city`.city = qry.name,
		`sakila`.`city`.country_id = qry.country_id
	;

	INSERT INTO
		`sakila`.`city`
	(
		city_id,
		city,
		country_id
	)
	SELECT
		qry.id,
		qry.name,
		qry.country_id
	FROM
		in_memory_aux_table as qry
			LEFT JOIN
		`sakila`.`city` as cities
			ON (qry.id = cities.city_id)
	WHERE
		cities.city_id IS NULL;

	DROP TABLE in_memory_aux_table;
END //

DELIMITER ;