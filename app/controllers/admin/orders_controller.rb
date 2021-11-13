class Admin::OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

    if @order.status == "confirm"
     @order_details.update_all(making_status: "waiting")
    end
    redirect_to admin_order_path(@order)
  end

private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :fee, :total_payment, :status, :making_status)
end

end
