# Note: This controller ignores sad paths on purpose to keep the focus on Ajax.
class MoviesController < ApplicationController
  # codecite layout
  layout "ajax"
  skip_before_filter :verify_authenticity_token
  skip_before_filter :login_required, :login_from_cookie
  
  # codecite index
  def index
    @movies = Movie.find(:all, :order => "year")
  end
  # codecite index
  
  # codecite new
  def new
    @movie = Movie.new
  end
  # codecite new
  
  # codecite create
  def create
    @movie = Movie.create(params[:movie])
    # codecite create
    # codecite respond_to
    respond_to do |format|
      format.html {
        redirect_to :action => "index"
      }
      # codecite respond_to
      # codecite format.js
      format.js { 
        @movies = Movie.find(:all, :order => "year")
        render(:update) { |page|
          page.replace 'movie_list', :partial => "movie_list"
          page.replace 'add_movie', :partial => "add_movie_link"
        }
      } 
      # codecite format.js
    end
  end
end
