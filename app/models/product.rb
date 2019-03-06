class Product < ApplicationRecord
  belongs_to :category
  has_many :detail
  has_many :purchase, :through => :detail
  has_and_belongs_to_many :tag
  has_many :like
  has_many :user, :through => :like
end
