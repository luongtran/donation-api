describe "the signup process", :type => :feature do
  before :each do
    @user = FactoryGirl.attributes_for :user
  end

  it "signs me up" do
    visit '/users/sign_up'
    within("form") do
      fill_in 'Email', with: @user[:email]
      fill_in 'Name', with: @user[:name]
      fill_in 'Surname', with: @user[:surname]
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
    end
    click_button 'Register'
    expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
  end
end
