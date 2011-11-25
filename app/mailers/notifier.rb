class Notifier < ActionMailer::Base
  helper :application 
 
  default from: "depot@example.com"

  def order_received(order)
    @order = order
    mail :to => order.email, :subject => 'Pragmatic Store Order Confirmation'
  end

  def order_shipped(order)
    @order = order
    mail :to => order.email, :subject => 'Pragmatic Store Order have shipped'
  end
end
