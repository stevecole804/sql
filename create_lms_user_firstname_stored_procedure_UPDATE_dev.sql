DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_firstname_UPDATE`(
	IN `p_fname`			VARCHAR(255)	,
	IN `p_userid`	 		INT
	)

BEGIN    
	DECLARE USER_NAME VARCHAR(255);
	
	SELECT name INTO USER_NAME FROM users WHERE uid = p_userid;

    UPDATE `repda_lms.profilequinte.com`.`cl_user`
    SET prenom = p_fname WHERE username = (SELECT USER_NAME);  
	
END $$