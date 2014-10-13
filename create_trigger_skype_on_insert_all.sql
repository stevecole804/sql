DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_skype_on_insert` AFTER INSERT ON `field_data_field_skype_account`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_skype_INSERT(NEW.entity_id);
END $$