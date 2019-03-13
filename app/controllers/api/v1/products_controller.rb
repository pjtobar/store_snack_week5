module API
  module V1
    class ProductsController < ApplicationController
      include Pagy::Backend
      # respond_to :json

      def index
        products =
          if params[:search].present? && params[:search][:name]
            Product.where("name LIKE ?", params[:search][:name]).order('name ASC')
          else
            Product.all.order('name ASC')
          end
        product = pagy(products, items: 10)
        render json: {status: 'SUCCESS', message: 'Loaded products', data: product},status: :ok
        # respond_with product
      end
    end
  end
end
