class Feedback < ApplicationRecord
  validates :name, :message, presence: true
  enum remarks: { good: 0, bad: 1 }
  belongs_to :user

  has_many :notes
end


