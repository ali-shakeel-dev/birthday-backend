class WishesController < ApplicationController
  before_action :authorize_request

  def index
    wishes = @current_user.wishes.order(created_at: :desc)
    render json: wishes
  end

  def create
    wish = @current_user.wishes.build(wish_params)
    if wish.save
      render json: wish, status: :created
    else
      render json: { errors: wish.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    wish = @current_user.wishes.find(params[:id])
    if wish.update(wish_params)
      render json: wish
    else
      render json: { errors: wish.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    wish = @current_user.wishes.find(params[:id])
    wish.destroy
    render json: { message: 'Wish deleted' }
  end

  private

  def wish_params
    params.require(:wish).permit(:name, :email, :birthday, :time, :style)
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])
    rescue
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
