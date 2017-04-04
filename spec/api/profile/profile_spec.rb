describe "Profile API", type: :request do
  before :each do
    @user = FactoryGirl.create :user, :confirmed
  end
  context "Get profile" do
    it "return success" do
      get '/api/v1/profile',headers: @user.create_new_auth_token
      expect(http_status_code).to eq(200)
    end
  end

  context "Update profile when valid params" do
    it "return success" do
      put '/api/v1/profile',
        params: {
          user: {
            name: 'Foo',
            surname: 'Bar',
            # gender: 'Male',
            website: 'http://www.abc.com',
            phone: '0123456789',
            organisation: 'Enterpreneur',
            company_name: 'Billionaire',
            }
          },
        headers: @user.create_new_auth_token
      expect(http_status_code).to eq(200)
      @user.reload
      expect(@user.name).to eq('Foo')
      expect(@user.surname).to eq('Bar')
      # expect(@user.gender).to eq('Male')
      expect(@user.organisation).to eq('Enterpreneur')
      expect(@user.company_name).to eq('Billionaire')
      expect(@user.website).to eq('http://www.abc.com')
      expect(@user.phone).to eq('0123456789')
    end
  end

  context "Update profile without params" do
    it "return error" do
      put '/api/v1/profile',
        headers: @user.create_new_auth_token
      expect(http_status_code).to eq(400)
      expect(json_response[:error][:code]).to eq Api::Status::BAD_REQUEST
    end
  end

  context "Update profile without authenticate" do
    it "return error" do
      put '/api/v1/profile',
        params: {
          user: {
            name: 'Test'
            }
          }
      expect(http_status_code).to eq(401)
      expect(json_response[:error][:code]).to eq Api::Status::UNAUTHORIZED
    end
  end

  context "Update profile when invalid params" do
    it "return error" do
      put '/api/v1/profile',
        params: {
          user: {
            phone: 'abc'
            }
          },
        headers: @user.create_new_auth_token
      expect(http_status_code).to eq(400)
      expect(json_response[:error][:code]).to eq Api::Status::BAD_PARAMETERS
      expect(json_response[:errors]).to include 'Phone is not a number'
    end
  end
end
