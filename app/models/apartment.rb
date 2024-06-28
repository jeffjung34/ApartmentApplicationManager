class Apartment < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :city
  has_many :residents, class_name: "User"
  has_many :apartment_requests, dependent: :destroy
  has_many :applicants, through: :apartment_requests, source: :applicant


  validates :street_address, presence: true
  validates :rent, presence: true, 
                      numericality: { greater_than_or_equal_to: 100 }
  validates :bedrooms, presence: true, 
                      numericality: { greater_than_or_equal_to: 1 }

  def remaining_bedrooms
    bedrooms - residents.count
  end

  def has_free_bedrooms?
    self.residents.count < self.bedrooms
  end

  def unoccupied?
    residents.count == 0
  end

  def current_resident?(user)
    residents.include?(user)
  end

  def request(user)
    apartment_requests.find_by(applicant: user)
  end

  def requested?(user)
    request(user).present?
  end

  def request_pending?(user)
    request(user)&.pending?
  end

end
