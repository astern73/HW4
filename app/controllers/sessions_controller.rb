class SessionsController < ApplicationController
  def new
  end

  def create
    puts "Email: #{params[:email]}"
    puts "Password: #{params[:password]}"
    
    user = User.find_by(email: params[:email])
    puts "User found: #{user}"
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Login successful!"
      redirect_to "/places"
    else
      puts "Login failed"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end