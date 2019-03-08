class DetailsController < ApplicationController
  def create
    # puts 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'
    # puts params[:detail][:product]
    @detail = Detail.new
    @detail.quantity = params[:detail][:quantity]
    @detail.product_id = params[:detail][:product_id]
    @detail.purchase_id = params[:detail][:purchase_id]
    @detail.state = 1
    @detail.save

    redirect_to :controller => 'products', :action => 'index'
  end
end
