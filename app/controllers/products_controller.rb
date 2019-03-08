class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    # @product = Product.all
    @pagy, @product = pagy(Product.all, items: 10)
  end

  def show
    @product = Product.find(params[:id])
    @purchase = Purchase.where(["user_id = ? and state = ?", current_user.id, 1]).first
    if (!@purchase)
      @purchase = Purchase.create(user_id: current_user.id, state: 1)
      @purchase.save
    end
  end

  def update
    @cantidad = params[:product]
  end

end
