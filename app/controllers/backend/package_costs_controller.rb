class Backend::PackageCostsController < Backend::BaseController
  authorize_resource
  before_action :set_package_cost, only: [:show, :edit, :update, :destroy]

  # GET /backend/package_costs
  # GET /backend/package_costs.json
  def index
    @package_costs = PackageCost.all
  end

  # GET /backend/package_costs/1
  # GET /backend/package_costs/1.json
  def show
  end

  # GET /backend/package_costs/new
  def new
    @package_cost = PackageCost.new
  end

  # GET /backend/package_costs/1/edit
  def edit
  end

  # POST /backend/package_costs
  # POST /backend/package_costs.json
  def create
    @package_cost = PackageCost.new(package_cost_params)

    respond_to do |format|
      if @package_cost.save
        format.html { redirect_to backend_package_cost_url(@package_cost), notice: 'Package cost was successfully created.' }
        format.json { render :show, status: :created, location: @package_cost }
      else
        format.html { render :new }
        format.json { render json: @package_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/package_costs/1
  # PATCH/PUT /backend/package_costs/1.json
  def update
    respond_to do |format|
      if @package_cost.update(package_cost_params)
        format.html { redirect_to backend_package_cost_url(@package_cost), notice: 'Package cost was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_cost }
      else
        format.html { render :edit }
        format.json { render json: @package_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/package_costs/1
  # DELETE /backend/package_costs/1.json
  def destroy
    @package_cost.destroy
    respond_to do |format|
      format.html { redirect_to backend_package_costs_url, notice: 'Package cost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_cost
      @package_cost = PackageCost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_cost_params
      params.require(:package_cost).permit(:package_size, :cost_per_carton)
    end
end
