class ProductsController < ApplicationController
  include Pagy::Backend
  # before_action :product, except: [:index]
  # helper_method :product

  def index
    @like = Like.new
    @categories = Category.all.order(name: :ASC)
    @search = OpenStruct.new(
      params.fetch(:search, {})
    )
    @products =
      if params[:search].present?
        Product.available.where("name ILIKE ?", "%#{params[:search][:name]}%")
      else
        Product.available.all.order(name: :ASC)
      end
    @pagy, @product = pagy(@products, items: 10)
  end

  def show
    @product = Product.find(params[:id])
  end


  def new
    if user_signed_in? && (current_user.has_role? :admin)
      @product = Product.new
      @categories = Category.all.order(name: :ASC)
    else
      redirect_to products_path
    end
  end

  def create
    if user_signed_in? && (current_user.has_role? :admin)
      product = Product.new(product_params)
      product.state = 1
      product.save
    end
    redirect_to products_path
  end

  def edit
    if user_signed_in? && (current_user.has_role? :admin)
      @product = Product.find(params[:id])
      @categories = Category.all.order(name: :ASC)
    else
      redirect_to products_path
    end
  end

  def update
    if user_signed_in? && (current_user.has_role? :admin)
      @product = Product.find(params[:id])
      @product.assign_attributes(product_params)
      if @product.save
        redirect_to products_path and return
      else
        render 'edit'
      end
    else
      redirect_to products_path
    end
  end

  def destroy
    if user_signed_in? && (current_user.has_role? :admin)
      @product = Product.find(params[:id])
      @product.state = 0
      @product.save
    end
    redirect_to products_path and return
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :sku, :category_id, :image)
  end

  # def product
  #   @product ||=
  #     if ['create', 'new'].include?(action_name)
  #       Product.new(product_params)
  #     else
  #       Product.where(id: params[:id]).first
  #     end
  # end

end
