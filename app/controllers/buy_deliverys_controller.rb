class BuyDeliverysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only:[:index, :create]

  before_action :move_to_index, only: [:index, :create]

  def index
    @buy_delivery = BuyDelivery.new
  end 

  def create
    @buy_delivery = BuyDelivery.new(delivery_params) 
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
    def delivery_params
      params.require(:buy_delivery).permit(:post_number, :area_id, :city, :address_number, :building_name, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: delivery_params[:token],
        currency: 'jpy'
      )
    end
    
    def set_item
      @item = Item.find(params[:item_id])
    end

    def move_to_index
      if current_user.id == @item.user_id || @item.buy.present?
        redirect_to root_path
      end
    end
end