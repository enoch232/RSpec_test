class PostsController < ApplicationController

  def index
  	@posts = Post.order(:price)
  end
  def new
  	@post = Post.new
  	if @post.save
  	  respond_to do |format|
  	    format.html{redirect_to root_path}
  	    format.json{}
  	  end
  	else
  	  respond_to do |format|
  	    format.html{redirect_to root_path}
  	    flash[:notice] = "failed"
  	    format.json{}
  	  end
  	end	
  end
  def copy
  end
end
