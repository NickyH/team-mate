class UsersController < ApplicationController
  before_filter :authenticate
  def index
    @users = User.order(:name)
  end
  def new
    @user = User.new
  end
  def create
    team = @auth.team_id
    @user = User.create(params[:user])
    @user.team_id = team
    @user.save
  end
  def show
  end
  def new_player
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
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

end
