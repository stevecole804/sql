DELIMITER $$
#DROP TRIGGER `insert_lms_user`;
CREATE TRIGGER `insert_lms_user` AFTER INSERT ON `users`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_INSERT(NEW.name,NEW.mail);
END;
$$