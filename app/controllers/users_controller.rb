class UsersController < ApplicationController
  skip_before_action :authorized, only: [:signup, :login]

  def signup
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    else
      render json: { error: 'That email already exists. Try again.' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end


  private

  def token
    encode_token({ user_id: @user.id })
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
