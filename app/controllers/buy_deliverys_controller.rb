class BuyDeliverysController < ApplicationController

  def index
    @buy_delivery = BuyDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_delivery = BuyDelivery.new(delivery_params)
    @item = Item.find(params[:item_id])
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
        amount: @item[:price],  # 商品の値段
        card: delivery_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
  end

  #　amountの記述（商品のpriceの取得方法）
  #　cardのparams名（delivery_paramsの記述でOKかどうか）