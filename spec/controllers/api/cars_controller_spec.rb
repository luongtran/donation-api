describe Api::V1::CarsController do
  before do
    FactoryGirl.create_list :car, 5
    @user = FactoryGirl.create :user, :confirmed
  end

  describe "GET #index" do
    context "when not login" do
      it "should render 401" do
        get :index, { format: :json }
        expect(http_status_code).to eq(401)
      end
    end

    context "when logged in" do
      before do
        sign_in @user
      end
      it "should return cars list" do
        get :index, { format: :json }
        expect(http_status_code).to eq(200)
      end
    end

    context "with city id" do

    end

  end

end
