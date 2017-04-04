describe "the signin process", type: :feature do
  before :each do
    @user = FactoryGirl.create :user, :confirmed
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("form") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 123456
    end
    click_button 'Login'
    expect(page).to have_content @user.full_name
  end
end
