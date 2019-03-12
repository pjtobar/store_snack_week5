class LikesController < ApplicationController
  def create
    like = current_user.likes.find_by(product_id: like_params[:product_id])
    if like
      like.destroy
    else
      like = current_user.likes.create(like_params)
    end
    redirect_to products_path
  end

  private

  def like_params
    params.require(:like).permit(:product_id)
  end

end
