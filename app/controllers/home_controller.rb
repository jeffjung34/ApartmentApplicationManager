class HomeController < ApplicationController
  def index
    @my_apartment = current_user.apartment
    @my_requests = current_user.apartment_requests
    @reviewable_requests = @my_apartment.present? ? @my_apartment.apartment_requests.pending : []
  end
end
