-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_UPDATE`(
	IN `p_username` 		VARCHAR(255)	, 
	IN `p_email`			VARCHAR(255)	,
	IN `p_old_username` 	VARCHAR(255)	,
	IN `p_old_email` 		VARCHAR(255)
	)
BEGIN    
	DECLARE USERID VARCHAR(255);
	DECLARE DRUPAL_STATUS INT(11);

	SET SQL_SAFE_UPDATES = 0;

	SELECT `lms.regioneastpda.ca`.`cl_user`.`user_id` INTO USERID FROM `lms.regioneastpda.ca`.`cl_user` WHERE username = p_old_username;

	UPDATE `lms.regioneastpda.ca`.`cl_user`
		SET email = p_email, username = p_username WHERE user_id = (SELECT USERID);

	SELECT status INTO DRUPAL_STATUS FROM users WHERE name = p_username;

	IF (SELECT DRUAL_STATUS) = 0 THEN
		UPDATE `lms.regioneastpda.ca`.`cl_user`
		SET password = 'disableduser!' WHERE user_id = (SELECT USERID);
	END IF;

	SET SQL_SAFE_UPDATES = 1;

END $$