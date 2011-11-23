require 'spec_helper'

describe Image do
  
  it "should create a new instance given valid attributes" do
    expect { Factory(:image) }.to change(Image, :count).by(1)
  end
  
  it "should require a file" do
    image = Factory.build(:image, :file => nil)
    image.should_not be_valid
  end

  it "should accept valid file_urls" do
    file_urls = %w{ debug.jpg logo.png rails.png rtp.jpg ruby.jpg wd4d.jpg }
    file_urls.each do |file_url|
      image = Factory.build(:image, :file => attach_image(file_url))
      image.should be_valid
    end
  end
  
  it "should reject invalid file_urls" do
    file_urls = %w{ qwerty.doc qwerty.pdf }
    file_urls.each do |file_url|
      image = Factory.build(:image, :file => attach_image(file_url))
      image.should_not be_valid
    end
  end
end
