DELIMITER $$
#DROP TRIGGER `update_lms_user_firstname`;
CREATE TRIGGER `tr_update_lms_user_lastname_on_insert` AFTER INSERT ON `field_data_field_lastname`
FOR EACH ROW
BEGIN
	CALL sp_lms_user_lastname_UPDATE(NEW.field_lastname_value,NEW.entity_id);
END $$