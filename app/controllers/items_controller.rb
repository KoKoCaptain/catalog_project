class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.paginate(page: params[:page])
    @comment = @item.comments.build if signed_in?
  end


  def index
    @items = Item.paginate(page: params[:page])
    @items = Item.find(params[:category_id]).items if params[:category_id]
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.item_image = params[:file]
    @item.categories = Category.where(id: params[:item][:categories])
    if @item.save
      redirect_to @item
    else
      render '/'
    end
  end

  private

  def item_params                                        
    params.require(:item).permit(:name, :item_image, :description)
  end


end
