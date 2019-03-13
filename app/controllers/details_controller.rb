class DetailsController < ApplicationController

  before_action :set_purchase, only: %i[create show]

  def create
    if (!@purchase)
      @purchase = Purchase.new(user_id: current_user.id, state: 1)
      @purchase.save
    end

    detail = @purchase.details.find_by(product_id: detail_params[:product_id])

    product = Product.find(detail_params[:product_id])
    product.stock = product.stock - detail_params[:quantity].to_i
    product.save

    if detail
      detail.quantity += detail_params[:quantity].to_i
      detail.save
    else
      detail = @purchase.details.create(detail_params)
    end

    redirect_to products_path
  end

  def show
    if(@purchase)
      @details = @purchase.details
    end
  end

  def pay
    purchase = Purchase.find(params[:id])
    purchase.state = 0
    purchase.save
    redirect_to products_path and return
  end

  def set_purchase
    @purchase = current_user.purchases.find_by(state: 1)
  end


  private

  def detail_params
    params.require(:detail).permit(:product_id, :quantity)
  end
end
