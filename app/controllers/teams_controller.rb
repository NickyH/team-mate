class TeamsController < ApplicationController
  before_filter :authenticate
  # before_filter :find_next_game
  before_filter :check_if_logged_in
  def index
    @teams = @auth.teams
    @team = Team.new
    @user = User.new
    @selected = Team.where(:team_name => @auth.current_team)
    future_games = []
    @selected.first.games.each do |game|
      if game.date >= Date.today
        future_games << game
        @future_games = future_games.sort
      end
    if !@future_games.nil?
      @next_game = @future_games.first
    end
    end
    @added_to_list = @next_game.attendees
    all_players = User.where(:team_id => @selected.first.id)
    all_user_id = all_players.map(&:id)
    @invited_user_id = @added_to_list.map(&:user_id).uniq
    @not_yet_invited = all_user_id - @invited_user_id
    @not_invited = User.where(:id => @not_yet_invited)
    @invited = User.where(:id => @invited_user_id)
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
