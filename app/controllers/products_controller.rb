class ProductsController < ApplicationController
  before_action :load_products, only: :filter_products

  def show
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "not_found"
    redirect_to root_url
  end

  def filter_products; end

  private

  def load_products
    case
    when params[:cate_id]
      @products = Product.by_category params[:cate_id]
    when params[:cost_min] && params[:cost_max]
      @products = Product.min_max_cost params[:cost_min], params[:cost_max]
    end
  end
end
