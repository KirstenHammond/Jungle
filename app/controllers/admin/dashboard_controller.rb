class Admin::DashboardController < ApplicationController
  
  before_action :authorize
  
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
