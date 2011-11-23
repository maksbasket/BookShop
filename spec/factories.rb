FactoryGirl.define do
  factory :ruby, :class => Product do |ruby|
    title 'Programming Ruby 1.9'
    description %{
        <p>Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>}
    price 49.50
  end
end
