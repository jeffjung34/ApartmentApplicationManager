class City < ApplicationRecord
  has_many :neighborhoods, dependent: :destroy
  has_many :apartments, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
