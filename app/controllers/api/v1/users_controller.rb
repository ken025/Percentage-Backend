class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

  # def login
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     @token = encode_token(user_id: @user.id)
  #     # using built-in rails status codes
  #     render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  #   else
  #     render json: { error: 'failed to create user' }, status: :not_acceptable
  #   end
  # end


  # def index
  #   users = User.all
  #   render json: users
  # end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
end

# signing up
def create
  @user = User.create(user_params)
  if @user.valid?
    # passing encode_token a payload of user id
    @token = encode_token(user_id: @user.id)
    # using built-in rails status codes
    render json: { user: UserSerializer.new(@user), token: @token }, status: :created
  else
    render json: { error: user.errors.full_messages.to_sentence }, status: :not_acceptable
  end
end

  private


    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :profile_img, :income)
    end
end
