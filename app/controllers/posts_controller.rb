class PostsController < ApplicationController
  def index
  	@posts = Post.order(:price)
  end
  def new
  	@post = Post.new
  end
  def copy


  end
end
