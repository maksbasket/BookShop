require 'spec_helper'

describe StoreController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should show the Product" do
      product = Factory(:ruby)
      get :index
      response.should have_selector(".entry", :count => 1)
      response.should have_selector("h3", :content => product.title)
    end
  end
end
