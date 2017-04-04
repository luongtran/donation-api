describe Backend::ProfilesController do
  before do
    @user = FactoryGirl.create :user, :confirmed
  end

  describe "GET #show" do
    context "when not login" do
      it "should redirect to home page" do
        get :show
        expect(response.status).to eq(302)
      end
    end

    context "when logged in" do
      before do
        sign_in @user
      end
      it "should show profile page" do
        get :show
        expect(response.status).to eq(200)
      end
    end

  end

  describe "PUT #update" do
    context "when not login" do
      it "should redirect to home page" do
        put :update
        expect(response.status).to eq(302)
      end
    end

    context "when logged in" do
      before do
        sign_in @user
      end

      it "should update user profile when valid params" do
        put :update, params: { user: { name: "John" } }
        expect(response.status).to eq(200)
        @user.reload
        expect(@user.name).to eq("John")
      end

      it "should render error when invalid params" do
        put :update, params: { user: { phone: "abcdef" } }
        @user.reload
        expect(@user.phone).not_to eq("abcdef")
      end


    end
  end
end
