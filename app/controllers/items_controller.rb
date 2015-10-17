class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all
    @items = Item.find(params[:category_id]).items if params[:category_id]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.categories = Category.where(id: params[:item][:categories])

    if @item.save
      redirect_to @item
    else
      render '/'
    end
  end

  private

  def item_params                                        # category_id должно передваться в параметры, но не хочет..
    params.require(:item).permit(:name, :avatar, :description)
  end


end
