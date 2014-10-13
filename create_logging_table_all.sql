CREATE TABLE `logging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logdata` varchar(2000) DEFAULT NULL,
  `logdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `loggedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
