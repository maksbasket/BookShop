class Product < ActiveRecord::Base
  
  image_accessor :image

  validates :title, :description, :image, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :title, :length => { :minimum => 10,
                    :message => 'must be at least 10 characters long',
		    :hint => 'must be at least 10 characters long'
		    } 	    
 validates_property :format, :of => :image, :in => [:jpg, :png, :gif]
end
