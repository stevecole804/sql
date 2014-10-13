DELIMITER $$

CREATE TRIGGER `tr_update_lms_user_role_on_delete` AFTER DELETE ON `users_roles`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_role_DELETE(OLD.uid);
END $$