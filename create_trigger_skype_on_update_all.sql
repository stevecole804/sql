DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_skype_on_update` AFTER UPDATE ON `field_data_field_skype_account`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_skype_UPDATE(NEW.entity_id);
END $$