class Backend::DonationsController < Backend::BaseController
  authorize_resource
  before_action :set_donation, only: [:show, :edit, :update, :destroy, :sync]

  # GET /backend/donations
  # GET /backend/donations.json
  def index
    donations = Donation.includes(:user).includes(:charity).includes(:package_cost).includes(:address).all.order(id: :desc)
    donations = donations.page(paging_params[:page]).per(paging_params[:per])
    @donations = donations
  end

  # GET /backend/donations/1
  # GET /backend/donations/1.json
  def show
  end

  def sync
    SyncDonationJobJob.perform_async  @donation.id
    respond_to do |format|
      format.html { redirect_to backend_donations_url, notice: 'Donation was successfully destroyed.' }
    end
  end

  # GET /backend/donations/new
  def new
    @donaton = Donation.new
  end

  # GET /backend/donations/1/edit
  def edit
  end

  # POST /backend/donations
  # POST /backend/donations.json
  def create
    @donation = Donation.new(donation_params)

    respond_to do |format|
      if @donation.save
        SyncDonationJobJob.perform_async  @donation.id
        @donation.donation_categories = DonationCategory.where(id: params[:donation][:donation_category_ids])

        format.html { redirect_to backend_donation_url(@donation), notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: backend_donation_url(@donation) }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/donations/1
  # PATCH/PUT /backend/donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        @donation.donation_categories = DonationCategory.where(id: params[:donation][:donation_category_ids])
        format.html { redirect_to backend_donation_url(@donation), notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/donations/1
  # DELETE /backend/donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to backend_donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation =Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:user_id, :charity_id, :package_cost_id, :address_id, :total_price, :number_of_cartons,
        :is_fragile, :wimo_task_id, donation_category_ids: [],  attachments_attributes: [:id, :file, :_destroy])
    end

    def attachment_params
      params.require(:attachment).permit(:file)
    end
end
