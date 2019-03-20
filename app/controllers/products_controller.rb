class ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_category, only: %i[index new edit]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :check_login, except: %i[index show]

  def index
    @like = Like.new
    @search = OpenStruct.new(
      params.fetch(:search, {}))
    @products =
      if params[:search].present?
        Product.available.name_like(params[:search][:name])
      else
        Product.available.all.order_by_name
      end
    @pagy, @product = pagy(@products, items: 10)
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.state = 1
    product.save
    redirect_to products_path
  end

  def edit; end

  def update
    @product.assign_attributes(product_params)
    if @product.save
      redirect_to products_path and return
    else
      render 'edit'
    end
  end

  def destroy
    @product.state = 0
    @product.save
    redirect_to products_path and return
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :sku, :category_id, :image)
  end

  def set_category
    @categories = Category.all.order_by_name
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def check_login
    unless user_signed_in? && (current_user.has_role? :admin)
      redirect_to products_path and return
    end
  end
end
