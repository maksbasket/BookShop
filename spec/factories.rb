Factory.sequence :title do |i|
  "Programming Ruby 1.9.#{i}"
end

FactoryGirl.define do
  factory :ruby, :class => Product do |ruby|
    title 'Programming Ruby 1.9'
    description %{
        <p>Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>}
    price 49.50
  factory :image do |image| 
    file File.new("#{Rails.root}/spec/fixtures/images/ruby.jpg")
  end

  factory :product do |product|
    title { Factory.next :title }
    description 'Cool book!'
    price 11.11
  end

  factory :image do |image|
    file File.new("#{Rails.root}/spec/fixtures/images/ruby.jpg")
  end
  
  factory :comment do |comment|
    product { Factory(:product) }
    name 'User'
    text 'Trololo.'
    parent_id { product.root_comment.id }
  end

  factory :cart

  factory :pay_type do |pay_type|
    name 'Check'
  end

  factory :line_item do |line_item|
    price 12.34
    product { Factory(:product) }
  end

  factory :order do |order|
    name "Customer"
    address "1st Main Street"
    email "customer@example.com"
    pay_type { Factory(:pay_type) }
    line_items { [Factory(:line_item)] }
  end
end
