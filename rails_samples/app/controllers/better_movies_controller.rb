# Note: This controller ignores sad paths on purpose to keep the focus on Ajax.
class BetterMoviesController < ApplicationController
  layout "ajax"
  skip_before_filter :verify_authenticity_token
  skip_before_filter :login_required, :login_from_cookie
  
  def index
    @movies = Movie.find(:all, :order => "year")
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.create(params[:movie])
    respond_to do |format|
      format.html {
        redirect_to :action => "index"
      }
      format.js { 
        @movies = Movie.find(:all, :order => "year")
        render(:update) { |page|
          page.replace 'movie_list', :partial => "movie_list"
          # codecite highlight
          page.visual_effect :highlight, dom_id(@movie)
          # codecite blind_up
          page.visual_effect :blind_up, 'add_movie', :duration => 1
          # codecite delay
          page.delay(1) {
            page.replace :add_movie, :partial => "add_movie_link"
          }
          # codecite delay
        }
      } 
    end
  end
end
