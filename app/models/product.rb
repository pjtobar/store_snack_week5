class Product < ApplicationRecord
  belongs_to :category
  has_many :details
  has_many :purchases, through: :details
  has_many :likes
  has_many :users, through: :likes
  has_and_belongs_to_many :tags
  has_one_attached :image
  validates :sku, uniqueness: true

  scope :available, -> { where(state: 1) }
  scope :name_like, ->(product_name) { where('name ILIKE ?', "%#{product_name}%") }
  scope :order_by_name, -> { order(name: :ASC) }

  delegate :name, to: :category, prefix: true


  def product_image
    return self.image.variant(resize: '220x220').processed
  end
end
