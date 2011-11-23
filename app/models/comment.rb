class Comment < ActiveRecord::Base

  belongs_to :product
  
  validates :name, :text, :product, :presence => true
end
