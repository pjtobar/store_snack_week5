class User < ApplicationRecord
  rolify
  has_many :purchase
  has_many :like
  has_many :product, :through => :like
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
