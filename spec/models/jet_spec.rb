describe Jet, type: :model do
  # Validations
  it { should validate_presence_of :brand }
  it { should validate_presence_of :model }

end
