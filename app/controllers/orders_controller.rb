class OrdersController < ApplicationController
  before_action :redirect_root, expect: [:new, :create]
  before_action :set_item, only: [:new, :create]

  def new
    @address = Address.all
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'new'
    end
  end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(perams[:id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
