class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      Applog.save_log params[:controller], params[:action], @post.id
      flash[:notice] = 'Post was successfully created.'
      redirect_to @post
    else
      flash.now[:notice] = @post.errors
      render :new        
    end
  end

  def update
    if @post.update(post_params)
      Applog.save_log params[:controller], params[:action], @post.id
      flash[:notice] = 'Post was successfully updated.'
      redirect_to @post
    else
      flash.now[:notice] = @post.errors
      render :edit
    end
  end

  def destroy
    if @post.destroy
      Applog.save_log params[:controller], params[:action], @post.id
      flash[:notice] ='Post was successfully destroyed.'
      redirect_to posts_url
    else
      flash[:notice] = "some problems"
      redirect_to active_visit_path        
    end
  end

  def authorPost
    @author = Author.find(params[:id])
    @posts = @author.posts
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_id)
    end
end
