class Product < ApplicationRecord
  belongs_to :category
  has_many :details
  has_many :purchases, :through => :details
  has_and_belongs_to_many :tags
  has_many :likes
  has_many :users, :through => :likes
  has_one_attached :image
  validates :sku, uniqueness: true

  scope :available, -> { where(state: 1) }

  def product_image
    return self.image.variant(resize: '220x220').processed
  end

  def category_name
    category.name
  end
end
