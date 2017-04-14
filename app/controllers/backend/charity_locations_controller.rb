class Backend::CharityLocationsController < Backend::BaseController

  before_action :authenticate_user!
  before_action :set_backend_charity_location, only: [:show, :edit, :update, :destroy]

  # GET /backend/donation_locations
  # GET /backend/donation_locations.json
  def index
    @charity_locations = CharityLocation.all
  end

  # GET /backend/donation_locations/1
  # GET /backend/donation_locations/1.json
  def show
  end

  # GET /backend/donation_locations/new
  def new
    @charity_location = CharityLocation.new
  end

  # GET /backend/donation_locations/1/edit
  def edit
  end

  # POST /backend/donation_locations
  # POST /backend/donation_locations.json
  def create
    @charity_location = CharityLocation.new(backend_charity_location_params)

    respond_to do |format|
      if @charity_location.save
        format.html { redirect_to backend_charity_location_url(@charity_locations), notice: 'Donation location was successfully created.' }
        format.json { render :show, status: :created, location: backend_charity_location_url(@charity_location) }
      else
        format.html { render :new }
        format.json { render json: @charity_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/donation_locations/1
  # PATCH/PUT /backend/donation_locations/1.json
  def update
    respond_to do |format|
      if @charity_location.update(backend_charity_location_params)
        format.html { redirect_to backend_charity_location_url(@charity_location), notice: 'Donation location was successfully updated.' }
        format.json { render :show, status: :ok, location: backend_charity_location_url(@charity_location) }
      else
        format.html { render :edit }
        format.json { render json: @charity_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/donation_locations/1
  # DELETE /backend/donation_locations/1.json
  def destroy
    @charity_location.destroy
    respond_to do |format|
      format.html { redirect_to backend_charity_locations_url, notice: 'Donation location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_charity_location
      @charity_location = CharityLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_charity_location_params
      params.require(:charity_location).permit(:id, :location_name, :status)
    end
end
