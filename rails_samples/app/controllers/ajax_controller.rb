class AjaxController < ApplicationController
  # TODO: get rid of this:
  skip_before_filter :verify_authenticity_token
  
  COLORS = %w{red yellow green blue black white purple brown orange}
  def autocomplete_favorite_color
    re = Regexp.new("^#{params[:user][:favorite_color]}", "i")
    @colors= COLORS.grep(re)
    html = Builder::XmlMarkup.new
    html.ul(:class => "autocomplete_list") {
      @colors.each {|color|
        html.li(:class => "autocomplete_item") {
          html << color
        }
      }
    }
    render :text => html.target!
  end
  
  def search
    if params[:search].blank?
      @widgets = Widget.find(:all)
    else
      @widgets = Widget.find_all_by_name(params[:search])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @widgets }
      format.js   { render :partial => "search"}
    end
  end
  
  def new
    @widget = Widget.new
  end

  def create
    @widget = Widget.new(params[:widget])
    respond_to do |format|
      if @widget.save
        flash[:notice] = "Widget #{@widget.name} was successfully created."
        format.html { redirect_to(widgets_url) }
        format.js { render(:update) { |page|
          page.visual_effect(:blind_up, 'model_form', :duration=>1)
          page.replace_html 'model_error', 'Saved!'
          page.delay(2) { page.redirect_to(:controller => 'ajax') }
        }} 
      else
        format.html { render :action => "new" }
        format.js { render(:update) { |page|
          page.replace_html 'model_error', error_messages_for('widget')
        }}
      end
    end
  end
  
  def movies
    @movies = []
  end
end
