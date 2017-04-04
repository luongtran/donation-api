describe User, type: :model do
  # Validations
  it { should validate_presence_of :email }
  it { should allow_value('john@example.com').for(:email) }
  it do
    should_not allow_values(
      '@',
      '<john>@email',
      'john@email..com',
      'john@@email.com',
      'john@email.',
      '@@.com',
      '123@456.789'
    ).for(:email)
  end
  it { should validate_confirmation_of(:password) }

  it "should not allow null email" do
    user = FactoryGirl.build :user, email: nil
    user.validate
    expect(user.errors).to have_key(:email)
  end
end
