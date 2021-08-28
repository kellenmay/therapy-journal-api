class LoginController < ApplicationController
  require 'httparty'
  

  # httparty for a post request 
  
  response = HTTParty.get('http://localhost:3001/')
  response.code
  response.body 


  def create
    user = User.find_by("lower(username) = ?", user_params[:username].downcase)
    if user && user.authenticate(user_params[:password])
      render json: { token: token(user.id), user_id: user.id }, status: :created 
    else 
      render json: { errors: [ "Sorry, incorrect username or password" ] }, status: :unprocessable_entity
    end 
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end