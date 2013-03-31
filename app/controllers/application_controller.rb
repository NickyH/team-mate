class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  # def check_if_logged_in
  #   if @auth.nil
  #     redirect_to(root_path)
  #   end
  # end

  private
  def authenticate
    @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
  end
  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin
  end

  # def get_current_team
  #   @current_team = params[:team_name]
  #   @selected = Team.where(:team_name => @current_team)
  #   if @auth.present?
  #     @current_team = @auth.teams.first.team_name
  #     @selected = Team.where(:team_name => @current_team)
  #   else
  #     redirect_to(root_path)
  #   end
  # end

  def find_next_game
    team = params[:team_name]
    team = Team.where(:team_name => team)
    future_games = []
    team.first.games.each do |game|
      if game.date >= Date.today
        future_games << game
        @future_games = future_games.sort
      end
    end
  end

end
