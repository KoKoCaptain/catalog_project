class CategoriesController < ApplicationController

  attr_accessor :parent_id

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render '/'
    end
  end

  def add_parent_id
      self.parent_id = @category.id
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

end
