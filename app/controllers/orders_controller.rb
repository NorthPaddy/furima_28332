class OrdersController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @address = Address.all
  end

  def create

  end
end
