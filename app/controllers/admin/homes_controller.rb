class Admin::HomesController < ApplicationController
before_action :authenticate_admin!
  def top
    @order_detail = OrderDetail.all
    @order = Order.all
  end
end
