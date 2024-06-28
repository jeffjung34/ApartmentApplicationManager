class ApartmentRequest < ApplicationRecord
  belongs_to :apartment
  belongs_to :applicant, class_name: 'User', foreign_key: 'user_id'

  enum :status, [:pending, :approved, :denied, :superseded], default: :pending

  def approve
    transaction do
      update(status: :approved)
      applicant.apartment_requests.where.not(id: id).pending.update_all(status: :superseded)
      apartment.residents << applicant
    end
  end

  def deny
    update(status: :denied)
  end

  
end
