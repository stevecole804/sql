-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_lms_user_role_DELETE`(
	IN `p_userid`	 		INT
	)
BEGIN    
	DECLARE USER_NAME VARCHAR(255);
	DECLARE AGENCY VARCHAR(255);
	DECLARE ROLEID	INT(11);
	DECLARE LMS_USER_ID INT(11);
	DECLARE ISADMINUSER INT(11);

	SELECT `users`.`name` INTO USER_NAME FROM users WHERE uid = p_userid;
	SELECT rid INTO ROLEID FROM users_roles WHERE uid = p_userid and rid <> 68 and rid <> 3;
	select `role`.`name` INTO AGENCY from role where rid = (SELECT ROLEID);
	SELECT rid INTO ISADMINUSER FROM users_roles WHERE uid = p_userid and rid = 68;

	IF ISADMINUSER = 68 then
		UPDATE `lms.regioneastpda.ca`.`cl_user`
		SET isPlatformAdmin = 1 WHERE username = (SELECT USER_NAME);
	ELSE
		UPDATE `lms.regioneastpda.ca`.`cl_user`
		SET isPlatformAdmin = 0 WHERE username = (SELECT USER_NAME);
	END IF;

    UPDATE `lms.regioneastpda.ca`.`cl_user`
    SET officialCode = (SELECT AGENCY) WHERE username = (SELECT USER_NAME);
   
END