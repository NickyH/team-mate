class TeamsController < ApplicationController
  before_filter :authenticate
  # before_filter :find_next_game
  # before_filter :check_if_logged_in
  def index
    @teams = Team.order(:team_name)
    @team = Team.new
    @user = User.new
    if @selected == nil
      @selected = [@auth.teams.first]
    end
    # if !@selected.nil?
    #   find_next_game
    # else
    #   @future_games = nil
    # end
    #   @next_game = @future_games.first
    # end
    # if !@selected.nil? && !@future_games.nil? && !@currently_added.nil?
    #   @added_to_list = @next_game.attendees
    #   all_user_id = @selected.first.users.map(&:user_id)
    #   @invited_user_id = @added_to_list.map(&:user_id)
    #   @not_yet_invited = all_user_id - @invited_user_id
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
    @selected = Team.where(:team_name => @current_team) || @auth.teams.first
    find_next_game
    @next_game = @future_games.first || nil
  end
end
