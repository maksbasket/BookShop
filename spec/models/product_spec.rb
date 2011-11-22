require 'spec_helper'

describe Product do
  before(:each) do
    @attr = {	
     :title => 'My first book',
     :description => 'Wonderful Book',
     :price => 10.99,
     }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@attr)
  end
  
  it "should require a title" do
    product = Product.new(@attr.merge(:title => ''))
    product.should_not be_valid
  end 

  it "should require a description" do
    product = Product.new(@attr.merge(:description => ''))
    product.should_not be_valid
  end  
  
  it "should reject invalid price" do
    product = Product.new(@attr.merge(:price => 0.009))
    product.should_not be_valid
  end
  
  it "should reject dublicate title" do
    Product.create!(@attr)
    product = Product.new(@attr)
    product.should_not be_valid
  end  
  
  it "should have title at least 10 characters long" do
    short_name = "a"*9
    short_name = Product.new(@attr.merge(:title => short_name))
    short_name.should_not be_valid
  end
end
