module Notes
  module CollectionsAndStrings
    def word_array_literal
      # codecite word_array_literal
      %w{red green blue teal}
    end
    
    def regular_expressions
      puts 'Programming Ruby on Rails' =~ /Ruby/
      puts 'Programming Ruby on Rails' =~ /Rugby/

      puts 'Programming Ruby on Rails' =~ /ruby/
      puts 'Programming Ruby on Rails' =~ /ruby/i
    end
    
    def perl_variables
      '--apple;' =~ /(\w+)p(\w+)/
      puts "$1 = #$1"
      puts "$2 = #$2"
      puts "$3 = #$3"
      puts "$& = #$&"
      puts "$` = #$`"
      puts "$' = #$'"
    end
    
    def append
      str = "Programming"
      puts str << " Ruby"

      ticks = []
      3.times { ticks <<  'tick'}
      puts ticks.inspect      
    end
    
    def dynamic_method_definition
      wizard = Class.new do
        def self.learn_spell_or_charm(action, command)
          define_method(action) do
           puts command
          end
        end
      end
      wizard.learn_spell_or_charm('make_object_fly', 
                                  'Wingardium Leviosa')
      wizard.learn_spell_or_charm('knock_out_opponent', 
                                  'Stupefy')
      wizard.learn_spell_or_charm('disarm_opponent', 
                                  'Expelliarmus')
      harry = wizard.new
      harry.make_object_fly
      harry.knock_out_opponent
      harry.disarm_opponent    
    end
  end
end
