class Api::V1::ProfilesController < Api::BaseController
  before_action :authenticate_user!, only: [:show, :update]

  def show
  end

  def update
    if current_user.update_attributes(user_params)
      render_success 'Profile updated'
    else
      render_bad_params 'Failed to update profile', current_user.errors.full_messages
    end
  end

  def add_address
    if current_user.address.create(address_params)
      render_success 'Address added successfully'
    else
      render_bad_params 'Failed to add address', current_user.errors.full_messages
    end
  end

  def update_address
    @address = Address.find(params[:address][:id])
    if @address.update_attributes(address_params)
      render_success 'Address updated successfully'
    else
      render_bad_params 'Failed to update address', @address.errors.full_messages
    end
  end


  private

  def user_params
    params.require(:user).permit(:fullname, :phone)
  end

  def address_params
    params.require(:address).permit(:user_id, :address_line1, :address_fullname, :lat, :lon, :flat_building_number, :address_instruction)
  end

end
