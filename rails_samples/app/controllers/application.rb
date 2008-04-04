# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # codecite AuthenticatedSystem
  include AuthenticatedSystem
  before_filter :login_from_cookie
  before_filter :login_required
  # codecite AuthenticatedSystem

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'e4a921398358e6212f40452a4968442b'
end