class Backend::UsersController < Backend::BaseController
  authorize_resource
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    users = User.all
    users = users.index_search(params[:q]) if params[:q].present?
    users = users.page(paging_params[:page]).per(paging_params[:per])
    @users = users
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="users_export_'+ Time.now.strftime("%d_%b_%Y") +'.xlsx"'
      }
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def notification_modal
    @user = User.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def push_notification
    @user = User.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to({ action: 'index' }, alert: "User created")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to({action: :index}, notice: 'User updated')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to({action: :index}, alert: 'User destroyed')
  end


  private

  def find_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :role)
  end

end
