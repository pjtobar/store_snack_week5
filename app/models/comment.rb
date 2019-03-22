class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  scope :approve, -> { where(state: 1) }
  scope :type_user, -> { where(commentable_type: 'User') }
  scope :feedback, -> { where(state: 1).average(:score) }
end
