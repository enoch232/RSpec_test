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
  	  count1 = Post.all.count
  	  Post.create
  	  count2 = Post.all.count
  	  expect(count1 + 1).to eq(count2)
  	end
  end
  describe "#edit" do 
  	it "redirects to edit template" do 
  	  pending "needs edit template"
  	end
  end
  describe "#copy" do
  	it "copies a post"
  end
  describe "#update" do
    post = FactoryGirl.create(:post)
    it "should update title correctly" do
      put :update, id: post.id, post: {title: "hello"}
      post.reload
      expect(post.title).to eq("hello")
    end
    it "should update all correctly"
  end
end
