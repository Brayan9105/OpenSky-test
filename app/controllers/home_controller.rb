class HomeController < ApplicationController
  def index
    @authors = Author.last(5)
    @posts = Post.last(5)
  end
end
