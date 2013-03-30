class TeamsController < ApplicationController
  before_filter :authenticate
  before_filter :get_current_team
  before_filter :find_next_game
  # before_filter :check_if_logged_in
  def index
    binding.pry
    @teams = Team.order(:name)
    @team = Team.new
    @user = User.new
    @selected = get_current_team
    find_next_game if @selected.first.games
    if !@selected.nil? && !@future_games.nil?
      @next_game = @future_games.first
    end
    if !@selected.nil? && !@future_games.nil? && !@currently_added.nil?
      @added_to_list = @next_game.attendees
      all_user_id = @selected.first.users.map(&:user_id)
      @invited_user_id = @added_to_list.map(&:user_id)
      @not_yet_invited = all_user_id - @invited_user_id
    end
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
end