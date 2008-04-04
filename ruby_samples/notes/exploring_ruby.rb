module Notes
  module ExploringRuby
    def array_syntax
      [1,2,3,4,5]
    end 
    
    def hash_syntax
      {:name => "Matz", :language => "Ruby"}
    end
    
    def each
      [1,2,3,4,5].each {|x| puts x}
    end

    def find_all
      [1,2,3,4,5].find_all {|x| x > 3}
    end
    
    def map
      [1,2,3,4,5].map {|x| x**2}
    end
    
    def reflection
      puts Person.instance_methods(true)
      puts Person.instance_methods(false)
      p = Person.new
      puts p.methods(true)
      puts Person.methods(false)
      p.send("last_name=", "Doe")
    end
  end
  
  class Person
    attr_accessor :first_name, :last_name
    def full_name
      "#{first_name} #{last_name}"
    end
  end
end