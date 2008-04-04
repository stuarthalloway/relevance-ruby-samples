# codecite instruct
xml.instruct! :xml, :version=>"1.0" 
# codecite widgets
xml.widgets {
  # codecite loop
  @widgets.each {|widget|
    # codecite attributes
    xml.widget(:created_at => widget.created_at) {
      # codecite child elements
      xml.name(widget.name)
      xml.color(widget.color)
      xml.weight(widget.weight)
    }
  }
}