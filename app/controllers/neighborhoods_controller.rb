class NeighborhoodsController < PublicController
  before_action :set_city
  before_action :set_neighborhood, only: %i[ show edit update destroy ]

  # GET /neighborhoods or /neighborhoods.json
  def index
    @neighborhoods = @city.neighborhoods.all
  end

  # GET /neighborhoods/1 or /neighborhoods/1.json
  def show
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = @city.neighborhoods.build
    set_form_values
  end

  # GET /neighborhoods/1/edit
  def edit
    set_form_values
  end

  # POST /neighborhoods or /neighborhoods.json
  def create
    @neighborhood = @city.neighborhoods.build(neighborhood_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to city_neighborhood_url(@city, @neighborhood), notice: "Neighborhood was successfully created." }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/1 or /neighborhoods/1.json
  def update
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to city_neighborhood_url(@city, @neighborhood), notice: "Neighborhood was successfully updated." }
        format.json { render :show, status: :ok, location: @neighborhood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1 or /neighborhoods/1.json
  def destroy
    @neighborhood.destroy!

    respond_to do |format|
      format.html { redirect_to city_neighborhoods_url(@city), notice: "Neighborhood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = @city.neighborhoods.find(params[:id])
    end

    def set_city
      @city = City.find(params[:city_id])
    end

    def set_form_values
      @cities = City.all
    end

    # Only allow a list of trusted parameters through.
    def neighborhood_params
      params.require(:neighborhood).permit(:name, :city_id)
    end
end