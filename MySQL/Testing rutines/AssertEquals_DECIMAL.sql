DROP FUNCTION `Tests4Sql`.`AssertEquals_DECIMAL`;

DELIMITER $$
CREATE FUNCTION `Tests4Sql`.`AssertEquals_DECIMAL`(
	Expected DECIMAL,
	Actual DECIMAL
) RETURNS varchar(20) CHARSET utf8
BEGIN
	DEClARE RESULT NVARCHAR(20);

	SELECT
		(
			CASE 
				WHEN Expected=Actual THEN
					'GREEN'
				ELSE
					'___RED___'
			END
		) as TheResult
	INTO
		RESULT;

RETURN RESULT;
END$$
DELIMITER ;
