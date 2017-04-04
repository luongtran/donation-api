describe "States API", type: :request do
  before :each do
    FactoryGirl.create_list :state, 3, cities_count: 4
    @user = FactoryGirl.create :user, :confirmed
  end
  context "Get states" do
    it "return list of states and cities" do
      get '/api/v1/states',headers: @user.create_new_auth_token
      expect(http_status_code).to eq(200)
      expect(json_response[:data][:states].length).to eq(3)
      expect(json_response[:data][:states][0][:cities].length).to eq(4)
    end
  end
end
