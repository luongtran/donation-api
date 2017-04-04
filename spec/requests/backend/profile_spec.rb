describe "Profile", type: :feature do

  before :each do
    @user = FactoryGirl.create :user, :confirmed
  end

  context "Get profile" do

    it "return success" do
      visit '/users/sign_in'
      within("form") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: 123456
      end
      click_button 'Login'
      visit '/backend/profile'
      expect(page).to have_selector(".navbar-header .username", :text => @user.full_name)
    end

  end

end
