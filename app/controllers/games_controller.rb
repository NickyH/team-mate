class GamesController < ApplicationController
  before_filter :authenticate
  def index
    @games = Game.order(:date_time)
  end
  def new
    @game = Game.new
    @selected = Team.where(:team_name => @auth.current_team)
  end
  def edit
    @game = Game.where(:id => params[:id])
  end
  def import
    competition = params[:competition_name]
    @games = Game.import(params[:file])
    @competition = Competition.new(name: competition)
    @games.each do |game|
      @competition.games << game
    end
    @competition.start_date = @competition.games.first.date
    team = @auth.current_team
    @selected = Team.where(:team_name => team)
    @selected.first.games = @games
  end
  def show
    @competition = params[:competition_id]
    @games = Game.find(params[:competition_id])
  end
  def invite_player
    user = User.find(params[:user_id])
    game = Game.find(params[:game_id])
    current_team = @auth.current_team
    team = Team.where(:team_name => current_team)
    added_to_list = Attendee.create
    added_to_list.status = "Added to game list"
    added_to_list.game_id = game.id
    added_to_list.user_id = user.id
    @select = Game.where(:id => game.id)
    @select.first.attendees << added_to_list
    @currently_added = @select.first.attendees
    @added_to_list = game.attendees
    all_players = User.where(:team_id => team.first.id)
    all_user_id = all_players.map(&:id)
    @invited_user_id = @added_to_list.map(&:user_id).uniq
    @not_yet_invited = all_user_id - @invited_user_id
    @not_invited = User.where(:id => @not_yet_invited)
    @invited = User.where(:id => @invited_user_id)
    @selected = team
  end
  def result
  end
end

