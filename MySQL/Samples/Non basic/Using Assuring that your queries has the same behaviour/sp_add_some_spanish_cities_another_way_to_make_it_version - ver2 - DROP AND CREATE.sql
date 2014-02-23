DROP PROCEDURE `sakila`.`sp_add_some_spanish_cities_another_way_to_make_it_version`;

DELIMITER //
CREATE PROCEDURE `sakila`.`sp_add_some_spanish_cities_another_way_to_make_it_version`()
BEGIN

	/*
		List extracted from the wikipedia: 
			http://es.wikipedia.org/wiki/Anexo:Provincias_de_Espa%C3%B1a_por_c%C3%B3digo_postal
	*/
	CREATE TABLE in_memory_aux_table ENGINE = MEMORY
	select 8700001 as id, 'Álava (Vitoria)' as name, 87 as country_id
		UNION ALL
	select 8700002 as id, 'Albacete' as name, 87 as country_id
		UNION ALL
	select 8700003 as id, 'Alicante' as name, 87 as country_id
		UNION ALL
	select 8700004 as id, 'Almería' as name, 87 as country_id
		UNION ALL
	select 8700005 as id, 'Ávila' as name, 87 as country_id
	;
	/*... and so on*/

	UPDATE 
		`sakila`.`city`
			INNER JOIN
		in_memory_aux_table as qry
			ON (qry.id=`sakila`.`city`.`city_id`)
	SET
		city = qry.name,
		country_id = qry.country_id;		

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
			ON (qry.id=`sakila`.`city`.`city_id`)
	WHERE
		`sakila`.`city`.`city_id` IS NULL;

	DROP TABLE in_memory_aux_table;
END //

DELIMITER ;