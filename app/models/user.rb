class User < ApplicationRecord
  rolify
  has_many :purchases
  has_many :likes
  has_many :feedbacks
  has_many :products, through: :likes
  has_many :comments, as: :commentable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

end
