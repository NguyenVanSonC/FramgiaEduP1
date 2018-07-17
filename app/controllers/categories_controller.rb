class CategoriesController < ApplicationController
  before_action :find_category, only: %i(show)

  def show
    @products = @category.products.select(:id, :name, :cost, :status,
      :img_url).order_cost.paginate page: params[:page],
      per_page: Settings.pageproduct
    respond_to do |format|
      format.html{redirect_to root_url}
      format.js
    end
  end

  def index; end

  private

  def find_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "not-found-category"
    redirect_to root_url
  end
end
