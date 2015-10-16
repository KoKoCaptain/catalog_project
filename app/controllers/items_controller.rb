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
    @item.item_categories.build
  end

  #def category_id
   # @category = Category.where(id: params[:item][:categories])
  #end

  # Я помню, что закомментированный код не должен попадать в Git, позже уберу)

  def create
    @item = Item.new(item_params)  #:name, :avatar, :description, :category_id
    @item.item_categories.build
    #@category = Category.find(params[:id])
    #@item.save!
    #@item.add_category_to_item
    #@item.categories = @category
    if @item.save
      redirect_to @item
    else
      render '/'
    end
  end

  private

  def item_params                                        # category_id должно передваться в параметры, но не хочет..
    params.require(:item).permit(:name, :avatar, :description, item_categories_attributes: [:category_id])
  end


end
