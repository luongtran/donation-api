describe "Car API", type: :request do
  before :each do
    @cars = FactoryGirl.create_list :car, 5
    @city = FactoryGirl.create :city, cars_count: 4
    @user = FactoryGirl.create :user, :confirmed
  end
  context "Get cars" do
    it "return list of cars" do
      get '/api/v1/cars',headers: @user.create_new_auth_token
      expect(http_status_code).to eq(200)
      expect(json_response[:data][:cars].length).to eq(9)
    end
  end

  context "Get cars in city" do
    it "return list cars in city" do
      get '/api/v1/cars',headers: @user.create_new_auth_token, params: { city_id: @city.id }
      expect(http_status_code).to eq(200)
      expect(json_response[:data][:cars].length).to eq(4)
    end
  end

end
