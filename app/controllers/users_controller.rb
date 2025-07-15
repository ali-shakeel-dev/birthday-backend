class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { token: encode_token(user.id), user: user }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def encode_token(user_id)
    JWT.encode({ user_id: user_id }, Rails.application.credentials.secret_key_base)
  end
end
