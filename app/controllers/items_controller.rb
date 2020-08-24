class ItemsController < ApplicationController
  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: :show
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :item_condition_id, :postage_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
