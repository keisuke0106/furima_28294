class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    item = Item.find(params[:item_id])
    if (current_user.id != item.user_id) && item.purchase_history.blank?
      @item = Item.find(params[:item_id])
      @purchase = Purchase.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:post_code, :shipping_region_id, :city, :house_number, :building_name, :phone_number, :item_id, :purchase_history_id, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: params[:token],          # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end
end
