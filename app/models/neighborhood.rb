class Neighborhood < ApplicationRecord
  has_many :apartments, dependent: :destroy
  belongs_to :city

  validates :name, presence: true
end
