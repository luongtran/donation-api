class Api::V1::DonationsController < Api::BaseController
  before_action :authenticate_user!
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/donations
  # GET /api/v1/donations.json
  def index
    courier_cost = CourierCost.first 
    @courier_cost = !courier_cost.nil? ? courier_cost.cost : 30;
    @donations = current_user.donations.includes(:attachments, :donation_categories, :address, :charity)
  end

  def total_donations
    @total = Donation.count
    render json: {http_status_code: 200, success: true, message: t('total_donations.get.success') ,total: @total}
  end

  def courier_cost
    @courier_cost = CourierCost.first
    render json: {http_status_code: 200, success: true, message: t('total_donations.get.success') ,courier_cost: @courier_cost.cost}
  end

  # GET /api/v1/donations/1
  # GET /api/v1/donations/1.json
  def show
    courier_cost = CourierCost.first 
    @courier_cost = !courier_cost.nil? ? courier_cost.cost : 30;
  end

  # GET /api/v1/donations/new
  def new
    @donation = current_user.donations.new
  end

  # GET /api/v1/donations/1/edit
  def edit
  end

  # POST /api/v1/donations
  # POST /api/v1/donations.json
  def create
    @donation = current_user.donations.new(donation_params)
    respond_to do |format|
      if @donation.save
        #SyncDonationJobJob.perform_later @donation
        @donation.donation_categories = DonationCategory.where(id: params[:donation][:donation_category_ids])
       
        format.html { redirect_to api_v1_donation_url @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: api_v1_donation_url(@donation) }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_images
    @attachments = []
    if params[:attachments] && params[:attachments].kind_of?(Array)
      params[:attachments].each do |attachment|
        attachment = Attachment.new(attachment_params)
        if attachment.save
          @attachments << attachment
        end
      end

      if !@attachments.empty?

      else

      end

    end
  end

  # PATCH/PUT /api/v1/donations/1
  # PATCH/PUT /api/v1/donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to api_v1_donation_url @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: api_v1_donation_url(@donation) }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/donations/1
  # DELETE /api/v1/donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.includes(:donation_categories, :attachments, :address, :package_cost, :charity, :user).find(params[:id])
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
