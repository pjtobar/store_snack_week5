class Category < ApplicationRecord
  has_many :products

  scope :order_by_name, -> { order(name: :ASC) }
end
