class Catfact < ApplicationRecord
  belongs_to :user
  scope :owned_by_user, ->(user) { where(user: user) }
end
