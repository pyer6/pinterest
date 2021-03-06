class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      flash[:notice] = "投稿しました。"
      redirect_to root_url
    else
      flash[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

    private

      def post_params
        params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
      end
end
