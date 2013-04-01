class TeamsController < ApplicationController
  before_filter :authenticate
  # before_filter :find_next_game
  before_filter :check_if_logged_in
  def index
    @teams = @auth.teams
    @team = Team.new
    @user = User.new
    @selected = Team.where(:team_name => @auth.current_team)
    # if @selected == nil && !@auth.teams.nil?
    #   @selected = [@auth.teams.first] || nil
    # end
  end
  def edit
    @team = Team.find(params[:id])
    @user = User.create
  end
  def update
  end
  def new
    @team = Team.new
  end
  def create
    @team = Team.create(params[:team])
    @auth.teams << @team
  end
  def select_team
    @current_team = params[:team_name]
    @auth.current_team = @current_team
    find_next_game
    if !@future_games.nil?
      @next_game = @future_games.first
    else
      @next_game == nil
    end
    @selected = Team.where(:team_name => @current_team)
  end
end
