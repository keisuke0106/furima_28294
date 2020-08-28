class PurchaseHistoriesController < ApplicationController

  def index
    @item = Item.find_by(id: params[:item_id])
    end
    
    
    def create
    @item = Item.find_by(id: params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @order.valid?
    @purchase.save
    return redirect_to root_path
    else
    render "new"
    end
    end
    
    private
    
    def purchase_params
    params.require(:purchase).permit(:post_code, :shipping_region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: @item.id)
    end
end
