require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  before do
    @user = FactoryGirl.create :user
  end
  describe "welcome" do
    let(:mail) { UserMailer.welcome(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to billionaires jet")
      expect(mail.to).to eq([@user.email])
      expect(mail.from).to eq(["donot-reply@billionairesjet.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_text(@user.full_name)
    end
  end
end
