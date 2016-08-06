require 'spec_helper'
require 'rails-controller-testing'
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
  	it "should return respones of 200" do 
      post = FactoryGirl.create(:post)
      get :edit, id: post.id
      puts response.inspect
      expect(response.code).to eq("200")
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
    it "should update all correctly" do
      put :update, id: post.id, post: {title: "cool", description: "its funny", author: "no one", price: 10}
      post.reload
      expect(post.title).to eq("cool")
      expect(post.description).to eq("its funny")
      expect(post.author).to eq("no one")
      expect(post.price).to eq(10)
    end
  end
end
