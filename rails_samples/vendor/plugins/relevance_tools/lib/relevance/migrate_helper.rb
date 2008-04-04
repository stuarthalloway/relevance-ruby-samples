module Relevance
  module MigrateHelper
    def execute_file(file)
      lines = File.readlines(file)
      next_statement = []
      lines.each do |line|
        next_statement << line
        if line=~/;/
          execute(next_statement.join("\n"))
          next_statement = []
        end
      end
    end
  end
end
