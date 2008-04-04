class FootnoteShowUnimplFilter

  class <<self
    
    def filter(controller)
      if Object.const_defined?(:FootnoteFilter)
        FootnoteFilter.class_eval do
          alias original_insert_text_alias_for_relevance insert_text
          
          def insert_text(position, pattern, new_text, indentation = 4)
            new_text = new_text.sub(%r{<br/>\(}, "#{relevance_show_unimpl_link}<br/>(")
            original_insert_text_alias_for_relevance(position, pattern, new_text, indentation)
          end
          
          def relevance_show_unimpl_link
            %{ | <a href="#" onclick="#{relevance_toggle_unimpl_style()};return false">Unimplemented Features</a>}
          end

          def relevance_toggle_unimpl_style
            %{
              (function(){
                var s=document.getElementById('tmunimplstyle');
                if(s){
                  s.parentNode.removeChild(s);
                }else{
                  s=document.createElement('style');
                  s.setAttribute('id','tmunimplstyle');
                  s.setAttribute('type','text/css');
                  s.appendChild(document.createTextNode('
                    .unimpl{
                      -moz-outline: 1px solid #ff0000 !important;
                      outline: 1px solid #ff0000 !important;
                    }
                  '));
                  document.body.previousSibling.appendChild(s);
                }
              })()
            }.gsub(/(^|\n)\s*/, '')
          end
        end

      end

      ActionController::Base.skip_before_filter(self)
    end
    

  end
end

class ActionController::Base
  before_filter FootnoteShowUnimplFilter
end