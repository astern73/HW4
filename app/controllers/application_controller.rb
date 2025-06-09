class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      puts "Current user: #{@current_user&.username}"
    else
      puts "No user logged in"
    end
  end
end