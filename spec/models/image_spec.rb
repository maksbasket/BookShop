require 'spec_helper'

describe Image do
  before(:each) do
    @attr = {
      :file => attach_image('ruby.jpg')
    }
  end
  
  it "should create a new instance given valid attributes" do
    expect { Image.create!(@attr) }.to change(Image, :count).by(1)
  end
  
  it "should require a file" do
    image = Image.new(@attr.merge(:file => nil))
    image.should_not be_valid
  end

  it "should accept valid file_urls" do
    file_urls = %w{ debug.jpg logo.png rails.png rtp.jpg ruby.jpg wd4d.jpg }
    file_urls.each do |file_url|
      image = Image.new(@attr.merge(:file => attach_image(file_url)))
      image.should be_valid
    end
  end
  
  it "should reject invalid file_urls" do
    file_urls = %w{ qwerty.doc qwerty.pdf }
    file_urls.each do |file_url|
      image = Image.new(@attr.merge(:file => attach_image(file_url)))
      image.should_not be_valid
    end
  end
end
