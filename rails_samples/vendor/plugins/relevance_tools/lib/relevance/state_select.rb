module ActionView::Helpers::FormOptionsHelper
  
  # Return select and option tags for the given object and method, using state_options_for_select to generate the list of option tags.
  def state_select(object, method, options = {}, html_options = {})
    ActionView::Helpers::InstanceTag.new(object, method, self, nil, options.delete(:object)).to_state_select_tag(options, html_options)
  end
  
  # Returns a string of option tags for states in a country. Supply a state name as +selected+ to
  # have it marked as the selected option tag. 
  #
  # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
  
  def state_options_for_select(selected = nil, options = {})
    states_for_list = US_STATES
    if options[:current_states]
      states_for_list = US_STATES.reject{|pair| options[:current_states].include?(pair[1])}
    end
    
    if options[:titlecase]
      options_for_select(states_for_list.map {|i| [i[0].titlecase,i[1]]})
    else
      options_for_select(states_for_list)
    end
  end
  
  private
  
  US_STATES=[ 
              ['-','-'],
              ['ALABAMA','AL'],
              ['ALASKA','AK'],
              ['AMERICAN SAMOA','AS'],
              ['ARIZONA','AZ'],
              ['ARKANSAS','AR'],
              ['CALIFORNIA','CA'],
              ['COLORADO','CO'],
              ['CONNECTICUT','CT'],
              ['DELAWARE','DE'],
              ['DISTRICT OF COLUMBIA','DC'],
              ['FEDERATED STATES OF MICRONESIA','FM'],
              ['FLORIDA','FL'],
              ['GEORGIA','GA'],
              ['GUAM','GU'],
              ['HAWAII','HI'],
              ['IDAHO','ID'],
              ['ILLINOIS','IL'],
              ['INDIANA','IN'],
              ['IOWA','IA'],
              ['KANSAS','KS'],
              ['KENTUCKY','KY'],
              ['LOUISIANA','LA'],
              ['MAINE','ME'],
              ['MARSHALL ISLANDS','MH'],
              ['MARYLAND','MD'],
              ['MASSACHUSETTS','MA'],
              ['MICHIGAN','MI'],
              ['MINNESOTA','MN'],
              ['MISSISSIPPI','MS'],
              ['MISSOURI','MO'],
              ['MONTANA','MT'],
              ['NEBRASKA','NE'],
              ['NEVADA','NV'],
              ['NEW HAMPSHIRE','NH'],
              ['NEW JERSEY','NJ'],
              ['NEW MEXICO','NM'],
              ['NEW YORK','NY'],
              ['NORTH CAROLINA','NC'],
              ['NORTH DAKOTA','ND'],
              ['NORTHERN MARIANA ISLANDS','MP'],
              ['OHIO','OH'],
              ['OKLAHOMA','OK'],
              ['OREGON','OR'],
              ['PALAU','PW'],
              ['PENNSYLVANIA','PA'],
              ['PUERTO RICO','PR'],
              ['RHODE ISLAND','RI'],
              ['SOUTH CAROLINA','SC'],
              ['SOUTH DAKOTA','SD'],
              ['TENNESSEE','TN'],
              ['TEXAS','TX'],
              ['UTAH','UT'],
              ['VERMONT','VT'],
              ['VIRGIN ISLANDS','VI'],
              ['VIRGINIA','VA'],
              ['WASHINGTON','WA'],
              ['WEST VIRGINIA','WV'],
              ['WISCONSIN','WI'],
              ['WYOMING','WY']
            ]
  
end

class ActionView::Helpers::InstanceTag
  
  
  def to_state_select_tag(options, html_options)
    html_options = html_options.stringify_keys
    add_default_name_and_id(html_options)
    value=nil
    select_options = {:titlecase => options.delete(:titlecase), :current_states=>options.delete(:current_states)}
    selected_value = options.has_key?(:selected) ? options[:selected] : value
    content_tag("select", add_options(state_options_for_select(selected_value, select_options), options, value), html_options)
  end
end


class ActionView::Helpers::FormBuilder
  def state_select(method, options = {}, html_options = {})
    @template.state_select(@object_name, method, options.merge(:object => @object), html_options)
  end
end