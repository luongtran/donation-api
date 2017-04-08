class Api::V1::AddressesController < Api::BaseController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/addresses
  # GET /api/v1/addresses.json
  def index
    @addresses = current_user.addresses
  end

  # GET /api/v1/addresses/1
  # GET /api/v1/addresses/1.json
  def show
  end

  # GET /api/v1/addresses/1/edit
  def edit
  end

  # POST /api/v1/addresses
  # POST /api/v1/addresses.json
  def create
    @address = current_user.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/addresses/1
  # PATCH/PUT /api/v1/addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/addresses/1
  # DELETE /api/v1/addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      #format.html { redirect_to api_v1_addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.fetch(:address, {})
    end
end
