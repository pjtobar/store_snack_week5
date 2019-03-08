class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    # @product = Product.all
    @pagy, @product = pagy(Product.all, items: 10)
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
