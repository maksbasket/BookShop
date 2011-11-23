require 'spec_helper'

describe Product do

  it "should create a new instance given valid attributes" do
    expect { Factory(:ruby) }.to change(Product, :count).by(1)
  end
  
  it "should require a title" do
    product = Factory.build(:ruby, :title => nil)
    product.should_not be_valid
  end 

  it "should require a description" do
    product = Product.new(@attr.merge(:description => ''))
    product.should_not be_valid
  end  
  
  it "should reject invalid price" do
    product = Factory.build(:ruby, :price => 0.009)
    product.should_not be_valid
  end
  
  it "should reject duplicate title" do
    Factory(:ruby)
    product = Factory.build(:ruby)
    product.should_not be_valid
  end  
  
  it "should have title at least 10 characters long" do
    short_name = "a"*9
    short_name = Product.new(@attr.merge(:title => short_name))
    short_name.should_not be_valid
  end
end
