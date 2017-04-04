describe "the forgot password process", :type => :feature do
  before :each do
    @user = FactoryGirl.create :user
  end

  it "send resetpassword email" do
    visit '/users/password/new'
    within("form") do
      fill_in 'Email', with: @user[:email]
    end
    click_button 'Send'
    expect(page).to have_content I18n.t('devise.passwords.send_instructions')
  end
end
