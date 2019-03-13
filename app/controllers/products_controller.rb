class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    @like = Like.new
    @categories = Category.all.order(name: :ASC)
    @search = OpenStruct.new(
      params.fetch(:search, {})
    )
    @products =
      if params[:search].present?
        Product.where("name LIKE ?", params[:search][:name]).order(params[:search][:sort])
      else
        Product.all.order(name: :ASC)
        # Product.where("name LIKE ?", params[:search][:name]).order(name: :asc)
      end
    @pagy, @product = pagy(@products, items: 10)
  end

  def show
    @product = Product.find(params[:id])
  end

end
