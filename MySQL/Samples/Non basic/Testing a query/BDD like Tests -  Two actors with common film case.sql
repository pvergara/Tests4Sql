/*****************************************************************/
SET @actorKevinBloom_id=25,  
	@actorChristianAKROYD_id=58;

SELECT   
		'Two actors that appears in the same movie' as  
	"Given",  
		@actorKevinBloom_id,  
		@actorChristianAKROYD_id;
/*****************************************************************/


/*****************************************************************/
SET @actors_id=concat(@actorKevinBloom_id, ',', @actorChristianAKROYD_id) ;
SELECT   
		'I query the common films of that two actors' as  
	"When",   
		@actors_id as  
	"(two actors)";

CALL `sakila`.`GetTheCommonFilmsOf`(@actors_id);

/*****************************************************************/

/*****************************************************************/
SELECT @actual:=COUNT(*) FROM `sakila`.`ResultGetTheCommonFilmsOf`;

SELECT   
		'It returns the exact number of common films' as  
	"Then",    
		@expected:=1 as  
	"Expected",    
		@actual as  
	"Actual",    
		`Tests4Sql`.`AssertEquals_DECIMAL`(@expected,@actual) as 
	"Assert";
/*****************************************************************/

/*****************************************************************/
SELECT   
		'The common films are exactly ''Sabrina Midnight'' and no more' as  
	"Then";

CALL 
	`Tests4Sql`.`spAssertSameResult`
	(
		'`sakila`.`ResultGetTheCommonFilmsOf`',
		'(SELECT * FROM `sakila`.`film` WHERE film_id = 755) qryNew',
		'qryTheOldOne.`film_id` = qryTheNewOne.`film_id`'
	)
/*****************************************************************/
