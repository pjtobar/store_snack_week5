class DetailsController < ApplicationController
  def create
    @purchase = current_user.purchases.find_by(state: 1)

    if (!@purchase)
      @purchase = Purchase.new(user_id: current_user.id, state: 1)
      @purchase.save
    end

    @detail = Detail.new
    @detail.quantity = params[:detail][:quantity]
    @detail.product_id = params[:detail][:product_id]
    @detail.purchase_id = @purchase.id
    @detail.save

    redirect_to products_path
  end

  def show
    @purchase = current_user.purchases.find_by(state: 1)
    if(@purchase)
      @details = Detail.where(purchase_id: @purchase.id)
    end
  end

  def pay
    details = Detail.where(purchase_id: params[:id])
    details.each do |d|
      puts d.product_id
      product = Product.where(id: d.product_id).first
      puts product.stock
      product.stock = product.stock + d.quantity
      product.save
    end
    purchase = Purchase.find(params[:id])
    purchase.state = 0
    purchase.save
    redirect_to products_path
  end
end
