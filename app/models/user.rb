class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  has_many :purchases
  has_many :likes
  has_many :products, through: :likes
  has_many :comments, as: :commentable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def assign_default_role
     self.add_role(:client) if self.roles.blank?
   end

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

end
