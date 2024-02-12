# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirm_mail(bill, order, promotion = nil)
    @bill = bill
    @order = order
    @promotion = promotion
    @total_price = @order.sum(:item_total_price)
    mail to: @bill.email, subject: 'ご注文明細'
  end
end
