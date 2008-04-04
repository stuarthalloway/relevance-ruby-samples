class AddComplexDbMigrations < ActiveRecord::Migration
  def self.up
    execute <<-END
    CREATE TABLE `hrMEM002` (`memID` int(11) NOT NULL auto_increment, `memFN` varchar(50) default NULL, `memLN` varchar(50) default NULL, `memSSN` int(9) default NULL, PRIMARY KEY  (`memID`)) ENGINE=MyISAM DEFAULT CHARSET=latin1;
    END
    
    execute <<-END
    CREATE TABLE `hrPOL001` ( `polID` int(11) NOT NULL auto_increment, `polTYPE` varchar(50) default NULL, `polNUMBER` varchar(50) default NULL, `polHOLDER` int(11) default NULL, PRIMARY KEY  (`polID`)) ENGINE=MyISAM DEFAULT CHARSET=latin1;
    END
  end

  def self.down
    drop_table :hrMEM002
    drop_table :hrPOL001
  end
end
