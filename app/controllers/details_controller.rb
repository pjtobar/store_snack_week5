class DetailsController < ApplicationController
  def create
    @purchase = current_user.purchases.find_by(state: 1)

    if (!@purchase)
      @purchase = Purchase.new(user_id: current_user.id, state: 1)
      @purchase.save
    end

    @detail = current_user.purchases.find_by(state: 1).details.find_by(product_id: params[:detail][:product_id])

    if @detail
      @detail.quantity += params[:detail][:quantity].to_i
      @detail.save
    else
      @detail = Detail.new(detail_params)
      @detail.purchase_id = @purchase.id
      @detail.save
    end

    @product = Product.find(params[:detail][:product_id])
    @product.stock = @product.stock - params[:detail][:quantity].to_i
    @product.save

    redirect_to products_path and return
  end

  def show
    @purchase = current_user.purchases.find_by(state: 1)
    if(@purchase)
      @details = Detail.where(purchase_id: @purchase.id)
    end
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
end
