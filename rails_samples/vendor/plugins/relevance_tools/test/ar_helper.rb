require 'rubygems'
gem 'activerecord'
require 'active_record'
#AR_BASE = $:.grep(/activerecord/).first.sub(/(activerecord.*?\/).*/,"\\1")

possible_mysql_sockets = %w(/tmp/mysql.sock /opt/local/var/run/mysql5/mysqld.sock)
socket_file = possible_mysql_sockets.detect {|path| File.exist?(path) }

ActiveRecord::Base.configurations = {
  'relevance_tools_unittest' => {
    :adapter => 'mysql',
    :username => 'root',
    :database => 'relevance_tools_unittest',
    :socket => socket_file
  },
}
ActiveRecord::Base.establish_connection 'relevance_tools_unittest'