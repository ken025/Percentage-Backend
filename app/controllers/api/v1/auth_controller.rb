class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create, :autologin]

  # login functionality from backend
  def create
    @user = User.find_by(username: user_login_params[:username])
    # User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token(@user.id)
      render json: { user: UserSerializer.new(@user), token: token }, status: :accepted
    else
      render json: { errors: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def autologin
   user = session_user
    if user
      token = encode_token(user.id)
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: { errors: "Error with localStorage"}
    end
  end

      private 
        
      def user_login_params
        # params { user: {email: 'missy@missyelliott.com', password: 'misdemeanor' } }
        params.require(:user).permit(:username, :password)
      end
    end