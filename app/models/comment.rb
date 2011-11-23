class Comment < ActiveRecord::Base

  belongs_to :product
  
  validates :name, :text, :product, :presence => true

  acts_as_nested_set :scope => [:product_id]
end
