class Backend::CharitiesController < Backend::BaseController
  authorize_resource
  before_action :set_charity, only: [:show, :edit, :update, :destroy]
  before_action :set_charity_location, only: [:new, :edit, :update, :show, :destroy, :create]

  # GET /backend/charities
  # GET /backend/charities.json
  def index
    @backend_charities = Charity.all
  end

  # GET /backend/charities/1
  # GET /backend/charities/1.json
  def show
  end

  # GET /backend/charities/new
  def new
    @charity = @charity_location.charities.new
  end

  # GET /backend/charities/1/edit
  def edit
  end

  # POST /backend/charities
  # POST /backend/charities.json
  def create
    @charity = @charity_location.charities.new(charity_params)

    respond_to do |format|
      if @charity.save
        format.html { redirect_to backend_charity_location_url(@charity.charity_location), notice: 'Charity was successfully created.' }
        format.json { render :show, status: :created, location: @charity }
      else
        format.html { render :new }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/charities/1
  # PATCH/PUT /backend/charities/1.json
  def update
    respond_to do |format|
      if @charity.update(charity_params)
        format.html { redirect_to backend_charity_location_url(@charity.charity_location), notice: 'Charity was successfully updated.' }
        format.json { render :show, status: :ok, location: @charity }
      else
        format.html { render :edit }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/charities/1
  # DELETE /backend/charities/1.json
  def destroy
    @charity_location = @charity.charity_location
    @charity.destroy
    respond_to do |format|
      format.html { redirect_to backend_charity_location_url(@charity_location), notice: 'Charity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charity
      
      @charity = Charity.find(params[:id])
    end

    def set_charity_location
      @charity_location = CharityLocation.find params[:charity_location_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charity_params
      params.require(:charity).permit(:name, :status)
    end
end
