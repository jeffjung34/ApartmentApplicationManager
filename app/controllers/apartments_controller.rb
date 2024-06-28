class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy occupy vacate]

  # GET /apartments or /apartments.json
  def index
    @apartments = Apartment.all
  end

  # GET /apartments/1 or /apartments/1.json
  def show
    @apartment = Apartment.find(params[:id])
    @pending_applications = @apartment.apartment_requests.where(status: :pending)
                                .includes(applicant: :profile)
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
    set_form_values
  end

  # GET /apartments/1/edit
  def edit
    set_form_values
  end

  def occupy
    current_user.apartment_id = @apartment.id
    respond_to do |format|
      if current_user.save
        format.html { redirect_to apartment_url(@apartment), notice: "You have moved in!" }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end

  def vacate
    current_user.apartment_id = nil
    respond_to do |format|
      if current_user.save
        format.html { redirect_to apartment_url(@apartment), notice: "You have moved out!" }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
  end

  # POST /apartments or /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1 or /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to apartment_url(@apartment), notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy!

    respond_to do |format|
      format.html { redirect_to apartments_url, notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.where(id: params[:id]).includes(:city, :neighborhood).first
    end

    def set_form_values
      @cities = City.all
      @neighborhoods = Neighborhood.all
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:street_address, :bedrooms, :rent, :notes, :neighborhood_id, :city_id)
    end
end
