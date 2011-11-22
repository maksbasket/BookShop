class Product < ActiveRecord::Base
  
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  validates :title, :description, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :title, :length => { :minimum => 10,
                    :message => 'must be at least 10 characters long',
		    :hint => 'must be at least 10 characters long'
		    } 	    
end
