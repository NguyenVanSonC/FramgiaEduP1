class StaticPagesController < ApplicationController
  def home
    @products = Product.select(:id, :name, :cost, :status,
      :img_url).order_cost.paginate page: params[:page],
      per_page: Settings.pageproduct
    @categories = Category.select(:id, :name, :child_of).recent
  end

  def help; end

  def contact; end
end
