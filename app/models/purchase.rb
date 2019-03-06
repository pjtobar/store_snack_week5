class Purchase < ApplicationRecord
  belongs_to :User
  has_many :datail
  has_many :product, :through => :detail
end
