class BasicController < ApplicationController
  skip_before_filter :login_required, :login_from_cookie
  before_filter :authenticate, :except => :index
  
  def index
    render :text => "visible to all"
  end
  
  def secret
    render :text => "only the chosen"
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password| 
      user_name == 'chosen' && password == 'one'
    end
  end  
  
end
