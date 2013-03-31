class HomeController < ApplicationController
  # before_filter :check_if_logged_in
  def index
    @user = User.new
  end
end