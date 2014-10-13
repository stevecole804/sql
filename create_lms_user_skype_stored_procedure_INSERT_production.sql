-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_skype_INSERT`(
	IN `p_userid`	 		INT
	)
BEGIN    
	DECLARE USER_NAME VARCHAR(255);
	DECLARE SKYPEID	VARCHAR(255);
	DECLARE LMS_USER_ID INT(11);

	SELECT `users`.`name` INTO USER_NAME FROM users WHERE uid = p_userid;
	select `field_data_field_skype_account`.`field_skype_account_value` INTO SKYPEID 
		from field_data_field_skype_account where entity_id = p_userid;
	select `lms.regioneastpda.ca`.`cl_user`.`user_id` INTO LMS_USER_ID from `lms.regioneastpda.ca`.`cl_user` where username = (SELECT USER_NAME);

	SET SQL_SAFE_UPDATES = 0;
    if (SELECT SKYPEID) != '' THEN
		INSERT INTO `lms.regioneastpda.ca`.`cl_user_property` (userId, propertyId, propertyValue) VALUES ((SELECT LMS_USER_ID), 'skype', (SELECT SKYPEID));
	ELSE
		INSERT INTO `lms.regioneastpda.ca`.`cl_user_property` (userId, propertyId, propertyValue) VALUES ((SELECT LMS_USER_ID), 'skype', '');
	END IF;
	SET SQL_SAFE_UPDATES = 1;
	   
END $$