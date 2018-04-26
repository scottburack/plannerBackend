class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create
    @user = User.find_by(username: user_login_params[:username])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { username: @user.username, first_name: @user.first_name, last_name: @user.last_name, jwt: token }, status: 202
    else
      render json: { message: "Invalid username or password" }, status: 401
    end
  end

  def show
    if !!current_user #current_user comes from application controller; it finds current user by id found in decoded JWT token
      token = encode_token({ user_id: current_user.id })
      render json: { username: current_user.username, first_name: current_user.first_name, last_name: current_user.last_name, jwt: token }, status: 200
    else
      render json: { message: "User not found" }, status: 404
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end
