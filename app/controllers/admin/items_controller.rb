class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
   @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.all
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
   @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active )
  end

end
