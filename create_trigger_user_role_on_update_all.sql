DELIMITER $$

CREATE TRIGGER `tr_update_lms_user_role_on_update` AFTER UPDATE ON `users_roles`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_role_UPDATE(NEW.uid);
END $$