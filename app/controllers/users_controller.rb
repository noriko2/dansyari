class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @user = User.find_by(id: params[:id])
    @total_posts = @user.posts.count

    if current_user == @user
      render 'users/show'
    else
      redirect_to root_url
    end
  end
end
