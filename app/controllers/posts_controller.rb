class PostsController < ApplicationController
  before_action :authenticate_user!
  
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
    @posts = Post.limit(10).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id].to_i)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def post_params
      params.require(:post).permit(:caption, photo_attributes: [:image]).merge(user_id: current_user.id)
    end
end
