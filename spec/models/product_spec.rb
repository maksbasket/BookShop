require 'spec_helper'

describe Product do
  before(:each) do
    @attr = {	
     :title => 'Book',
     :description => 'Wonderful Book',
     :price => 10.99,
     :image_url => 'book.jpg'
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
  
  it "should require image_url" do
    product = Product.new(@attr.merge(:image_url => ''))
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
  
  it "should accept valid image_urls" do
    image_urls = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                     http://a.b.c/x/y/z/fred.gif }
    image_urls.each do |image_url|
      product = Product.new(@attr.merge(:image_url => image_url))
      product.should be_valid
    end
  end
  
  it "should reject invalid image_urls" do
    image_urls = %w{ fred.doc fred.gif/more fred.gif.more }
    image_urls.each do |image_url|
      product = Product.new(@attr.merge(:image_url => image_url))
      product.should_not be_valid
    end
  end
end
