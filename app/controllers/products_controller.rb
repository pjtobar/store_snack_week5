class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    # @product = Product.all
    @pagy, @product = pagy(Product.all, items: 10)

  end
end
