class Appointment < ApplicationRecord
  belongs_to :pet
  validates :reason, presence: true
end
