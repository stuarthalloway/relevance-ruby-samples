module ActionView::Helpers::AssetTagHelper
  
  # Returns the HTML for an image tag.  If either the 'alt' or 'title' attribute is 
  # given, then the same value is used for *both* the 'alt' and 'title' attributes.  
  # (If both the 'alt' and 'title' attributes are given, then this method simply
  # provides the standard Rails image_tag behavior.)
  def smart_image_tag(image, options = {})
    if (options[:alt] && options[:title])
      image_tag(image, options)
    elsif (options[:alt] || options[:title])
      text = options[:alt] || options[:title]
      tag_options = options.merge({:alt => text, :title => text})
      image_tag(image, tag_options)
    else
      image_tag(image, options)
    end
  end
  
end
