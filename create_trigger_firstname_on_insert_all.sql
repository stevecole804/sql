DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_firstname_on_insert` AFTER INSERT ON `field_data_field_firstname`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_firstname_UPDATE(NEW.field_firstname_value,NEW.entity_id);
END $$