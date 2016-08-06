class PostsController < ApplicationController

  def index
  	@posts = Post.order(:price)
  end
  def new
  	@post = Post.new
  	if @post.save
  	  respond_to do |format|
  	    format.html{redirect_to root_path}
        flash[:notice] = "Successfully posted"
  	    format.json{}
  	  end
  	else
  	  respond_to do |format|
  	    format.html{redirect_to root_path}
  	    flash[:notice] = "failed to create a post"
  	    format.json{}
  	  end
  	end	
  end
  def edit
  	@post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
  	if @post.update_attributes(params.require(:post).permit(:title, :description, :author, :price))
  	  respond_to do |format|
        format.html{ redirect_to root_path}
        format.json{}
  	  end
    else
      respond_to do |format|
        flash[:notice] = "failed to update a post"
        format.html{ redirect_to root_path}
        format.json{}
      end
    end
  end

  def copy
  end
end
