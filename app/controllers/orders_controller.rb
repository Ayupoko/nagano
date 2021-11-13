class OrdersController < ApplicationController
   before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders
#    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @sum = 0
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.address = @address.address
      @order.postal_code = @address.postal_code
    elsif params[:order][:select_address] == "3"
    end
  end

  def create
    @order = Order.all
    @order = Order.new(order_params)
    @order.status = 0
    if @order.save
      @cart_items = CartItem.all
      @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = 0
      @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      render :new
    end
  end

private
def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :fee, :total_payment, :status)
end

end
