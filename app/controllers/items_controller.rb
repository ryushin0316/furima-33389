class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
      if @item.destroy
        redirect_to root_path
      else
        redirect_to item_path(item.id)
      end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :type_id, :delivery_pay_id, :area_id, :day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if @item.user_id != current_user.id || @item.buy.present?
      redirect_to root_path
    end
  end
  
end


