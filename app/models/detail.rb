class Detail < ApplicationRecord
  belongs_to :product
  belongs_to :purchase

  def product_name
    product.name
  end

  def product_sku
    product.sku
  end

  def product_price
    product.price
  end
end
