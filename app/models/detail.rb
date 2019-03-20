class Detail < ApplicationRecord
  belongs_to :product
  belongs_to :purchase

  delegate :name, :sku, :price, :category_name, to: :product, prefix: true

end
