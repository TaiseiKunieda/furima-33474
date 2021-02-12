class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @purchase = Form.new
    if @item.user_id == current_user.id
      redirect_to root_path
    end

    if user_signed_in?
      if @item.purchase != nil
        redirect_to root_path
      end
    end
  end

  def create
    @purchase = Form.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

  private
  def purchase_params
    params.require(:form).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
