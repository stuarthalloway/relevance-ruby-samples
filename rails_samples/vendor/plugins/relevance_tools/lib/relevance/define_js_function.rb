module ActionView::Helpers::JavascriptHelper
  
  def define_js_function(function_name, &block)
    parens = function_name.kind_of?(Symbol) ? "()" : ""
    update_page_tag do | page |
      page << "function #{function_name}#{parens} {"
      yield page
      page << "}"
    end  
  end
  
end
module ActionView::Helpers::JavascriptHelper
  
  def define_js_function(function_name, &block)
    parens = function_name.kind_of?(Symbol) ? "()" : ""
    update_page_tag do | page |
      page << "function #{function_name}#{parens} {"
      yield page
      page << "}"
    end  
  end
  
end