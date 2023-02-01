class Admin::CategoriesController < ApplicationController
  
  before_action :authorize

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category added!'
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit( :name )
  end

end
