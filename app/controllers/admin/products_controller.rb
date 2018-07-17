class Admin::ProductsController < ApplicationController
  layout "admin/admin"
  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "success_product"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :color, :cost, :status,
      :supplier_id, :category_id, :s, :m, :l, :xl, :quanity,
      :img_url, :description
  end
end
