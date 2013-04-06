class UsersController < ApplicationController
  before_filter :authenticate
  def index
    @users = User.order(:name)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
    @team = Team.create
    @team.manager = @user.name
    @team.team_name = @user.current_team
    @user.teams << @team
    @team.save
    @user.save
  end
  def show
  end
  def new_player
    @user = User.new
  end
  def create_new_player
    phone = params[:phone]
    name = params[:name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    current_team = @auth.current_team
    @newuser = User.create(name: name, phone: phone, email: email, password: password, password_confirmation: password_confirmation, current_team: current_team, is_manager: false)
    team = Team.where(:team_name => current_team)
    @newuser.teams << team
    @newuser.save
  end
  def edit
    @user = @auth
  end
  def update
    @auth.update_attributes(params[:user])
  end
  def sendtxt
    name = params[:name]
    body = params[:body]
    user = User.where(:name => name).first
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+16468635581', :to => user.phone, :body => body)
    redirect_to(teams_path)
  end
  def txtform
  end
end
