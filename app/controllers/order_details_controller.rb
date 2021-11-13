class OrderDetailsController < ApplicationController
   before_action :authenticate_customer!
    def create
    @order = Order.all
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path
    end

private
def order_detail_params
    params.require(:order_detail).permit(:making_status)
end

end
