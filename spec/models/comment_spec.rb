require 'spec_helper'

describe Comment do
  
  it "should be created by Product's creation" do
    expect { Factory(:product) }.to change(Comment, :count).by(1)
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:text) }

  it { should validate_presence_of(:product) }
end
