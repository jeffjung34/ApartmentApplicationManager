class ApartmentRequestsController < ApplicationController
    before_action :set_apartment
    before_action :set_apartment_request, only: [:destroy, :update]
  
    def create
      @apartment_request = @apartment.apartment_requests.new(applicant: current_user, status: :pending)
  
      if @apartment_request.save
        redirect_to @apartment, notice: 'Application submitted successfully.'
      else
        redirect_to @apartment, alert: 'Could not submit application.'
      end
    end
  
    def destroy
      @apartment_request.destroy
      redirect_to @apartment, notice: 'Application has been withdrawn.'
    end

    def update
        @apartment = @apartment_request.apartment
        if params[:status] == "approved"
          @apartment_request.approve
        elsif params[:status] == "denied"
          @apartment_request.deny
        else
          @apartment_request.update(status: params[:status])
        end
        redirect_to home_path 
      end
  
    private
  
    def set_apartment
      @apartment = Apartment.find(params[:apartment_id])
    end
  
    def set_apartment_request
      @apartment_request = @apartment.apartment_requests.find(params[:id])
    end
  end
  