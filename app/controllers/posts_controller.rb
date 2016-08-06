class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update]
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
  end
  def update 
  	if @post.update_attributes(post_params)
  	  respond_to do |format|
        flash[:notice] = "Successfully updated"
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
  private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :description, :author, :price)
  end
end
