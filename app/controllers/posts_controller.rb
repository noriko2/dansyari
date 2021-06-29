class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :destroy]

  def new
    @post = Post.new
    @post.build_photo
  end

  def create
    @post = Post.new(post_params)
    if @post.photo.present?
      @post.save
      redirect_to posts_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_post_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.where(user_id: current_user).limit(12).order('created_at DESC')
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "記録が削除されました"
    else
      flash[:alert] = "記録の削除に失敗しました"
    end
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:caption, photo_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find(params[:id].to_i)
      if @post.user != current_user
        redirect_to root_url
      end
    end
end
