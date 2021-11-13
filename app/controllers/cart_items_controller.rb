class CartItemsController < ApplicationController
   before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end

def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
end

    def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    end

    def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
    end


  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
