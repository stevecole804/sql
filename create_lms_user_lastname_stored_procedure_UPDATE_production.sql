-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_lastname_UPDATE`(
	IN `p_lname`			VARCHAR(255)	,
	IN `p_userid`	 		INT
	)
BEGIN    
	DECLARE USER_NAME VARCHAR(255);
	
	SELECT name INTO USER_NAME FROM users WHERE uid = p_userid;

    UPDATE `lms.regioneastpda.ca`.`cl_user`
    SET nom = p_lname WHERE username = (SELECT USER_NAME);  
	
END $$