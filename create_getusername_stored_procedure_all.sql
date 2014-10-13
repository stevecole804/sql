DELIMITER $$

CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_username`(
	IN p_uid				INT(11) ,
	OUT username		VARCHAR(255)
)
BEGIN
	SELECT name INTO username FROM users WHERE uid = p_uid;
END $$