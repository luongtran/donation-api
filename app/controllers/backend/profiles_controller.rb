class Backend::ProfilesController < Backend::BaseController
  def show
  end

  def update
    if current_user.update_attributes(user_params)
      render :show, notice: 'Profile updated'
    else
      render :show, alert: 'Failed to update profile, please check your input'
    end
  end

  def account_setting
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :phone, :gender, :company_name, :organisation, :website)
  end
end
