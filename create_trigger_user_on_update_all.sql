DELIMITER $$
#usersDROP TRIGGER `insert_lms_user`;
CREATE TRIGGER `update_lms_user` AFTER UPDATE ON `users`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_UPDATE(NEW.name,NEW.mail,OLD.name,OLD.mail);
END $$