class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Form.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:form).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
