class Post < ApplicationRecord
  #attr_accessor :title, :description, :author, :price
  after_initialize :init
  def init
  	self.title = "No title"
  	self.description = "No description"
  	self.author = "No author"
  	self.price = 0
  end
end
