require File.join(File.dirname(__FILE__), "..", "test_helper.rb")
require 'notes/collections_and_strings'

describe Notes::CollectionsAndStrings do
  include Notes::CollectionsAndStrings

  it "demonstrates %w syntax" do
    word_array_literal.should == ['red','green','blue','teal']
  end

  it "demonstrates regular expressions" do
    (recording_stdout do
      regular_expressions
    end).should == ['12', 'nil', 'nil', '12', ''].join("\n")
  end

  it "demonstrates perl variables" do
    (recording_stdout do
      perl_variables
    end).should == ["$1 = ap", "$2 = le", "$3 = ", "$& = apple", "$` = --", "$' = ;", ""].join("\n")
  end
  
  it "demonstrates append" do
    (recording_stdout do
      append
    end).should == [%{Programming Ruby}, %{["tick", "tick", "tick"]}, ""].join("\n")
  end
  
  it "demonstrates dynamic method definition" do
    (recording_stdout do
      dynamic_method_definition
    end).should == ["Wingardium Leviosa", "Stupefy", "Expelliarmus", ""].join("\n")
  end
end

