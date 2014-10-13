DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_phone_on_insert` AFTER INSERT ON `field_data_field_phone`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_phone_UPDATE(NEW.field_phone_value,NEW.entity_id);
END $$