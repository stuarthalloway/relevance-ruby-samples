class BaseballController < ApplicationController
  # codecite no cache
  def show_team
    @team = Team.find(params[:id])
  end
  # codecite no cache
  # codecite cached  
  def show_team_cached
    unless read_fragment({})
      @team = Team.find(params[:id])
    end
  end
  # codecite cached  
  
  # codecite controllerquerycache
  def modify_team
    team = Team.find(params[:id])
    team2 = Team.find(params[:id])
    team2.name = "New Name"
    team2.save
    team3 = Team.find(params[:id])
  end
  # codecite controllerquerycache
  
end
