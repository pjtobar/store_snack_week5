class DetailsController < ApplicationController

  before_action :set_purchase, only: %i[create show]
  before_action :check_login
  def create
    unless @purchase
      @purchase = Purchase.new(user_id: current_user.id, state: 1)
      @purchase.save
    end
    update_stock(detail_params[:product_id], detail_params[:quantity].to_i)
    detail = @purchase.details.find_by(product_id: detail_params[:product_id])
    if detail
      detail.quantity += detail_params[:quantity].to_i
      detail.save
    else
      @purchase.details.create(detail_params)
    end
    redirect_to products_path
  end

  def show
    @details = @purchase.details if @purchase
  end

  def pay
    purchase = Purchase.find(params[:id])
    purchase.state = 0
    purchase.save
    redirect_to products_path and return
  end

  private

  def detail_params
    params.require(:detail).permit(:product_id, :quantity)
  end

  def set_purchase
    @purchase = current_user.purchases.find_by(state: 1)
  end

  def check_login
    unless user_signed_in? && (current_user.has_role? :client)
      redirect_to products_path and return
    end
  end

  def update_stock(product_id, quantity)
    product = Product.find(product_id)
    product.stock = product.stock - quantity
    product.save

    if product.likes.any? && product.stock <= 3
      SendNotificationsJob.perform_later(product)
    end
  end
end
