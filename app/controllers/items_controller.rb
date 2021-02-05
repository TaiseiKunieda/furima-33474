class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :contributor_confirmation, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :postage_id, :area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to  new_user_session_path unless user_signed_in?
  end
end
