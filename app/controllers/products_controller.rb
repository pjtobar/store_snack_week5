class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    @like = Like.new
    @search = OpenStruct.new(
      params.fetch(:search, {})
    )
    @products =
      if params[:search].present? && params[:search][:name]
        Product.where("name LIKE ?", params[:search][:name]).order(created_at: :desc)
      else
        Product.all.order(created_at: :desc)
      end
    @pagy, @product = pagy(@products, items: 10)
  end

  def show
    @product = Product.find(params[:id])
  end

end
