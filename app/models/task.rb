class Task < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  validates :title, :description, presence: true
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 65535
end
