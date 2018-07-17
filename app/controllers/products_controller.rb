class ProductsController < ApplicationController
  before_action :find_product, only: %i(show)
  before_action :load_comments, only: %i(show)

  def show; end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    valid_object? @product
  end

  def load_comments
    @comments = @product.comments.paginate page: params[:page],
      per_page: Settings.pagecomment
    @comment = Comment.new
  end
end
