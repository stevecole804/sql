-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_phone_UPDATE`(
	IN `p_phone`			VARCHAR(255)	,
	IN `p_userid`	 		INT
	)
BEGIN    
	DECLARE USER_NAME VARCHAR(255);
	DECLARE AGENCY VARCHAR(255);
	DECLARE ROLEID	INT(11);
	DECLARE SKYPEID	VARCHAR(255);
	DECLARE LMS_USER_ID INT(11);

	SELECT `users`.`name` INTO USER_NAME FROM users WHERE uid = p_userid;
	SELECT rid INTO ROLEID FROM users_roles WHERE uid = p_userid and rid <> 68 and rid <> 3;
	select `role`.`name` INTO AGENCY from role where rid = (SELECT ROLEID);
	select `field_data_field_skype_account`.`field_skype_account_value` INTO SKYPEID 
		from field_data_field_skype_account where entity_id = p_userid;
	select `repda_lms.profilequinte.com`.`cl_user`.`user_id` INTO LMS_USER_ID from `repda_lms.profilequinte.com`.`cl_user` where username = (SELECT USER_NAME);

    #if (SELECT SKYPEID) != '' THEN
	#	INSERT INTO `repda_lms.profilequinte.com`.`cl_user_property` (userId, propertyId, propertyValue) VALUES ((SELECT LMS_USER_ID), 'skype', (SELECT SKYPEID));
	#ELSE
	#	INSERT INTO `repda_lms.profilequinte.com`.`cl_user_property` (userId, propertyId, propertyValue) VALUES ((SELECT LMS_USER_ID), 'skype', '');
	#END IF;

    UPDATE `repda_lms.profilequinte.com`.`cl_user`
    SET phoneNumber = p_phone, officialCode = (SELECT AGENCY) WHERE username = (SELECT USER_NAME);
		   
END $$