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
  	it "should return respones of 200" do 
      post = FactoryGirl.create(:post)
      get :edit, id: post.id
      expect(response.code).to eq("200")
  	end
  end
  describe "#copy" do
  	it "copies a post" do
      @post = FactoryGirl.create(:post)
      put :update, id: @post.id, post: {title: "title 1", description: "description 1", author: "author 1", price: 3}
      @post.reload
      copied_post = post :copy, id: @post.id
      #puts "PUTS #{copied_post}"

      expect(response.code).to eq("302")
    end
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
  describe "#destroy" do
    post = FactoryGirl.create(:post)
    it "deletes a post" do
      expect{Post.find(post.id)}.to_not raise_error
      delete :destroy, id: post.id
      #should raise_error, where it cant find the post
      expect{Post.find(post.id)}.to raise_error
    end
  end
end
