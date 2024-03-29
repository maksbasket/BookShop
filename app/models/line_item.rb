class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validates :product, :presence => true
  validates :price, :numericality => {
    :greater_than_or_equal_to => 0.01,
    :message => 'must be positive'
  }

  def total_price
   price * quantity
  end
end
