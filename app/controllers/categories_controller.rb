class CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :name).recent
  end
end
