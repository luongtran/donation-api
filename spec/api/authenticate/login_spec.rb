describe "the api signin process", type: :request do
  before :each do
    @user = FactoryGirl.create :user, :confirmed, password: 123123
  end

  it "signs me in" do
    post '/api/v1/auth/sign_in', params: {email: @user.email, password: 123123}
    expect(response).to be_success
    expect(http_status_code).to eq(200)
    expect(json_response[:data][:id]).to eq(@user.id)
  end

  it "signs me up" do
    user_params = FactoryGirl.attributes_for :user
    post '/api/v1/auth', params: user_params
    expect(response).to be_success
    expect(http_status_code).to eq(200)
    expect(json_response[:message]).to include('confirmation link')
  end
end
