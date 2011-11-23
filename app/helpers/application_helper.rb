module ApplicationHelper

  def price_for(item)
    price = item.respond_to?(:price) ? item.price : item
    number_to_currency(price, :format => '%n %u', :unit => '&euro;',
                       :separator => ',', :delimeter => ' ')
  end
end
