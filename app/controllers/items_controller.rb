class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render '/'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :avatar, :description)
  end


end
