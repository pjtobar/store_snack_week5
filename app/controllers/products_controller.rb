class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    # @product = Product.all
    @search = OpenStruct.new(
      params.fetch(:search, {})
    )
    @products =
      if params[:search].present? && params[:search][:name]
        puts 'ssssssssssssssssssssssssssssssssssssss'
        Product.where('name LIKE ?', params[:search][:name]).order(created_at: :desc)
      else
        Product.all.order(created_at: :desc)
      end
    @pagy, @product = pagy(@products, items: 10)
  end

  def show
    # @all_product = Product.all
    @product = Product.find(params[:id])
    # @purchase = Purchase.where(["user_id = ? and state = ?", current_user.id, 1]).first

  end

  def update
    @cantidad = params[:product]
  end

end
