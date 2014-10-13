DELIMITER $$

CREATE PROCEDURE `sp_insert_log_row` (
	`p_logdata` 			VARCHAR(2000)	, 
	`p_loggedby`			VARCHAR(255)	
 )

BEGIN    
    INSERT INTO `repda.profilequinte.com`.`logging`
 (
	logdata								,
	loggedby
 ) 
	VALUES 
 (
	p_logdata							,
	p_loggedby
 );
END $$

