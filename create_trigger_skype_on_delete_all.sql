DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_skype_on_delete` AFTER DELETE ON `field_data_field_skype_account`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_skype_DELETE(OLD.entity_id);
END $$