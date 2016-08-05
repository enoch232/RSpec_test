require 'spec_helper'

describe PostsController do
  let(:post_controller) {PostsController.new}
  describe "#index" do
  	it "returns all posts" do
  	  Post.should_receive(:order).with(:price)
  	  post_controller.index
  	end
  end
  describe "#new" do 
  	it "makes a new post" do
  	  Post.should_receive(:new)
  	  post_controller.new
  	end
  end
  describe "#copy" do
  	it "copies a post"
  end

end
