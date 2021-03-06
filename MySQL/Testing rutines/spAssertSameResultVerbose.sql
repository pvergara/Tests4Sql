DROP PROCEDURE `Tests4Sql`.`spAssertSameResultVerbose`;

DELIMITER //
CREATE PROCEDURE `Tests4Sql`.`spAssertSameResultVerbose`
(
	oldQryName varchar(256),
	newQryName varchar(256),
	joinSpecification varchar(4000)
)
BEGIN
SET @dyn_sql=CONCAT('
SELECT
    (
        CASE WHEN count(*) = (select count(*) from ',oldQryName,') THEN
            ''GREEN''
        ELSE
            ''___RED___''
        END
    ) as "Assert_SqlCodeSeemsSimilar"
FROM
(
    SELECT * FROM ',newQryName,'
) qryTheNewOne
        INNER JOIN
(
    SELECT * FROM ',oldQryName,'
) qryTheOldOne
    ON
    (
        qryTheNewOne.city_id = qryTheOldOne.city_id
    );');
PREPARE s1 from @dyn_sql; 
EXECUTE s1; 

SET @dyn_sql=CONCAT('
SELECT
	qryTheNewOne.*,
	qryTheOldOne.*
FROM
(
    SELECT * FROM ',newQryName,'
) qryTheNewOne
        INNER JOIN
(
    SELECT * FROM ',oldQryName,'
) qryTheOldOne
    ON
    (
        ',joinSpecification,'
    );');
PREPARE s2 from @dyn_sql; 
EXECUTE s2; 

DEALLOCATE PREPARE s1; 
DEALLOCATE PREPARE s2; 


END //

DELIMITER ;
