module ApplicationHelper

  def price_for(item)
    price = item.respond_to?(:price) ? item.price : item
    number_to_currency(price, :format => '%n %u', :unit => '&euro;',
                       :separator => ',', :delimeter => ' ')
  end

  def hidden_div_if(condition, attributes = {}, &block)
    attributes["style"] = "display: none" if condition
    content_tag("div", attributes, &block)
  end
end
