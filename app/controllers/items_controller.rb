class ItemsController < ApplicationController



  def show
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all
    @items = Item.find(params[:category_id]).items if params[:category_id]
    #@items = Item.includes(:categories).all
  end

  def new
    @item = Item.new
  end

  def create
   # @category = Category.find(params[:id])
    @item = Item.new(item_params)
    @item.categories = Category.where(id: params[:item][:categories]) # should be right
   # @item.categories = @category
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
