class Feedback < ApplicationRecord
  validates :name, :email, :message, presence: true
  enum remarks: { good: 0, bad: 1 }
end


