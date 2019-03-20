module API
  module V1
    class ProductsController < ApplicationController
      include Pagy::Backend
      # respond_to :json

      def index
        products =
          if params[:search].present? && params[:search][:name]
            Product.name_like(params[:search][:name]).order_by_name
          else
            Product.all.order_by_name
          end
        product = pagy(products, items: 10)
        render json: {status: 'SUCCESS', message: 'Loaded products', data: product},status: :ok
        # respond_with product
      end
    end
  end
end
