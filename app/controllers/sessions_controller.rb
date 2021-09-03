class SessionsController < ApplicationController
  
  def index
    if session.include?(:user_id)
      render json: { user: "logged in"}
    else 
      render json: { user: "not logged in"}
    end
  end
  
  def create
    user = User.find_by_email(params[:email])
    byebug
    if user && user.authenticate(params[:email][:password])
        payload = {user_id: user.id}
        token = encode_token(payload)
        user_json = UserSerializer.new(user).serializable_hash
        user_json[:jwt] = token
        render json: {
            user: user_json,               
            jwt: token}
    else
        render json: {status: "error", message: "We don't find such an user according to your information,please try again."}
    end
  end                 

  def autologin
    if session_user
      render json: UserSerializer.new(session_user).serializable_hash
    else
      render json: {errors: "No User Logged In."}
    end 
  end

end