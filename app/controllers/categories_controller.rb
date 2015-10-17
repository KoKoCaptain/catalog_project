class CategoriesController < ApplicationController
  attr_accessor :parent_id

  def show
    @categories = Category.all
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

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

end
