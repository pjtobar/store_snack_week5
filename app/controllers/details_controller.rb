class DetailsController < ApplicationController

  before_action :set_purchase, only: %i[create show]
<<<<<<< HEAD
  # before_action :user, only: %i[create show]
=======
>>>>>>> ddce4836d5c743255baa849a8ae36b96e8dcfe5a

  def create
    if user_signed_in? &&
      if (current_user.has_role? :client)
        if (!@purchase)
          @purchase = Purchase.new(user_id: current_user.id, state: 1)
          @purchase.save
        end

<<<<<<< HEAD
        detail = @purchase.details.find_by(product_id: detail_params[:product_id])

        product = Product.find(detail_params[:product_id])
        product.stock = product.stock - detail_params[:quantity].to_i
        product.save

        if !product.likes.empty? && product.stock <= 3
          SendNotificationsJob.perform_later(product)
        end
=======
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
>>>>>>> ddce4836d5c743255baa849a8ae36b96e8dcfe5a

        if detail
          detail.quantity += detail_params[:quantity].to_i
          detail.save
        else
          detail = @purchase.details.create(detail_params)
        end
      end
    end
    redirect_to products_path
  end

  def show
<<<<<<< HEAD
    if user_signed_in? && (current_user.has_role? :client)
      if(@purchase)
        @details = @purchase.details
      end
    else
      redirect_to products_path
=======
    if(@purchase)
      @details = @purchase.details
>>>>>>> ddce4836d5c743255baa849a8ae36b96e8dcfe5a
    end
  end

  def pay
    if user_signed_in? && (current_user.has_role? :client)
      purchase = Purchase.find(params[:id])
      purchase.state = 0
      purchase.save
    end
    redirect_to products_path and return
  end

  def set_purchase
    if user_signed_in? && (current_user.has_role? :client)
      @purchase = current_user.purchases.find_by(state: 1)
    end
  end

  # def user
  #   if user_signed_in?
  #     @user = current_user
  #   else
  #     @user =
  #   end
  # end

  private

  def detail_params
    params.require(:detail).permit(:product_id, :quantity)
  end
end
