CREATE TABLE `inventors` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(50) default NULL,
  `last_name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL auto_increment,
  `inventor_id` int(11),
  `low` varchar(50) default NULL,
  `middle` varchar(50) default NULL,
  `high` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL auto_increment,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `for_scope1` int NOT NULL ,
  `for_scope2` int ,
  `for_scope3` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;
