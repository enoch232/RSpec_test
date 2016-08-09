require 'spec_helper'
describe Post do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:post)).to be_valid
  end
  it "should initialize with default title, author, description, price" do
  	post = FactoryGirl.create(:post)
  	expect(post.title).to eq("No title")
  	expect(post.description).to eq("No description")
  	expect(post.author).to eq("No author")
  	expect(post.price).to eq(0)
  end
end
