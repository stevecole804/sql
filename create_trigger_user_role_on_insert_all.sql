DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_role_on_insert` AFTER INSERT ON `users_roles`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_role_INSERT(NEW.uid);
END $$