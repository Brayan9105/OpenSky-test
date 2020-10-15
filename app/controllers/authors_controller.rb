class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = params[:sort].present? ? Author.authorSort(params[:sort]) : Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      AppLog.save_log params[:controller], params[:action], @author.id
      flash[:notice] =  'Author was successfully created.'
      redirect_to @author
    else
      flash.now[:notice] = @author.errors
      render :new 
    end    
  end

  def update
    if @author.update(author_params)
      AppLog.save_log params[:controller], params[:action], @author.id
      flash[:notice] = 'Author was successfully updated.' 
      redirect_to @author
    else
      flash.now[:notice] = '@author.errors'
      render :edit
    end
  end

  def destroy
    if  @author.destroy
      AppLog.save_log params[:controller], params[:action], @author.id
      flash[:notice] = 'Authors was deleted and his posts'
      redirect_to authors_path
    else
      flash[:notice] = @author.errors
      redirect_to authors_path
    end
  end

  private
    
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :age, :country_id)
    end
end
