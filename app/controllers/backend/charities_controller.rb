class Backend::CharitiesController < ApplicationController
  before_action :set_backend_charity, only: [:show, :edit, :update, :destroy]

  # GET /backend/charities
  # GET /backend/charities.json
  def index
    @backend_charities = Backend::Charity.all
  end

  # GET /backend/charities/1
  # GET /backend/charities/1.json
  def show
  end

  # GET /backend/charities/new
  def new
    @backend_charity = Backend::Charity.new
  end

  # GET /backend/charities/1/edit
  def edit
  end

  # POST /backend/charities
  # POST /backend/charities.json
  def create
    @backend_charity = Backend::Charity.new(backend_charity_params)

    respond_to do |format|
      if @backend_charity.save
        format.html { redirect_to @backend_charity, notice: 'Charity was successfully created.' }
        format.json { render :show, status: :created, location: @backend_charity }
      else
        format.html { render :new }
        format.json { render json: @backend_charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/charities/1
  # PATCH/PUT /backend/charities/1.json
  def update
    respond_to do |format|
      if @backend_charity.update(backend_charity_params)
        format.html { redirect_to @backend_charity, notice: 'Charity was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_charity }
      else
        format.html { render :edit }
        format.json { render json: @backend_charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/charities/1
  # DELETE /backend/charities/1.json
  def destroy
    @backend_charity.destroy
    respond_to do |format|
      format.html { redirect_to backend_charities_url, notice: 'Charity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_charity
      @backend_charity = Backend::Charity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_charity_params
      params.fetch(:backend_charity, {})
    end
end
