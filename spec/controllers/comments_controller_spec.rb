require 'spec_helper'

describe CommentsController do

def valid_attributes(options={})
    { :name => 'User',
      :text => 'Trololo!' }.merge(options)
  end

  before :each do
    @product = Factory(:ruby)
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new, :product_id => @product.id
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post :create, valid_attributes(:product_id => @product.id)
      response.should be_success(:product_id => @product.id)
    end
  end
end
