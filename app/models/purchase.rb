class Purchase < ApplicationRecord
  belongs_to :user
  has_many :details
  has_many :products, :through => :details

end
