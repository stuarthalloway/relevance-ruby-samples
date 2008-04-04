# codecite modules
module ActiveRecord
  module Acts #:nodoc:
    module Notable #:nodoc:
      # codecite modules
      # codecite included
      def self.included(base)
        base.extend(ClassMethods)
      end
      # codecite included
      

      # codecite class methods
      # This +acts_as+ extension provides the capabilities for receiving and
      # retrieving notes on a model.  
      #
      # Example:
      #   class ResearchProject < ActiveRecord::Base
      #      acts_as_notable
      #   end
      #
      #   research_project.note("Anonymous note")
      #   research_project.note("Signed note", :signed_by => "James")
      #   research_project.last_note -> <Note :body => "Signed note", :signed_by => "James">
      #   research_project.all_notes -> "Anonymous note\nSigned note (James)"
      module ClassMethods
        def acts_as_notable
          class_eval <<-EOV
            include ActiveRecord::Acts::Notable::InstanceMethods
            
            has_many :notes, :as => :notable, :order => :created_at
          EOV
        end
      end
      # codecite class methods
      # codecite instance methods
      module InstanceMethods
      # codecite instance methods  
        # codecite note
        def note(text, options = {})
          self.notes.create!(:body => text, :signed_by => options[:signed_by] || "Anonymous Coward")
        end
        # codecite note
        # codecite last note
        def last_note
          self.notes.find(:first, :order => 'created_at DESC')
        end
        # codecite last note
        # codecite all notes
        def all_notes
          self.notes.inject("") {|result, note| result += "#{note.to_signed}\n"}
        end
        # codecite all notes
      end 

    end
  end
end
