require File.join(File.dirname(__FILE__), "..", "test_helper.rb")
require 'notes/exploring_ruby'

describe Notes::ExploringRuby do
  include Notes::ExploringRuby

  it "demonstrates array syntax" do
    array_syntax.should == [1,2,3,4,5]
  end

  it "demonstrates hash syntax" do
    hash_syntax.should == {:name => "Matz", :language => "Ruby"}
  end

  it "demonstrates each" do
    (recording_stdout do
      [1,2,3,4,5].each {|x| puts x}
    end).should == [1,2,3,4,5,""].join("\n")
  end
  
  it "demonstrates transform" do
    map.should == [1,4,9,16,25]
  end

  it "demonstrates find" do
    find_all.should == [4,5]
  end
  
  it "demonstrates reflection" do
    recording_stdout {reflection}
  end
  
  it "defines simple Person class" do
    p = Notes::Person.new
    p.first_name = "John"
    p.last_name = "Doe"
    p.full_name.should == "John Doe"
  end

end

