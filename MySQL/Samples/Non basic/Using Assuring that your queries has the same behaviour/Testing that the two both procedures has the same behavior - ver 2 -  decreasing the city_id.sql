USE `sakila`;

CALL `sakila`.`sp_add_some_spanish_cities_hard_to_mantain_version`();


CREATE TABLE frist_attempt ENGINE=MEMORY
SELECT 
	`city`.`city_id`,
    `city`.`city`,
    `city`.`country_id`,
    `city`.`last_update`
FROM 
	`sakila`.`city`
WHERE
	`sakila`.`city`.country_id = 87
		AND
	`sakila`.`city`.city_id >=8701;

CALL `sakila`.`sp_add_some_spanish_cities_another_way_to_make_it_version`();

CREATE TABLE second_attempt ENGINE=MEMORY
SELECT 
	`city`.`city_id`,
    `city`.`city`,
    `city`.`country_id`,
    `city`.`last_update`
FROM 
	`sakila`.`city`
WHERE
	`sakila`.`city`.country_id = 87
		AND
	`sakila`.`city`.city_id >=8701;

SELECT
    /*Maybe this part must be encapsulated on some kind of "fnTest4SQL_SameResult" scalar-function*/
    (
        CASE WHEN count(*) = (select count(*) from qryTheOldOne) THEN
            'GREEN'
        ELSE
            'RED!!!'
        END
    ) as "Assert_SqlCodeSeemsSimilar"
FROM
(
    SELECT * FROM second_attempt
) qryTheNewOne
        INNER JOIN
(
    SELECT * FROM first_attempt
) qryTheOldOne
    ON
    (
        qryTheNewOne.city_id = qryTheOldOne.city_id
    );

DROP TABLE first_attempt;
DROP TABLE second_attempt;
