-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_INSERT`(
	IN `p_username` 		VARCHAR(255)	, 
	IN `p_email`			VARCHAR(255)	
	)
BEGIN    

    INSERT INTO `repda_lms.profilequinte.com`.`cl_user`
	(
	username							,
	email								
	) 
	VALUES 
	(
	p_username							,
	p_email
	);
 
END $$