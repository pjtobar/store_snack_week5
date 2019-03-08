class Product < ApplicationRecord
  belongs_to :category
  has_many :details
  has_many :purchases, :through => :details
  has_and_belongs_to_many :tags
  has_many :likes
  has_many :users, :through => :likes
end
