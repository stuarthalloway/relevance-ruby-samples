/* codecite sql */
CREATE TABLE investment_accounts (
  id INTEGER PRIMARY KEY,
  owner TEXT,
  balance INTEGER
);

/* or, for MySQL:

CREATE TABLE `investment_accounts` (
  `id` int(11) NOT NULL auto_increment,
  `owner` text,
  `balance` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

*/

/* codecite sql */