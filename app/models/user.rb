class User < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy
  belongs_to :apartment, optional: true

  has_many :apartment_requests, dependent: :destroy
  has_many :applied_apartments, through: :apartment_requests, source: :apartment



  before_save :downcase_email
  after_create :create_profile

  def downcase_email
    self.email = email.downcase
  end
end
