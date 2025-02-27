class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def map
    posts = Post.all
    @markers = posts.map do |post|
      {
        id: post.id,
        lat: post.latitude,
        lng: post.longitude
      }
    end
  end

  def locations
    @users = User.all
    render json: @users.to_json(only: [:id, :name, :latitude, :longitude])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    @user = User.find(params[:id])
    params.require(:user).permit(:username, :password, :email, :password_confirmation, :photo)
  end
end
